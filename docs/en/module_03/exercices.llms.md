# Consolidation exercises

> **IMPORTANT:**
>
> [Download the ready-to-open workspace (.zip)](../../downloads/donnees/stt1100-module-03-en.zip)
>
> Unpack the file, then open the `.Rproj` project. The paths used in the exercises will work without moving the data.

These exercises stabilize the core moves of the module: recognize a categorical variable, count levels, clean character strings, extract patterns and build readable charts.

They are independent from the adventure and challenge. They practise the same skills without directly preparing the food offence article.

``` r
library(tidyverse)
```

## Block A - Categorical variables and frequencies

### Exercise 1 - Recognize variable types

Here is a small dataset.

``` r
survey <- tibble(
  program = c("Statistics", "Economics", "Statistics", "Biology", "Economics"),
  age = c(21, 24, 22, 20, 27),
  campus = c("Quebec City", "Quebec City", "Montreal", "Quebec City", "Montreal"),
  satisfaction = c("High", "Medium", "High", "Low", "Medium")
)
```

Identify which variables are categorical and which variables are numeric.

> **NOTE:**
>
> `program`, `campus` and `satisfaction` are categorical. `age` is numeric.

### Exercise 2 - Create a frequency table

Calculate the number of students by program.

> **TIP:**
>
> Use `count()`.

> **NOTE:**
>
> ``` r
> survey |>
>   count(program, sort = TRUE)
> ```
>
>     # A tibble: 3 × 2
>       program        n
>       <chr>      <int>
>     1 Economics      2
>     2 Statistics     2
>     3 Biology        1

### Exercise 3 - Add proportions

Using the previous result, add a proportion and a percentage.

> **NOTE:**
>
> ``` r
> survey |>
>   count(program, sort = TRUE) |>
>   mutate(
>     proportion = n / sum(n),
>     percentage = 100 * proportion
>   )
> ```
>
>     # A tibble: 3 × 4
>       program        n proportion percentage
>       <chr>      <int>      <dbl>      <dbl>
>     1 Economics      2        0.4         40
>     2 Statistics     2        0.4         40
>     3 Biology        1        0.2         20

### Exercise 4 - Build a cross-tabulation

Build a cross-tabulation between `program` and `campus`.

> **NOTE:**
>
> ``` r
> survey |>
>   count(program, campus) |>
>   pivot_wider(
>     names_from = campus,
>     values_from = n,
>     values_fill = 0
>   )
> ```
>
>     # A tibble: 3 × 3
>       program    `Quebec City` Montreal
>       <chr>              <int>    <int>
>     1 Biology                1        0
>     2 Economics              1        1
>     3 Statistics             1        1

## Block B - Character strings and patterns

### Exercise 5 - Standardize responses

Here is a response variable entered with inconsistent formats.

``` r
responses <- tibble(
  response = c(" Yes", "yes", "YES ", "No", " no", "NO", "I do not know")
)
```

Create a variable `response_clean` in lowercase, without extra spaces.

> **NOTE:**
>
> ``` r
> responses |>
>   mutate(response_clean = str_squish(str_to_lower(response)))
> ```
>
>     # A tibble: 7 × 2
>       response        response_clean
>       <chr>           <chr>
>     1 " Yes"          yes
>     2 "yes"           yes
>     3 "YES "          yes
>     4 "No"            no
>     5 " no"           no
>     6 "NO"            no
>     7 "I do not know" i do not know

### Exercise 6 - Detect a keyword

In the following vector, detect texts that contain `"delay"`, regardless of case.

``` r
comments <- tibble(
  text = c(
    "Service delay",
    "Fast service",
    "major delay",
    "No issue",
    "REPEATED DELAY"
  )
)
```

> **NOTE:**
>
> ``` r
> comments |>
>   mutate(contains_delay = str_detect(str_to_lower(text), "delay"))
> ```
>
>     # A tibble: 5 × 2
>       text           contains_delay
>       <chr>          <lgl>
>     1 Service delay  TRUE
>     2 Fast service   FALSE
>     3 major delay    TRUE
>     4 No issue       FALSE
>     5 REPEATED DELAY TRUE

### Exercise 7 - Extract postal codes

From the following addresses, extract a simplified Canadian postal code.

``` r
addresses <- tibble(
  address = c(
    "2500 boul. Laurier, Quebec City G1V 2L1",
    "475 Sherbrooke Street West, Montreal H3A 2L9",
    "100 Wellington Street, Gatineau J8X 2J1",
    "Unknown address"
  )
)
```

> **NOTE:**
>
> ``` r
> addresses |>
>   mutate(
>     postal_code = str_extract(
>       address,
>       "[A-Z][0-9][A-Z]\\s*[0-9][A-Z][0-9]"
>     )
>   )
> ```
>
>     # A tibble: 4 × 2
>       address                                      postal_code
>       <chr>                                        <chr>
>     1 2500 boul. Laurier, Quebec City G1V 2L1      G1V 2L1
>     2 475 Sherbrooke Street West, Montreal H3A 2L9 H3A 2L9
>     3 100 Wellington Street, Gatineau J8X 2J1      J8X 2J1
>     4 Unknown address                              <NA>

### Exercise 8 - Convert a text amount

Convert the following amounts to numeric values.

``` r
fines <- tibble(
  amount = c("1 000 $", "500$", "2 250 $", "750 dollars")
)
```

> **NOTE:**
>
> ``` r
> fines |>
>   mutate(fine_num = parse_number(
>     amount,
>     locale = locale(grouping_mark = " ")
>   ))
> ```
>
>     # A tibble: 4 × 2
>       amount      fine_num
>       <chr>          <dbl>
>     1 1 000 $         1000
>     2 500$             500
>     3 2 250 $         2250
>     4 750 dollars      750

## Block C - Practise on fictitious campus service requests

Exercises 9 to 12 use a small fictitious dataset of campus service requests. This context is distinct from the adventure and challenge.

### Exercise 9 - Build a clean dataset

Here are the raw data.

``` r
campus_services_raw <- tibble(
  id = paste0("REQ-", str_pad(1:12, 2, pad = "0")),
  campus = c("Quebec City", "Quebec", "Montreal", "Montréal", "Levis", "Lévis",
             "Quebec City", "Montreal", "Levis", "Quebec", "Montréal", "Lévis"),
  service = c("Library", "library", "Wi-Fi", "wifi", "Parking", "parking",
              "Shuttle", "shuttle", "Printing", "printing", "Library", "Wi-Fi"),
  description = c(
    "Shuttle delay reported",
    "Noisy reading room",
    "wifi unstable in building",
    "WiFi connection unavailable",
    "Payment impossible",
    "parking lot full",
    "Evening shuttle delay",
    "Crowded shuttle",
    "Printer without paper",
    "Printing blocked",
    "books misplaced",
    "Slow connection"
  ),
  status = c("open", "Open ", "closed", "Closed", "open", "in progress",
             "In progress", "closed", "open", "Closed", "in progress", "open"),
  cost = c("0 $", "150 $", "0$", "300 $", "1 200 $", "0 $",
           "850 $", "0 $", "75 $", "90 $", "0 $", "200 $")
)

campus_services_raw
```

    # A tibble: 12 × 6
       id     campus      service  description                 status        cost
       <chr>  <chr>       <chr>    <chr>                       <chr>         <chr>
     1 REQ-01 Quebec City Library  Shuttle delay reported      "open"        0 $
     2 REQ-02 Quebec      library  Noisy reading room          "Open "       150 $
     3 REQ-03 Montreal    Wi-Fi    wifi unstable in building   "closed"      0$
     4 REQ-04 Montréal    wifi     WiFi connection unavailable "Closed"      300 $
     5 REQ-05 Levis       Parking  Payment impossible          "open"        1 200 $
     6 REQ-06 Lévis       parking  parking lot full            "in progress" 0 $
     7 REQ-07 Quebec City Shuttle  Evening shuttle delay       "In progress" 850 $
     8 REQ-08 Montreal    shuttle  Crowded shuttle             "closed"      0 $
     9 REQ-09 Levis       Printing Printer without paper       "open"        75 $
    10 REQ-10 Quebec      printing Printing blocked            "Closed"      90 $
    11 REQ-11 Montréal    Library  books misplaced             "in progress" 0 $
    12 REQ-12 Lévis       Wi-Fi    Slow connection             "open"        200 $

Create a table `campus_services` containing:

- a standardized campus;
- a standardized service;
- a standardized status;
- a numeric cost variable `cost_num`.

> **NOTE:**
>
> ``` r
> campus_services <- campus_services_raw |>
>   mutate(
>     campus = str_squish(campus),
>     campus = recode(
>       campus,
>       "Quebec" = "Quebec City",
>       "Montréal" = "Montreal",
>       "Lévis" = "Levis"
>     ),
>     service = str_to_lower(str_squish(service)),
>     service = case_when(
>       str_detect(service, "library") ~ "library",
>       str_detect(service, "wi-fi|wifi") ~ "wi-fi",
>       str_detect(service, "parking") ~ "parking",
>       str_detect(service, "shuttle") ~ "shuttle",
>       str_detect(service, "printing") ~ "printing",
>       TRUE ~ service
>     ),
>     status = str_to_lower(str_squish(status)),
>     cost_num = parse_number(cost, locale = locale(grouping_mark = " "))
>   )
>
> campus_services |>
>   select(id, campus, service, status, cost_num)
> ```
>
>     # A tibble: 12 × 5
>        id     campus      service  status      cost_num
>        <chr>  <chr>       <chr>    <chr>          <dbl>
>      1 REQ-01 Quebec City library  open               0
>      2 REQ-02 Quebec City library  open             150
>      3 REQ-03 Montreal    wi-fi    closed             0
>      4 REQ-04 Montreal    wi-fi    closed           300
>      5 REQ-05 Levis       parking  open            1200
>      6 REQ-06 Levis       parking  in progress        0
>      7 REQ-07 Quebec City shuttle  in progress      850
>      8 REQ-08 Montreal    shuttle  closed             0
>      9 REQ-09 Levis       printing open              75
>     10 REQ-10 Quebec City printing closed            90
>     11 REQ-11 Montreal    library  in progress        0
>     12 REQ-12 Levis       wi-fi    open             200

### Exercise 10 - Count requested services

Calculate the number of requests by campus and service.

> **NOTE:**
>
> ``` r
> campus_services |>
>   count(campus, service, sort = TRUE)
> ```
>
>     # A tibble: 9 × 3
>       campus      service      n
>       <chr>       <chr>    <int>
>     1 Levis       parking      2
>     2 Montreal    wi-fi        2
>     3 Quebec City library      2
>     4 Levis       printing     1
>     5 Levis       wi-fi        1
>     6 Montreal    library      1
>     7 Montreal    shuttle      1
>     8 Quebec City printing     1
>     9 Quebec City shuttle      1

### Exercise 11 - Compare statuses by campus

Calculate the proportion of requests in each status for each campus.

> **NOTE:**
>
> ``` r
> campus_services |>
>   count(campus, status) |>
>   group_by(campus) |>
>   mutate(proportion = n / sum(n)) |>
>   ungroup() |>
>   arrange(campus, desc(proportion))
> ```
>
>     # A tibble: 7 × 4
>       campus      status          n proportion
>       <chr>       <chr>       <int>      <dbl>
>     1 Levis       open            3       0.75
>     2 Levis       in progress     1       0.25
>     3 Montreal    closed          3       0.75
>     4 Montreal    in progress     1       0.25
>     5 Quebec City open            2       0.5
>     6 Quebec City closed          1       0.25
>     7 Quebec City in progress     1       0.25

### Exercise 12 - Detect keywords

Create two logical variables:

- `contains_delay`, equal to `TRUE` if the description contains `"delay"`;
- `contains_connection`, equal to `TRUE` if the description contains `"wifi"` or `"connection"`.

> **NOTE:**
>
> ``` r
> campus_services <- campus_services |>
>   mutate(
>     description_lower = str_to_lower(description),
>     contains_delay = str_detect(description_lower, "delay"),
>     contains_connection = str_detect(description_lower, "wifi|connection")
>   )
>
> campus_services |>
>   select(id, service, contains_delay, contains_connection)
> ```
>
>     # A tibble: 12 × 4
>        id     service  contains_delay contains_connection
>        <chr>  <chr>    <lgl>          <lgl>
>      1 REQ-01 library  TRUE           FALSE
>      2 REQ-02 library  FALSE          FALSE
>      3 REQ-03 wi-fi    FALSE          TRUE
>      4 REQ-04 wi-fi    FALSE          TRUE
>      5 REQ-05 parking  FALSE          FALSE
>      6 REQ-06 parking  FALSE          FALSE
>      7 REQ-07 shuttle  TRUE           FALSE
>      8 REQ-08 shuttle  FALSE          FALSE
>      9 REQ-09 printing FALSE          FALSE
>     10 REQ-10 printing FALSE          FALSE
>     11 REQ-11 library  FALSE          FALSE
>     12 REQ-12 wi-fi    FALSE          TRUE

## Block D - Visualize categories

### Exercise 13 - Order a bar chart

Produce a bar chart showing the number of requests by service. Order services from most frequent to least frequent.

> **NOTE:**
>
> ``` r
> campus_services |>
>   count(service, sort = TRUE) |>
>   ggplot(aes(x = fct_reorder(service, n), y = n)) +
>   geom_col(fill = "#2F6C8F") +
>   coord_flip() +
>   labs(
>     x = "Service",
>     y = "Number of requests",
>     title = "Fictitious service requests by category"
>   ) +
>   theme_minimal()
> ```
>
> ![](exercices_files/figure-html/unnamed-chunk-18-1.png)

### Exercise 14 - Compare proportions with `position = "fill"`

Compare status composition between campuses.

> **NOTE:**
>
> ``` r
> campus_services |>
>   count(campus, status) |>
>   group_by(campus) |>
>   mutate(proportion = n / sum(n)) |>
>   ungroup() |>
>   ggplot(aes(x = campus, y = proportion, fill = status)) +
>   geom_col(position = "fill") +
>   scale_y_continuous(labels = scales::percent) +
>   labs(
>     x = "Campus",
>     y = "Proportion",
>     fill = "Status",
>     title = "Status composition by campus"
>   ) +
>   theme_minimal()
> ```
>
> ![](exercices_files/figure-html/unnamed-chunk-19-1.png)

### Exercise 15 - Compare costs by service

Create a chart comparing reported costs by service.

> **NOTE:**
>
> ``` r
> campus_services |>
>   filter(cost_num > 0) |>
>   ggplot(aes(x = service, y = cost_num)) +
>   geom_boxplot(fill = "#D8A24A") +
>   coord_flip() +
>   scale_y_continuous(labels = scales::dollar) +
>   labs(
>     x = "Service",
>     y = "Reported cost",
>     title = "Costs associated with fictitious service requests"
>   ) +
>   theme_minimal()
> ```
>
> ![](exercices_files/figure-html/unnamed-chunk-20-1.png)

### Exercise 16 - Improve the message of a chart

Take one previous chart and improve it for a non-specialist reader:

- informative title;
- readable axes;
- ordered categories;
- units or percentages clearly shown;
- two-sentence comment under the chart.

> **NOTE:**
>
> ``` r
> service_chart <- campus_services |>
>   count(service, sort = TRUE) |>
>   mutate(share = n / sum(n)) |>
>   ggplot(aes(x = fct_reorder(service, share), y = share)) +
>   geom_col(fill = "#2F6C8F") +
>   coord_flip() +
>   scale_y_continuous(labels = scales::percent) +
>   labs(
>     x = NULL,
>     y = "Share of requests",
>     title = "Requests are distributed across a few recurring services"
>   ) +
>   theme_minimal()
>
> service_chart
> ```
>
> ![](exercices_files/figure-html/unnamed-chunk-21-1.png)
>
> Possible comment: the chart shows which services appear most often in this fictitious sample. However, the file is for method practice and does not measure a real volume of requests.

## Case studies

### Case study 1 - Montréal 311 requests

The file `data/requetes_311_montreal.csv` is a real extract of Montréal 311 requests. A request does not necessarily represent a municipal intervention.

Complete the following tasks:

1.  import the file;
2.  clean the variable `categorie`;
3.  calculate the number of requests by borough and category;
4.  calculate status proportions by request nature;
5.  produce a chart of the most frequent categories;
6.  write two sentences that could appear in a short report.

> **NOTE:**
>
> ``` r
> requests_311 <- read_csv(
>   "data/requetes_311_montreal.csv",
>   show_col_types = FALSE
> ) |>
>   mutate(categorie = str_squish(categorie))
>
> requests_311 |>
>   count(arrondissement, categorie, sort = TRUE)
> ```
>
>     # A tibble: 122 × 3
>        arrondissement categorie                                    n
>        <chr>          <chr>                                    <int>
>      1 Non assigné    Info-Remorquage                             75
>      2 Non assigné    Collecte des encombrants                    50
>      3 Non assigné    Taxes foncières                             46
>      4 Non assigné    Collecte de déchets                         45
>      5 Non assigné    Y-Eau - Divers                              30
>      6 Non assigné    Organisme divers                            27
>      7 Non assigné    Fermeture d'une conduite d'eau - Urgence    23
>      8 Non assigné    Fermeture d'entrée d'eau                    21
>      9 Non assigné    Manque d'eau                                20
>     10 Non assigné    Intervention stationnement                  19
>     # ℹ 112 more rows
>
> ``` r
> requests_311 |>
>   count(nature, statut) |>
>   group_by(nature) |>
>   mutate(proportion = n / sum(n)) |>
>   ungroup()
> ```
>
>     # A tibble: 1 × 4
>       nature      statut          n proportion
>       <chr>       <chr>       <int>      <dbl>
>     1 Information Sans statut   750          1
>
> ``` r
> requests_311 |>
>   count(categorie, sort = TRUE) |>
>   slice_head(n = 12) |>
>   ggplot(aes(x = fct_reorder(categorie, n), y = n)) +
>   geom_col(fill = "#4B8B3B") +
>   coord_flip() +
>   labs(
>     x = "Category",
>     y = "Number of requests",
>     title = "Frequent categories in the 311 extract"
>   ) +
>   theme_minimal()
> ```
>
> ![](exercices_files/figure-html/unnamed-chunk-22-1.png)
>
> Possible comment: the extract describes published requests, not the real workload or quality of municipal interventions.

### Case study 2 - Consumer complaints in Québec

The file `data/plaintes_consommation_quebec.csv` is a real extract of complaints received by Québec’s Office de la protection du consommateur. A complaint is an unverified allegation.

Complete the following tasks:

1.  import the file;
2.  calculate the total number of complaints by head-office city;
3.  identify the most frequent complaint reasons;
4.  compare product categories between cities with a proportional chart;
5.  propose an operational recommendation supported by a number.

> **NOTE:**
>
> ``` r
> transit_complaints <- read_csv(
>   "data/plaintes_consommation_quebec.csv",
>   show_col_types = FALSE
> )
>
> transit_complaints |>
>   count(ville_siege_social, sort = TRUE)
> ```
>
>     # A tibble: 158 × 2
>        ville_siege_social     n
>        <chr>              <int>
>      1 Montréal             110
>      2 <NA>                  76
>      3 Québec                44
>      4 Laval                 40
>      5 Toronto               24
>      6 Boucherville          23
>      7 Saint-Eustache        19
>      8 Vancouver             19
>      9 Longueuil             16
>     10 Gatineau              15
>     # ℹ 148 more rows
>
> ``` r
> transit_complaints |>
>   count(motif, sort = TRUE)
> ```
>
>     # A tibble: 7 × 2
>       motif                                                              n
>       <chr>                                                          <int>
>     1 Qualité des biens et services                                    238
>     2 Service à la clientèle / Absence de livraison / Non conformité   187
>     3 Pratique trompeuse ou déloyale                                   180
>     4 Mésentente liée au contrat conclu                                 66
>     5 Problème de facturation ou de recouvrement de créance             51
>     6 Mésentente avant l’achat liée au prix / au tarif                  22
>     7 Autre                                                              6
>
> ``` r
> transit_complaints |>
>   count(ville_siege_social, categorie_produit, name = "total") |>
>   group_by(ville_siege_social) |>
>   mutate(proportion = total / sum(total)) |>
>   ungroup() |>
>   ggplot(aes(x = ville_siege_social, y = proportion, fill = categorie_produit)) +
>   geom_col(position = "fill") +
>   scale_y_continuous(labels = scales::percent) +
>   labs(
>     x = "Head-office city",
>     y = "Proportion of complaints",
>     fill = "Category",
>     title = "Composition of consumer complaints"
>   ) +
>   theme_minimal()
> ```
>
> ![](exercices_files/figure-html/unnamed-chunk-23-1.png)
>
> Possible recommendation: describe the most frequent categories while explicitly noting that a complaint does not establish an offence.
