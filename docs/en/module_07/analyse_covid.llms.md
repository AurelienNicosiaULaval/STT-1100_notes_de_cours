# Initial analysis of COVID-19 cases

## Data context

The dataset presented in this analysis simulates information collected during the year 2022 on cases of COVID-19 among elderly people living in three regions of Quebec: Montreal, Quebec and Outaouais. Each line represents an individual identified by their first name, last name, age, region, date of observation and the number of confirmed cases associated with them. The data also includes an observation date.

         region age confirmed_cases       date
    1    Quebec  78             111 2022-08-03
    2    Quebec  66              92 2022-03-20
    3 Outaouais  68              74 2022-01-30
    4  Montreal  94             144 2022-12-05
    5    Quebec  85             133 2022-05-02
    6    Quebec  75              93 2022-07-21

## Visualization proposed by the research team

``` r
case_by_region <- covid_problematic %>%
  group_by(region) %>%
  summarise(total_cases = sum(confirmed_cases), .groups = "drop")

ggplot(case_by_region, aes(x = region, y = total_cases, fill = region)) +
  geom_bar(stat = "identity") +
  scale_y_continuous(breaks = seq(0, max(case_by_region$total_cases), by = 10)) +
  scale_fill_manual(values = c("Montreal" = "red", "Quebec" = "orange", "Outaouais" = "purple")) +
  theme_minimal() +
  theme(legend.position = "none")
```

![](analyse_covid_files/figure-html/unnamed-chunk-2-1.png)

## Interpretation of results

The graph above **clearly shows that the Montreal region is the most affected**, with a much higher number of cases than other regions. The data are **taken from our internal reports** collected during 2012. No adjustment by population was made, but this is not considered necessary.

# Descriptive analysis

## Table of notable cases

In this section, we seek to identify the individuals who have generated the greatest number of confirmed cases.

The following table shows the 5 people with the highest individual totals of confirmed cases according to our database:

``` r
# Extraction of the 5 people with the highest number of confirmed cases
covid_problematic %>%
  arrange(desc(confirmed_cases)) %>%
  select(person, region, confirmed_cases, date) %>%
  head(5)
```

                      person    region confirmed_cases       date
    1  Luc Dupont , 66 years  Montreal             147 2022-09-29
    2 Chloé Morin , 67 years Outaouais             146 2022-08-30
    3 Chloé Gagné , 84 years    Quebec             145 2022-02-11
    4  Luc Dupont , 90 years    Quebec             145 2022-08-28
    5 Chloé Morin , 94 years  Montreal             144 2022-12-05

## Complementary exploratory analysis

``` r
covid_problematic %>%
  mutate(risk = if_else(age > 85 & confirmed_cases > 100, "High", "Moderate")) %>%
  group_by(risk) %>%
  summarize(
    mean_age = mean(age),
    mean_case = mean(confirmed_cases),
    .groups = "drop"
  )
```

    # A tibble: 2 × 3
      risk     mean_age mean_case
      <chr>       <dbl>     <dbl>
    1 High         91.8      132
    2 Moderate     76.3      105.

``` r
covid_problematic %>%
  ggplot(aes(x = age, y = confirmed_cases)) +
  geom_point(color = "darkred") +
  geom_smooth(method = "lm", se = FALSE, linetype = "dashed") +
  labs(title = "The older you are, the more you contract COVID")
```

    `geom_smooth()` using formula = 'y ~ x'

![](analyse_covid_files/figure-html/unnamed-chunk-4-1.png)

## Immediate recommendations

- The authorities should concentrate their efforts on **Montreal**, which seems to be in crisis.
- People aged over 85 should be prioritized (see table).
- The Quebec region seems little affected: resources could be redistributed.

## Methodological note

Data were pooled quickly without standardization by population. No margin of error, confidence interval or verification of sources has been provided. The data cover variable periods without harmonization.

------------------------------------------------------------------------

**Educational note**: This document deliberately contains numerous visualization, ethical and analytical errors. It is used as a starting point for your critical mission.

The `data_covid_module7.csv` file is the one you must use to produce a corrected version of the graph.
