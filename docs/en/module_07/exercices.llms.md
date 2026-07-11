# Module 7 - Exercises

STT-1100 Introduction to Data Science

## Consolidation Exercises

These exercises are independent from the adventure and challenge. They consolidate the Module 7 skills: recognizing misleading visualizations, rebuilding defensible charts, reducing re-identification risks and writing short ethical notes.

> **NOTE:**
>
> The exercises use [Sherbrooke public-safety incidents](https://www.donneesquebec.ca/recherche/dataset/64d19d62f0804f5896e4b24c32aea49d_0), [Statistics Canada annual population estimates](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1710015501) and the [Données Québec user survey](https://www.donneesquebec.ca/recherche/dataset/sondage). The script `scripts/build_module07_real_data.R` removes coordinates and exact incident dates, then aggregates observations by month and type. The survey is originally published as aggregate counts and percentages, without individual responses.

``` r
library(tidyverse)
library(scales)
```

## Block A - Diagnose a Visualization

### Exercise 1 - Compare Two Axes

Import the aggregated Sherbrooke incidents, then produce two charts of the same totals by type:

- one chart with a truncated vertical axis;
- one chart whose axis starts at zero.

How does visual perception change?

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
>     title = "Misleading version: truncated axis",
>     x = "Incident type",
>     y = "Number of incidents"
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
>     title = "Defensible version: axis starts at zero",
>     x = "Incident type",
>     y = "Number of incidents"
>   )
> ```
>
> ![](exercices_files/figure-html/unnamed-chunk-3-1.png)
>
> The truncated axis magnifies differences and even makes some small categories invisible. Bar length encodes quantity, so the axis should normally start at zero.

### Exercise 2 - Publish Aggregate Counts

Produce a chart showing totals by type, counts and a note defining the scope of the data.

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
>     title = "Public-safety incidents by type",
>     subtitle = "Sherbrooke, 2022 to 2024; aggregated monthly data",
>     x = NULL,
>     y = "Number of incidents"
>   )
> ```
>
> ![](exercices_files/figure-html/unnamed-chunk-4-1.png)
>
> This chart publishes no address, coordinate or exact date. It describes incidents recorded in the source, not every situation that may have occurred.

### Exercise 3 - Avoid an Unfair Comparison Between Years

Join annual totals to population estimates and calculate a rate per 10,000 people. Compare this rate with raw counts.

> **NOTE:**
>
> ``` r
> population <- read_csv(
>   "data/population_sherbrooke_2022_2024.csv",
>   show_col_types = FALSE
> )
>
> incidents_year <- incidents |>
>   group_by(annee) |>
>   summarise(
>     total_incidents = sum(nb_incidents),
>     .groups = "drop"
>   ) |>
>   left_join(population, by = "annee") |>
>   mutate(
>     rate_per_10000 = total_incidents / population_estimee * 10000
>   )
>
> incidents_year
> ```
>
>     # A tibble: 3 × 5
>       annee total_incidents population_estimee geographie             rate_per_10000
>       <dbl>           <dbl>              <dbl> <chr>                           <dbl>
>     1  2022            3750             177782 Sherbrooke (V), Québec           211.
>     2  2023            3790             180135 Sherbrooke (V), Québec           210.
>     3  2024            3881             183265 Sherbrooke (V), Québec           212.
>
> The rate accounts for population change. Years are still not perfectly comparable if recording practices or context changed.

## Block B - Reduce Re-identification Risks

### Exercise 4 - Identify Risky Variables

The original source includes `OBJECTID`, `DATEINCIDENT`, `DATETEXTE`, `x`, `y`, `DESCRIPTION` and `ANNEE`. Classify these fields by disclosure risk and compare them with the course extract.

> **NOTE:**
>
> ``` r
> tibble(
>   source_variable = c(
>     "OBJECTID", "DATEINCIDENT", "DATETEXTE", "x", "y",
>     "DESCRIPTION", "ANNEE"
>   ),
>   assessment = c(
>     "technical identifier removed",
>     "exact date and time removed",
>     "exact date removed",
>     "coordinate removed",
>     "coordinate removed",
>     "category retained",
>     "broad period retained"
>   )
> )
> ```
>
>     # A tibble: 7 × 2
>       source_variable assessment
>       <chr>           <chr>
>     1 OBJECTID        technical identifier removed
>     2 DATEINCIDENT    exact date and time removed
>     3 DATETEXTE       exact date removed
>     4 x               coordinate removed
>     5 y               coordinate removed
>     6 DESCRIPTION     category retained
>     7 ANNEE           broad period retained
>
> ``` r
> names(incidents)
> ```
>
>     [1] "annee"         "mois"          "type_incident" "nb_incidents"
>
> Monthly aggregation reduces temporal precision and removing coordinates eliminates fine location. This reduces risk without guaranteeing absolute anonymization.

### Exercise 5 - Apply a Publication Threshold

Create `public_count`, masking monthly cells containing fewer than five incidents.

> **NOTE:**
>
> ``` r
> public_incidents <- incidents |>
>   mutate(
>     public_count = if_else(nb_incidents < 5, NA_integer_, nb_incidents),
>     publication_status = if_else(
>       is.na(public_count),
>       "suppressed: small count",
>       "published"
>     )
>   )
>
> public_incidents |>
>   filter(is.na(public_count))
> ```
>
>     # A tibble: 6 × 6
>       annee  mois type_incident   nb_incidents public_count publication_status
>       <dbl> <dbl> <chr>                  <dbl>        <dbl> <chr>
>     1  2022     7 Accident mortel            1           NA suppressed: small count
>     2  2022     8 Accident mortel            1           NA suppressed: small count
>     3  2022    11 Accident mortel            1           NA suppressed: small count
>     4  2022    12 Accident mortel            1           NA suppressed: small count
>     5  2023     8 Accident mortel            1           NA suppressed: small count
>     6  2024     7 Accident mortel            1           NA suppressed: small count
>
> Five is a cautious teaching rule, not a universal anonymity guarantee. A real threshold depends on context, other variables and organizational rules.

### Exercise 6 - Measure the Effect of Suppression

Count published and suppressed cells by incident type.

> **NOTE:**
>
> ``` r
> public_incidents |>
>   count(type_incident, publication_status) |>
>   pivot_wider(
>     names_from = publication_status,
>     values_from = n,
>     values_fill = 0
>   )
> ```
>
>     # A tibble: 8 × 3
>       type_incident                      published `suppressed: small count`
>       <chr>                                  <int>                     <int>
>     1 Accident avec blessés                     36                         0
>     2 Accident mortel                            0                         6
>     3 Conduite avec capacités affaiblies        36                         0
>     4 Introduction par effraction               36                         0
>     5 Menace ou acte de violence                36                         0
>     6 Méfait                                    36                         0
>     7 Voie de fait                              36                         0
>     8 Vol                                       36                         0

### Exercise 7 - Visualize Without Overexposing Small Categories

Calculate annual totals by type, retain only cells with at least 20 incidents and graph rates per 10,000 people.

> **NOTE:**
>
> ``` r
> rates_type_year <- incidents |>
>   group_by(annee, type_incident) |>
>   summarise(
>     nb_incidents = sum(nb_incidents),
>     .groups = "drop"
>   ) |>
>   left_join(population, by = "annee") |>
>   filter(nb_incidents >= 20) |>
>   mutate(
>     rate_per_10000 = nb_incidents / population_estimee * 10000
>   )
>
> ggplot(
>   rates_type_year,
>   aes(x = factor(annee), y = rate_per_10000, fill = type_incident)
> ) +
>   geom_col(position = "dodge") +
>   labs(
>     title = "Recorded incident rates by type",
>     subtitle = "Annual categories with 20 incidents or more",
>     x = "Year",
>     y = "Incidents per 10,000 people",
>     fill = "Type"
>   )
> ```
>
> ![](exercices_files/figure-html/unnamed-chunk-9-1.png)
>
> The graph should not be used to label a neighbourhood or population. It presents city-wide recorded categories.

## Case Study 1 - Responsible Municipal Publication

### Exercise 8 - Build a Publishable Table

Using `public_incidents`, create a monthly table retaining type, year and month but not publishing small numbers.

> **NOTE:**
>
> ``` r
> publication_table <- public_incidents |>
>   select(
>     annee,
>     mois,
>     type_incident,
>     public_count,
>     publication_status
>   ) |>
>   arrange(annee, mois, type_incident)
>
> publication_table
> ```
>
>     # A tibble: 258 × 5
>        annee  mois type_incident                     public_count publication_status
>        <dbl> <dbl> <chr>                                    <dbl> <chr>
>      1  2022     1 Accident avec blessés                       28 published
>      2  2022     1 Conduite avec capacités affaibli…            6 published
>      3  2022     1 Introduction par effraction                 18 published
>      4  2022     1 Menace ou acte de violence                  30 published
>      5  2022     1 Méfait                                      17 published
>      6  2022     1 Voie de fait                                43 published
>      7  2022     1 Vol                                         76 published
>      8  2022     2 Accident avec blessés                       18 published
>      9  2022     2 Conduite avec capacités affaibli…            8 published
>     10  2022     2 Introduction par effraction                 16 published
>     # ℹ 248 more rows

### Exercise 9 - Write a Short Ethical Note

Write three sentences explaining what is published, what is suppressed and the main interpretation limitation.

> **NOTE:**
>
> The publication presents monthly aggregate counts by type, without exact dates or coordinates. Cells with fewer than five incidents are suppressed to reduce disclosure risk and overinterpretation of very small numbers. These data describe recorded incidents and measure neither every situation that occurred nor the causes of observed variation.

## Case Study 2 - Public Survey and Cautious Communication

The file `data/sondage_utilisateurs_donnees_quebec_2020_2025.csv` contains aggregate responses to three questions from the Données Québec public consultation. It contains neither respondent identifiers nor free-text comments.

### Exercise 10 - Inspect Counts and Missing Values

Import the file, count missing values and summarize recorded selections by year and question.

> **NOTE:**
>
> ``` r
> survey <- read_csv(
>   "data/sondage_utilisateurs_donnees_quebec_2020_2025.csv",
>   show_col_types = FALSE
> )
>
> survey |>
>   summarise(
>     missing_counts = sum(is.na(nb_reponses)),
>     missing_percentages = sum(is.na(pourcentage))
>   )
> ```
>
>     # A tibble: 1 × 2
>       missing_counts missing_percentages
>                <int>               <int>
>     1              8                   8
>
> ``` r
> survey_summary <- survey |>
>   filter(!is.na(nb_reponses)) |>
>   group_by(annee, question) |>
>   summarise(
>     total_selections = sum(nb_reponses),
>     response_categories = n(),
>     .groups = "drop"
>   )
>
> survey_summary
> ```
>
>     # A tibble: 17 × 4
>        annee question total_selections response_categories
>        <dbl>    <dbl>            <dbl>               <int>
>      1  2020        6               88                  10
>      2  2020       11               41                  10
>      3  2021        3              495                   8
>      4  2021        6              286                  10
>      5  2021       11              291                  10
>      6  2022        3              535                   8
>      7  2022        6              291                  10
>      8  2022       11              292                  10
>      9  2023        3              511                   8
>     10  2023        6              263                  10
>     11  2023       11              264                  10
>     12  2024        3              446                   8
>     13  2024        6              259                  10
>     14  2024       11              260                  10
>     15  2025        3              199                   8
>     16  2025        6              124                  10
>     17  2025       11              124                  10
>
> The total number of selections is not necessarily the number of people when a question permits multiple responses.

### Exercise 11 - Produce a Defensible Chart

For question 6 in 2025, suppress response categories with fewer than five selections and produce a chart with counts.

> **NOTE:**
>
> ``` r
> survey_2025_q6 <- survey |>
>   filter(
>     annee == 2025,
>     question == 6,
>     !is.na(nb_reponses),
>     nb_reponses >= 5
>   )
>
> ggplot(
>   survey_2025_q6,
>   aes(x = fct_reorder(reponse, nb_reponses), y = nb_reponses)
> ) +
>   geom_col(fill = "#2F4B7C") +
>   geom_text(aes(label = nb_reponses), hjust = -0.1, size = 3.4) +
>   coord_flip() +
>   scale_y_continuous(
>     limits = c(0, max(survey_2025_q6$nb_reponses) * 1.2)
>   ) +
>   labs(
>     title = "Reported uses of open data",
>     subtitle = "Question 6, 2025; categories below five selections omitted",
>     x = NULL,
>     y = "Number of selections"
>   )
> ```
>
> ![](exercices_files/figure-html/unnamed-chunk-12-1.png)
>
> Participants chose to take part in an online consultation. Results should not be presented as representative of the entire Québec population.

### Exercise 12 - Decide What Should Not Be Published

Name two types of information that should not be added to this open publication and explain why.

> **NOTE:**
>
> An identifier linking selections from the same person should not be added because it would turn an aggregate table into an individual history. Free-text comments should not be published without a rigorous process because they may contain names, organizations, contact details or recognizable situations. Even in an aggregate table, very small counts require review before release.
