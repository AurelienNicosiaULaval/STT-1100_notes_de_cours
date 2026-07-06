# Consolidation Exercises

# Consolidation Exercises

These exercises are independent from the adventure and the challenge. They consolidate linear regression, prediction and careful discussion of bias using fictitious datasets that differ from the main activity.

Before starting, review the module resources if needed: chapters 7 and 8 of *Introduction to Modern Statistics*, the `lm()` documentation, the `predict.lm()` documentation and the module formative mini-test.

``` r
library(tidyverse)
```

## Block A - Explore a linear relationship

### Exercise 1 - Import the data

Import the file `fictitious_housing_energy.csv`. Each row represents a fictitious housing unit in the Quebec City region.

``` r
housing <- read_csv("data/fictitious_housing_energy.csv", show_col_types = FALSE)

glimpse(housing)
```

    Rows: 32
    Columns: 8
    $ housing_id                  <chr> "H001", "H002", "H003", "H004", "H005", "H…
    $ neighbourhood               <chr> "Montcalm", "Limoilou", "Sainte-Foy", "Van…
    $ area_m2                     <dbl> 62, 74, 91, 58, 113, 105, 130, 46, 124, 88…
    $ year_built                  <dbl> 1988, 1975, 2006, 1968, 1992, 1980, 2012, …
    $ occupants                   <dbl> 1, 2, 3, 2, 4, 3, 4, 1, 5, 3, 2, 2, 1, 4, …
    $ heating_type                <chr> "Electricity", "Electricity", "Electricity…
    $ neighbourhood_median_income <dbl> 64000, 52000, 71000, 47000, 59000, 56000, …
    $ annual_kwh                  <dbl> 11800, 14300, 16150, 15600, 20550, 18800, …

> **TIP:**
>
> The table contains 32 fictitious housing units. The variable `annual_kwh` will be used as the response variable in the first exercises.

### Exercise 2 - Visualize the main relationship

Plot the relationship between housing area and annual electricity consumption. Add a regression line.

``` r
ggplot(housing, aes(x = area_m2, y = annual_kwh)) +
  geom_point(alpha = 0.75, size = 2) +
  geom_smooth(method = "lm", formula = y ~ x, se = FALSE) +
  labs(
    x = "Housing area (m2)",
    y = "Annual consumption (kWh)",
    title = "Annual consumption by housing area"
  ) +
  theme_minimal()
```

![](exercices_files/figure-html/unnamed-chunk-2-1.png)

> **TIP:**
>
> The relationship appears positive: larger housing units tend to have higher annual consumption. This chart does not prove that area causes all consumption, but it suggests an association that is useful for a first model.

### Exercise 3 - Fit a simple regression

Fit a model that predicts annual consumption from area.

``` r
simple_model <- lm(annual_kwh ~ area_m2, data = housing)

summary(simple_model)
```


    Call:
    lm(formula = annual_kwh ~ area_m2, data = housing)

    Residuals:
        Min      1Q  Median      3Q     Max
    -2979.7  -977.5  -129.1  1105.0  3303.2

    Coefficients:
                Estimate Std. Error t value Pr(>|t|)
    (Intercept) 7113.129    910.209   7.815 1.01e-08 ***
    area_m2      110.884      9.743  11.381 2.07e-12 ***
    ---
    Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

    Residual standard error: 1549 on 30 degrees of freedom
    Multiple R-squared:  0.8119,    Adjusted R-squared:  0.8057
    F-statistic: 129.5 on 1 and 30 DF,  p-value: 2.071e-12

Interpret the slope in your own words.

> **TIP:**
>
> The slope estimates the average predicted change in annual consumption when area increases by one square metre. The interpretation should remain descriptive because other variables such as occupants, building age and heating type may also play a role.

## Block B - Predict and diagnose

### Exercise 4 - Fit a multiple regression

Now fit a model that adds the number of occupants and the year built.

``` r
multiple_model <- lm(
  annual_kwh ~ area_m2 + occupants + year_built,
  data = housing
)

summary(multiple_model)
```


    Call:
    lm(formula = annual_kwh ~ area_m2 + occupants + year_built, data = housing)

    Residuals:
        Min      1Q  Median      3Q     Max
    -1717.9  -375.9  -127.5   291.4  1656.4

    Coefficients:
                 Estimate Std. Error t value Pr(>|t|)
    (Intercept) 101766.34   24023.19   4.236 0.000222 ***
    area_m2         91.23      15.85   5.756 3.53e-06 ***
    occupants     1416.11     237.05   5.974 1.96e-06 ***
    year_built     -48.75      12.52  -3.893 0.000559 ***
    ---
    Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

    Residual standard error: 785.4 on 28 degrees of freedom
    Multiple R-squared:  0.9549,    Adjusted R-squared:  0.9501
    F-statistic: 197.5 on 3 and 28 DF,  p-value: < 2.2e-16

Compare the interpretation of the `area_m2` coefficient with the one obtained in the simple model.

> **TIP:**
>
> In the multiple model, the `area_m2` coefficient is interpreted while holding `occupants` and `year_built` fixed. It therefore does not answer exactly the same question as the simple model.

### Exercise 5 - Produce predictions

Create two new fictitious housing units, then use the multiple model to predict their annual consumption.

``` r
new_housing <- tibble(
  area_m2 = c(70, 120),
  occupants = c(2, 4),
  year_built = c(1990, 2015)
)

housing_predictions <- new_housing |>
  mutate(predicted_consumption = predict(multiple_model, newdata = new_housing))

housing_predictions
```

    # A tibble: 2 × 4
      area_m2 occupants year_built predicted_consumption
        <dbl>     <dbl>      <dbl>                 <dbl>
    1      70         2       1990                13966.
    2     120         4       2015                20141.

> **TIP:**
>
> Predictions are expected values according to the model. They do not replace a real measurement, and they become more fragile if the new housing unit looks very different from the units used to fit the model.

### Exercise 6 - Compare observed and predicted values

Add the multiple-model predictions to the original table, then calculate the error `observed - predicted`.

``` r
model_diagnostics <- housing |>
  mutate(
    predicted_consumption = predict(multiple_model, newdata = housing),
    error_kwh = annual_kwh - predicted_consumption,
    absolute_error_kwh = abs(error_kwh)
  )

model_diagnostics |>
  arrange(desc(absolute_error_kwh)) |>
  select(
    housing_id,
    neighbourhood,
    annual_kwh,
    predicted_consumption,
    error_kwh,
    absolute_error_kwh
  ) |>
  slice_head(n = 6)
```

    # A tibble: 6 × 6
      housing_id neighbourhood annual_kwh predicted_consumption error_kwh
      <chr>      <chr>              <dbl>                 <dbl>     <dbl>
    1 H028       Saint-Roch         10800                12518.    -1718.
    2 H004       Vanier             15600                13944.     1656.
    3 H015       Vanier             18400                16929.     1471.
    4 H026       Limoilou           16100                14655.     1445.
    5 H019       Sillery            21950                20731.     1219.
    6 H008       Saint-Roch         11250                12408.    -1158.
    # ℹ 1 more variable: absolute_error_kwh <dbl>

Then calculate a root mean squared error.

``` r
rmse_kwh <- sqrt(mean(model_diagnostics$error_kwh^2))

rmse_kwh
```

    [1] 734.6654

> **TIP:**
>
> Rows with the largest absolute errors deserve inspection. They may reveal unusual housing units, important variables missing from the model or simply natural variability.

### Exercise 7 - Visualize errors

Plot the errors against the predicted values. The chart should help you see whether errors remain centred around zero.

``` r
ggplot(model_diagnostics, aes(x = predicted_consumption, y = error_kwh)) +
  geom_hline(yintercept = 0, linetype = "dashed") +
  geom_point(alpha = 0.75, size = 2) +
  labs(
    x = "Predicted consumption (kWh)",
    y = "Error: observed - predicted (kWh)",
    title = "Visual diagnosis of errors"
  ) +
  theme_minimal()
```

![](exercices_files/figure-html/unnamed-chunk-8-1.png)

> **TIP:**
>
> A useful reflex is to look for patterns: errors that increase with predictions, separated groups or highly isolated points. Such a pattern does not automatically invalidate the model, but it signals a limit to discuss.

## Block C - Examine descriptive bias

### Exercise 8 - Import a second dataset

Import the file `fictitious_culture_grants.csv`. Each row represents a fictitious cultural grant application.

``` r
grants <- read_csv("data/fictitious_culture_grants.csv", show_col_types = FALSE)

glimpse(grants)
```

    Rows: 36
    Columns: 8
    $ application_id    <chr> "G001", "G002", "G003", "G004", "G005", "G006", "G00…
    $ region            <chr> "Capitale-Nationale", "Capitale-Nationale", "Bas-Sai…
    $ discipline        <chr> "Theatre", "Music", "Visual arts", "Dance", "Theatre…
    $ organization_size <chr> "Large", "Small", "Small", "Large", "Medium", "Small…
    $ first_application <chr> "No", "Yes", "Yes", "No", "No", "Yes", "Yes", "No", …
    $ requested_budget  <dbl> 82000, 24000, 18000, 91000, 45000, 22000, 31000, 760…
    $ committee_score   <dbl> 86, 72, 68, 88, 74, 64, 70, 82, 66, 78, 71, 69, 90, …
    $ decision          <chr> "Accepted", "Accepted", "Rejected", "Accepted", "Acc…

> **TIP:**
>
> This dataset is fictitious. It is used to practise descriptive reading of differences between groups without concluding too quickly about cause or discrimination.

### Exercise 9 - Compare rates by region

Calculate the acceptance rate by region, then produce a chart.

``` r
acceptance_by_region <- grants |>
  group_by(region) |>
  summarise(
    applications = n(),
    acceptance_rate = mean(decision == "Accepted"),
    .groups = "drop"
  ) |>
  arrange(acceptance_rate)

acceptance_by_region
```

    # A tibble: 7 × 3
      region                  applications acceptance_rate
      <chr>                          <int>           <dbl>
    1 Cote-Nord                          5           0.2
    2 Chaudiere-Appalaches               4           0.25
    3 Bas-Saint-Laurent                  5           0.4
    4 Outaouais                          5           0.4
    5 Saguenay-Lac-Saint-Jean            5           0.6
    6 Capitale-Nationale                 6           0.833
    7 Montreal                           6           1

``` r
ggplot(acceptance_by_region, aes(x = acceptance_rate, y = reorder(region, acceptance_rate))) +
  geom_col() +
  labs(
    x = "Acceptance rate",
    y = NULL,
    title = "Acceptance rate by region"
  ) +
  theme_minimal()
```

![](exercices_files/figure-html/unnamed-chunk-11-1.png)

> **TIP:**
>
> Raw rates can draw attention to differences, but the groups have few observations. Avoid a definitive conclusion.

### Exercise 10 - Add context variables

Also compare decisions by organization size and by whether the application is a first application.

``` r
acceptance_by_size <- grants |>
  group_by(organization_size) |>
  summarise(
    applications = n(),
    acceptance_rate = mean(decision == "Accepted"),
    mean_score = mean(committee_score),
    .groups = "drop"
  )

acceptance_by_size
```

    # A tibble: 3 × 4
      organization_size applications acceptance_rate mean_score
      <chr>                    <int>           <dbl>      <dbl>
    1 Large                        8           1           85.1
    2 Medium                      13           0.615       72.6
    3 Small                       15           0.267       67.1

``` r
acceptance_by_first_application <- grants |>
  group_by(first_application) |>
  summarise(
    applications = n(),
    acceptance_rate = mean(decision == "Accepted"),
    median_budget = median(requested_budget),
    mean_score = mean(committee_score),
    .groups = "drop"
  )

acceptance_by_first_application
```

    # A tibble: 2 × 5
      first_application applications acceptance_rate median_budget mean_score
      <chr>                    <int>           <dbl>         <dbl>      <dbl>
    1 No                          18           0.944         48500       78.7
    2 Yes                         18           0.167         27000       67.6

> **TIP:**
>
> A regional difference may be linked to other available variables, such as organization size, committee score or first-application status. This does not settle the bias question, but it makes the analysis more honest.

### Exercise 11 - Write a careful conclusion

Using the previous tables, write three sentences:

1.  one sentence that describes an observed difference;
2.  one sentence that mentions a data limitation;
3.  one sentence that proposes an additional check.

> **TIP:**
>
> Possible example: acceptance rates vary between regions in this fictitious file. However, each region contains few applications and raw rates do not account for all application characteristics. A next step would be to check whether differences remain among applications with comparable scores, comparable disciplines and comparable organization sizes.

## Case Study 1 - Predict residential consumption

A small municipal organization wants to forecast the annual consumption of new housing units in order to plan an energy-support program.

Your task:

1.  choose between `simple_model` and `multiple_model`;
2.  predict consumption for three fictitious housing units;
3.  write three limits to communicate before using the predictions.

``` r
housing_to_evaluate <- tibble(
  area_m2 = c(65, 95, 145),
  occupants = c(1, 3, 5),
  year_built = c(1972, 2001, 2018)
)

housing_to_evaluate |>
  mutate(predicted_consumption = predict(multiple_model, newdata = housing_to_evaluate))
```

    # A tibble: 3 × 4
      area_m2 occupants year_built predicted_consumption
        <dbl>     <dbl>      <dbl>                 <dbl>
    1      65         1       1972                12971.
    2      95         3       2001                17126.
    3     145         5       2018                23691.

> **TIP:**
>
> The multiple model is preferable here because it uses more relevant information. Limits to communicate may include: the data are fictitious and small; the model does not include insulation, heating habits or appliances; predictions should remain within the range of housing units similar to those observed.

## Case Study 2 - Audit a grant procedure

A committee wants to know whether its grant decisions show concerning differences between groups.

Your task:

1.  choose two comparison variables;
2.  calculate acceptance rates and mean scores;
3.  write a short paragraph that distinguishes descriptive signal, limit and next analysis.

``` r
audit_summary <- grants |>
  group_by(region, organization_size) |>
  summarise(
    applications = n(),
    acceptance_rate = mean(decision == "Accepted"),
    mean_score = mean(committee_score),
    median_budget = median(requested_budget),
    .groups = "drop"
  ) |>
  arrange(region, organization_size)

audit_summary
```

    # A tibble: 16 × 6
       region              organization_size applications acceptance_rate mean_score
       <chr>               <chr>                    <int>           <dbl>      <dbl>
     1 Bas-Saint-Laurent   Medium                       1           1           77
     2 Bas-Saint-Laurent   Small                        4           0.25        66.5
     3 Capitale-Nationale  Large                        2           1           84.5
     4 Capitale-Nationale  Medium                       2           1           75.5
     5 Capitale-Nationale  Small                        2           0.5         71
     6 Chaudiere-Appalach… Medium                       2           0.5         71.5
     7 Chaudiere-Appalach… Small                        2           0           64
     8 Cote-Nord           Medium                       2           0.5         69.5
     9 Cote-Nord           Small                        3           0           65.3
    10 Montreal            Large                        5           1           86.2
    11 Montreal            Medium                       1           1           74
    12 Outaouais           Medium                       3           0.333       71.3
    13 Outaouais           Small                        2           0.5         69
    14 Saguenay-Lac-Saint… Large                        1           1           81
    15 Saguenay-Lac-Saint… Medium                       2           0.5         73
    16 Saguenay-Lac-Saint… Small                        2           0.5         68.5
    # ℹ 1 more variable: median_budget <dbl>

> **TIP:**
>
> A careful paragraph could say that acceptance rates differ across some combinations of region and organization size in the fictitious data. However, several cells contain few applications, which makes comparisons unstable. Before discussing bias or discrimination, comparable applications should be examined, decision criteria should be documented and possible proxy variables should be checked.
