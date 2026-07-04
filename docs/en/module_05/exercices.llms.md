# Module 5 - Exercises

STT-1100 Introduction to Data Science

# Consolidation Exercises

These exercises are independent from the adventure and challenge. They consolidate the technical moves from module 5: manipulate dates, summarize groups, visualize associations, calculate simple correlations and write cautious conclusions.

The data used here are fictitious and do not represent any real system.

``` r
library(tidyverse)
library(lubridate)
```

# Readings to Review

- [R for Data Science - Exploratory data analysis](https://r4ds.hadley.nz/EDA.html)
- [R for Data Science - Dates and times](https://r4ds.hadley.nz/datetimes.html)
- [R for Data Science - Data visualization](https://r4ds.hadley.nz/data-visualize.html)
- [R for Data Science - Missing values](https://r4ds.hadley.nz/missing-values.html)
- [Introduction to Modern Statistics - Exploring numerical data](https://openintro-ims.netlify.app/explore-numerical)
- [Introduction to Modern Statistics - Applications: Explore](https://openintro-ims.netlify.app/explore-applications)

After the readings, also complete the [formative mini-test](../module_05/mini_test.llms.md). It is not graded.

# Block A - Dates, Structure and Missing Values

The file `data/fictitious_support_workshops.csv` describes fake university support workshops.

## Exercise 1 - Import and Inspect

Import the file, display its structure and check its dimensions.

> **NOTE:**
>
> ``` r
> workshops <- read_csv(
>   "data/fictitious_support_workshops.csv",
>   show_col_types = FALSE
> )
>
> glimpse(workshops)
> ```
>
>     Rows: 24
>     Columns: 10
>     $ workshop_id       <chr> "A-001", "A-002", "A-003", "A-004", "A-005", "A-006"…
>     $ workshop_date     <date> 2026-01-15, 2026-01-16, 2026-01-18, 2026-01-22, 202…
>     $ start_hour        <dbl> 9, 13, 16, 10, 14, 18, 9, 15, 17, 11, 13, 16, 9, 14,…
>     $ campus            <chr> "Quebec", "Quebec", "Levis", "Quebec", "Levis", "Que…
>     $ duration_minutes  <dbl> 60, 75, 60, 90, 75, 60, 90, 60, 75, 60, 90, 75, 60, …
>     $ participants      <dbl> 18, 24, 12, 31, 16, 22, 28, 14, 35, 20, 18, 33, 19, …
>     $ temperature_c     <dbl> -8, -6, -5, -3, -2, -4, -10, -7, -4, -1, 0, 1, -6, -…
>     $ rain_mm           <dbl> 0.0, 1.2, 0.0, 0.4, 2.1, 0.0, 0.0, 3.4, 0.2, 0.0, 6.…
>     $ mean_satisfaction <dbl> 4.1, 4.2, 3.8, 4.4, 4.0, 4.3, 4.5, 3.7, 4.6, 4.2, 3.…
>     $ topic             <chr> "Quarto", "Visualization", "Import", "EDA", "Quarto"…
>
> ``` r
> tibble(
>   rows = nrow(workshops),
>   columns = ncol(workshops)
> )
> ```
>
>     # A tibble: 1 × 2
>        rows columns
>       <int>   <int>
>     1    24      10

## Exercise 2 - Prepare Temporal Variables

Transform `workshop_date` into a date, then create `weekday`, `month` and `time_of_day`.

> **NOTE:**
>
> ``` r
> workshops_dates <- workshops |>
>   mutate(
>     workshop_date = ymd(workshop_date),
>     weekday = wday(workshop_date, label = TRUE, abbr = FALSE),
>     month = month(workshop_date, label = TRUE, abbr = FALSE),
>     time_of_day = case_when(
>       start_hour < 12 ~ "morning",
>       start_hour < 17 ~ "afternoon",
>       TRUE ~ "evening"
>     )
>   )
>
> workshops_dates |>
>   select(workshop_id, workshop_date, weekday, month, start_hour, time_of_day) |>
>   slice_head(n = 8)
> ```
>
>     # A tibble: 8 × 6
>       workshop_id workshop_date weekday  month    start_hour time_of_day
>       <chr>       <date>        <ord>    <ord>         <dbl> <chr>
>     1 A-001       2026-01-15    Thursday January           9 morning
>     2 A-002       2026-01-16    Friday   January          13 afternoon
>     3 A-003       2026-01-18    Sunday   January          16 afternoon
>     4 A-004       2026-01-22    Thursday January          10 morning
>     5 A-005       2026-01-24    Saturday January          14 afternoon
>     6 A-006       2026-01-29    Thursday January          18 evening
>     7 A-007       2026-02-03    Tuesday  February          9 morning
>     8 A-008       2026-02-05    Thursday February         15 afternoon

## Exercise 3 - Identify Missing Values

Calculate the number of missing values in `participants`, `rain_mm` and `mean_satisfaction`.

> **NOTE:**
>
> ``` r
> workshops_dates |>
>   summarise(
>     participants_missing = sum(is.na(participants)),
>     rain_missing = sum(is.na(rain_mm)),
>     satisfaction_missing = sum(is.na(mean_satisfaction))
>   )
> ```
>
>     # A tibble: 1 × 3
>       participants_missing rain_missing satisfaction_missing
>                      <int>        <int>                <int>
>     1                    0            1                    1

## Exercise 4 - Summarize by Time of Day

Calculate the number of workshops, mean participation and mean satisfaction by `time_of_day`.

> **NOTE:**
>
> ``` r
> summary_time <- workshops_dates |>
>   group_by(time_of_day) |>
>   summarise(
>     n_workshops = n(),
>     mean_participants = mean(participants, na.rm = TRUE),
>     mean_satisfaction = mean(mean_satisfaction, na.rm = TRUE),
>     .groups = "drop"
>   )
>
> summary_time
> ```
>
>     # A tibble: 3 × 4
>       time_of_day n_workshops mean_participants mean_satisfaction
>       <chr>             <int>             <dbl>             <dbl>
>     1 afternoon            11              20.5              4.08
>     2 evening               5              35.8              4.55
>     3 morning               8              23.2              4.28

# Block B - Associations and Visualizations

## Exercise 5 - Visualize Participants

Produce a column chart of the mean number of participants by time of day.

> **NOTE:**
>
> ``` r
> summary_time |>
>   ggplot(aes(x = time_of_day, y = mean_participants)) +
>   geom_col(fill = "#2c7fb8") +
>   labs(
>     title = "Mean participation by time of day",
>     x = "Time of day",
>     y = "Mean number of participants"
>   )
> ```
>
> ![](exercices_files/figure-html/unnamed-chunk-5-1.png)

## Exercise 6 - Compare Topics

For each workshop topic, calculate the number of workshops, mean participation and mean satisfaction.

> **NOTE:**
>
> ``` r
> summary_topic <- workshops_dates |>
>   group_by(topic) |>
>   summarise(
>     n_workshops = n(),
>     mean_participants = mean(participants, na.rm = TRUE),
>     mean_satisfaction = mean(mean_satisfaction, na.rm = TRUE),
>     .groups = "drop"
>   ) |>
>   arrange(desc(mean_participants))
>
> summary_topic
> ```
>
>     # A tibble: 4 × 4
>       topic         n_workshops mean_participants mean_satisfaction
>       <chr>               <int>             <dbl>             <dbl>
>     1 Visualization           7              30.9              4.42
>     2 EDA                     6              28.7              4.4
>     3 Quarto                  6              19.7              4.17
>     4 Import                  5              16.8              3.88

## Exercise 7 - Calculate a Correlation Matrix

Calculate the correlations between `duration_minutes`, `participants`, `temperature_c`, `rain_mm` and `mean_satisfaction`.

> **NOTE:**
>
> ``` r
> workshops_dates |>
>   select(duration_minutes, participants, temperature_c, rain_mm, mean_satisfaction) |>
>   cor(use = "complete.obs") |>
>   round(2)
> ```
>
>                       duration_minutes participants temperature_c rain_mm
>     duration_minutes              1.00         0.59          0.16    0.15
>     participants                  0.59         1.00          0.27   -0.47
>     temperature_c                 0.16         0.27          1.00    0.17
>     rain_mm                       0.15        -0.47          0.17    1.00
>     mean_satisfaction             0.40         0.93          0.23   -0.65
>                       mean_satisfaction
>     duration_minutes               0.40
>     participants                   0.93
>     temperature_c                  0.23
>     rain_mm                       -0.65
>     mean_satisfaction              1.00
>
> Correlation summarizes a linear association. It is not enough to establish cause and effect.

## Exercise 8 - Make a Scatterplot

Create a graph of `duration_minutes` and `participants`. Add a trend line.

> **NOTE:**
>
> ``` r
> workshops_dates |>
>   ggplot(aes(x = duration_minutes, y = participants)) +
>   geom_point(aes(color = topic), size = 2.5, alpha = 0.8) +
>   geom_smooth(method = "lm", se = FALSE, color = "black") +
>   labs(
>     title = "Workshop duration and participation",
>     x = "Workshop duration (minutes)",
>     y = "Number of participants",
>     color = "Topic"
>   )
> ```
>
>     `geom_smooth()` using formula = 'y ~ x'
>
> ![](exercices_files/figure-html/unnamed-chunk-8-1.png)

## Exercise 9 - Compare Rainy and Non-Rainy Days

Create a `rainy_day` variable, then compare mean participation by that variable.

> **NOTE:**
>
> ``` r
> workshops_rain <- workshops_dates |>
>   mutate(
>     rainy_day = case_when(
>       is.na(rain_mm) ~ "unknown rain",
>       rain_mm > 0 ~ "rain",
>       TRUE ~ "no rain"
>     )
>   )
>
> workshops_rain |>
>   group_by(rainy_day) |>
>   summarise(
>     n_workshops = n(),
>     mean_participants = mean(participants, na.rm = TRUE),
>     .groups = "drop"
>   )
> ```
>
>     # A tibble: 3 × 3
>       rainy_day    n_workshops mean_participants
>       <chr>              <int>             <dbl>
>     1 no rain               11              27.5
>     2 rain                  12              22.4
>     3 unknown rain           1              19

# Block C - Cautious Interpretation

## Exercise 10 - Write a Descriptive Conclusion

Using one of the previous tables, write two sentences:

1.  one sentence that describes the observed result;
2.  one sentence that states a limitation.

> **NOTE:**
>
> Evening workshops seem to have higher mean participation in this small fictitious file. This comparison remains descriptive because evening workshops do not always cover the same topics and the number of observations is limited.

## Exercise 11 - Choose an Appropriate Visualization

Choose one of the two questions below, then produce an appropriate graph.

1.  Does mean satisfaction vary by topic?
2.  Does participation vary with temperature?

> **NOTE:**
>
> ``` r
> workshops_dates |>
>   filter(!is.na(mean_satisfaction)) |>
>   ggplot(aes(x = topic, y = mean_satisfaction)) +
>   geom_point(size = 2.5, alpha = 0.8) +
>   labs(
>     title = "Mean satisfaction by topic",
>     x = "Topic",
>     y = "Mean satisfaction"
>   )
> ```
>
> ![](exercices_files/figure-html/unnamed-chunk-10-1.png)

## Exercise 12 - Build a Small Summary Table

Create a summary table by campus with the number of workshops, total participation, mean participation and mean satisfaction.

> **NOTE:**
>
> ``` r
> workshops_dates |>
>   group_by(campus) |>
>   summarise(
>     n_workshops = n(),
>     total_participation = sum(participants, na.rm = TRUE),
>     mean_participation = mean(participants, na.rm = TRUE),
>     mean_satisfaction = mean(mean_satisfaction, na.rm = TRUE),
>     .groups = "drop"
>   )
> ```
>
>     # A tibble: 2 × 5
>       campus n_workshops total_participation mean_participation mean_satisfaction
>       <chr>        <int>               <dbl>              <dbl>             <dbl>
>     1 Levis            8                 129               16.1              3.9
>     2 Quebec          16                 461               28.8              4.41

# Case Studies

## Case Study 1 - Fictitious Library Visits

The file `data/fictitious_library_visits.csv` describes fake library-area visit observations.

Complete the following tasks:

1.  import the file;
2.  transform `visit_date` into a date;
3.  create `weekday` and `time_of_day`;
4.  summarize visitors by area and time of day;
5.  calculate correlations between `visitors`, `temperature_c` and `rain_mm`;
6.  produce a useful visualization;
7.  write a cautious conclusion.

> **NOTE:**
>
> ``` r
> library_visits <- read_csv(
>   "data/fictitious_library_visits.csv",
>   show_col_types = FALSE
> ) |>
>   mutate(
>     visit_date = ymd(visit_date),
>     weekday = wday(visit_date, label = TRUE, abbr = FALSE),
>     time_of_day = case_when(
>       hour < 12 ~ "morning",
>       hour < 17 ~ "afternoon",
>       TRUE ~ "evening"
>     )
>   )
>
> library_visits |>
>   group_by(area, time_of_day) |>
>   summarise(
>     n_observations = n(),
>     mean_visitors = mean(visitors),
>     .groups = "drop"
>   )
> ```
>
>     # A tibble: 3 × 4
>       area          time_of_day n_observations mean_visitors
>       <chr>         <chr>                <int>         <dbl>
>     1 Collaboration afternoon                8          58.2
>     2 Computers     evening                  8          65.9
>     3 Silent        morning                  8          44.4
>
> ``` r
> library_visits |>
>   select(visitors, temperature_c, rain_mm) |>
>   cor(use = "complete.obs") |>
>   round(2)
> ```
>
>                   visitors temperature_c rain_mm
>     visitors          1.00          0.63   -0.27
>     temperature_c     0.63          1.00   -0.48
>     rain_mm          -0.27         -0.48    1.00
>
> ``` r
> library_visits |>
>   ggplot(aes(x = time_of_day, y = visitors, color = area)) +
>   geom_point(size = 2.5, alpha = 0.8) +
>   labs(
>     title = "Fictitious visits by time of day",
>     x = "Time of day",
>     y = "Number of visitors",
>     color = "Area"
>   )
> ```
>
> ![](exercices_files/figure-html/unnamed-chunk-12-1.png)
>
> A cautious conclusion could state that evening observations seem busier in this file, especially in the computer area. This conclusion remains descriptive because exam week, area and campus vary at the same time.

## Case Study 2 - Fictitious Campus Service Requests

The file `data/fictitious_campus_service_requests.csv` describes fake requests sent to campus services.

Complete the following tasks:

1.  import the file;
2.  transform `request_date` into a date;
3.  summarize delays by service and priority;
4.  calculate correlations between `delay_hours`, `satisfaction` and `estimated_cost`;
5.  produce a useful visualization;
6.  write a cautious conclusion.

> **NOTE:**
>
> ``` r
> requests <- read_csv(
>   "data/fictitious_campus_service_requests.csv",
>   show_col_types = FALSE
> ) |>
>   mutate(
>     request_date = ymd(request_date),
>     weekday = wday(request_date, label = TRUE, abbr = FALSE)
>   )
>
> requests |>
>   group_by(service, priority) |>
>   summarise(
>     n_requests = n(),
>     mean_delay = mean(delay_hours, na.rm = TRUE),
>     mean_satisfaction = mean(satisfaction, na.rm = TRUE),
>     .groups = "drop"
>   ) |>
>   arrange(desc(mean_delay))
> ```
>
>     # A tibble: 12 × 5
>        service     priority n_requests mean_delay mean_satisfaction
>        <chr>       <chr>         <int>      <dbl>             <dbl>
>      1 Maintenance Low               2       76                3
>      2 Maintenance Normal            2       59                3.2
>      3 Maintenance High              2       45                3.55
>      4 Rooms       Low               1       44                3.3
>      5 Rooms       Normal            2       34.5              3.8
>      6 IT          Low               1       27                4
>      7 Library     Low               2       22                4.5
>      8 Rooms       High              2       20.5              4.05
>      9 IT          Normal            4       17.5              4.3
>     10 Library     Normal            3       13                4.77
>     11 Library     High              1       10                4.8
>     12 IT          High              2        8.5              4.6
>
> ``` r
> requests |>
>   select(delay_hours, satisfaction, estimated_cost) |>
>   cor(use = "complete.obs") |>
>   round(2)
> ```
>
>                    delay_hours satisfaction estimated_cost
>     delay_hours           1.00        -0.95           0.91
>     satisfaction         -0.95         1.00          -0.90
>     estimated_cost        0.91        -0.90           1.00
>
> ``` r
> requests |>
>   ggplot(aes(x = delay_hours, y = satisfaction, color = service)) +
>   geom_point(size = 2.5, alpha = 0.8) +
>   geom_smooth(method = "lm", se = FALSE, color = "black") +
>   labs(
>     title = "Processing delay and satisfaction",
>     x = "Processing delay (hours)",
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
> A cautious conclusion could state that requests with longer delays seem associated with lower satisfaction in this fictitious file. However, we cannot conclude that delay directly causes satisfaction because priority, service type and request complexity may also matter.
