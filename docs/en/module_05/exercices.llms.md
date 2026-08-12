# Module 5 - Exercises

STT-1100 Introduction to Data Science

> **IMPORTANT:**
>
> [Download the ready-to-open workspace (.zip)](../../downloads/donnees/stt1100-module-05-en.zip)
>
> Unpack the file, then open the `.Rproj` project. The paths used in the exercises will work without moving the data.

## Consolidation Exercises

These exercises are independent from the adventure and challenge. They consolidate the technical moves from Module 5: manipulating dates, summarizing groups, visualizing associations, calculating simple correlations and writing cautious conclusions.

> **NOTE:**
>
> The exercises use [Laval bicycle counts](https://www.donneesquebec.ca/recherche/dataset/comptages-velos), [hourly Québec air-quality measurements](https://www.donneesquebec.ca/recherche/dataset/rsqaq-donnees-horaires-continues) from the Québec - Vieux-Limoilou station and [Gatineau traffic volumes](https://www.donneesquebec.ca/recherche/dataset/debits-de-circulation). These official sources are released under the CC BY 4.0 licence. The local files are reproducible extracts prepared by `scripts/build_module05_real_data.R`.

``` r
library(tidyverse)
library(lubridate)
```

## Block A - Dates, Structure and Missing Values

The file `data/comptages_velos_laval_2016_06.csv` contains counts recorded every 15 minutes at Laval’s Chevillon loop in June 2016. The source’s French field names are retained.

### Exercise 1 - Import and Inspect

Import the file, display its structure and check its dimensions.

> **NOTE:**
>
> ``` r
> bikes <- read_csv(
>   "data/comptages_velos_laval_2016_06.csv",
>   show_col_types = FALSE
> )
>
> glimpse(bikes)
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
>   rows = nrow(bikes),
>   columns = ncol(bikes)
> )
> ```
>
>     # A tibble: 1 × 2
>        rows columns
>       <int>   <int>
>     1  2688       5

### Exercise 2 - Prepare Temporal Variables

Combine `date` and `heure`, then create `weekday`, `month`, `hour_of_day` and `time_of_day`.

> **NOTE:**
>
> ``` r
> bikes_dates <- bikes |>
>   mutate(
>     date_time = ymd_hms(paste(date, heure)),
>     weekday = wday(date_time, label = TRUE, abbr = FALSE),
>     month = month(date_time, label = TRUE, abbr = FALSE),
>     hour_of_day = hour(date_time),
>     time_of_day = case_when(
>       hour_of_day < 12 ~ "morning",
>       hour_of_day < 17 ~ "afternoon",
>       TRUE ~ "evening"
>     )
>   )
>
> bikes_dates |>
>   select(date_time, weekday, month, hour_of_day, time_of_day) |>
>   slice_head(n = 8)
> ```
>
>     # A tibble: 8 × 5
>       date_time           weekday   month hour_of_day time_of_day
>       <dttm>              <ord>     <ord>       <int> <chr>
>     1 2016-06-01 00:00:00 Wednesday June            0 morning
>     2 2016-06-01 00:15:00 Wednesday June            0 morning
>     3 2016-06-01 00:30:00 Wednesday June            0 morning
>     4 2016-06-01 00:45:00 Wednesday June            0 morning
>     5 2016-06-01 01:00:00 Wednesday June            1 morning
>     6 2016-06-01 01:15:00 Wednesday June            1 morning
>     7 2016-06-01 01:30:00 Wednesday June            1 morning
>     8 2016-06-01 01:45:00 Wednesday June            1 morning

### Exercise 3 - Check Missing Values and an Accounting Relationship

Count missing values in the three count columns. Also check whether `velos_total` equals the sum of inbound and outbound bicycles.

> **NOTE:**
>
> ``` r
> bikes_dates |>
>   summarise(
>     total_missing = sum(is.na(velos_total)),
>     inbound_missing = sum(is.na(velos_entrants)),
>     outbound_missing = sum(is.na(velos_sortants)),
>     inconsistent_totals = sum(
>       velos_total != velos_entrants + velos_sortants,
>       na.rm = TRUE
>     )
>   )
> ```
>
>     # A tibble: 1 × 4
>       total_missing inbound_missing outbound_missing inconsistent_totals
>               <int>           <int>            <int>               <int>
>     1             0               0                0                   0

### Exercise 4 - Summarize by Time of Day

Calculate the number of observations and mean bicycle count by `time_of_day`.

> **NOTE:**
>
> ``` r
> time_summary <- bikes_dates |>
>   group_by(time_of_day) |>
>   summarise(
>     n_observations = n(),
>     mean_bikes = mean(velos_total, na.rm = TRUE),
>     mean_inbound = mean(velos_entrants, na.rm = TRUE),
>     mean_outbound = mean(velos_sortants, na.rm = TRUE),
>     .groups = "drop"
>   )
>
> time_summary
> ```
>
>     # A tibble: 3 × 5
>       time_of_day n_observations mean_bikes mean_inbound mean_outbound
>       <chr>                <int>      <dbl>        <dbl>         <dbl>
>     1 afternoon              560      18.3          9.82          8.5
>     2 evening                784       7.99         4.16          3.83
>     3 morning               1344       7.69         3.50          4.19

## Block B - Associations and Visualizations

### Exercise 5 - Visualize Mean Counts

Produce a column chart of the mean bicycle count by time of day.

> **NOTE:**
>
> ``` r
> time_summary |>
>   ggplot(aes(x = time_of_day, y = mean_bikes)) +
>   geom_col(fill = "#2c7fb8") +
>   labs(
>     title = "Mean count by time of day",
>     x = "Time of day",
>     y = "Mean number of bicycles per 15-minute interval"
>   )
> ```
>
> ![Column chart of the mean bicycle count by time of day.](exercices_files/figure-html/unnamed-chunk-5-1.png)

### Exercise 6 - Compare Weekdays

For each weekday, calculate the number of observations and mean count.

> **NOTE:**
>
> ``` r
> summary_weekday <- bikes_dates |>
>   group_by(weekday) |>
>   summarise(
>     n_observations = n(),
>     mean_bicycles = mean(velos_total, na.rm = TRUE),
>     .groups = "drop"
>   ) |>
>   arrange(desc(mean_bicycles))
>
> summary_weekday
> ```
>
>     # A tibble: 7 × 3
>       weekday   n_observations mean_bicycles
>       <ord>              <int>         <dbl>
>     1 Sunday               288         12.9
>     2 Tuesday              384         12.0
>     3 Thursday             480         10.9
>     4 Friday               384         10.2
>     5 Saturday             288          9.36
>     6 Wednesday            480          8.01
>     7 Monday               384          7.38

### Exercise 7 - Calculate a Correlation Matrix

Calculate correlations among `velos_total`, `velos_entrants` and `velos_sortants`.

> **NOTE:**
>
> ``` r
> bikes_dates |>
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
> Here the correlation is affected by the accounting relationship between the total and the two directions. It is not evidence of causation.

### Exercise 8 - Make a Scatterplot

Graph incoming and outgoing bicycles. Colour the points by time of day and add a trend line.

> **NOTE:**
>
> ``` r
> bikes_dates |>
>   ggplot(aes(x = velos_entrants, y = velos_sortants)) +
>   geom_point(aes(color = time_of_day), alpha = 0.45) +
>   geom_smooth(method = "lm", se = FALSE, color = "black") +
>   labs(
>     title = "Incoming and outgoing bicycle counts in Laval",
>     x = "Incoming bicycles",
>     y = "Outgoing bicycles",
>     color = "Time"
>   )
> ```
>
>     `geom_smooth()` using formula = 'y ~ x'
>
> ![Line chart of the mean bicycle count by hour of day.](exercices_files/figure-html/unnamed-chunk-8-1.png)

### Exercise 9 - Compare Weekdays and Weekends

Create a `day_type` variable, then compare mean counts between weekdays and weekends.

> **NOTE:**
>
> ``` r
> bikes_day_type <- bikes_dates |>
>   mutate(
>     day_type = if_else(
>       wday(date_time) %in% c(1, 7),
>       "weekend",
>       "weekday"
>     )
>   )
>
> bikes_day_type |>
>   group_by(day_type) |>
>   summarise(
>     n_observations = n(),
>     mean_bicycles = mean(velos_total, na.rm = TRUE),
>     .groups = "drop"
>   )
> ```
>
>     # A tibble: 2 × 3
>       day_type n_observations mean_bicycles
>       <chr>             <int>         <dbl>
>     1 weekday            2112          9.68
>     2 weekend             576         11.1

## Block C - Cautious Interpretation

### Exercise 10 - Write a Descriptive Conclusion

Using one of the previous tables, write one descriptive sentence and one sentence stating a limitation.

> **NOTE:**
>
> In this extract, the mean count is higher in the afternoon than in the morning or evening. The result describes only the Chevillon counter during June 2016 and cannot explain the cause of this difference.

### Exercise 11 - Choose an Appropriate Visualization

Produce a graph of mean counts by hour of day.

> **NOTE:**
>
> ``` r
> bikes_dates |>
>   group_by(hour_of_day) |>
>   summarise(
>     mean_bicycles = mean(velos_total, na.rm = TRUE),
>     .groups = "drop"
>   ) |>
>   ggplot(aes(x = hour_of_day, y = mean_bicycles)) +
>   geom_line(linewidth = 1, color = "#2c7fb8") +
>   geom_point(color = "#2c7fb8") +
>   labs(
>     title = "Hourly bicycle-count profile",
>     x = "Hour",
>     y = "Mean number of bicycles"
>   )
> ```
>
> ![](exercices_files/figure-html/unnamed-chunk-10-1.png)

### Exercise 12 - Build a Daily Summary Table

Create a table by date containing the daily total, interval mean and largest 15-minute count.

> **NOTE:**
>
> ``` r
> bikes_dates |>
>   group_by(date) |>
>   summarise(
>     daily_total = sum(velos_total, na.rm = TRUE),
>     interval_mean = mean(velos_total, na.rm = TRUE),
>     interval_maximum = max(velos_total, na.rm = TRUE),
>     .groups = "drop"
>   ) |>
>   arrange(desc(daily_total))
> ```
>
>     # A tibble: 28 × 4
>        date       daily_total interval_mean interval_maximum
>        <date>           <dbl>         <dbl>            <dbl>
>      1 2016-06-24        2003          20.9              124
>      2 2016-06-16        1509          15.7               53
>      3 2016-06-15        1473          15.3               50
>      4 2016-06-14        1450          15.1               56
>      5 2016-06-18        1418          14.8               55
>      6 2016-06-30        1359          14.2               41
>      7 2016-06-19        1349          14.1               50
>      8 2016-06-07        1318          13.7               66
>      9 2016-06-21        1303          13.6               48
>     10 2016-06-23        1303          13.6               58
>     # ℹ 18 more rows

## Case Studies

### Case Study 1 - Air Quality at Québec - Vieux-Limoilou

The file `data/qualite_air_quebec_vieux_limoilou_2025_07.csv` contains 744 hourly measurements from July 2025 at the Québec - Vieux-Limoilou station. The variables are pollutant concentrations and may contain missing values.

Complete the following tasks:

1.  import the file and transform `date_heure`;
2.  create `date`, `hour_of_day` and `time_of_day`;
3.  count missing values for each pollutant;
4.  summarize mean concentrations by time of day;
5.  calculate a correlation matrix among pollutants;
6.  produce a time-series visualization of fine particles;
7.  write a cautious conclusion.

> **NOTE:**
>
> ``` r
> quebec_air <- read_csv(
>   "data/qualite_air_quebec_vieux_limoilou_2025_07.csv",
>   show_col_types = FALSE
> ) |>
>   mutate(
>     date_heure = ymd_hms(date_heure),
>     date = as_date(date_heure),
>     hour_of_day = hour(date_heure),
>     time_of_day = case_when(
>       hour_of_day < 12 ~ "morning",
>       hour_of_day < 17 ~ "afternoon",
>       TRUE ~ "evening"
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
> quebec_air |>
>   summarise(
>     across(
>       carbone_noir:dioxyde_soufre,
>       ~ sum(is.na(.x)),
>       .names = "missing_{.col}"
>     )
>   )
> ```
>
>     # A tibble: 1 × 5
>       missing_carbone_noir missing_monoxyde_carbone missing_ozone
>                      <int>                    <int>         <int>
>     1                   59                       31             7
>     # ℹ 2 more variables: missing_particules_fines <int>,
>     #   missing_dioxyde_soufre <int>
>
> ``` r
> quebec_air |>
>   group_by(time_of_day) |>
>   summarise(
>     across(carbone_noir:dioxyde_soufre, ~ mean(.x, na.rm = TRUE)),
>     .groups = "drop"
>   )
> ```
>
>     # A tibble: 3 × 6
>       time_of_day carbone_noir monoxyde_carbone ozone particules_fines
>       <chr>              <dbl>            <dbl> <dbl>            <dbl>
>     1 afternoon          0.560            0.220  30.9             14.8
>     2 evening            0.798            0.240  26.4             16.2
>     3 morning            0.690            0.221  17.6             14.2
>     # ℹ 1 more variable: dioxyde_soufre <dbl>
>
> ``` r
> quebec_air |>
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
> quebec_air |>
>   ggplot(aes(x = date_heure, y = particules_fines)) +
>   geom_line(color = "#7b3294", linewidth = 0.5, na.rm = TRUE) +
>   labs(
>     title = "Fine particles at Québec - Vieux-Limoilou",
>     subtitle = "Hourly measurements, July 2025",
>     x = NULL,
>     y = "PM2.5"
>   )
> ```
>
> ![Hourly time series of fine-particle concentrations at the Québec - Vieux-Limoilou station in July 2025.](exercices_files/figure-html/unnamed-chunk-12-1.png)
>
> A cautious conclusion may describe hourly variation and observed associations. It must remain limited to one station and one month, without assigning the concentrations to a specific cause.

### Case Study 2 - Traffic Volumes in Gatineau

The file `data/debits_circulation_gatineau_2016_2023.csv` is a teaching extract of traffic volumes published by the City of Gatineau for different intersections, approaches, directions and years. It retains 150 rows per year to keep calculations light, but is not a representative sample of the city.

Complete the following tasks:

1.  import the file and inspect missing values;
2.  create an estimate of the number of heavy vehicles;
3.  summarize traffic volumes by sector and year;
4.  calculate correlations among year, traffic volume, heavy-vehicle share and estimated heavy-vehicle count;
5.  produce a useful visualization;
6.  write a cautious conclusion.

> **NOTE:**
>
> ``` r
> traffic <- read_csv(
>   "data/debits_circulation_gatineau_2016_2023.csv",
>   show_col_types = FALSE
> ) |>
>   mutate(
>     estimated_heavy_vehicles =
>       debit_total_24h * pourcentage_vehicules_lourds / 100
>   )
>
> traffic |>
>   summarise(across(everything(), ~ sum(is.na(.x))))
> ```
>
>     # A tibble: 1 × 8
>       secteur intersection approche direction_circulation debit_total_24h
>         <int>        <int>    <int>                 <int>           <int>
>     1       0            0      154                     4               0
>     # ℹ 3 more variables: pourcentage_vehicules_lourds <int>, annee <int>,
>     #   estimated_heavy_vehicles <int>
>
> ``` r
> traffic |>
>   group_by(secteur, annee) |>
>   summarise(
>     n_observations = n(),
>     median_volume = median(debit_total_24h, na.rm = TRUE),
>     mean_heavy_percentage = mean(
>       pourcentage_vehicules_lourds,
>       na.rm = TRUE
>     ),
>     .groups = "drop"
>   )
> ```
>
>     # A tibble: 26 × 5
>        secteur    annee n_observations median_volume mean_heavy_percentage
>        <chr>      <dbl>          <int>         <dbl>                 <dbl>
>      1 Aylmer      2017             52           750                  7.85
>      2 Aylmer      2018             72          7150                  5.93
>      3 Aylmer      2019             45          1100                  7.93
>      4 Aylmer      2020            150          1000                  7.32
>      5 Aylmer      2021             48          1600                  4.40
>      6 Aylmer      2022             52           700                  5.78
>      7 Buckingham  2016              5          4000                  0
>      8 Buckingham  2017              6          1200                  9.37
>      9 Buckingham  2019             10          1800                  9.35
>     10 Buckingham  2022              7          3100                  5.07
>     # ℹ 16 more rows
>
> ``` r
> traffic |>
>   select(
>     annee,
>     debit_total_24h,
>     pourcentage_vehicules_lourds,
>     estimated_heavy_vehicles
>   ) |>
>   cor(use = "complete.obs") |>
>   round(2)
> ```
>
>                                  annee debit_total_24h pourcentage_vehicules_lourds
>     annee                         1.00           -0.11                        -0.10
>     debit_total_24h              -0.11            1.00                         0.01
>     pourcentage_vehicules_lourds -0.10            0.01                         1.00
>     estimated_heavy_vehicles     -0.08            0.27                         0.78
>                                  estimated_heavy_vehicles
>     annee                                           -0.08
>     debit_total_24h                                  0.27
>     pourcentage_vehicules_lourds                     0.78
>     estimated_heavy_vehicles                         1.00
>
> ``` r
> traffic |>
>   ggplot(
>     aes(
>       x = debit_total_24h,
>       y = pourcentage_vehicules_lourds,
>       color = secteur
>     )
>   ) +
>   geom_point(alpha = 0.35) +
>   labs(
>     title = "Total traffic and heavy-vehicle share",
>     x = "Total 24-hour traffic volume",
>     y = "Heavy vehicles (%)",
>     color = "Sector"
>   )
> ```
>
>     Warning: Removed 7 rows containing missing values or values outside the scale range
>     (`geom_point()`).
>
> ![Scatterplot of total traffic volume and heavy-vehicle percentage, coloured by sector.](exercices_files/figure-html/unnamed-chunk-13-1.png)
>
> A cautious conclusion may compare the groups represented in the file. It should note that observed locations and years differ, and that the estimated heavy-vehicle count is calculated directly from total volume and percentage.
