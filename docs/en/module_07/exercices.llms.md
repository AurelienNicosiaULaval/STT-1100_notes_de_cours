# Module 7 - Exercises

STT-1100 Introduction to Data Science

## Consolidation Exercises

These exercises are independent from the adventure and the challenge. They consolidate the core moves of module 7: recognizing misleading visualization choices, rebuilding a defensible chart, reducing re-identification risks and writing a short ethics note.

The data used here are fictitious and do not represent any real person, organization or municipality.

``` r
library(tidyverse)
library(scales)
```

## Readings to Review

- [R for Data Science - Communication](https://r4ds.hadley.nz/communication.html)
- [Fundamentals of Data Visualization - Directory of visualizations](https://clauswilke.com/dataviz/directory-of-visualizations.html)
- [Royal Statistical Society - Best Practices for Data Visualisation](https://royal-statistical-society.github.io/datavisguide/RSS-data-vis-guide.pdf)
- [Gouvernement du Québec - Anonymisation](https://www.quebec.ca/gouvernement/travailler-gouvernement/normes-gouvernance-pratiques-internes/protection-des-renseignements-personnels/anonymisation)
- [CNIL - Anonymisation of personal data](https://www.cnil.fr/fr/technologies/lanonymisation-de-donnees-personnelles)
- [Wilkinson et al. (2016) - FAIR Guiding Principles](https://www.nature.com/articles/sdata201618)

After the readings, also complete the [formative mini-test](../module_07/mini_test.llms.md). It is not graded.

## Block A - Diagnose a Visualization

### Exercise 1 - Compare Two Axes

Import the fictitious municipal reports, then produce two charts with the same data:

- one chart with a truncated vertical axis;
- one chart with an axis starting at zero.

How does the visual perception change?

> **NOTE:**
>
> ``` r
> reports <- read_csv(
>   "data/fictitious_municipal_reports.csv",
>   show_col_types = FALSE
> )
>
> reports_neighbourhood <- reports |>
>   group_by(neighbourhood) |>
>   summarise(
>     total_reports = sum(n_reports),
>     .groups = "drop"
>   ) |>
>   arrange(desc(total_reports))
>
> reports_neighbourhood
> ```
>
>     # A tibble: 7 × 2
>       neighbourhood    total_reports
>       <chr>                    <dbl>
>     1 Sainte-Foy                  63
>     2 Saint-Roch                  60
>     3 Limoilou                    57
>     4 Beauport                    40
>     5 Charlesbourg                19
>     6 La Cite-Limoilou             5
>     7 Sillery                      3
>
> ``` r
> ggplot(reports_neighbourhood, aes(x = reorder(neighbourhood, total_reports), y = total_reports)) +
>   geom_col(fill = "#B33A3A") +
>   coord_flip(ylim = c(20, max(reports_neighbourhood$total_reports) * 1.05)) +
>   labs(
>     title = "Misleading version: truncated axis",
>     x = "Neighbourhood",
>     y = "Number of reports"
>   )
> ```
>
> ![](exercices_files/figure-html/unnamed-chunk-2-1.png)
>
> ``` r
> ggplot(reports_neighbourhood, aes(x = reorder(neighbourhood, total_reports), y = total_reports)) +
>   geom_col(fill = "#3C6E71") +
>   coord_flip() +
>   scale_y_continuous(limits = c(0, NA), expand = expansion(mult = c(0, 0.05))) +
>   labs(
>     title = "More honest version: zero baseline",
>     x = "Neighbourhood",
>     y = "Number of reports"
>   )
> ```
>
> ![](exercices_files/figure-html/unnamed-chunk-3-1.png)
>
> The truncated axis visually amplifies differences. For bars, length encodes quantity; starting the axis above zero can therefore suggest a stronger difference than the data support.

### Exercise 2 - Add Counts to the Message

Compute the total number of reports by type. Produce a chart that compares report types without creating an impression of individual risk.

> **NOTE:**
>
> ``` r
> reports_type <- reports |>
>   group_by(report_type) |>
>   summarise(
>     total_reports = sum(n_reports),
>     n_neighbourhoods = n_distinct(neighbourhood),
>     .groups = "drop"
>   ) |>
>   arrange(desc(total_reports))
>
> reports_type
> ```
>
>     # A tibble: 5 × 3
>       report_type total_reports n_neighbourhoods
>       <chr>               <dbl>            <int>
>     1 noise                  85                3
>     2 transport              71                2
>     3 waste                  49                2
>     4 housing                37                4
>     5 safety                  5                1
>
> ``` r
> ggplot(reports_type, aes(x = reorder(report_type, total_reports), y = total_reports)) +
>   geom_col(fill = "#4C78A8") +
>   geom_text(aes(label = total_reports), hjust = -0.15, size = 3.5) +
>   coord_flip() +
>   scale_y_continuous(limits = c(0, max(reports_type$total_reports) * 1.15)) +
>   labs(
>     title = "Fictitious municipal reports by type",
>     subtitle = "Numbers are aggregated; no individual address is published",
>     x = "Report type",
>     y = "Number of reports"
>   )
> ```
>
> ![](exercices_files/figure-html/unnamed-chunk-5-1.png)
>
> The chart publishes aggregated and readable information. It avoids individual addresses or details that could expose a person or household.

### Exercise 3 - Avoid Unfair Comparisons

Join reports with the fictitious neighbourhood population. Compute a rate per 10,000 people. Why is this rate more defensible than a raw comparison?

> **NOTE:**
>
> ``` r
> population <- read_csv(
>   "data/fictitious_neighbourhood_population.csv",
>   show_col_types = FALSE
> )
>
> rate_neighbourhood <- reports_neighbourhood |>
>   left_join(population, by = "neighbourhood") |>
>   mutate(
>     rate_per_10000 = total_reports / estimated_population * 10000
>   ) |>
>   arrange(desc(rate_per_10000))
>
> rate_neighbourhood
> ```
>
>     # A tibble: 7 × 6
>       neighbourhood  total_reports estimated_population area_km2 vulnerability_index
>       <chr>                  <dbl>                <dbl>    <dbl>               <dbl>
>     1 Saint-Roch                60                18200      3.1                0.64
>     2 Limoilou                  57                31800      8.4                0.58
>     3 Sainte-Foy                63                74200     32.1                0.31
>     4 Beauport                  40                80500     74.4                0.39
>     5 Charlesbourg              19                82600     66.3                0.36
>     6 Sillery                    3                13700      6.8                0.22
>     7 La Cite-Limoi…             5               108000     22.2                0.55
>     # ℹ 1 more variable: rate_per_10000 <dbl>
>
> ``` r
> ggplot(rate_neighbourhood, aes(x = reorder(neighbourhood, rate_per_10000), y = rate_per_10000)) +
>   geom_col(fill = "#5B8E7D") +
>   coord_flip() +
>   labs(
>     title = "Fictitious reports per 10,000 people",
>     subtitle = "The comparison accounts for approximate neighbourhood size",
>     x = "Neighbourhood",
>     y = "Reports per 10,000 people"
>   )
> ```
>
> ![](exercices_files/figure-html/unnamed-chunk-7-1.png)
>
> Raw counts favor more populated neighbourhoods. A population rate makes the comparison more relevant, although it still does not explain causes.

## Block B - Reduce Re-Identification Risks

### Exercise 4 - Identify Sensitive Variables

Import the fictitious student survey. Classify variables into three families:

- direct identifier;
- quasi-identifier or sensitive variable;
- variable publishable after aggregation.

> **NOTE:**
>
> ``` r
> survey <- read_csv(
>   "data/fictitious_student_survey.csv",
>   show_col_types = FALSE
> )
>
> glimpse(survey)
> ```
>
>     Rows: 16
>     Columns: 9
>     $ respondent_id       <chr> "E001", "E002", "E003", "E004", "E005", "E006", "E…
>     $ program             <chr> "Statistics", "Computer science", "Mathematics", "…
>     $ year_level          <dbl> 1, 2, 1, 3, 1, 2, 2, 3, 2, 3, 1, 3, 1, 2, 2, 1
>     $ age                 <dbl> 19, 21, 18, 24, 20, 22, 23, 26, 21, 25, 19, 27, 18…
>     $ gender              <chr> "F", "M", "F", "Not specified", "F", "M", "F", "F"…
>     $ study_hours         <dbl> 12, 18, 10, 22, 16, 20, 14, 28, 17, 24, 15, 19, 9,…
>     $ stress_score        <dbl> 6, 7, 5, 8, 6, 7, 4, 9, 6, 8, 5, 7, 4, 7, 6, 5
>     $ publication_consent <chr> "yes", "yes", "yes", "yes", "no", "yes", "yes", "y…
>     $ free_text_comment   <chr> "Prefers not to be quoted.", "Also works evenings.…
>
> ``` r
> tibble(
>   variable = names(survey),
>   diagnostic = c(
>     "direct identifier",
>     "quasi-identifier",
>     "quasi-identifier",
>     "quasi-identifier",
>     "sensitive variable",
>     "analysis variable",
>     "sensitive variable",
>     "use condition",
>     "risky free text"
>   )
> )
> ```
>
>     # A tibble: 9 × 2
>       variable            diagnostic
>       <chr>               <chr>
>     1 respondent_id       direct identifier
>     2 program             quasi-identifier
>     3 year_level          quasi-identifier
>     4 age                 quasi-identifier
>     5 gender              sensitive variable
>     6 study_hours         analysis variable
>     7 stress_score        sensitive variable
>     8 publication_consent use condition
>     9 free_text_comment   risky free text
>
> `respondent_id` directly identifies a row. Free-text comments can contain identifying details. Program, year level, age and gender may become identifying when combined.

### Exercise 5 - Prepare an Anonymized Version

Create a survey version that:

- removes the direct identifier;
- removes the free-text comment;
- keeps only respondents who consented to publication;
- groups age into classes;
- keeps useful variables for aggregated analysis.

> **NOTE:**
>
> ``` r
> survey_anonymous <- survey |>
>   filter(publication_consent == "yes") |>
>   mutate(
>     age_group = cut(
>       age,
>       breaks = c(17, 20, 23, 26, Inf),
>       labels = c("18-20", "21-23", "24-26", "27+"),
>       right = TRUE
>     )
>   ) |>
>   select(
>     program,
>     year_level,
>     age_group,
>     gender,
>     study_hours,
>     stress_score
>   )
>
> survey_anonymous
> ```
>
>     # A tibble: 15 × 6
>        program          year_level age_group gender        study_hours stress_score
>        <chr>                 <dbl> <fct>     <chr>               <dbl>        <dbl>
>      1 Statistics                1 18-20     F                      12            6
>      2 Computer science          2 21-23     M                      18            7
>      3 Mathematics               1 18-20     F                      10            5
>      4 Statistics                3 24-26     Not specified          22            8
>      5 Data science              2 21-23     M                      20            7
>      6 Mathematics               2 21-23     F                      14            4
>      7 Data science              3 24-26     F                      28            9
>      8 Statistics                2 21-23     M                      17            6
>      9 Computer science          3 24-26     M                      24            8
>     10 Data science              1 18-20     F                      15            5
>     11 Mathematics               3 27+       Not specified          19            7
>     12 Statistics                1 18-20     M                       9            4
>     13 Computer science          2 21-23     F                      21            7
>     14 Data science              2 21-23     M                      18            6
>     15 Mathematics               1 18-20     F                      13            5
>
> This version reduces risk, but it does not eliminate all re-identification risk. A rare combination such as program + year level + gender + age can still isolate a person.

### Exercise 6 - Check Small Groups

Find combinations of `program`, `year_level` and `gender` with fewer than three people. Why should these cells not be published in detail?

> **NOTE:**
>
> ``` r
> small_groups <- survey_anonymous |>
>   count(program, year_level, gender, name = "n") |>
>   filter(n < 3) |>
>   arrange(n, program)
>
> small_groups
> ```
>
>     # A tibble: 13 × 4
>        program          year_level gender            n
>        <chr>                 <dbl> <chr>         <int>
>      1 Computer science          2 F                 1
>      2 Computer science          2 M                 1
>      3 Computer science          3 M                 1
>      4 Data science              1 F                 1
>      5 Data science              3 F                 1
>      6 Mathematics               2 F                 1
>      7 Mathematics               3 Not specified     1
>      8 Statistics                1 F                 1
>      9 Statistics                1 M                 1
>     10 Statistics                2 M                 1
>     11 Statistics                3 Not specified     1
>     12 Data science              2 M                 2
>     13 Mathematics               1 F                 2
>
> Small groups increase the risk of recognizing a person, especially in a class where students know each other. One option is to group categories, suppress some cells or publish only more aggregated results.

### Exercise 7 - Visualize Without Overexposing

Produce a chart of average stress score by program. Also show counts and add a cautious interpretation.

> **NOTE:**
>
> ``` r
> stress_program <- survey_anonymous |>
>   group_by(program) |>
>   summarise(
>     n = n(),
>     mean_stress = mean(stress_score),
>     .groups = "drop"
>   ) |>
>   arrange(desc(mean_stress))
>
> stress_program
> ```
>
>     # A tibble: 4 × 3
>       program              n mean_stress
>       <chr>            <int>       <dbl>
>     1 Computer science     3        7.33
>     2 Data science         4        6.75
>     3 Statistics           4        6
>     4 Mathematics          4        5.25
>
> ``` r
> ggplot(stress_program, aes(x = reorder(program, mean_stress), y = mean_stress)) +
>   geom_col(fill = "#6B5B95") +
>   geom_text(aes(label = paste0("n = ", n)), hjust = -0.1, size = 3.5) +
>   coord_flip() +
>   scale_y_continuous(limits = c(0, 10), breaks = 0:10) +
>   labs(
>     title = "Average stress score by program in a fictitious survey",
>     subtitle = "Counts are small; these values cannot rank programs",
>     x = "Program",
>     y = "Average stress score"
>   )
> ```
>
> ![](exercices_files/figure-html/unnamed-chunk-12-1.png)
>
> Cautious interpretation: in this small fictitious survey, some programs have a higher average score, but the counts are too small to conclude that the program causes stress.

## Case Study 1 - Responsible Municipal Publication

A fictitious city wants to publish a table of monthly reports. It wants to be transparent, but it does not want to stigmatize small areas or indirectly reveal individual situations.

### Exercise 8 - Build a Publishable Version

Starting from the municipal reports, create a table that suppresses cells where `public_detail_level` is `"suppress"`. Create a variable `n_public` that keeps the count when publication is acceptable and replaces other values with `NA`.

> **NOTE:**
>
> ``` r
> reports_public <- reports |>
>   mutate(
>     n_public = if_else(public_detail_level == "suppress", NA_integer_, n_reports),
>     publication_status = if_else(is.na(n_public), "suppressed", "published")
>   )
>
> reports_public |>
>   select(neighbourhood, report_type, n_reports, n_public, publication_status)
> ```
>
>     # A tibble: 12 × 5
>        neighbourhood    report_type n_reports n_public publication_status
>        <chr>            <chr>           <dbl>    <dbl> <chr>
>      1 Saint-Roch       noise              42       42 published
>      2 Saint-Roch       housing            18       18 published
>      3 Limoilou         noise              31       31 published
>      4 Limoilou         waste              26       26 published
>      5 Sainte-Foy       transport          54       54 published
>      6 Sainte-Foy       housing             9        9 published
>      7 Beauport         waste              23       23 published
>      8 Beauport         transport          17       17 published
>      9 Charlesbourg     noise              12       12 published
>     10 Charlesbourg     housing             7       NA suppressed
>     11 La Cite-Limoilou safety              5       NA suppressed
>     12 Sillery          housing             3       NA suppressed

### Exercise 9 - Write a Short Ethics Note

Write three sentences explaining:

1.  what is published;
2.  what is suppressed;
3.  the main interpretive limitation.

> **NOTE:**
>
> The publication presents aggregated report counts by neighbourhood and type, without addresses or individual coordinates. Cells associated with very small counts are suppressed to reduce identification risk and local stigmatization. These data describe reports received and do not measure the true severity of situations or the causes of differences between neighbourhoods.

## Case Study 2 - Student Survey and Careful Communication

A fictitious teaching team wants to present results from a workload survey. The data can help improve the course, but free-text comments and small groups can make some people recognizable.

### Exercise 10 - Prepare a Publishable Summary

Create a table by year level with the number of responses, average study hours and average stress score.

> **NOTE:**
>
> ``` r
> summary_level <- survey_anonymous |>
>   group_by(year_level) |>
>   summarise(
>     n = n(),
>     mean_study_hours = mean(study_hours),
>     mean_stress = mean(stress_score),
>     .groups = "drop"
>   )
>
> summary_level
> ```
>
>     # A tibble: 3 × 4
>       year_level     n mean_study_hours mean_stress
>            <dbl> <int>            <dbl>       <dbl>
>     1          1     5             11.8        5
>     2          2     6             18          6.17
>     3          3     4             23.2        8

### Exercise 11 - Produce a Defensible Chart

Produce a chart showing average study hours by year level. The title must avoid turning a description into an accusation.

> **NOTE:**
>
> ``` r
> ggplot(summary_level, aes(x = factor(year_level), y = mean_study_hours)) +
>   geom_col(fill = "#2F4B7C") +
>   geom_text(aes(label = paste0("n = ", n)), vjust = -0.4, size = 3.5) +
>   scale_y_continuous(limits = c(0, max(summary_level$mean_study_hours) * 1.25)) +
>   labs(
>     title = "Reported study hours in a fictitious survey",
>     subtitle = "Aggregated by year level; individual responses are not published",
>     x = "Year level",
>     y = "Study hours per week"
>   )
> ```
>
> ![](exercices_files/figure-html/unnamed-chunk-15-1.png)

### Exercise 12 - Decide What Not to Publish

Name two elements from the initial file that should not appear in an open publication. Explain why.

> **NOTE:**
>
> The `respondent_id` field should not be published because it directly tracks an individual response. The `free_text_comment` field should not be published as is because it can contain a name, team, employer, personal situation or detail that makes a person recognizable.
