# Module 7 - Exercices

STT-1100 Introduction à la science des données

## Exercices de consolidation

Ces exercices sont indépendants de l’aventure et du défi. Ils servent à consolider les gestes du module 7: reconnaître une visualisation trompeuse, reconstruire un graphique défendable, réduire les risques de ré-identification et écrire une note éthique courte.

> **NOTE:**
>
> Les exercices utilisent les [incidents de sécurité publique de Sherbrooke](https://www.donneesquebec.ca/recherche/dataset/64d19d62f0804f5896e4b24c32aea49d_0), les [estimations annuelles de population de Statistique Canada](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=1710015501) et le [sondage auprès des utilisateurs de Données Québec](https://www.donneesquebec.ca/recherche/dataset/sondage). Le script `scripts/build_module07_real_data.R` retire les coordonnées et les dates exactes des incidents, puis agrège les observations par mois et par type. Le sondage est publié à l’origine sous forme de nombres et de pourcentages agrégés, sans réponses individuelles.

``` r
library(tidyverse)
library(scales)
```

## Bloc A - Diagnostiquer une visualisation

### Exercice 1 - Comparer deux axes

Importez les incidents agrégés de Sherbrooke, puis produisez deux graphiques sur les mêmes totaux par type:

- un graphique avec un axe vertical tronqué;
- un graphique dont l’axe commence à zéro.

Que change la perception visuelle?

> **NOTE:**
>
> ``` r
> incidents <- read_csv(
>   "data/incidents_securite_sherbrooke_agreges.csv",
>   show_col_types = FALSE
> )
>
> incidents_type <- incidents |>
>   group_by(type_incident) |>
>   summarise(
>     total_incidents = sum(nb_incidents),
>     .groups = "drop"
>   ) |>
>   arrange(desc(total_incidents))
>
> incidents_type
> ```
>
>     # A tibble: 8 × 2
>       type_incident                      total_incidents
>       <chr>                                        <dbl>
>     1 Vol                                           4159
>     2 Voie de fait                                  2001
>     3 Menace ou acte de violence                    1421
>     4 Méfait                                        1222
>     5 Accident avec blessés                         1086
>     6 Introduction par effraction                    996
>     7 Conduite avec capacités affaiblies             530
>     8 Accident mortel                                  6
>
> ``` r
> ggplot(
>   incidents_type,
>   aes(x = reorder(type_incident, total_incidents), y = total_incidents)
> ) +
>   geom_col(fill = "#B33A3A") +
>   coord_flip(ylim = c(1000, max(incidents_type$total_incidents) * 1.05)) +
>   labs(
>     title = "Version trompeuse: axe tronqué",
>     x = "Type d'incident",
>     y = "Nombre d'incidents"
>   )
> ```
>
> ![](exercices_files/figure-html/unnamed-chunk-2-1.png)
>
> ``` r
> ggplot(
>   incidents_type,
>   aes(x = reorder(type_incident, total_incidents), y = total_incidents)
> ) +
>   geom_col(fill = "#3C6E71") +
>   coord_flip() +
>   scale_y_continuous(
>     limits = c(0, NA),
>     expand = expansion(mult = c(0, 0.05))
>   ) +
>   labs(
>     title = "Version défendable: axe à zéro",
>     x = "Type d'incident",
>     y = "Nombre d'incidents"
>   )
> ```
>
> ![](exercices_files/figure-html/unnamed-chunk-3-1.png)
>
> L’axe tronqué amplifie les écarts et rend même certaines petites catégories invisibles. Pour des barres, la longueur encode la quantité; l’axe doit donc normalement partir de zéro.

### Exercice 2 - Publier des effectifs agrégés

Produisez un graphique qui affiche les totaux par type, les effectifs et une note précisant la portée des données.

> **NOTE:**
>
> ``` r
> ggplot(
>   incidents_type,
>   aes(x = reorder(type_incident, total_incidents), y = total_incidents)
> ) +
>   geom_col(fill = "#4C78A8") +
>   geom_text(aes(label = comma(total_incidents)), hjust = -0.1, size = 3.4) +
>   coord_flip() +
>   scale_y_continuous(
>     limits = c(0, max(incidents_type$total_incidents) * 1.15)
>   ) +
>   labs(
>     title = "Incidents de sécurité publique par type",
>     subtitle = "Sherbrooke, 2022 à 2024; données mensuelles agrégées",
>     x = NULL,
>     y = "Nombre d'incidents"
>   )
> ```
>
> ![](exercices_files/figure-html/unnamed-chunk-4-1.png)
>
> Ce graphique ne publie aucune adresse, coordonnée ou date exacte. Il décrit les incidents enregistrés dans la source et non l’ensemble des situations qui ont pu survenir.

### Exercice 3 - Éviter une comparaison injuste entre années

Joignez les totaux annuels aux estimations de population et calculez un taux par 10 000 personnes. Comparez ce taux aux nombres bruts.

> **NOTE:**
>
> ``` r
> population <- read_csv(
>   "data/population_sherbrooke_2022_2024.csv",
>   show_col_types = FALSE
> )
>
> incidents_annee <- incidents |>
>   group_by(annee) |>
>   summarise(
>     total_incidents = sum(nb_incidents),
>     .groups = "drop"
>   ) |>
>   left_join(population, by = "annee") |>
>   mutate(
>     taux_par_10000 = total_incidents / population_estimee * 10000
>   )
>
> incidents_annee
> ```
>
>     # A tibble: 3 × 5
>       annee total_incidents population_estimee geographie             taux_par_10000
>       <dbl>           <dbl>              <dbl> <chr>                           <dbl>
>     1  2022            3750             177782 Sherbrooke (V), Québec           211.
>     2  2023            3790             180135 Sherbrooke (V), Québec           210.
>     3  2024            3881             183265 Sherbrooke (V), Québec           212.
>
> Le taux tient compte de l’évolution de la population. Il ne rend toutefois pas les années parfaitement comparables si les pratiques d’enregistrement ou le contexte changent.

## Bloc B - Réduire les risques de ré-identification

### Exercice 4 - Repérer les variables à risque

La source originale contient notamment `OBJECTID`, `DATEINCIDENT`, `DATETEXTE`, `x`, `y`, `DESCRIPTION` et `ANNEE`. Classez ces variables selon leur risque de divulgation et comparez-les aux champs retenus dans l’extrait du cours.

> **NOTE:**
>
> ``` r
> tibble(
>   variable_source = c(
>     "OBJECTID", "DATEINCIDENT", "DATETEXTE", "x", "y",
>     "DESCRIPTION", "ANNEE"
>   ),
>   diagnostic = c(
>     "identifiant technique retiré",
>     "date et heure exactes retirées",
>     "date exacte retirée",
>     "coordonnée retirée",
>     "coordonnée retirée",
>     "catégorie conservée",
>     "période large conservée"
>   )
> )
> ```
>
>     # A tibble: 7 × 2
>       variable_source diagnostic
>       <chr>           <chr>
>     1 OBJECTID        identifiant technique retiré
>     2 DATEINCIDENT    date et heure exactes retirées
>     3 DATETEXTE       date exacte retirée
>     4 x               coordonnée retirée
>     5 y               coordonnée retirée
>     6 DESCRIPTION     catégorie conservée
>     7 ANNEE           période large conservée
>
> ``` r
> names(incidents)
> ```
>
>     [1] "annee"         "mois"          "type_incident" "nb_incidents"
>
> L’agrégation mensuelle réduit la précision temporelle et la suppression des coordonnées élimine la localisation fine. Cela réduit le risque sans garantir une anonymisation absolue.

### Exercice 5 - Appliquer un seuil de diffusion

Créez `nb_public`, qui masque les cellules mensuelles contenant moins de cinq incidents.

> **NOTE:**
>
> ``` r
> incidents_publics <- incidents |>
>   mutate(
>     nb_public = if_else(nb_incidents < 5, NA_integer_, nb_incidents),
>     statut_publication = if_else(
>       is.na(nb_public),
>       "masqué: petit effectif",
>       "publié"
>     )
>   )
>
> incidents_publics |>
>   filter(is.na(nb_public))
> ```
>
>     # A tibble: 6 × 6
>       annee  mois type_incident   nb_incidents nb_public statut_publication
>       <dbl> <dbl> <chr>                  <dbl>     <dbl> <chr>
>     1  2022     7 Accident mortel            1        NA masqué: petit effectif
>     2  2022     8 Accident mortel            1        NA masqué: petit effectif
>     3  2022    11 Accident mortel            1        NA masqué: petit effectif
>     4  2022    12 Accident mortel            1        NA masqué: petit effectif
>     5  2023     8 Accident mortel            1        NA masqué: petit effectif
>     6  2024     7 Accident mortel            1        NA masqué: petit effectif
>
> Le seuil de cinq est une règle pédagogique prudente, pas une garantie universelle d’anonymat. Un seuil réel doit dépendre du contexte, des autres variables et des règles de l’organisation.

### Exercice 6 - Mesurer l’effet du masquage

Comptez les cellules publiées et masquées par type d’incident.

> **NOTE:**
>
> ``` r
> incidents_publics |>
>   count(type_incident, statut_publication) |>
>   pivot_wider(
>     names_from = statut_publication,
>     values_from = n,
>     values_fill = 0
>   )
> ```
>
>     # A tibble: 8 × 3
>       type_incident                      publié `masqué: petit effectif`
>       <chr>                               <int>                    <int>
>     1 Accident avec blessés                  36                        0
>     2 Accident mortel                         0                        6
>     3 Conduite avec capacités affaiblies     36                        0
>     4 Introduction par effraction            36                        0
>     5 Menace ou acte de violence             36                        0
>     6 Méfait                                 36                        0
>     7 Voie de fait                           36                        0
>     8 Vol                                    36                        0

### Exercice 7 - Visualiser sans surexposer les petites catégories

Calculez les totaux annuels par type, conservez seulement les cellules comptant au moins 20 incidents et produisez un graphique de taux par 10 000 personnes.

> **NOTE:**
>
> ``` r
> taux_type_annee <- incidents |>
>   group_by(annee, type_incident) |>
>   summarise(
>     nb_incidents = sum(nb_incidents),
>     .groups = "drop"
>   ) |>
>   left_join(population, by = "annee") |>
>   filter(nb_incidents >= 20) |>
>   mutate(
>     taux_par_10000 = nb_incidents / population_estimee * 10000
>   )
>
> ggplot(
>   taux_type_annee,
>   aes(x = factor(annee), y = taux_par_10000, fill = type_incident)
> ) +
>   geom_col(position = "dodge") +
>   labs(
>     title = "Taux d'incidents enregistrés par type",
>     subtitle = "Catégories annuelles de 20 incidents ou plus",
>     x = "Année",
>     y = "Incidents par 10 000 personnes",
>     fill = "Type"
>   )
> ```
>
> ![](exercices_files/figure-html/unnamed-chunk-9-1.png)
>
> Le graphique ne doit pas servir à étiqueter un quartier ou une population. Il présente des catégories enregistrées à l’échelle de la ville.

## Étude de cas 1 - Publication municipale responsable

### Exercice 8 - Construire une table publiable

À partir de `incidents_publics`, créez une table mensuelle qui conserve le type, l’année et le mois, mais ne diffuse pas les petits nombres.

> **NOTE:**
>
> ``` r
> table_publication <- incidents_publics |>
>   select(
>     annee,
>     mois,
>     type_incident,
>     nb_public,
>     statut_publication
>   ) |>
>   arrange(annee, mois, type_incident)
>
> table_publication
> ```
>
>     # A tibble: 258 × 5
>        annee  mois type_incident                      nb_public statut_publication
>        <dbl> <dbl> <chr>                                  <dbl> <chr>
>      1  2022     1 Accident avec blessés                     28 publié
>      2  2022     1 Conduite avec capacités affaiblies         6 publié
>      3  2022     1 Introduction par effraction               18 publié
>      4  2022     1 Menace ou acte de violence                30 publié
>      5  2022     1 Méfait                                    17 publié
>      6  2022     1 Voie de fait                              43 publié
>      7  2022     1 Vol                                       76 publié
>      8  2022     2 Accident avec blessés                     18 publié
>      9  2022     2 Conduite avec capacités affaiblies         8 publié
>     10  2022     2 Introduction par effraction               16 publié
>     # ℹ 248 more rows

### Exercice 9 - Écrire une note éthique courte

Rédigez trois phrases qui expliquent ce qui est publié, ce qui est masqué et la principale limite d’interprétation.

> **NOTE:**
>
> La publication présente des nombres mensuels agrégés par type, sans date exacte ni coordonnées. Les cellules de moins de cinq incidents sont masquées pour réduire les risques de divulgation et d’interprétation excessive des très petits nombres. Ces données décrivent des incidents enregistrés et ne mesurent ni toutes les situations survenues ni les causes des variations observées.

## Étude de cas 2 - Sondage public et communication prudente

Le fichier `data/sondage_utilisateurs_donnees_quebec_2020_2025.csv` contient des réponses agrégées à trois questions de la consultation publique de Données Québec. Il ne contient ni identifiant de répondant ni commentaire libre.

### Exercice 10 - Inspecter les effectifs et les valeurs manquantes

Importez le fichier, comptez les valeurs manquantes et résumez le nombre de choix enregistrés par année et par question.

> **NOTE:**
>
> ``` r
> sondage <- read_csv(
>   "data/sondage_utilisateurs_donnees_quebec_2020_2025.csv",
>   show_col_types = FALSE
> )
>
> sondage |>
>   summarise(
>     nb_manquants = sum(is.na(nb_reponses)),
>     pct_manquants = sum(is.na(pourcentage))
>   )
> ```
>
>     # A tibble: 1 × 2
>       nb_manquants pct_manquants
>              <int>         <int>
>     1            8             8
>
> ``` r
> resume_sondage <- sondage |>
>   filter(!is.na(nb_reponses)) |>
>   group_by(annee, question) |>
>   summarise(
>     total_choix = sum(nb_reponses),
>     nb_modalites = n(),
>     .groups = "drop"
>   )
>
> resume_sondage
> ```
>
>     # A tibble: 17 × 4
>        annee question total_choix nb_modalites
>        <dbl>    <dbl>       <dbl>        <int>
>      1  2020        6          88           10
>      2  2020       11          41           10
>      3  2021        3         495            8
>      4  2021        6         286           10
>      5  2021       11         291           10
>      6  2022        3         535            8
>      7  2022        6         291           10
>      8  2022       11         292           10
>      9  2023        3         511            8
>     10  2023        6         263           10
>     11  2023       11         264           10
>     12  2024        3         446            8
>     13  2024        6         259           10
>     14  2024       11         260           10
>     15  2025        3         199            8
>     16  2025        6         124           10
>     17  2025       11         124           10
>
> Le total des choix n’est pas nécessairement le nombre de personnes si une question permet plusieurs réponses.

### Exercice 11 - Produire un graphique défendable

Pour la question 6 en 2025, masquez les modalités comptant moins de cinq choix et produisez un graphique avec les effectifs.

> **NOTE:**
>
> ``` r
> sondage_2025_q6 <- sondage |>
>   filter(
>     annee == 2025,
>     question == 6,
>     !is.na(nb_reponses),
>     nb_reponses >= 5
>   )
>
> ggplot(
>   sondage_2025_q6,
>   aes(x = fct_reorder(reponse, nb_reponses), y = nb_reponses)
> ) +
>   geom_col(fill = "#2F4B7C") +
>   geom_text(aes(label = nb_reponses), hjust = -0.1, size = 3.4) +
>   coord_flip() +
>   scale_y_continuous(
>     limits = c(0, max(sondage_2025_q6$nb_reponses) * 1.2)
>   ) +
>   labs(
>     title = "Usages déclarés des données ouvertes",
>     subtitle = "Question 6, 2025; modalités de moins de cinq choix non affichées",
>     x = NULL,
>     y = "Nombre de choix"
>   )
> ```
>
> ![](exercices_files/figure-html/unnamed-chunk-12-1.png)
>
> Les personnes ont choisi de participer à une consultation en ligne. Les résultats ne doivent pas être présentés comme représentatifs de toute la population québécoise.

### Exercice 12 - Décider ce qu’il ne faut pas publier

Nommez deux types d’information qui ne devraient pas être ajoutés à cette publication ouverte et expliquez pourquoi.

> **NOTE:**
>
> Il ne faudrait pas ajouter d’identifiant permettant de relier les choix d’une même personne, car cela transformerait un tableau agrégé en historique individuel. Les commentaires libres ne devraient pas être publiés sans un processus rigoureux, car ils peuvent contenir des noms, des organisations, des coordonnées ou des situations reconnaissables. Même dans un tableau agrégé, les très petits effectifs méritent une évaluation avant diffusion.
