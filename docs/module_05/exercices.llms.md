# Module 5 - Exercices

STT-1100 Introduction à la science des données

> **IMPORTANT:**
>
> [Télécharger le dossier prêt à ouvrir (.zip)](../downloads/donnees/stt1100-module-05-fr.zip)
>
> Décompressez le fichier, puis ouvrez le projet `.Rproj`. Les chemins utilisés dans les exercices fonctionneront sans déplacer les données.

## Exercices de consolidation

Ces exercices sont indépendants de l’aventure et du défi. Ils servent à consolider les gestes techniques du module 5: manipuler des dates, résumer des groupes, visualiser des associations, calculer des corrélations simples et formuler des conclusions prudentes.

> **NOTE:**
>
> Les exercices utilisent les [comptages vélos de Laval](https://www.donneesquebec.ca/recherche/dataset/comptages-velos), les [mesures horaires de la qualité de l’air du Québec](https://www.donneesquebec.ca/recherche/dataset/rsqaq-donnees-horaires-continues) à la station Québec - Vieux-Limoilou et les [débits de circulation de Gatineau](https://www.donneesquebec.ca/recherche/dataset/debits-de-circulation). Ces sources officielles sont diffusées sous licence CC BY 4.0. Les fichiers locaux sont des extraits reproductibles préparés par `scripts/build_module05_real_data.R`.

``` r
library(tidyverse)
library(lubridate)
```

## Bloc A - Dates, structure et valeurs manquantes

Le fichier `data/comptages_velos_laval_2016_06.csv` contient les comptages effectués toutes les 15 minutes à la boucle Chevillon, à Laval, en juin 2016.

### Exercice 1 - Importer et inspecter

Importez le fichier, affichez sa structure et vérifiez ses dimensions.

> **NOTE:**
>
> ``` r
> velos <- read_csv(
>   "data/comptages_velos_laval_2016_06.csv",
>   show_col_types = FALSE
> )
>
> glimpse(velos)
> ```
>
>     Rows: 2,688
>     Columns: 5
>     $ date           <date> 2016-06-01, 2016-06-01, 2016-06-01, 2016-06-01, 2016-0…
>     $ heure          <time> 00:00:00, 00:15:00, 00:30:00, 00:45:00, 01:00:00, 01:1…
>     $ velos_total    <dbl> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
>     $ velos_entrants <dbl> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
>     $ velos_sortants <dbl> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
>
> ``` r
> tibble(
>   lignes = nrow(velos),
>   colonnes = ncol(velos)
> )
> ```
>
>     # A tibble: 1 × 2
>       lignes colonnes
>        <int>    <int>
>     1   2688        5

### Exercice 2 - Préparer les variables temporelles

Combinez `date` et `heure`, puis créez `jour_semaine`, `mois`, `heure_jour` et `moment_journee`.

> **NOTE:**
>
> ``` r
> velos_dates <- velos |>
>   mutate(
>     date_heure = ymd_hms(paste(date, heure)),
>     jour_semaine = wday(date_heure, label = TRUE, abbr = FALSE),
>     mois = month(date_heure, label = TRUE, abbr = FALSE),
>     heure_jour = hour(date_heure),
>     moment_journee = case_when(
>       heure_jour < 12 ~ "matin",
>       heure_jour < 17 ~ "après-midi",
>       TRUE ~ "soir"
>     )
>   )
>
> velos_dates |>
>   select(date_heure, jour_semaine, mois, heure_jour, moment_journee) |>
>   slice_head(n = 8)
> ```
>
>     # A tibble: 8 × 5
>       date_heure          jour_semaine mois  heure_jour moment_journee
>       <dttm>              <ord>        <ord>      <int> <chr>
>     1 2016-06-01 00:00:00 Wednesday    June           0 matin
>     2 2016-06-01 00:15:00 Wednesday    June           0 matin
>     3 2016-06-01 00:30:00 Wednesday    June           0 matin
>     4 2016-06-01 00:45:00 Wednesday    June           0 matin
>     5 2016-06-01 01:00:00 Wednesday    June           1 matin
>     6 2016-06-01 01:15:00 Wednesday    June           1 matin
>     7 2016-06-01 01:30:00 Wednesday    June           1 matin
>     8 2016-06-01 01:45:00 Wednesday    June           1 matin

### Exercice 3 - Vérifier les valeurs manquantes et une relation comptable

Comptez les valeurs manquantes dans les trois colonnes de comptage. Vérifiez aussi que `velos_total` correspond à la somme des vélos entrants et sortants.

> **NOTE:**
>
> ``` r
> velos_dates |>
>   summarise(
>     total_manquant = sum(is.na(velos_total)),
>     entrants_manquants = sum(is.na(velos_entrants)),
>     sortants_manquants = sum(is.na(velos_sortants)),
>     totaux_incoherents = sum(
>       velos_total != velos_entrants + velos_sortants,
>       na.rm = TRUE
>     )
>   )
> ```
>
>     # A tibble: 1 × 4
>       total_manquant entrants_manquants sortants_manquants totaux_incoherents
>                <int>              <int>              <int>              <int>
>     1              0                  0                  0                  0

### Exercice 4 - Résumer par moment de la journée

Calculez le nombre d’observations et le nombre moyen de vélos selon `moment_journee`.

> **NOTE:**
>
> ``` r
> resume_moment <- velos_dates |>
>   group_by(moment_journee) |>
>   summarise(
>     n_observations = n(),
>     velos_moyens = mean(velos_total, na.rm = TRUE),
>     entrants_moyens = mean(velos_entrants, na.rm = TRUE),
>     sortants_moyens = mean(velos_sortants, na.rm = TRUE),
>     .groups = "drop"
>   )
>
> resume_moment
> ```
>
>     # A tibble: 3 × 5
>       moment_journee n_observations velos_moyens entrants_moyens sortants_moyens
>       <chr>                   <int>        <dbl>           <dbl>           <dbl>
>     1 après-midi                560        18.3             9.82            8.5
>     2 matin                    1344         7.69            3.50            4.19
>     3 soir                      784         7.99            4.16            3.83

## Bloc B - Associations et visualisations

### Exercice 5 - Visualiser les comptages moyens

Produisez un diagramme en colonnes du nombre moyen de vélos selon le moment de la journée.

> **NOTE:**
>
> ``` r
> resume_moment |>
>   ggplot(aes(x = moment_journee, y = velos_moyens)) +
>   geom_col(fill = "#2c7fb8") +
>   labs(
>     title = "Comptage moyen selon le moment de la journée",
>     x = "Moment de la journée",
>     y = "Nombre moyen de vélos par intervalle de 15 minutes"
>   )
> ```
>
> ![](exercices_files/figure-html/unnamed-chunk-5-1.png)

### Exercice 6 - Comparer les jours de la semaine

Pour chaque jour de la semaine, calculez le nombre d’observations et le comptage moyen.

> **NOTE:**
>
> ``` r
> resume_jour <- velos_dates |>
>   group_by(jour_semaine) |>
>   summarise(
>     n_observations = n(),
>     velos_moyens = mean(velos_total, na.rm = TRUE),
>     .groups = "drop"
>   ) |>
>   arrange(desc(velos_moyens))
>
> resume_jour
> ```
>
>     # A tibble: 7 × 3
>       jour_semaine n_observations velos_moyens
>       <ord>                 <int>        <dbl>
>     1 Sunday                  288        12.9
>     2 Tuesday                 384        12.0
>     3 Thursday                480        10.9
>     4 Friday                  384        10.2
>     5 Saturday                288         9.36
>     6 Wednesday               480         8.01
>     7 Monday                  384         7.38

### Exercice 7 - Calculer une matrice de corrélation

Calculez les corrélations entre `velos_total`, `velos_entrants` et `velos_sortants`.

> **NOTE:**
>
> ``` r
> velos_dates |>
>   select(velos_total, velos_entrants, velos_sortants) |>
>   cor(use = "complete.obs") |>
>   round(2)
> ```
>
>                    velos_total velos_entrants velos_sortants
>     velos_total           1.00           0.94           0.92
>     velos_entrants        0.94           1.00           0.73
>     velos_sortants        0.92           0.73           1.00
>
> La corrélation est ici influencée par la relation comptable entre le total et les deux directions. Elle ne constitue pas une preuve de causalité.

### Exercice 8 - Faire un nuage de points

Créez un graphique des vélos entrants et sortants. Colorez les points selon le moment de la journée et ajoutez une droite de tendance.

> **NOTE:**
>
> ``` r
> velos_dates |>
>   ggplot(aes(x = velos_entrants, y = velos_sortants)) +
>   geom_point(aes(color = moment_journee), alpha = 0.45) +
>   geom_smooth(method = "lm", se = FALSE, color = "black") +
>   labs(
>     title = "Comptages entrants et sortants à Laval",
>     x = "Vélos entrants",
>     y = "Vélos sortants",
>     color = "Moment"
>   )
> ```
>
>     `geom_smooth()` using formula = 'y ~ x'
>
> ![](exercices_files/figure-html/unnamed-chunk-8-1.png)

### Exercice 9 - Comparer la semaine et la fin de semaine

Créez une variable `type_jour`, puis comparez les comptages moyens entre la semaine et la fin de semaine.

> **NOTE:**
>
> ``` r
> velos_type_jour <- velos_dates |>
>   mutate(
>     type_jour = if_else(
>       wday(date_heure) %in% c(1, 7),
>       "fin de semaine",
>       "semaine"
>     )
>   )
>
> velos_type_jour |>
>   group_by(type_jour) |>
>   summarise(
>     n_observations = n(),
>     velos_moyens = mean(velos_total, na.rm = TRUE),
>     .groups = "drop"
>   )
> ```
>
>     # A tibble: 2 × 3
>       type_jour      n_observations velos_moyens
>       <chr>                   <int>        <dbl>
>     1 fin de semaine            576        11.1
>     2 semaine                  2112         9.68

## Bloc C - Interprétation prudente

### Exercice 10 - Écrire une conclusion descriptive

À partir de l’un des tableaux précédents, écrivez une phrase descriptive et une phrase qui précise une limite.

> **NOTE:**
>
> Dans cet extrait, le comptage moyen est plus élevé l’après-midi que le matin ou le soir. Le résultat décrit uniquement les mesures de la boucle Chevillon en juin 2016 et ne permet pas d’expliquer la cause de cette différence.

### Exercice 11 - Choisir une visualisation adaptée

Produisez un graphique du comptage moyen selon l’heure de la journée.

> **NOTE:**
>
> ``` r
> velos_dates |>
>   group_by(heure_jour) |>
>   summarise(
>     velos_moyens = mean(velos_total, na.rm = TRUE),
>     .groups = "drop"
>   ) |>
>   ggplot(aes(x = heure_jour, y = velos_moyens)) +
>   geom_line(linewidth = 1, color = "#2c7fb8") +
>   geom_point(color = "#2c7fb8") +
>   labs(
>     title = "Profil horaire des comptages vélos",
>     x = "Heure",
>     y = "Nombre moyen de vélos"
>   )
> ```
>
> ![](exercices_files/figure-html/unnamed-chunk-10-1.png)

### Exercice 12 - Construire un tableau de synthèse quotidien

Créez un tableau par date avec le total quotidien, la moyenne par intervalle et le maximum observé sur 15 minutes.

> **NOTE:**
>
> ``` r
> velos_dates |>
>   group_by(date) |>
>   summarise(
>     total_quotidien = sum(velos_total, na.rm = TRUE),
>     moyenne_intervalle = mean(velos_total, na.rm = TRUE),
>     maximum_intervalle = max(velos_total, na.rm = TRUE),
>     .groups = "drop"
>   ) |>
>   arrange(desc(total_quotidien))
> ```
>
>     # A tibble: 28 × 4
>        date       total_quotidien moyenne_intervalle maximum_intervalle
>        <date>               <dbl>              <dbl>              <dbl>
>      1 2016-06-24            2003               20.9                124
>      2 2016-06-16            1509               15.7                 53
>      3 2016-06-15            1473               15.3                 50
>      4 2016-06-14            1450               15.1                 56
>      5 2016-06-18            1418               14.8                 55
>      6 2016-06-30            1359               14.2                 41
>      7 2016-06-19            1349               14.1                 50
>      8 2016-06-07            1318               13.7                 66
>      9 2016-06-21            1303               13.6                 48
>     10 2016-06-23            1303               13.6                 58
>     # ℹ 18 more rows

## Études de cas

### Étude de cas 1 - Qualité de l’air à Québec - Vieux-Limoilou

Le fichier `data/qualite_air_quebec_vieux_limoilou_2025_07.csv` contient 744 mesures horaires de juillet 2025 à la station Québec - Vieux-Limoilou. Les variables représentent des concentrations de contaminants et peuvent contenir des valeurs manquantes.

Réalisez les tâches suivantes:

1.  importez le fichier et transformez `date_heure`;
2.  créez `date`, `heure_jour` et `moment_journee`;
3.  comptez les valeurs manquantes par contaminant;
4.  résumez les concentrations moyennes par moment de la journée;
5.  calculez une matrice de corrélation entre les contaminants;
6.  produisez une visualisation temporelle des particules fines;
7.  rédigez une conclusion prudente.

> **NOTE:**
>
> ``` r
> air_quebec <- read_csv(
>   "data/qualite_air_quebec_vieux_limoilou_2025_07.csv",
>   show_col_types = FALSE
> ) |>
>   mutate(
>     date_heure = ymd_hms(date_heure),
>     date = as_date(date_heure),
>     heure_jour = hour(date_heure),
>     moment_journee = case_when(
>       heure_jour < 12 ~ "matin",
>       heure_jour < 17 ~ "après-midi",
>       TRUE ~ "soir"
>     )
>   )
> ```
>
>     Warning: There was 1 warning in `mutate()`.
>     ℹ In argument: `date_heure = ymd_hms(date_heure)`.
>     Caused by warning:
>     !  31 failed to parse.
>
> ``` r
> air_quebec |>
>   summarise(
>     across(
>       carbone_noir:dioxyde_soufre,
>       ~ sum(is.na(.x)),
>       .names = "manquants_{.col}"
>     )
>   )
> ```
>
>     # A tibble: 1 × 5
>       manquants_carbone_noir manquants_monoxyde_carbone manquants_ozone
>                        <int>                      <int>           <int>
>     1                     59                         31               7
>     # ℹ 2 more variables: manquants_particules_fines <int>,
>     #   manquants_dioxyde_soufre <int>
>
> ``` r
> air_quebec |>
>   group_by(moment_journee) |>
>   summarise(
>     across(carbone_noir:dioxyde_soufre, ~ mean(.x, na.rm = TRUE)),
>     .groups = "drop"
>   )
> ```
>
>     # A tibble: 3 × 6
>       moment_journee carbone_noir monoxyde_carbone ozone particules_fines
>       <chr>                 <dbl>            <dbl> <dbl>            <dbl>
>     1 après-midi            0.560            0.220  30.9             14.8
>     2 matin                 0.690            0.221  17.6             14.2
>     3 soir                  0.798            0.240  26.4             16.2
>     # ℹ 1 more variable: dioxyde_soufre <dbl>
>
> ``` r
> air_quebec |>
>   select(carbone_noir:dioxyde_soufre) |>
>   cor(use = "complete.obs") |>
>   round(2)
> ```
>
>                      carbone_noir monoxyde_carbone ozone particules_fines
>     carbone_noir             1.00             0.83  0.04             0.79
>     monoxyde_carbone         0.83             1.00  0.20             0.93
>     ozone                    0.04             0.20  1.00             0.28
>     particules_fines         0.79             0.93  0.28             1.00
>     dioxyde_soufre          -0.04            -0.12  0.02            -0.07
>                      dioxyde_soufre
>     carbone_noir              -0.04
>     monoxyde_carbone          -0.12
>     ozone                      0.02
>     particules_fines          -0.07
>     dioxyde_soufre             1.00
>
> ``` r
> air_quebec |>
>   ggplot(aes(x = date_heure, y = particules_fines)) +
>   geom_line(color = "#7b3294", linewidth = 0.5, na.rm = TRUE) +
>   labs(
>     title = "Particules fines à Québec - Vieux-Limoilou",
>     subtitle = "Mesures horaires, juillet 2025",
>     x = NULL,
>     y = "PM2,5"
>   )
> ```
>
> ![](exercices_files/figure-html/unnamed-chunk-12-1.png)
>
> Une conclusion prudente peut décrire les variations horaires et les associations observées. Elle doit toutefois rester limitée à une station et à un mois, sans attribuer les concentrations à une cause précise.

### Étude de cas 2 - Débits de circulation à Gatineau

Le fichier `data/debits_circulation_gatineau_2016_2023.csv` est un extrait pédagogique des débits publiés par la Ville de Gatineau pour différentes intersections, approches, directions et années. Il conserve 150 lignes par année pour alléger les calculs, mais ne constitue pas un échantillon représentatif du territoire.

Réalisez les tâches suivantes:

1.  importez le fichier et inspectez les valeurs manquantes;
2.  créez une estimation du nombre de véhicules lourds;
3.  résumez les débits par secteur et par année;
4.  calculez les corrélations entre l’année, le débit, la proportion de véhicules lourds et le nombre estimé de véhicules lourds;
5.  produisez une visualisation utile;
6.  rédigez une conclusion prudente.

> **NOTE:**
>
> ``` r
> debits <- read_csv(
>   "data/debits_circulation_gatineau_2016_2023.csv",
>   show_col_types = FALSE
> ) |>
>   mutate(
>     vehicules_lourds_estimes =
>       debit_total_24h * pourcentage_vehicules_lourds / 100
>   )
>
> debits |>
>   summarise(across(everything(), ~ sum(is.na(.x))))
> ```
>
>     # A tibble: 1 × 8
>       secteur intersection approche direction_circulation debit_total_24h
>         <int>        <int>    <int>                 <int>           <int>
>     1       0            0      154                     4               0
>     # ℹ 3 more variables: pourcentage_vehicules_lourds <int>, annee <int>,
>     #   vehicules_lourds_estimes <int>
>
> ``` r
> debits |>
>   group_by(secteur, annee) |>
>   summarise(
>     n_observations = n(),
>     debit_median = median(debit_total_24h, na.rm = TRUE),
>     pourcentage_lourds_moyen = mean(
>       pourcentage_vehicules_lourds,
>       na.rm = TRUE
>     ),
>     .groups = "drop"
>   )
> ```
>
>     # A tibble: 26 × 5
>        secteur    annee n_observations debit_median pourcentage_lourds_moyen
>        <chr>      <dbl>          <int>        <dbl>                    <dbl>
>      1 Aylmer      2017             52          750                     7.85
>      2 Aylmer      2018             72         7150                     5.93
>      3 Aylmer      2019             45         1100                     7.93
>      4 Aylmer      2020            150         1000                     7.32
>      5 Aylmer      2021             48         1600                     4.40
>      6 Aylmer      2022             52          700                     5.78
>      7 Buckingham  2016              5         4000                     0
>      8 Buckingham  2017              6         1200                     9.37
>      9 Buckingham  2019             10         1800                     9.35
>     10 Buckingham  2022              7         3100                     5.07
>     # ℹ 16 more rows
>
> ``` r
> debits |>
>   select(
>     annee,
>     debit_total_24h,
>     pourcentage_vehicules_lourds,
>     vehicules_lourds_estimes
>   ) |>
>   cor(use = "complete.obs") |>
>   round(2)
> ```
>
>                                  annee debit_total_24h pourcentage_vehicules_lourds
>     annee                         1.00           -0.11                        -0.10
>     debit_total_24h              -0.11            1.00                         0.01
>     pourcentage_vehicules_lourds -0.10            0.01                         1.00
>     vehicules_lourds_estimes     -0.08            0.27                         0.78
>                                  vehicules_lourds_estimes
>     annee                                           -0.08
>     debit_total_24h                                  0.27
>     pourcentage_vehicules_lourds                     0.78
>     vehicules_lourds_estimes                         1.00
>
> ``` r
> debits |>
>   ggplot(
>     aes(
>       x = debit_total_24h,
>       y = pourcentage_vehicules_lourds,
>       color = secteur
>     )
>   ) +
>   geom_point(alpha = 0.35) +
>   labs(
>     title = "Débit total et part des véhicules lourds",
>     x = "Débit total sur 24 heures",
>     y = "Véhicules lourds (%)",
>     color = "Secteur"
>   )
> ```
>
>     Warning: Removed 7 rows containing missing values or values outside the scale range
>     (`geom_point()`).
>
> ![](exercices_files/figure-html/unnamed-chunk-13-1.png)
>
> Une conclusion prudente peut comparer les groupes présents dans le fichier. Elle doit rappeler que les lieux et années observés diffèrent, et que le nombre estimé de véhicules lourds est calculé directement à partir du débit total et du pourcentage.
