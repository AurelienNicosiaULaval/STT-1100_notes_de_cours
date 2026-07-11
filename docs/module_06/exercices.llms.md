# Module 6 - Exercices

STT-1100 Introduction à la science des données

## Exercices de consolidation

Ces exercices sont indépendants de l’aventure et du défi. Ils servent à consolider les gestes techniques du module 6: joindre plusieurs tables, vérifier les clés, repérer les lignes sans correspondance, comprendre les cardinalités et formuler une revue constructive.

> **NOTE:**
>
> Les quatre tables proviennent de l’[API officielle de Données Québec](https://www.donneesquebec.ca/recherche/api/3/action/package_search). L’extrait regroupe 142 organisations, 312 jeux de données, 3 143 ressources et 2 101 associations à des étiquettes. Pour éviter qu’une seule organisation domine l’exercice, le script conserve au plus huit jeux parmi les 1 000 plus récemment modifiés pour chaque organisation. Il inclut ainsi des ministères et des villes de plusieurs régions, dont Laval, Lévis, Longueuil, Montréal, Québec, Rimouski, Rouyn-Noranda, Saguenay, Sherbrooke et Trois-Rivières. Le script `scripts/build_module06_real_data.R` reconstruit l’extrait.

``` r
library(tidyverse)
```

## Bloc A - Comprendre les clés de jointure

### Exercice 1 - Importer les organisations et les jeux

Importez `organisations_donnees_quebec.csv` et `jeux_donnees_quebec.csv`, puis inspectez leurs dimensions et leurs clés.

> **NOTE:**
>
> ``` r
> organisations <- read_csv(
>   "data/organisations_donnees_quebec.csv",
>   show_col_types = FALSE
> )
>
> jeux <- read_csv(
>   "data/jeux_donnees_quebec.csv",
>   show_col_types = FALSE
> )
>
> glimpse(organisations)
> ```
>
>     Rows: 142
>     Columns: 5
>     $ organisation_id   <chr> "02ac2745-f6ac-432b-aebd-27037cbaa0fb", "b0631ca4-c8…
>     $ organisation_nom  <chr> "AdMare", "Agence de mobilité durable", "Assemblée n…
>     $ organisation_slug <chr> "admare", "agence-de-mobilite-durable", "assemblee-n…
>     $ nb_jeux_catalogue <dbl> 1, 0, 5, 5, 1, 1, 2, 6, 2, 0, 1, 2, 0, 6, 1, 3, 6, 7…
>     $ etat              <chr> "active", "active", "active", "active", "active", "a…
>
> ``` r
> glimpse(jeux)
> ```
>
>     Rows: 312
>     Columns: 8
>     $ jeu_id            <chr> "00ec17f8-c7f1-414c-9860-a12bd0c91824", "b10a6f01-32…
>     $ titre             <chr> "Écocentres et points de dépôt municipaux", "Rampes …
>     $ organisation_id   <chr> "0000b004-5e60-4585-b5b1-c0942d829fa5", "00fde186-c7…
>     $ licence           <chr> "Attribution (CC-BY 4.0)", "Attribution (CC-BY 4.0)"…
>     $ date_creation     <date> 2023-08-30, 2026-04-01, 2026-04-02, 2026-04-02, 202…
>     $ date_modification <date> 2026-02-09, 2026-04-02, 2026-04-02, 2026-04-02, 202…
>     $ nb_ressources     <dbl> 3, 1, 1, 1, 2, 2, 2, 1, 1, 1, 4, 4, 4, 4, 4, 8, 8, 3…
>     $ nb_etiquettes     <dbl> 6, 12, 6, 5, 3, 10, 5, 6, 6, 3, 4, 4, 33, 11, 4, 3, …
>
> ``` r
> tibble(
>   table = c("organisations", "jeux"),
>   lignes = c(nrow(organisations), nrow(jeux)),
>   cles_distinctes = c(
>     n_distinct(organisations$organisation_id),
>     n_distinct(jeux$jeu_id)
>   )
> )
> ```
>
>     # A tibble: 2 × 3
>       table         lignes cles_distinctes
>       <chr>          <int>           <int>
>     1 organisations    142             142
>     2 jeux             312             312

### Exercice 2 - Ajouter le nom de l’organisation

Utilisez `left_join()` pour ajouter le nom et le nombre total de jeux du catalogue à chaque jeu de l’extrait.

> **NOTE:**
>
> ``` r
> jeux_detail <- jeux |>
>   left_join(organisations, by = "organisation_id")
>
> jeux_detail |>
>   select(
>     jeu_id,
>     titre,
>     organisation_nom,
>     licence,
>     nb_ressources,
>     nb_jeux_catalogue
>   ) |>
>   slice_head(n = 10)
> ```
>
>     # A tibble: 10 × 6
>        jeu_id         titre organisation_nom licence nb_ressources nb_jeux_catalogue
>        <chr>          <chr> <chr>            <chr>           <dbl>             <dbl>
>      1 00ec17f8-c7f1… Écoc… RECYC-QUÉBEC     Attrib…             3                 1
>      2 b10a6f01-320c… Ramp… Ville de Shawin… Attrib…             1                31
>      3 668b7750-b71a… Dist… Ville de Shawin… Attrib…             1                31
>      4 32f75a4d-552f… Bâti… Ville de Shawin… Attrib…             1                31
>      5 08123b30-f795… Parc… Ville de Shawin… Attrib…             2                31
>      6 6813f7dd-8f31… Parc… Ville de Shawin… Attrib…             2                31
>      7 8e09581e-6963… Sent… Ville de Shawin… Attrib…             2                31
>      8 c6138a86-5777… Sent… Ville de Shawin… Attrib…             1                31
>      9 3f137d4d-b156… Sent… Ville de Shawin… Attrib…             1                31
>     10 83596ebd-5845… Art_… AdMare           Attrib…             1                 1

### Exercice 3 - Repérer les jeux sans organisation connue

Utilisez `anti_join()` pour vérifier si des jeux ont une clé d’organisation absente de la table des organisations.

> **NOTE:**
>
> ``` r
> jeux |>
>   anti_join(organisations, by = "organisation_id")
> ```
>
>     # A tibble: 0 × 8
>     # ℹ 8 variables: jeu_id <chr>, titre <chr>, organisation_id <chr>,
>     #   licence <chr>, date_creation <date>, date_modification <date>,
>     #   nb_ressources <dbl>, nb_etiquettes <dbl>
>
> Obtenir zéro ligne est un résultat utile: les clés étrangères de cet extrait trouvent toutes une correspondance.

### Exercice 4 - Identifier les organisations représentées

Utilisez `semi_join()` pour conserver seulement les organisations ayant au moins un jeu dans l’extrait équilibré.

> **NOTE:**
>
> ``` r
> organisations_representees <- organisations |>
>   semi_join(jeux, by = "organisation_id") |>
>   arrange(organisation_nom)
>
> organisations_representees
> ```
>
>     # A tibble: 78 × 5
>        organisation_id    organisation_nom organisation_slug nb_jeux_catalogue etat
>        <chr>              <chr>            <chr>                         <dbl> <chr>
>      1 02ac2745-f6ac-432… AdMare           admare                            1 acti…
>      2 e6ecd29a-c198-48b… Assemblée natio… assemblee-nation…                 5 acti…
>      3 5f1f16de-5dea-4fd… Association des… l-association-de…                 5 acti…
>      4 8d4ad35d-9d0b-4a4… Autorité des ma… autorite-des-mar…                 1 acti…
>      5 737e8d6f-a3bd-4f4… Autorité des ma… amp                               1 acti…
>      6 193c8a13-04c9-46d… Bibliothèque et… banq                              6 acti…
>      7 15f2f4fc-9d79-433… Bixi Montréal    bixi                              2 acti…
>      8 8284d83e-1b0f-4bd… Cinémathèque qu… cinematheque-que…                 6 acti…
>      9 d6c64296-b68e-47a… Commission de p… cptaq                             3 acti…
>     10 5d511b3d-dad9-4f1… Commission de t… commission-de-to…                 6 acti…
>     # ℹ 68 more rows

## Bloc B - Relations un-à-plusieurs

### Exercice 5 - Résumer les jeux par organisation

Calculez le nombre de jeux retenus dans l’extrait et le nombre total annoncé dans le catalogue pour chaque organisation représentée.

> **NOTE:**
>
> ``` r
> resume_organisations <- jeux_detail |>
>   group_by(organisation_id, organisation_nom, nb_jeux_catalogue) |>
>   summarise(
>     nb_jeux_extrait = n(),
>     nb_ressources_extrait = sum(nb_ressources),
>     .groups = "drop"
>   ) |>
>   arrange(desc(nb_jeux_catalogue))
>
> resume_organisations
> ```
>
>     # A tibble: 78 × 5
>        organisation_id            organisation_nom nb_jeux_catalogue nb_jeux_extrait
>        <chr>                      <chr>                        <dbl>           <int>
>      1 6e1f26e1-da99-4de4-a1db-c… Ville de Montré…               389               8
>      2 4e77c64b-22f6-469e-ad07-c… Ville de Laval                 130               8
>      3 b65dd6f6-8f31-402e-a8e1-8… Ministère de l’…               126               8
>      4 95c1ba5b-25ec-405d-8647-3… Ministère des R…               121               8
>      5 23e2ed49-fd2c-4114-858e-0… Ville de Gatine…                52               2
>      6 c1ec9cbd-c536-49f1-900e-0… Ville de Repent…                39               8
>      7 89ffd393-6e8c-4055-a172-7… Ville de Trois-…                38               8
>      8 06690e08-a712-4ee3-8cff-3… Ville de Québec                 37               8
>      9 0941b44f-88b2-4b11-93fa-3… Ministère de la…                34               8
>     10 00fde186-c76f-499e-9dfc-e… Ville de Shawin…                31               8
>     # ℹ 68 more rows
>     # ℹ 1 more variable: nb_ressources_extrait <dbl>

### Exercice 6 - Visualiser les organisations les plus présentes

Produisez un graphique des dix organisations ayant le plus de jeux dans l’ensemble du catalogue.

> **NOTE:**
>
> ``` r
> organisations |>
>   slice_max(nb_jeux_catalogue, n = 10, with_ties = FALSE) |>
>   ggplot(
>     aes(
>       x = fct_reorder(organisation_nom, nb_jeux_catalogue),
>       y = nb_jeux_catalogue
>     )
>   ) +
>   geom_col(fill = "#2c7fb8") +
>   coord_flip() +
>   labs(
>     title = "Organisations ayant le plus de jeux dans Données Québec",
>     x = NULL,
>     y = "Nombre de jeux au catalogue"
>   )
> ```
>
> ![](exercices_files/figure-html/unnamed-chunk-6-1.png)

### Exercice 7 - Joindre les ressources aux jeux

Importez `ressources_donnees_quebec.csv`, ajoutez le titre du jeu à chaque ressource et comptez les formats.

> **NOTE:**
>
> ``` r
> ressources <- read_csv(
>   "data/ressources_donnees_quebec.csv",
>   show_col_types = FALSE
> )
>
> ressources_detail <- ressources |>
>   left_join(
>     jeux |> select(jeu_id, titre, organisation_id),
>     by = "jeu_id",
>     relationship = "many-to-one"
>   )
>
> ressources_detail |>
>   count(format, sort = TRUE) |>
>   slice_head(n = 15)
> ```
>
>     # A tibble: 15 × 2
>        format      n
>        <chr>   <int>
>      1 CSV      1405
>      2 XLSX      368
>      3 json      275
>      4 GeoJSON   169
>      5 PDF       142
>      6 SHP       136
>      7 JSON      124
>      8 HTML       82
>      9 XML        60
>     10 KML        56
>     11 RINEX      49
>     12 FGDB       41
>     13 WMS        41
>     14 GPKG       30
>     15 xml        25

### Exercice 8 - Vérifier les correspondances entre jeux et ressources

Repérez les jeux sans ressource et les ressources sans jeu connu.

> **NOTE:**
>
> ``` r
> jeux_sans_ressource <- jeux |>
>   anti_join(ressources, by = "jeu_id")
>
> ressources_sans_jeu <- ressources |>
>   anti_join(jeux, by = "jeu_id")
>
> jeux_sans_ressource
> ```
>
>     # A tibble: 0 × 8
>     # ℹ 8 variables: jeu_id <chr>, titre <chr>, organisation_id <chr>,
>     #   licence <chr>, date_creation <date>, date_modification <date>,
>     #   nb_ressources <dbl>, nb_etiquettes <dbl>
>
> ``` r
> ressources_sans_jeu
> ```
>
>     # A tibble: 0 × 7
>     # ℹ 7 variables: ressource_id <chr>, jeu_id <chr>, ressource_nom <chr>,
>     #   format <chr>, type_ressource <chr>, taille_octets <dbl>,
>     #   date_modification <date>

## Bloc C - Relations plusieurs-à-plusieurs et revue

### Exercice 9 - Ajouter les étiquettes

Importez `etiquettes_donnees_quebec.csv`, puis ajoutez le titre et l’organisation à chaque association jeu-étiquette.

> **NOTE:**
>
> ``` r
> etiquettes <- read_csv(
>   "data/etiquettes_donnees_quebec.csv",
>   show_col_types = FALSE
> )
>
> etiquettes_detail <- etiquettes |>
>   left_join(
>     jeux_detail |> select(jeu_id, titre, organisation_nom),
>     by = "jeu_id",
>     relationship = "many-to-one"
>   )
>
> etiquettes_detail |>
>   slice_head(n = 10)
> ```
>
>     # A tibble: 10 × 4
>        jeu_id                               etiquette         titre organisation_nom
>        <chr>                                <chr>             <chr> <chr>
>      1 00ec17f8-c7f1-414c-9860-a12bd0c91824 Collecte des mat… Écoc… RECYC-QUÉBEC
>      2 00ec17f8-c7f1-414c-9860-a12bd0c91824 GMR               Écoc… RECYC-QUÉBEC
>      3 00ec17f8-c7f1-414c-9860-a12bd0c91824 Municipal         Écoc… RECYC-QUÉBEC
>      4 00ec17f8-c7f1-414c-9860-a12bd0c91824 Point de dépôt    Écoc… RECYC-QUÉBEC
>      5 00ec17f8-c7f1-414c-9860-a12bd0c91824 Recyclage         Écoc… RECYC-QUÉBEC
>      6 00ec17f8-c7f1-414c-9860-a12bd0c91824 Écocentre         Écoc… RECYC-QUÉBEC
>      7 b10a6f01-320c-4d56-b545-1ee5b70fdaeb Acces a l eau     Ramp… Ville de Shawin…
>      8 b10a6f01-320c-4d56-b545-1ee5b70fdaeb Bateau            Ramp… Ville de Shawin…
>      9 b10a6f01-320c-4d56-b545-1ee5b70fdaeb Canot             Ramp… Ville de Shawin…
>     10 b10a6f01-320c-4d56-b545-1ee5b70fdaeb Descente          Ramp… Ville de Shawin…

### Exercice 10 - Résumer les étiquettes

Trouvez les quinze étiquettes associées au plus grand nombre de jeux distincts.

> **NOTE:**
>
> ``` r
> resume_etiquettes <- etiquettes_detail |>
>   summarise(
>     nb_jeux = n_distinct(jeu_id),
>     .by = etiquette
>   ) |>
>   arrange(desc(nb_jeux)) |>
>   slice_head(n = 15)
>
> resume_etiquettes
> ```
>
>     # A tibble: 15 × 2
>        etiquette           nb_jeux
>        <chr>                 <int>
>      1 HackQC19                 16
>      2 Transport                15
>      3 HackQC20                 14
>      4 Municipal                12
>      5 Culture                  12
>      6 Sherbrooke                9
>      7 Urbanisme                 9
>      8 Donnee ouverte            8
>      9 Eau                       8
>     10 Ville de shawinigan       8
>     11 Hydrographie              8
>     12 Route                     8
>     13 Environnement             8
>     14 Art contemporain          8
>     15 Prestation                8

### Exercice 11 - Observer la multiplication des lignes

Joignez successivement les ressources et les étiquettes aux jeux, puis comparez le nombre de lignes avant et après. Expliquez pourquoi la seconde jointure est plusieurs-à-plusieurs.

> **NOTE:**
>
> ``` r
> jeux_ressources <- jeux |>
>   left_join(
>     ressources,
>     by = "jeu_id",
>     relationship = "one-to-many"
>   )
>
> catalogue_aplati <- jeux_ressources |>
>   left_join(
>     etiquettes,
>     by = "jeu_id",
>     relationship = "many-to-many"
>   )
>
> tibble(
>   table = c("jeux", "jeux_ressources", "catalogue_aplati"),
>   lignes = c(nrow(jeux), nrow(jeux_ressources), nrow(catalogue_aplati))
> )
> ```
>
>     # A tibble: 3 × 2
>       table            lignes
>       <chr>             <int>
>     1 jeux                312
>     2 jeux_ressources    3143
>     3 catalogue_aplati  20395
>
> Un jeu peut avoir plusieurs ressources et plusieurs étiquettes. Les combinaisons ressources-étiquettes multiplient donc les lignes sans créer de nouveaux jeux.

### Exercice 12 - Rédiger une issue utile

Repérez une ressource dont le format est manquant, puis rédigez une issue avec trois sections: constat, suggestion et justification.

> **NOTE:**
>
> ``` markdown
> ## Constat
>
> La fiche de la ressource ne précise pas son format dans les métadonnées du catalogue.
>
> ## Suggestion
>
> Renseigner le champ de format avec une valeur normalisée qui correspond au fichier ou au service diffusé.
>
> ## Pourquoi cette suggestion est utile
>
> Le format permet aux personnes utilisatrices de choisir leurs outils et de filtrer les ressources avant le téléchargement.
> ```

## Études de cas

### Étude de cas 1 - Audit relationnel de Données Québec

Utilisez les tables des organisations, jeux, ressources et étiquettes.

Réalisez les tâches suivantes:

1.  vérifiez l’unicité des trois clés primaires;
2.  joignez les jeux aux organisations;
3.  repérez les clés étrangères sans correspondance;
4.  repérez les jeux sans ressource et sans étiquette;
5.  produisez un résumé par organisation;
6.  rédigez une conclusion prudente sur l’intégrité relationnelle de l’extrait.

> **NOTE:**
>
> ``` r
> verification_cles <- tibble(
>   table = c("organisations", "jeux", "ressources"),
>   lignes = c(nrow(organisations), nrow(jeux), nrow(ressources)),
>   cles_distinctes = c(
>     n_distinct(organisations$organisation_id),
>     n_distinct(jeux$jeu_id),
>     n_distinct(ressources$ressource_id)
>   )
> )
>
> jeux_organisations <- jeux |>
>   left_join(organisations, by = "organisation_id")
>
> jeux_sans_organisation <- jeux |>
>   anti_join(organisations, by = "organisation_id")
>
> ressources_sans_jeu <- ressources |>
>   anti_join(jeux, by = "jeu_id")
>
> jeux_sans_ressource <- jeux |>
>   anti_join(ressources, by = "jeu_id")
>
> jeux_sans_etiquette <- jeux |>
>   anti_join(etiquettes, by = "jeu_id")
>
> resume_audit <- jeux_organisations |>
>   group_by(organisation_nom) |>
>   summarise(
>     nb_jeux = n(),
>     nb_ressources = sum(nb_ressources),
>     nb_jeux_sans_etiquette = sum(nb_etiquettes == 0),
>     .groups = "drop"
>   ) |>
>   arrange(desc(nb_ressources))
>
> verification_cles
> ```
>
>     # A tibble: 3 × 3
>       table         lignes cles_distinctes
>       <chr>          <int>           <int>
>     1 organisations    142             142
>     2 jeux             312             312
>     3 ressources      3143            3143
>
> ``` r
> jeux_sans_organisation
> ```
>
>     # A tibble: 0 × 8
>     # ℹ 8 variables: jeu_id <chr>, titre <chr>, organisation_id <chr>,
>     #   licence <chr>, date_creation <date>, date_modification <date>,
>     #   nb_ressources <dbl>, nb_etiquettes <dbl>
>
> ``` r
> ressources_sans_jeu
> ```
>
>     # A tibble: 0 × 7
>     # ℹ 7 variables: ressource_id <chr>, jeu_id <chr>, ressource_nom <chr>,
>     #   format <chr>, type_ressource <chr>, taille_octets <dbl>,
>     #   date_modification <date>
>
> ``` r
> jeux_sans_ressource
> ```
>
>     # A tibble: 0 × 8
>     # ℹ 8 variables: jeu_id <chr>, titre <chr>, organisation_id <chr>,
>     #   licence <chr>, date_creation <date>, date_modification <date>,
>     #   nb_ressources <dbl>, nb_etiquettes <dbl>
>
> ``` r
> jeux_sans_etiquette
> ```
>
>     # A tibble: 14 × 8
>        jeu_id          titre organisation_id licence date_creation date_modification
>        <chr>           <chr> <chr>           <chr>   <date>        <date>
>      1 5c88fe6f-0e8e-… Regi… 1021b38a-91ff-… Attrib… 2026-05-15    2026-07-11
>      2 2222f024-e94d-… Regi… 1021b38a-91ff-… Attrib… 2022-06-14    2026-07-11
>      3 14d93d62-16bf-… Regi… 737e8d6f-a3bd-… Attrib… 2015-05-01    2026-07-08
>      4 21686a8e-2713-… Agen… 836fde8a-a7ee-… Attrib… 2015-09-22    2025-11-20
>      5 755b45d6-7aee-… List… cebe524d-f2f6-… Attrib… 2021-01-29    2026-07-11
>      6 126c4b33-55c2-… List… cebe524d-f2f6-… Attrib… 2021-01-29    2026-07-01
>      7 579125c6-561b-… Tron… f62d2ba9-89e5-… Attrib… 2025-09-30    2025-11-17
>      8 2642706c-14a6-… Unit… f62d2ba9-89e5-… Attrib… 2025-09-30    2025-09-30
>      9 19b0d9a9-11d5-… Dist… f62d2ba9-89e5-… Attrib… 2025-09-30    2025-09-30
>     10 d4357015-d0d9-… Adre… f62d2ba9-89e5-… Attrib… 2025-09-30    2025-09-30
>     11 c4179790-79a3-… Dist… f62d2ba9-89e5-… Attrib… 2025-09-30    2025-09-30
>     12 52e35caf-ee9d-… Gran… f62d2ba9-89e5-… Attrib… 2025-09-30    2025-09-30
>     13 0c8a89da-47f2-… Zona… f62d2ba9-89e5-… Attrib… 2025-09-30    2025-09-30
>     14 7185f1a1-3d97-… Born… f62d2ba9-89e5-… Attrib… 2025-09-30    2025-09-30
>     # ℹ 2 more variables: nb_ressources <dbl>, nb_etiquettes <dbl>
>
> ``` r
> resume_audit
> ```
>
>     # A tibble: 78 × 4
>        organisation_nom                 nb_jeux nb_ressources nb_jeux_sans_etiquette
>        <chr>                              <int>         <dbl>                  <int>
>      1 Secrétariat du Conseil du trésor       5           611                      0
>      2 Ministère des Affaires municipa…       7           561                      0
>      3 Ministère de l'Emploi et de la …       8           304                      0
>      4 Ministère de l’Immigration, de …       4           127                      0
>      5 Ministère de la Cybersécurité e…       5           122                      0
>      6 Ministère de la Justice                1            90                      0
>      7 Ville de Lévis                         8            71                      0
>      8 Ministère des Ressources nature…       8            70                      0
>      9 Ministère des Transports et de …       8            69                      0
>     10 Ministère de l'Éducation et Min…       4            61                      0
>     # ℹ 68 more rows
>
> Une conclusion prudente peut constater l’absence de clés orphelines dans l’extrait fourni. Elle doit aussi rappeler que l’extrait est équilibré par organisation et ne représente ni tout le catalogue ni sa distribution réelle.

### Étude de cas 2 - Revue des métadonnées de ressources

Utilisez les mêmes tables pour produire une revue constructive de la documentation des ressources.

Réalisez les tâches suivantes:

1.  joignez les ressources aux jeux et aux organisations;
2.  repérez les formats manquants;
3.  calculez la part des ressources sans taille déclarée;
4.  résumez les formats par organisation;
5.  repérez les jeux sans étiquette;
6.  rédigez une issue précise pour un problème observé.

> **NOTE:**
>
> ``` r
> ressources_catalogue <- ressources |>
>   left_join(
>     jeux |> select(jeu_id, titre, organisation_id),
>     by = "jeu_id",
>     relationship = "many-to-one"
>   ) |>
>   left_join(
>     organisations |> select(organisation_id, organisation_nom),
>     by = "organisation_id",
>     relationship = "many-to-one"
>   )
>
> formats_manquants <- ressources_catalogue |>
>   filter(is.na(format) | str_squish(format) == "")
>
> part_taille_manquante <- ressources_catalogue |>
>   summarise(
>     nb_ressources = n(),
>     nb_sans_taille = sum(is.na(taille_octets)),
>     part_sans_taille = mean(is.na(taille_octets))
>   )
>
> formats_par_organisation <- ressources_catalogue |>
>   count(organisation_nom, format, sort = TRUE)
>
> jeux_sans_etiquette <- jeux |>
>   anti_join(etiquettes, by = "jeu_id")
>
> formats_manquants
> ```
>
>     # A tibble: 4 × 10
>       ressource_id          jeu_id ressource_nom format type_ressource taille_octets
>       <chr>                 <chr>  <chr>         <chr>  <chr>                  <dbl>
>     1 a64f32b8-ab9f-4d8e-8… 221d1… Chantiers - … <NA>   cartes                    NA
>     2 4a88ae0f-746e-40fb-a… 67d85… Ta            <NA>   <NA>                  754713
>     3 c9b80bfb-1f80-432f-9… e9d80… Sensibilisat… <NA>   <NA>                      NA
>     4 20f76d05-96e5-4aa6-8… 142ff… Visualisation <NA>   cartes                    NA
>     # ℹ 4 more variables: date_modification <date>, titre <chr>,
>     #   organisation_id <chr>, organisation_nom <chr>
>
> ``` r
> part_taille_manquante
> ```
>
>     # A tibble: 1 × 3
>       nb_ressources nb_sans_taille part_sans_taille
>               <int>          <int>            <dbl>
>     1          3143            889            0.283
>
> ``` r
> formats_par_organisation
> ```
>
>     # A tibble: 283 × 3
>        organisation_nom                                                 format     n
>        <chr>                                                            <chr>  <int>
>      1 Ministère des Affaires municipales et de l'Habitation            CSV      290
>      2 Ministère de l'Emploi et de la Solidarité sociale                CSV      282
>      3 Secrétariat du Conseil du trésor                                 json     275
>      4 Ministère des Affaires municipales et de l'Habitation            XLSX     200
>      5 Ministère de l’Immigration, de la Francisation et de l’Intégrat… CSV      119
>      6 Secrétariat du Conseil du trésor                                 CSV      101
>      7 Ministère de la Justice                                          CSV       90
>      8 Secrétariat du Conseil du trésor                                 JSON      87
>      9 Secrétariat du Conseil du trésor                                 XLSX      78
>     10 Ministère de la Cybersécurité et du Numérique                    CSV       63
>     # ℹ 273 more rows
>
> ``` r
> jeux_sans_etiquette
> ```
>
>     # A tibble: 14 × 8
>        jeu_id          titre organisation_id licence date_creation date_modification
>        <chr>           <chr> <chr>           <chr>   <date>        <date>
>      1 5c88fe6f-0e8e-… Regi… 1021b38a-91ff-… Attrib… 2026-05-15    2026-07-11
>      2 2222f024-e94d-… Regi… 1021b38a-91ff-… Attrib… 2022-06-14    2026-07-11
>      3 14d93d62-16bf-… Regi… 737e8d6f-a3bd-… Attrib… 2015-05-01    2026-07-08
>      4 21686a8e-2713-… Agen… 836fde8a-a7ee-… Attrib… 2015-09-22    2025-11-20
>      5 755b45d6-7aee-… List… cebe524d-f2f6-… Attrib… 2021-01-29    2026-07-11
>      6 126c4b33-55c2-… List… cebe524d-f2f6-… Attrib… 2021-01-29    2026-07-01
>      7 579125c6-561b-… Tron… f62d2ba9-89e5-… Attrib… 2025-09-30    2025-11-17
>      8 2642706c-14a6-… Unit… f62d2ba9-89e5-… Attrib… 2025-09-30    2025-09-30
>      9 19b0d9a9-11d5-… Dist… f62d2ba9-89e5-… Attrib… 2025-09-30    2025-09-30
>     10 d4357015-d0d9-… Adre… f62d2ba9-89e5-… Attrib… 2025-09-30    2025-09-30
>     11 c4179790-79a3-… Dist… f62d2ba9-89e5-… Attrib… 2025-09-30    2025-09-30
>     12 52e35caf-ee9d-… Gran… f62d2ba9-89e5-… Attrib… 2025-09-30    2025-09-30
>     13 0c8a89da-47f2-… Zona… f62d2ba9-89e5-… Attrib… 2025-09-30    2025-09-30
>     14 7185f1a1-3d97-… Born… f62d2ba9-89e5-… Attrib… 2025-09-30    2025-09-30
>     # ℹ 2 more variables: nb_ressources <dbl>, nb_etiquettes <dbl>
>
> Une bonne issue cite la ressource concernée, décrit le champ absent et propose une correction vérifiable. L’absence de taille n’est pas automatiquement une erreur, notamment pour une ressource de type service ou carte interactive.
