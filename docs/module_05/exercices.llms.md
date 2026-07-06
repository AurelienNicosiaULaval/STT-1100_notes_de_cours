# Module 5 - Exercices

STT-1100 Introduction à la science des données

# Exercices de consolidation

Ces exercices sont indépendants de l’aventure et du défi. Ils servent à consolider les gestes techniques du module 5: manipuler des dates, résumer des groupes, visualiser des associations, calculer des corrélations simples et formuler des conclusions prudentes.

Les données utilisées ici sont fictives et ne représentent aucun système réel.

``` r
library(tidyverse)
library(lubridate)
```

# Lectures à revoir

- [R for Data Science - Exploratory data analysis](https://r4ds.hadley.nz/EDA.html)
- [R for Data Science - Dates and times](https://r4ds.hadley.nz/datetimes.html)
- [R for Data Science - Data visualization](https://r4ds.hadley.nz/data-visualize.html)
- [R for Data Science - Missing values](https://r4ds.hadley.nz/missing-values.html)
- [OpenIntro Statistics - Exploration descriptive](https://www.openintro.org/book/os/)

Après les lectures, faites aussi le [mini-test formatif](../module_05/mini_test.llms.md). Il n’est pas noté.

# Bloc A - Dates, structure et valeurs manquantes

Le fichier `data/ateliers_soutien_fictif.csv` décrit de faux ateliers de soutien universitaire.

## Exercice 1 - Importer et inspecter

Importez le fichier, affichez sa structure et vérifiez ses dimensions.

> **NOTE:**
>
> ``` r
> ateliers <- read_csv(
>   "data/ateliers_soutien_fictif.csv",
>   show_col_types = FALSE
> )
>
> glimpse(ateliers)
> ```
>
>     Rows: 24
>     Columns: 10
>     $ atelier_id           <chr> "A-001", "A-002", "A-003", "A-004", "A-005", "A-0…
>     $ date_atelier         <date> 2026-01-15, 2026-01-16, 2026-01-18, 2026-01-22, …
>     $ heure_debut          <dbl> 9, 13, 16, 10, 14, 18, 9, 15, 17, 11, 13, 16, 9, …
>     $ campus               <chr> "Quebec", "Quebec", "Levis", "Quebec", "Levis", "…
>     $ duree_minutes        <dbl> 60, 75, 60, 90, 75, 60, 90, 60, 75, 60, 90, 75, 6…
>     $ participants         <dbl> 18, 24, 12, 31, 16, 22, 28, 14, 35, 20, 18, 33, 1…
>     $ temperature_c        <dbl> -8, -6, -5, -3, -2, -4, -10, -7, -4, -1, 0, 1, -6…
>     $ pluie_mm             <dbl> 0.0, 1.2, 0.0, 0.4, 2.1, 0.0, 0.0, 3.4, 0.2, 0.0,…
>     $ satisfaction_moyenne <dbl> 4.1, 4.2, 3.8, 4.4, 4.0, 4.3, 4.5, 3.7, 4.6, 4.2,…
>     $ theme                <chr> "Quarto", "Visualisation", "Importation", "EDA", …
>
> ``` r
> tibble(
>   lignes = nrow(ateliers),
>   colonnes = ncol(ateliers)
> )
> ```
>
>     # A tibble: 1 × 2
>       lignes colonnes
>        <int>    <int>
>     1     24       10

## Exercice 2 - Préparer les variables temporelles

Transformez `date_atelier` en date, puis créez `jour_semaine`, `mois` et `moment_journee`.

> **NOTE:**
>
> ``` r
> ateliers_dates <- ateliers |>
>   mutate(
>     date_atelier = ymd(date_atelier),
>     jour_semaine = wday(date_atelier, label = TRUE, abbr = FALSE),
>     mois = month(date_atelier, label = TRUE, abbr = FALSE),
>     moment_journee = case_when(
>       heure_debut < 12 ~ "matin",
>       heure_debut < 17 ~ "après-midi",
>       TRUE ~ "soir"
>     )
>   )
>
> ateliers_dates |>
>   select(atelier_id, date_atelier, jour_semaine, mois, heure_debut, moment_journee) |>
>   slice_head(n = 8)
> ```
>
>     # A tibble: 8 × 6
>       atelier_id date_atelier jour_semaine mois     heure_debut moment_journee
>       <chr>      <date>       <ord>        <ord>          <dbl> <chr>
>     1 A-001      2026-01-15   Thursday     January            9 matin
>     2 A-002      2026-01-16   Friday       January           13 après-midi
>     3 A-003      2026-01-18   Sunday       January           16 après-midi
>     4 A-004      2026-01-22   Thursday     January           10 matin
>     5 A-005      2026-01-24   Saturday     January           14 après-midi
>     6 A-006      2026-01-29   Thursday     January           18 soir
>     7 A-007      2026-02-03   Tuesday      February           9 matin
>     8 A-008      2026-02-05   Thursday     February          15 après-midi

## Exercice 3 - Repérer les valeurs manquantes

Calculez le nombre de valeurs manquantes dans `participants`, `pluie_mm` et `satisfaction_moyenne`.

> **NOTE:**
>
> ``` r
> ateliers_dates |>
>   summarise(
>     participants_manquants = sum(is.na(participants)),
>     pluie_manquante = sum(is.na(pluie_mm)),
>     satisfaction_manquante = sum(is.na(satisfaction_moyenne))
>   )
> ```
>
>     # A tibble: 1 × 3
>       participants_manquants pluie_manquante satisfaction_manquante
>                        <int>           <int>                  <int>
>     1                      0               1                      1

## Exercice 4 - Résumer par moment de la journée

Calculez le nombre d’ateliers, le nombre moyen de participantes et participants, et la satisfaction moyenne selon `moment_journee`.

> **NOTE:**
>
> ``` r
> resume_moment <- ateliers_dates |>
>   group_by(moment_journee) |>
>   summarise(
>     n_ateliers = n(),
>     participants_moyens = mean(participants, na.rm = TRUE),
>     satisfaction_moyenne = mean(satisfaction_moyenne, na.rm = TRUE),
>     .groups = "drop"
>   )
>
> resume_moment
> ```
>
>     # A tibble: 3 × 4
>       moment_journee n_ateliers participants_moyens satisfaction_moyenne
>       <chr>               <int>               <dbl>                <dbl>
>     1 après-midi             11                20.5                 4.08
>     2 matin                   8                23.2                 4.28
>     3 soir                    5                35.8                 4.55

# Bloc B - Associations et visualisations

## Exercice 5 - Visualiser les participantes et participants

Produisez un diagramme en colonnes du nombre moyen de participantes et participants selon le moment de la journée.

> **NOTE:**
>
> ``` r
> resume_moment |>
>   ggplot(aes(x = moment_journee, y = participants_moyens)) +
>   geom_col(fill = "#2c7fb8") +
>   labs(
>     title = "Participation moyenne selon le moment de la journée",
>     x = "Moment de la journée",
>     y = "Nombre moyen de participantes et participants"
>   )
> ```
>
> ![](exercices_files/figure-html/unnamed-chunk-5-1.png)

## Exercice 6 - Comparer les thèmes

Pour chaque thème d’atelier, calculez le nombre d’ateliers, la participation moyenne et la satisfaction moyenne.

> **NOTE:**
>
> ``` r
> resume_theme <- ateliers_dates |>
>   group_by(theme) |>
>   summarise(
>     n_ateliers = n(),
>     participants_moyens = mean(participants, na.rm = TRUE),
>     satisfaction_moyenne = mean(satisfaction_moyenne, na.rm = TRUE),
>     .groups = "drop"
>   ) |>
>   arrange(desc(participants_moyens))
>
> resume_theme
> ```
>
>     # A tibble: 4 × 4
>       theme         n_ateliers participants_moyens satisfaction_moyenne
>       <chr>              <int>               <dbl>                <dbl>
>     1 Visualisation          7                30.9                 4.42
>     2 EDA                    6                28.7                 4.4
>     3 Quarto                 6                19.7                 4.17
>     4 Importation            5                16.8                 3.88

## Exercice 7 - Calculer une matrice de corrélation

Calculez les corrélations entre `duree_minutes`, `participants`, `temperature_c`, `pluie_mm` et `satisfaction_moyenne`.

> **NOTE:**
>
> ``` r
> ateliers_dates |>
>   select(duree_minutes, participants, temperature_c, pluie_mm, satisfaction_moyenne) |>
>   cor(use = "complete.obs") |>
>   round(2)
> ```
>
>                          duree_minutes participants temperature_c pluie_mm
>     duree_minutes                 1.00         0.59          0.16     0.15
>     participants                  0.59         1.00          0.27    -0.47
>     temperature_c                 0.16         0.27          1.00     0.17
>     pluie_mm                      0.15        -0.47          0.17     1.00
>     satisfaction_moyenne          0.40         0.93          0.23    -0.65
>                          satisfaction_moyenne
>     duree_minutes                        0.40
>     participants                         0.93
>     temperature_c                        0.23
>     pluie_mm                            -0.65
>     satisfaction_moyenne                 1.00
>
> La corrélation résume une association linéaire. Elle ne suffit pas à établir une relation de cause à effet.

## Exercice 8 - Faire un nuage de points

Créez un graphique de `duree_minutes` et `participants`. Ajoutez une droite de tendance.

> **NOTE:**
>
> ``` r
> ateliers_dates |>
>   ggplot(aes(x = duree_minutes, y = participants)) +
>   geom_point(aes(color = theme), size = 2.5, alpha = 0.8) +
>   geom_smooth(method = "lm", se = FALSE, color = "black") +
>   labs(
>     title = "Durée des ateliers et participation",
>     x = "Durée de l'atelier (minutes)",
>     y = "Nombre de participantes et participants",
>     color = "Thème"
>   )
> ```
>
>     `geom_smooth()` using formula = 'y ~ x'
>
> ![](exercices_files/figure-html/unnamed-chunk-8-1.png)

## Exercice 9 - Comparer les jours pluvieux et non pluvieux

Créez une variable `jour_pluvieux`, puis comparez la participation moyenne selon cette variable.

> **NOTE:**
>
> ``` r
> ateliers_pluie <- ateliers_dates |>
>   mutate(
>     jour_pluvieux = case_when(
>       is.na(pluie_mm) ~ "pluie inconnue",
>       pluie_mm > 0 ~ "pluie",
>       TRUE ~ "pas de pluie"
>     )
>   )
>
> ateliers_pluie |>
>   group_by(jour_pluvieux) |>
>   summarise(
>     n_ateliers = n(),
>     participants_moyens = mean(participants, na.rm = TRUE),
>     .groups = "drop"
>   )
> ```
>
>     # A tibble: 3 × 3
>       jour_pluvieux  n_ateliers participants_moyens
>       <chr>               <int>               <dbl>
>     1 pas de pluie           11                27.5
>     2 pluie                  12                22.4
>     3 pluie inconnue          1                19

# Bloc C - Interprétation prudente

## Exercice 10 - Écrire une conclusion descriptive

À partir de l’un des tableaux précédents, écrivez deux phrases:

1.  une phrase qui décrit le résultat observé;
2.  une phrase qui précise une limite.

> **NOTE:**
>
> Les ateliers du soir semblent avoir une participation moyenne plus élevée dans ce petit fichier fictif. Cette comparaison reste descriptive, car les ateliers du soir ne portent pas toujours sur les mêmes thèmes et le nombre d’observations est limité.

## Exercice 11 - Choisir une visualisation adaptée

Choisissez une question parmi les deux suivantes, puis produisez un graphique adapté.

1.  La satisfaction moyenne varie-t-elle selon le thème?
2.  La participation varie-t-elle selon la température?

> **NOTE:**
>
> ``` r
> ateliers_dates |>
>   filter(!is.na(satisfaction_moyenne)) |>
>   ggplot(aes(x = theme, y = satisfaction_moyenne)) +
>   geom_point(size = 2.5, alpha = 0.8) +
>   labs(
>     title = "Satisfaction moyenne selon le thème",
>     x = "Thème",
>     y = "Satisfaction moyenne"
>   )
> ```
>
> ![](exercices_files/figure-html/unnamed-chunk-10-1.png)

## Exercice 12 - Construire un petit tableau de synthèse

Créez un tableau de synthèse par campus avec le nombre d’ateliers, la participation totale, la participation moyenne et la satisfaction moyenne.

> **NOTE:**
>
> ``` r
> ateliers_dates |>
>   group_by(campus) |>
>   summarise(
>     n_ateliers = n(),
>     participation_totale = sum(participants, na.rm = TRUE),
>     participation_moyenne = mean(participants, na.rm = TRUE),
>     satisfaction_moyenne = mean(satisfaction_moyenne, na.rm = TRUE),
>     .groups = "drop"
>   )
> ```
>
>     # A tibble: 2 × 5
>       campus n_ateliers participation_totale participation_moyenne
>       <chr>       <int>                <dbl>                 <dbl>
>     1 Levis           8                  129                  16.1
>     2 Quebec         16                  461                  28.8
>     # ℹ 1 more variable: satisfaction_moyenne <dbl>

# Études de cas

## Étude de cas 1 - Fréquentation fictive d’une bibliothèque

Le fichier `data/frequentation_bibliotheque_fictive.csv` décrit de fausses observations de fréquentation dans des zones de bibliothèque.

Réalisez les tâches suivantes:

1.  importez le fichier;
2.  transformez `date_visite` en date;
3.  créez `jour_semaine` et `moment_journee`;
4.  résumez le nombre de visiteurs par zone et par moment de la journée;
5.  calculez les corrélations entre `visiteurs`, `temperature_c` et `pluie_mm`;
6.  produisez une visualisation utile;
7.  rédigez une conclusion prudente.

> **NOTE:**
>
> ``` r
> bibliotheque <- read_csv(
>   "data/frequentation_bibliotheque_fictive.csv",
>   show_col_types = FALSE
> ) |>
>   mutate(
>     date_visite = ymd(date_visite),
>     jour_semaine = wday(date_visite, label = TRUE, abbr = FALSE),
>     moment_journee = case_when(
>       heure < 12 ~ "matin",
>       heure < 17 ~ "après-midi",
>       TRUE ~ "soir"
>     )
>   )
>
> bibliotheque |>
>   group_by(zone, moment_journee) |>
>   summarise(
>     n_observations = n(),
>     visiteurs_moyens = mean(visiteurs),
>     .groups = "drop"
>   )
> ```
>
>     # A tibble: 3 × 4
>       zone          moment_journee n_observations visiteurs_moyens
>       <chr>         <chr>                   <int>            <dbl>
>     1 Collaboration après-midi                  8             58.2
>     2 Ordinateurs   soir                        8             65.9
>     3 Silence       matin                       8             44.4
>
> ``` r
> bibliotheque |>
>   select(visiteurs, temperature_c, pluie_mm) |>
>   cor(use = "complete.obs") |>
>   round(2)
> ```
>
>                   visiteurs temperature_c pluie_mm
>     visiteurs          1.00          0.63    -0.27
>     temperature_c      0.63          1.00    -0.48
>     pluie_mm          -0.27         -0.48     1.00
>
> ``` r
> bibliotheque |>
>   ggplot(aes(x = moment_journee, y = visiteurs, color = zone)) +
>   geom_point(size = 2.5, alpha = 0.8) +
>   labs(
>     title = "Fréquentation fictive selon le moment de la journée",
>     x = "Moment de la journée",
>     y = "Nombre de visiteurs",
>     color = "Zone"
>   )
> ```
>
> ![](exercices_files/figure-html/unnamed-chunk-12-1.png)
>
> Une conclusion prudente pourrait indiquer que les observations du soir semblent plus fréquentées dans ce fichier, surtout dans la zone des ordinateurs. Cette conclusion reste descriptive, car la semaine d’examens, la zone et le campus varient en même temps.

## Étude de cas 2 - Demandes fictives de services campus

Le fichier `data/demandes_services_campus_fictif.csv` décrit de fausses demandes adressées à des services de campus.

Réalisez les tâches suivantes:

1.  importez le fichier;
2.  transformez `date_demande` en date;
3.  résumez les délais par service et par priorité;
4.  calculez les corrélations entre `delai_heures`, `satisfaction` et `cout_estime`;
5.  produisez une visualisation utile;
6.  rédigez une conclusion prudente.

> **NOTE:**
>
> ``` r
> demandes <- read_csv(
>   "data/demandes_services_campus_fictif.csv",
>   show_col_types = FALSE
> ) |>
>   mutate(
>     date_demande = ymd(date_demande),
>     jour_semaine = wday(date_demande, label = TRUE, abbr = FALSE)
>   )
>
> demandes |>
>   group_by(service, priorite) |>
>   summarise(
>     n_demandes = n(),
>     delai_moyen = mean(delai_heures, na.rm = TRUE),
>     satisfaction_moyenne = mean(satisfaction, na.rm = TRUE),
>     .groups = "drop"
>   ) |>
>   arrange(desc(delai_moyen))
> ```
>
>     # A tibble: 12 × 5
>        service      priorite n_demandes delai_moyen satisfaction_moyenne
>        <chr>        <chr>         <int>       <dbl>                <dbl>
>      1 Entretien    Basse             2        76                   3
>      2 Entretien    Normale           2        59                   3.2
>      3 Entretien    Elevee            2        45                   3.55
>      4 Salles       Basse             1        44                   3.3
>      5 Salles       Normale           2        34.5                 3.8
>      6 Informatique Basse             1        27                   4
>      7 Bibliotheque Basse             2        22                   4.5
>      8 Salles       Elevee            2        20.5                 4.05
>      9 Informatique Normale           4        17.5                 4.3
>     10 Bibliotheque Normale           3        13                   4.77
>     11 Bibliotheque Elevee            1        10                   4.8
>     12 Informatique Elevee            2         8.5                 4.6
>
> ``` r
> demandes |>
>   select(delai_heures, satisfaction, cout_estime) |>
>   cor(use = "complete.obs") |>
>   round(2)
> ```
>
>                  delai_heures satisfaction cout_estime
>     delai_heures         1.00        -0.95        0.91
>     satisfaction        -0.95         1.00       -0.90
>     cout_estime          0.91        -0.90        1.00
>
> ``` r
> demandes |>
>   ggplot(aes(x = delai_heures, y = satisfaction, color = service)) +
>   geom_point(size = 2.5, alpha = 0.8) +
>   geom_smooth(method = "lm", se = FALSE, color = "black") +
>   labs(
>     title = "Délai de traitement et satisfaction",
>     x = "Délai de traitement (heures)",
>     y = "Satisfaction",
>     color = "Service"
>   )
> ```
>
>     `geom_smooth()` using formula = 'y ~ x'
>
>     Warning: Removed 1 row containing non-finite outside the scale range
>     (`stat_smooth()`).
>
>     Warning: Removed 1 row containing missing values or values outside the scale range
>     (`geom_point()`).
>
> ![](exercices_files/figure-html/unnamed-chunk-13-1.png)
>
> Une conclusion prudente pourrait indiquer que les demandes avec de longs délais semblent associées à une satisfaction plus faible dans ce fichier fictif. On ne peut toutefois pas conclure que le délai cause directement la satisfaction, car la priorité, le type de service et la complexité des demandes peuvent aussi intervenir.
