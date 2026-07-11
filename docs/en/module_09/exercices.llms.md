# Consolidation Exercises

These exercises are independent from the adventure and the challenge. They consolidate linear regression, prediction and careful analysis of coverage bias using real Quebec municipal data.

Both files come from the Quebec Ministry of Municipal Affairs and Housing dataset [Stratégie québécoise d’économie d’eau potable 2019-2025](https://www.donneesquebec.ca/recherche/dataset/sqeep-2019-2025). The data were reported by participating municipalities and approved by the Ministry. They are distributed under the CC BY 4.0 licence.

## Block A - Explore a linear relationship

### Exercise 1 - Import the data

Import `municipal_water_consumption_2023.csv`. Each row represents a Quebec municipality for which the required variables are available and whose population served reaches at least 500 people.

> **NOTE:**
>
> ``` r
> water <- read_csv(
>   "data/municipal_water_consumption_2023.csv",
>   show_col_types = FALSE
> )
>
> glimpse(water)
> ```
>
>     Rows: 496
>     Columns: 10
>     $ municipality_code                    <chr> "88055", "88022", "85020", "87085…
>     $ municipality                         <chr> "Amos", "Barraute", "Béarn", "Dup…
>     $ municipality_type                    <chr> "City", "Municipality", "Municipa…
>     $ region                               <chr> "Abitibi-Témiscamingue", "Abitibi…
>     $ residential_consumption_l_person_day <dbl> 243, 184, 192, 158, 216, 154, 172…
>     $ population_served                    <dbl> 11771, 1414, 689, 618, 7130, 543,…
>     $ population_served_thousands          <dbl> 11.771, 1.414, 0.689, 0.618, 7.13…
>     $ residences_served                    <dbl> 5740, 594, 325, 266, 3565, 269, 2…
>     $ persons_per_residence                <dbl> 2.050635, 2.380000, 2.120000, 2.3…
>     $ distributed_water_l_person_day       <dbl> 414, 307, 580, 301, 396, 208, 104…
>
> The table contains 496 municipalities across all 17 administrative regions. `distributed_water_l_person_day` is the response. Filtering for available data makes modelling possible, but limits the population to which the results can be generalized.

### Exercise 2 - Visualize the main relationship

Plot distributed water quantity against residential consumption. Add a regression line.

> **NOTE:**
>
> ``` r
> ggplot(
>   water,
>   aes(
>     x = residential_consumption_l_person_day,
>     y = distributed_water_l_person_day
>   )
> ) +
>   geom_point(alpha = 0.55, size = 1.8) +
>   geom_smooth(method = "lm", formula = y ~ x, se = FALSE) +
>   labs(
>     x = "Residential consumption (L/person/day)",
>     y = "Distributed water (L/person/day)",
>     title = "Distributed water and residential consumption"
>   ) +
>   theme_minimal()
> ```
>
> ![](exercices_files/figure-html/unnamed-chunk-2-1.png)
>
> The relationship is positive, but substantial dispersion remains. Residential consumption accounts for only part of distributed water, and the chart does not demonstrate a causal relationship.

### Exercise 3 - Fit a simple regression

Fit a model that predicts distributed water from residential consumption.

Interpret the slope in your own words.

> **NOTE:**
>
> ``` r
> simple_model <- lm(
>   distributed_water_l_person_day ~ residential_consumption_l_person_day,
>   data = water
> )
>
> summary(simple_model)
> ```
>
>
>     Call:
>     lm(formula = distributed_water_l_person_day ~ residential_consumption_l_person_day,
>         data = water)
>
>     Residuals:
>         Min      1Q  Median      3Q     Max
>     -334.06 -115.95  -60.74   56.45 1892.37
>
>     Coefficients:
>                                          Estimate Std. Error t value Pr(>|t|)
>     (Intercept)                           89.4507    28.2324   3.168  0.00163 **
>     residential_consumption_l_person_day   1.5015     0.1192  12.601  < 2e-16 ***
>     ---
>     Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
>
>     Residual standard error: 207.5 on 494 degrees of freedom
>     Multiple R-squared:  0.2432,    Adjusted R-squared:  0.2417
>     F-statistic: 158.8 on 1 and 494 DF,  p-value: < 2.2e-16
>
> The slope estimates the average predicted change in distributed water when residential consumption increases by one litre per person per day. It describes an association among the selected municipalities without proving that this increase alone causes the observed variation.

## Block B - Predict and diagnose

### Exercise 4 - Fit a multiple regression

Add the population served, expressed in thousands of people, and the average number of people per residence.

Compare the interpretation of the `residential_consumption_l_person_day` coefficient with the one from the simple model.

> **NOTE:**
>
> ``` r
> multiple_model <- lm(
>   distributed_water_l_person_day ~
>     residential_consumption_l_person_day +
>     population_served_thousands +
>     persons_per_residence,
>   data = water
> )
>
> summary(multiple_model)
> ```
>
>
>     Call:
>     lm(formula = distributed_water_l_person_day ~ residential_consumption_l_person_day +
>         population_served_thousands + persons_per_residence, data = water)
>
>     Residuals:
>         Min      1Q  Median      3Q     Max
>     -331.66 -116.76  -59.09   55.66 1893.47
>
>     Coefficients:
>                                           Estimate Std. Error t value Pr(>|t|)
>     (Intercept)                          129.23156   50.76174   2.546   0.0112 *
>     residential_consumption_l_person_day   1.47677    0.12206  12.098   <2e-16 ***
>     population_served_thousands            0.01469    0.09986   0.147   0.8831
>     persons_per_residence                -15.39861   16.30254  -0.945   0.3454
>     ---
>     Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
>
>     Residual standard error: 207.7 on 492 degrees of freedom
>     Multiple R-squared:  0.2446,    Adjusted R-squared:   0.24
>     F-statistic: 53.11 on 3 and 492 DF,  p-value: < 2.2e-16
>
> In the multiple model, the coefficient is interpreted while holding population served and people per residence constant. It therefore does not answer exactly the same question as the simple-model slope.

### Exercise 5 - Produce predictions

Build two scenarios within the range of the data, then predict distributed water.

> **NOTE:**
>
> ``` r
> water_scenarios <- tibble(
>   residential_consumption_l_person_day = c(180, 240),
>   population_served_thousands = c(5, 45),
>   persons_per_residence = c(2.1, 2.4)
> )
>
> water_predictions <- water_scenarios |>
>   mutate(
>     predicted_distributed_water = predict(
>       multiple_model,
>       newdata = water_scenarios
>     )
>   )
>
> water_predictions
> ```
>
>     # A tibble: 2 × 4
>       residential_consumption_l_perso…¹ population_served_th…² persons_per_residence
>                                   <dbl>                  <dbl>                 <dbl>
>     1                               180                      5                   2.1
>     2                               240                     45                   2.4
>     # ℹ abbreviated names: ¹​residential_consumption_l_person_day,
>     #   ²​population_served_thousands
>     # ℹ 1 more variable: predicted_distributed_water <dbl>
>
> These values are teaching scenarios, not observed municipalities. Predictions are expected values under the model and become more fragile outside the range of the fitting data.

### Exercise 6 - Compare observed and predicted values

Calculate the multiple-model errors and identify the six largest absolute errors.

Then calculate a root mean squared error.

> **NOTE:**
>
> ``` r
> model_diagnostics <- water |>
>   mutate(
>     predicted_distributed_water = predict(multiple_model, newdata = water),
>     error_l_person_day =
>       distributed_water_l_person_day - predicted_distributed_water,
>     absolute_error = abs(error_l_person_day)
>   )
>
> model_diagnostics |>
>   arrange(desc(absolute_error)) |>
>   select(
>     municipality_code,
>     municipality,
>     region,
>     distributed_water_l_person_day,
>     predicted_distributed_water,
>     error_l_person_day
>   ) |>
>   slice_head(n = 6)
> ```
>
>     # A tibble: 6 × 6
>       municipality_code municipality                   region distributed_water_l_…¹
>       <chr>             <chr>                          <chr>                   <dbl>
>     1 99020             Chapais                        Nord-…                   2671
>     2 54017             Saint-Damase (16)              Monté…                   1792
>     3 03025             Murdochville                   Gaspé…                   1823
>     4 49075             Notre-Dame-Du-Bon-Conseil (Vl) Centr…                   1352
>     5 55037             Rougemont                      Monté…                   1294
>     6 66112             Baie-D'urfé                    Montr…                   1417
>     # ℹ abbreviated name: ¹​distributed_water_l_person_day
>     # ℹ 2 more variables: predicted_distributed_water <dbl>,
>     #   error_l_person_day <dbl>
>
> ``` r
> water_rmse <- sqrt(mean(model_diagnostics$error_l_person_day^2))
>
> water_rmse
> ```
>
>     [1] 206.8512
>
> A large error may indicate an unusual municipality, an important missing variable or uncertain measurement. It does not automatically constitute a data error.

### Exercise 7 - Visualize errors

> **NOTE:**
>
> ``` r
> ggplot(
>   model_diagnostics,
>   aes(x = predicted_distributed_water, y = error_l_person_day)
> ) +
>   geom_hline(yintercept = 0, linetype = "dashed") +
>   geom_point(alpha = 0.55, size = 1.8) +
>   labs(
>     x = "Predicted distributed water (L/person/day)",
>     y = "Error: observed minus predicted",
>     title = "Visual diagnosis of errors"
>   ) +
>   theme_minimal()
> ```
>
> ![](exercices_files/figure-html/unnamed-chunk-8-1.png)
>
> Look for patterns, separated groups and isolated points. Increasing dispersion as predictions grow can indicate that uncertainty is not constant.

## Block C - Examine coverage bias

### Exercise 8 - Import validity results

Import `water_audit_validity_2023.csv`. It contains all 1,104 municipalities in the source table, including those for which the validity index is unavailable.

> **NOTE:**
>
> ``` r
> validity <- read_csv(
>   "data/water_audit_validity_2023.csv",
>   show_col_types = FALSE
> )
>
> glimpse(validity)
> ```
>
>     Rows: 1,104
>     Columns: 7
>     $ municipality_code                       <chr> "88055", "87050", "87100", "88…
>     $ municipality                            <chr> "Amos", "Authier", "Authier-No…
>     $ municipality_type                       <chr> "City", "Municipality", "Munic…
>     $ region                                  <chr> "Abitibi-Témiscamingue", "Abit…
>     $ validity_index_pct                      <dbl> 59, NA, NA, 57, NA, NA, NA, 65…
>     $ metered_non_residential_connections_pct <dbl> 0.08867925, NA, NA, 0.00000000…
>     $ validity_available                      <lgl> TRUE, FALSE, FALSE, TRUE, FALS…
>
> A missing value does not mean that an audit is invalid. It indicates that the index is unavailable in this resource. Treating absence as failure would produce an incorrect conclusion.

### Exercise 9 - Compare availability by region

Calculate the proportion of municipalities for which the index is available, then produce a chart.

> **NOTE:**
>
> ``` r
> availability_by_region <- validity |>
>   group_by(region) |>
>   summarise(
>     municipalities = n(),
>     available_indices = sum(validity_available),
>     availability_rate = mean(validity_available),
>     .groups = "drop"
>   ) |>
>   arrange(availability_rate)
>
> availability_by_region
> ```
>
>     # A tibble: 17 × 4
>        region                     municipalities available_indices availability_rate
>        <chr>                               <int>             <int>             <dbl>
>      1 Outaouais                              67                20             0.299
>      2 Abitibi-Témiscamingue                  63                26             0.413
>      3 Gaspésie–Îles-de-la-Madel…             44                20             0.455
>      4 Estrie                                117                57             0.487
>      5 Bas-Saint-Laurent                     113                60             0.531
>      6 Centre-du-Québec                       78                47             0.603
>      7 Chaudière-Appalaches                  136                82             0.603
>      8 Côte-Nord                              33                21             0.636
>      9 Montérégie                            148                97             0.655
>     10 Laurentides                            76                52             0.684
>     11 Mauricie                               42                31             0.738
>     12 Montréal                               16                12             0.75
>     13 Capitale-Nationale                     59                47             0.797
>     14 Nord-du-Québec                          5                 4             0.8
>     15 Lanaudière                             57                47             0.825
>     16 Saguenay–Lac-Saint-Jean                49                45             0.918
>     17 Laval                                   1                 1             1
>
> ``` r
> ggplot(
>   availability_by_region,
>   aes(x = availability_rate, y = reorder(region, availability_rate))
> ) +
>   geom_col() +
>   labs(
>     x = "Proportion with an available index",
>     y = NULL,
>     title = "Coverage of the validity index by region"
>   ) +
>   theme_minimal()
> ```
>
> ![](exercices_files/figure-html/unnamed-chunk-11-1.png)
>
> Coverage differences are descriptive. They may reflect participation, measurement availability, network size or other unobserved mechanisms.

### Exercise 10 - Add municipality type

Among municipalities with an available index, compare its mean by municipality type.

> **NOTE:**
>
> ``` r
> validity_by_type <- validity |>
>   filter(validity_available) |>
>   group_by(municipality_type) |>
>   summarise(
>     municipalities = n(),
>     mean_validity_index = mean(validity_index_pct),
>     median_metered_connections = median(
>       metered_non_residential_connections_pct,
>       na.rm = TRUE
>     ),
>     .groups = "drop"
>   ) |>
>   arrange(mean_validity_index)
>
> validity_by_type
> ```
>
>     # A tibble: 6 × 4
>       municipality_type municipalities mean_validity_index median_metered_connecti…¹
>       <chr>                      <int>               <dbl>                     <dbl>
>     1 Township                      12                56.3                     0.957
>     2 Village                       23                58.3                     0.935
>     3 United townships               2                59                       0.5
>     4 Municipality                 362                59.6                     0.990
>     5 Parish                        66                59.9                     0.993
>     6 City                         204                60.1                     0.942
>     # ℹ abbreviated name: ¹​median_metered_connections
>
> This comparison only includes municipalities with a published index. If availability is not random, observed means may not represent every municipality of the same type.

### Exercise 11 - Write a careful conclusion

Write three sentences that distinguish an observed difference, a coverage limitation and an additional check.

> **NOTE:**
>
> Possible example: the proportion of municipalities with an available index varies across regions in 2023. These differences do not demonstrate differences in management quality because index absence may depend on participation and measurement availability. A next step would document the nonresponse mechanism and compare municipalities of similar size and type.

## Case Study 1 - Predict a distributed water quantity

A municipal organization wants to use the 2023 data to prepare consumption scenarios.

Your task:

1.  choose between `simple_model` and `multiple_model`;
2.  produce three scenarios within the observed range;
3.  communicate three limits before using the predictions.

> **NOTE:**
>
> ``` r
> program_scenarios <- tibble(
>   residential_consumption_l_person_day = c(160, 210, 275),
>   population_served_thousands = c(2, 18, 90),
>   persons_per_residence = c(2.0, 2.3, 2.5)
> )
>
> program_scenarios |>
>   mutate(
>     predicted_distributed_water = predict(
>       multiple_model,
>       newdata = program_scenarios
>     )
>   )
> ```
>
>     # A tibble: 3 × 4
>       residential_consumption_l_perso…¹ population_served_th…² persons_per_residence
>                                   <dbl>                  <dbl>                 <dbl>
>     1                               160                      2                   2
>     2                               210                     18                   2.3
>     3                               275                     90                   2.5
>     # ℹ abbreviated names: ¹​residential_consumption_l_person_day,
>     #   ²​population_served_thousands
>     # ℹ 1 more variable: predicted_distributed_water <dbl>
>
> Limitations include complete-case selection, variables omitted from the model, extreme values and the impossibility of giving coefficients a causal interpretation.

## Case Study 2 - Audit water-audit coverage

A committee wants to know whether its picture of data validity covers Quebec municipalities evenly.

> **NOTE:**
>
> ``` r
> audit_summary <- validity |>
>   group_by(region, municipality_type) |>
>   summarise(
>     municipalities = n(),
>     availability_rate = mean(validity_available),
>     mean_index_if_available = mean_if_available(validity_index_pct),
>     .groups = "drop"
>   ) |>
>   arrange(region, municipality_type)
>
> audit_summary
> ```
>
>     # A tibble: 68 × 5
>        region                municipality_type municipalities availability_rate
>        <chr>                 <chr>                      <int>             <dbl>
>      1 Abitibi-Témiscamingue City                          11             0.909
>      2 Abitibi-Témiscamingue Municipality                  40             0.275
>      3 Abitibi-Témiscamingue Parish                         5             0.2
>      4 Abitibi-Témiscamingue Township                       6             0.5
>      5 Abitibi-Témiscamingue United townships               1             1
>      6 Bas-Saint-Laurent     City                          14             0.714
>      7 Bas-Saint-Laurent     Municipality                  61             0.590
>      8 Bas-Saint-Laurent     Parish                        36             0.333
>      9 Bas-Saint-Laurent     Village                        2             1
>     10 Capitale-Nationale    City                          24             0.917
>     # ℹ 58 more rows
>     # ℹ 1 more variable: mean_index_if_available <dbl>
>
> The table can identify less-covered groups, but cannot assign a cause to the differences. Before comparing audit quality, distinguish the observed index from its availability and investigate participation and measurement mechanisms.
