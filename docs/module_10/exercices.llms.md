# Exercices de consolidation

Ces exercices sont indépendants de l’aventure et du défi. Ils consolident l’analyse de texte, les scores lexicaux, le TF-IDF et la préparation d’un tableau de bord à partir de textes québécois réels et publics.

Le premier fichier contient un échantillon équilibré de descriptions tirées de l’[API officielle de Données Québec](https://www.donneesquebec.ca/page-api/). Le second provient du jeu [Événements - Système d’information touristique Québec](https://www.donneesquebec.ca/recherche/dataset/sit-quebec-evenements) du ministère du Tourisme. Les sources sont diffusées sous licence CC BY 4.0.

## Bloc A - Transformer des descriptions en tokens

### Exercice 1 - Importer les descriptions

Importez `descriptions_donnees_quebec.csv`. Chaque ligne représente une fiche réelle du portail, avec son titre, sa description, son producteur et sa catégorie.

> **NOTE:**
>
> ``` r
> catalogue <- read_csv(
>   "data/descriptions_donnees_quebec.csv",
>   show_col_types = FALSE
> )
>
> glimpse(catalogue)
> ```
>
>     Rows: 89
>     Columns: 9
>     $ jeu_id           <chr> "pistes-cyclables-standard", "calendrier-de-collecte-…
>     $ producteur       <chr> "Ville de Gatineau", "Ville de Gatineau", "Ville de G…
>     $ categorie        <chr> "Infrastructures; Transport", "Environnement, ressour…
>     $ titre            <chr> "Pistes cyclables", "Calendrier de collecte des matiè…
>     $ description      <chr> "Pistes cyclables (standard du hackathon provincial à…
>     $ nb_ressources    <dbl> 5, 1, 2, 2, 3, 4, 3, 4, 4, 4, 4, 4, 4, 4, 4, 4, 3, 3,…
>     $ date_mise_a_jour <date> 2025-11-25, 2025-04-24, 2025-04-24, 2025-04-24, 2025…
>     $ licence          <chr> "Attribution (CC-BY 4.0)", "Attribution (CC-BY 4.0)",…
>     $ date_instantane  <date> 2026-07-11, 2026-07-11, 2026-07-11, 2026-07-11, 2026…
>
> > **TIP:**
> >
> > L’échantillon contient 89 fiches provenant de huit villes: Québec, Gatineau, Sherbrooke, Trois-Rivières, Saguenay, Laval, Longueuil et Montréal. Montréal représente un producteur sur huit.

### Exercice 2 - Vérifier la structure

Calculez le nombre de fiches par producteur et le nombre de catégories distinctes.

> **NOTE:**
>
> ``` r
> catalogue |>
>   group_by(producteur) |>
>   summarise(
>     fiches = n(),
>     categories = n_distinct(categorie),
>     .groups = "drop"
>   ) |>
>   arrange(desc(fiches), producteur)
> ```
>
>     # A tibble: 8 × 3
>       producteur                                fiches categories
>       <chr>                                      <int>      <int>
>     1 Ville de Laval                                12          6
>     2 Ville de Longueuil                            12          7
>     3 Ville de Montréal                             12          7
>     4 Ville de Québec                               12          5
>     5 Ville de Saguenay                             12          6
>     6 Ville de Sherbrooke - Données géomatiques     12          5
>     7 Ville de Trois-Rivières                       12          3
>     8 Ville de Gatineau                              5          2
>
> > **TIP:**
> >
> > La sélection est équilibrée par producteur, mais elle ne représente pas tout le catalogue. Elle privilégie les fiches récemment mises à jour dont la description contient au moins 50 caractères.

### Exercice 3 - Tokeniser et retirer les stopwords

> **NOTE:**
>
> ``` r
> stop_fr <- stopwords("fr", source = "snowball")
>
> tokens_catalogue <- catalogue |>
>   unnest_tokens(mot, description) |>
>   filter(
>     !mot %in% stop_fr,
>     str_detect(mot, "^\\p{L}+$")
>   )
>
> tokens_catalogue |>
>   count(mot, sort = TRUE) |>
>   slice_head(n = 12)
> ```
>
>     # A tibble: 12 × 2
>        mot              n
>        <chr>        <int>
>      1 ville           53
>      2 territoire      34
>      3 cartographie    26
>      4 données         23
>      5 ensemble        16
>      6 travaux         16
>      7 type            16
>      8 identifiant     15
>      9 longueuil       13
>     10 rivières        13
>     11 zone            13
>     12 québec          12
>
> > **TIP:**
> >
> > Une ligne correspond maintenant à un mot conservé. Les fréquences donnent un premier portrait, mais le contexte d’une description doit être relu avant toute interprétation.

### Exercice 4 - Comparer les mots par producteur

> **NOTE:**
>
> ``` r
> mots_par_producteur <- tokens_catalogue |>
>   count(producteur, mot, sort = TRUE) |>
>   group_by(producteur) |>
>   slice_max(n, n = 5, with_ties = FALSE) |>
>   ungroup()
>
> mots_par_producteur
> ```
>
>     # A tibble: 40 × 3
>        producteur        mot              n
>        <chr>             <chr>        <int>
>      1 Ville de Gatineau courant         10
>      2 Ville de Gatineau zone             8
>      3 Ville de Gatineau correspond       6
>      4 Ville de Gatineau crue             6
>      5 Ville de Gatineau gatineau         6
>      6 Ville de Laval    territoire       9
>      7 Ville de Laval    cartographie     6
>      8 Ville de Laval    lavallois        6
>      9 Ville de Laval    cdu              5
>     10 Ville de Laval    code             5
>     # ℹ 30 more rows
>
> ``` r
> ggplot(
>   mots_par_producteur,
>   aes(x = n, y = fct_reorder(mot, n))
> ) +
>   geom_col() +
>   facet_wrap(vars(producteur), scales = "free_y") +
>   labs(
>     x = "Nombre d'occurrences",
>     y = NULL,
>     title = "Mots fréquents par producteur"
>   ) +
>   theme_minimal()
> ```
>
> ![](exercices_files/figure-html/unnamed-chunk-5-1.png)
>
> > **TIP:**
> >
> > Une différence peut venir des thèmes publiés, du vocabulaire institutionnel ou de la taille des descriptions. Elle ne mesure pas directement la qualité des données.

## Bloc B - Construire un score lexical simple

### Exercice 5 - Créer un lexique de précision

Créez un petit lexique exploratoire. Les mots concrets reçoivent `+1` et les mots très généraux `-1`.

> **NOTE:**
>
> ``` r
> lexique_precision <- tibble(
>   mot = c(
>     "localisation", "inventaire", "nombre", "mesure", "date",
>     "horaire", "statistiques", "registre", "liste", "géographique",
>     "quotidien", "annuel", "donnée", "données", "information",
>     "informations", "ensemble", "divers", "autre", "différents"
>   ),
>   classe = c(rep("concret", 12), rep("general", 8)),
>   score = if_else(classe == "concret", 1, -1)
> )
>
> lexique_precision
> ```
>
>     # A tibble: 20 × 3
>        mot          classe  score
>        <chr>        <chr>   <dbl>
>      1 localisation concret     1
>      2 inventaire   concret     1
>      3 nombre       concret     1
>      4 mesure       concret     1
>      5 date         concret     1
>      6 horaire      concret     1
>      7 statistiques concret     1
>      8 registre     concret     1
>      9 liste        concret     1
>     10 géographique concret     1
>     11 quotidien    concret     1
>     12 annuel       concret     1
>     13 donnée       general    -1
>     14 données      general    -1
>     15 information  general    -1
>     16 informations general    -1
>     17 ensemble     general    -1
>     18 divers       general    -1
>     19 autre        general    -1
>     20 différents   general    -1
>
> > **TIP:**
> >
> > Ce score ne constitue pas une mesure validée de qualité rédactionnelle. Il sert à comprendre la mécanique d’un score fondé sur un lexique et doit toujours être accompagné d’une lecture humaine.

### Exercice 6 - Calculer un score par fiche

> **NOTE:**
>
> ``` r
> scores_fiches <- tokens_catalogue |>
>   inner_join(lexique_precision, by = "mot") |>
>   group_by(jeu_id, producteur, categorie) |>
>   summarise(
>     score_precision = sum(score),
>     mots_reconnus = n(),
>     .groups = "drop"
>   ) |>
>   right_join(
>     catalogue,
>     by = c("jeu_id", "producteur", "categorie")
>   ) |>
>   mutate(
>     score_precision = replace_na(score_precision, 0),
>     mots_reconnus = replace_na(mots_reconnus, 0),
>     jours_depuis_mise_a_jour = as.integer(
>       date_instantane - date_mise_a_jour
>     )
>   )
>
> scores_fiches |>
>   select(
>     jeu_id,
>     producteur,
>     titre,
>     score_precision,
>     mots_reconnus
>   ) |>
>   slice_head(n = 10)
> ```
>
>     # A tibble: 10 × 5
>        jeu_id                         producteur titre score_precision mots_reconnus
>        <chr>                          <chr>      <chr>           <dbl>         <int>
>      1 04880bdf6ffa40ababfa900c2ef45… Ville de … Trav…               5             9
>      2 728d843955a744c78dd6cd4b26b86… Ville de … Stat…               1             1
>      3 arrondissements-longueuil      Ville de … Arro…               1             1
>      4 chantiers-routiers             Ville de … Chan…               1             1
>      5 infrastructure-pietonne        Ville de … Infr…              -1             1
>      6 milieux-humides-rci            Ville de … Mili…              -3             3
>      7 offres-d-emploi                Ville de … Offr…              -2             2
>      8 permis-de-construction         Ville de … Perm…              -1             1
>      9 permis-delivres-ville-de-queb… Ville de … Perm…              -1             1
>     10 sag-reseau-routier             Ville de … Rése…              -1             1
>
> > **TIP:**
> >
> > Un score nul peut signifier que le vocabulaire est neutre, mais aussi qu’aucun mot du petit lexique n’a été reconnu. La colonne `mots_reconnus` est donc indispensable.

### Exercice 7 - Résumer le score par producteur

> **NOTE:**
>
> ``` r
> precision_producteur <- scores_fiches |>
>   group_by(producteur) |>
>   summarise(
>     score_moyen = mean(score_precision),
>     mots_reconnus_moyens = mean(mots_reconnus),
>     ressources_moyennes = mean(nb_ressources),
>     fiches = n(),
>     .groups = "drop"
>   )
>
> precision_producteur
> ```
>
>     # A tibble: 8 × 5
>       producteur         score_moyen mots_reconnus_moyens ressources_moyennes fiches
>       <chr>                    <dbl>                <dbl>               <dbl>  <int>
>     1 Ville de Gatineau       0                     0                    2.6       5
>     2 Ville de Laval         -0.167                 0.333                3.83     12
>     3 Ville de Longueuil      0.0833                0.25                 3        12
>     4 Ville de Montréal      -1.17                  3.33                 4.75     12
>     5 Ville de Québec        -0.167                 0.167                4.67     12
>     6 Ville de Saguenay      -0.667                 1                    4.08     12
>     7 Ville de Sherbroo…      0.25                  1.08                 6        12
>     8 Ville de Trois-Ri…      0                     0                    3        12
>
> ``` r
> ggplot(
>   precision_producteur,
>   aes(x = score_moyen, y = reorder(producteur, score_moyen))
> ) +
>   geom_col(fill = "steelblue") +
>   labs(
>     x = "Score lexical moyen",
>     y = NULL,
>     title = "Score lexical exploratoire par producteur"
>   ) +
>   theme_minimal()
> ```
>
> ![](exercices_files/figure-html/unnamed-chunk-9-1.png)
>
> > **TIP:**
> >
> > Le graphique compare l’échantillon, pas la qualité globale des producteurs. Les différences de sujets et de style rédactionnel peuvent expliquer une partie des écarts.

## Bloc C - Repérer les mots distinctifs

### Exercice 8 - Calculer le TF-IDF par producteur

> **NOTE:**
>
> ``` r
> tfidf_producteur <- tokens_catalogue |>
>   count(producteur, mot) |>
>   bind_tf_idf(mot, producteur, n) |>
>   arrange(desc(tf_idf))
>
> tfidf_producteur |>
>   group_by(producteur) |>
>   slice_max(tf_idf, n = 5, with_ties = FALSE) |>
>   ungroup()
> ```
>
>     # A tibble: 40 × 6
>        producteur        mot                n     tf   idf tf_idf
>        <chr>             <chr>          <int>  <dbl> <dbl>  <dbl>
>      1 Ville de Gatineau courant           10 0.0452  2.08 0.0941
>      2 Ville de Gatineau correspond         6 0.0271  2.08 0.0565
>      3 Ville de Gatineau crue               6 0.0271  2.08 0.0565
>      4 Ville de Gatineau gatineau           6 0.0271  2.08 0.0565
>      5 Ville de Gatineau grand              6 0.0271  2.08 0.0565
>      6 Ville de Laval    lavallois          6 0.0392  2.08 0.0815
>      7 Ville de Laval    cdu                5 0.0327  2.08 0.0680
>      8 Ville de Laval    zaep               4 0.0261  2.08 0.0544
>      9 Ville de Laval    architecturale     3 0.0196  2.08 0.0408
>     10 Ville de Laval    piia               3 0.0196  2.08 0.0408
>     # ℹ 30 more rows
>
> > **TIP:**
> >
> > Un mot distinctif est relativement plus associé à un producteur qu’aux autres. Il n’est pas nécessairement positif, négatif ou important pour les utilisateurs.

### Exercice 9 - Visualiser les mots distinctifs

> **NOTE:**
>
> ``` r
> tfidf_top <- tfidf_producteur |>
>   group_by(producteur) |>
>   slice_max(tf_idf, n = 4, with_ties = FALSE) |>
>   ungroup() |>
>   mutate(mot = fct_reorder(mot, tf_idf))
>
> ggplot(tfidf_top, aes(x = tf_idf, y = mot)) +
>   geom_col(fill = "darkorange") +
>   facet_wrap(vars(producteur), scales = "free_y") +
>   labs(
>     x = "TF-IDF",
>     y = NULL,
>     title = "Mots distinctifs des descriptions"
>   ) +
>   theme_minimal()
> ```
>
> ![](exercices_files/figure-html/unnamed-chunk-11-1.png)
>
> > **TIP:**
> >
> > Revenez aux descriptions originales pour vérifier le sens des mots avant de rédiger une conclusion.

## Bloc D - Préparer une sortie de tableau de bord

### Exercice 10 - Construire un tableau de synthèse

> **NOTE:**
>
> ``` r
> resume_dashboard <- scores_fiches |>
>   group_by(producteur) |>
>   summarise(
>     fiches = n(),
>     score_precision_moyen = mean(score_precision),
>     ressources_moyennes = mean(nb_ressources),
>     jours_medians_depuis_mise_a_jour = median(
>       jours_depuis_mise_a_jour
>     ),
>     categories = n_distinct(categorie),
>     .groups = "drop"
>   )
>
> resume_dashboard
> ```
>
>     # A tibble: 8 × 6
>       producteur                    fiches score_precision_moyen ressources_moyennes
>       <chr>                          <int>                 <dbl>               <dbl>
>     1 Ville de Gatineau                  5                0                     2.6
>     2 Ville de Laval                    12               -0.167                 3.83
>     3 Ville de Longueuil                12                0.0833                3
>     4 Ville de Montréal                 12               -1.17                  4.75
>     5 Ville de Québec                   12               -0.167                 4.67
>     6 Ville de Saguenay                 12               -0.667                 4.08
>     7 Ville de Sherbrooke - Donnée…     12                0.25                  6
>     8 Ville de Trois-Rivières           12                0                     3
>     # ℹ 2 more variables: jours_medians_depuis_mise_a_jour <dbl>, categories <int>
>
> > **TIP:**
> >
> > Le tableau sépare la préparation des indicateurs de leur affichage. Un tableau de bord pourrait ensuite présenter des cartes, des graphiques et les descriptions sources.

### Exercice 11 - Simuler un filtre

> **NOTE:**
>
> ``` r
> producteur_choisi <- "Ville de Québec"
>
> resume_dashboard |>
>   filter(producteur == producteur_choisi)
> ```
>
>     # A tibble: 1 × 6
>       producteur      fiches score_precision_moyen ressources_moyennes
>       <chr>            <int>                 <dbl>               <dbl>
>     1 Ville de Québec     12                -0.167                4.67
>     # ℹ 2 more variables: jours_medians_depuis_mise_a_jour <dbl>, categories <int>
>
> > **TIP:**
> >
> > Dans une application `shiny`, la valeur pourrait venir d’un menu. L’opération analytique reste un filtre sur un tableau préparé.

## Étude de cas 1 - Qualité des descriptions de données

Une équipe veut repérer les descriptions qui mériteraient une révision éditoriale.

Votre mandat:

1.  choisir deux indicateurs parmi le score, les mots reconnus, le nombre de ressources et la récence;
2.  repérer quelques fiches à relire;
3.  formuler une recommandation qui reconnaît les limites du lexique.

> **NOTE:**
>
> ``` r
> fiches_a_relire <- scores_fiches |>
>   arrange(score_precision, mots_reconnus) |>
>   select(
>     producteur,
>     titre,
>     description,
>     score_precision,
>     mots_reconnus,
>     jours_depuis_mise_a_jour
>   ) |>
>   slice_head(n = 10)
>
> fiches_a_relire
> ```
>
>     # A tibble: 10 × 6
>        producteur                    titre description score_precision mots_reconnus
>        <chr>                         <chr> <chr>                 <dbl>         <int>
>      1 Ville de Montréal             Inte… "Ensemble …              -4             6
>      2 Ville de Sherbrooke - Donnée… Mili… "Milieux h…              -3             3
>      3 Ville de Laval                Offr… "Ensemble …              -2             2
>      4 Ville de Montréal             Cale… "Cet ensem…              -2             2
>      5 Ville de Montréal             Résu… "Cet ensem…              -2             2
>      6 Ville de Montréal             Fréq… "Ensemble …              -2             4
>      7 Ville de Montréal             RSQA… "La Ville …              -2             8
>      8 Ville de Québec               Infr… "Ensemble …              -1             1
>      9 Ville de Laval                Perm… "Informati…              -1             1
>     10 Ville de Québec               Perm… "Informati…              -1             1
>     # ℹ 1 more variable: jours_depuis_mise_a_jour <int>
>
> > **TIP:**
> >
> > Le score peut prioriser une lecture, mais ne doit pas déclencher automatiquement une correction. Le lexique est petit, les sujets diffèrent et une description générale peut tout de même être exacte et utile.

## Étude de cas 2 - Événements touristiques québécois

Importez `evenements_touristiques_quebec.csv`. La colonne `texte` combine des champs publics du SIT Québec pour fournir un corpus court et reproductible.

> **NOTE:**
>
> ``` r
> evenements <- read_csv(
>   "data/evenements_touristiques_quebec.csv",
>   show_col_types = FALSE
> )
>
> tokens_evenements <- evenements |>
>   unnest_tokens(mot, texte) |>
>   filter(
>     !mot %in% stop_fr,
>     str_detect(mot, "^\\p{L}+$")
>   )
>
> tfidf_evenements <- tokens_evenements |>
>   count(type_evenement, mot) |>
>   bind_tf_idf(mot, type_evenement, n) |>
>   group_by(type_evenement) |>
>   slice_max(tf_idf, n = 4, with_ties = FALSE) |>
>   ungroup()
>
> tfidf_evenements
> ```
>
>     # A tibble: 40 × 6
>        type_evenement                    mot             n     tf   idf tf_idf
>        <chr>                             <chr>       <int>  <dbl> <dbl>  <dbl>
>      1 Concert, spectacle                soirées         2 0.0435  2.30 0.100
>      2 Concert, spectacle                chanson         2 0.0435  1.61 0.0700
>      3 Concert, spectacle                contes          2 0.0435  1.61 0.0700
>      4 Concert, spectacle                légendes        2 0.0435  1.61 0.0700
>      5 Concours / tournoi                adulte          1 0.0556  2.30 0.128
>      6 Concours / tournoi                deslauriers     1 0.0556  2.30 0.128
>      7 Concours / tournoi                félix           1 0.0556  2.30 0.128
>      8 Concours / tournoi                hallée          1 0.0556  2.30 0.128
>      9 Expérience multimédia / immersive numériques      5 0.0704  1.61 0.113
>     10 Expérience multimédia / immersive immersif        3 0.0423  1.61 0.0680
>     # ℹ 30 more rows
>
> ``` r
> resume_evenements <- evenements |>
>   group_by(region_touristique) |>
>   summarise(
>     evenements = n(),
>     municipalites = n_distinct(municipalite),
>     duree_mediane_jours = median(duree_jours),
>     proportion_avec_site = mean(site_web_disponible),
>     .groups = "drop"
>   ) |>
>   arrange(desc(evenements), region_touristique)
>
> resume_evenements
> ```
>
>     # A tibble: 20 × 5
>        region_touristique       evenements municipalites duree_mediane_jours
>        <chr>                         <int>         <int>               <dbl>
>      1 Abitibi-Témiscamingue             8             5                 3
>      2 Bas-Saint-Laurent                 8             6                 4
>      3 Cantons-de-l'Est                  8             6                 1.5
>      4 Centre-du-Québec                  8             4                16.5
>      5 Charlevoix                        8             5                 3
>      6 Chaudière-Appalaches              8             5                 3
>      7 Côte-Nord (Manicouagan)           8             5                 4.5
>      8 Gaspésie                          8             8                 7
>      9 Lanaudière                        8             7                 3
>     10 Laurentides                       8             8                 2
>     11 Laval                             8             1                 4
>     12 Mauricie                          8             4                21
>     13 Montréal                          8             1               656
>     14 Montérégie                        8             7                33
>     15 Outaouais                         8             4                 3
>     16 Québec                            8             3                19.5
>     17 Saguenay--Lac-Saint-Jean          8             7                 4.5
>     18 Îles-de-la-Madeleine              6             2                 5.5
>     19 Côte-Nord (Duplessis)             5             3                 4
>     20 Baie-James                        4             2                 6.5
>     # ℹ 1 more variable: proportion_avec_site <dbl>
>
> > **TIP:**
> >
> > Deux visuels utiles seraient un graphique TF-IDF par type d’événement et un graphique de couverture par région. L’échantillon est équilibré à un maximum de huit événements par région touristique; il ne mesure donc pas le volume réel de toute l’offre touristique.
