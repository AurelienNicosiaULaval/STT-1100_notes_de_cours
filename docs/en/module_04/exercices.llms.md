# Consolidation exercises

These exercises are independent from the adventure and challenge. They consolidate the technical moves of module 4: importing files, checking types, cleaning values, manipulating factors, reading JSON and documenting cleaning decisions.

``` r
library(readr)
library(dplyr)
library(tidyr)
library(stringr)
library(forcats)
library(tibble)
library(readxl)
library(jsonlite)
library(janitor)
```

## Block A - Import and inspect

### Exercise 1 - Read a CSV with controlled types

Import `policies.csv`, forcing `policy_id` to text and `premium_amount` to numeric.

> **NOTE:**
>
> ``` r
> policies <- read_csv(
>   "policies.csv",
>   col_types = cols(
>     policy_id = col_character(),
>     premium_amount = col_double(),
>     .default = col_guess()
>   )
> )
>
> glimpse(policies)
> ```
>
>     Rows: 15
>     Columns: 9
>     $ policy_id      <chr> "P001", "P002", "P003", "P004", "P005", "P006", "P007",…
>     $ premium_amount <dbl> 750.50, 820.00, 640.25, 910.80, 500.75, 1020.00, 780.20…
>     $ vehicle_type   <chr> "car", "truck", "truck", "car", "car", "truck", "car", …
>     $ vehicle_use    <chr> "Pleasure", "pleasure", "Commute", "Com.mute", "Pleasur…
>     $ q1_claims      <dbl> 2, 0, 1, 3, 0, 2, 1, 0, 3, 1, 0, 1, 2, 0, 1
>     $ q2_claims      <dbl> 1, 1, 0, 2, 0, 1, 1, 0, 2, 1, 1, 0, 1, 0, 2
>     $ q3_claims      <dbl> 0, 2, 1, 1, 0, 0, 2, 1, 0, 1, 0, 1, 2, 1, 0
>     $ q4_claims      <dbl> 1, 0, 0, 2, 1, 1, 0, 1, 2, 0, 1, 0, 1, 1, 2
>     $ claim_amount   <dbl> 1200, 0, 300, 2500, 0, 1800, 450, 0, 2200, 700, 0, 900,…

### Exercise 2 - Check dimensions and names

Check the number of rows, number of columns and variable names in `policies`.

> **NOTE:**
>
> ``` r
> tibble(
>   rows = nrow(policies),
>   columns = ncol(policies)
> )
> ```
>
>     # A tibble: 1 × 2
>        rows columns
>       <int>   <int>
>     1    15       9
>
> ``` r
> names(policies)
> ```
>
>     [1] "policy_id"      "premium_amount" "vehicle_type"   "vehicle_use"
>     [5] "q1_claims"      "q2_claims"      "q3_claims"      "q4_claims"
>     [9] "claim_amount"

### Exercise 3 - Clean column names

Create a small table with inconvenient column names, then clean them with `clean_names()`.

> **NOTE:**
>
> ``` r
> raw_table <- tibble(
>   "Program Name" = c("Statistics", "Computer Science"),
>   "Requested Amount ($)" = c(2500, 1800)
> )
>
> clean_table <- raw_table |>
>   clean_names()
>
> names(clean_table)
> ```
>
>     [1] "program_name"     "requested_amount"

### Exercise 4 - Move from wide to long format

In `policies`, columns `q1_claims` to `q4_claims` represent quarterly claims. Transform them into two columns: `quarter` and `claims`.

> **NOTE:**
>
> ``` r
> policies_long <- policies |>
>   pivot_longer(
>     cols = q1_claims:q4_claims,
>     names_to = "quarter",
>     values_to = "claims"
>   )
>
> policies_long |>
>   select(policy_id, quarter, claims) |>
>   slice_head(n = 8)
> ```
>
>     # A tibble: 8 × 3
>       policy_id quarter   claims
>       <chr>     <chr>      <dbl>
>     1 P001      q1_claims      2
>     2 P001      q2_claims      1
>     3 P001      q3_claims      0
>     4 P001      q4_claims      1
>     5 P002      q1_claims      0
>     6 P002      q2_claims      1
>     7 P002      q3_claims      2
>     8 P002      q4_claims      0

## Block B - Clean values and categories

### Exercise 5 - Return to wide format

Starting from `policies_long`, return to wide format.

> **NOTE:**
>
> ``` r
> policies_wide <- policies_long |>
>   pivot_wider(
>     names_from = quarter,
>     values_from = claims
>   )
>
> glimpse(policies_wide)
> ```
>
>     Rows: 15
>     Columns: 9
>     $ policy_id      <chr> "P001", "P002", "P003", "P004", "P005", "P006", "P007",…
>     $ premium_amount <dbl> 750.50, 820.00, 640.25, 910.80, 500.75, 1020.00, 780.20…
>     $ vehicle_type   <chr> "car", "truck", "truck", "car", "car", "truck", "car", …
>     $ vehicle_use    <chr> "Pleasure", "pleasure", "Commute", "Com.mute", "Pleasur…
>     $ claim_amount   <dbl> 1200, 0, 300, 2500, 0, 1800, 450, 0, 2200, 700, 0, 900,…
>     $ q1_claims      <dbl> 2, 0, 1, 3, 0, 2, 1, 0, 3, 1, 0, 1, 2, 0, 1
>     $ q2_claims      <dbl> 1, 1, 0, 2, 0, 1, 1, 0, 2, 1, 1, 0, 1, 0, 2
>     $ q3_claims      <dbl> 0, 2, 1, 1, 0, 0, 2, 1, 0, 1, 0, 1, 2, 1, 0
>     $ q4_claims      <dbl> 1, 0, 0, 2, 1, 1, 0, 1, 2, 0, 1, 0, 1, 1, 2

### Exercise 6 - Recode similar categories

The `vehicle_use` variable contains variants such as `"Pleasure"`, `"pleasure"` and `"Com.mute"`. Clean it to keep only `"Pleasure"` and `"Commute"`.

> **NOTE:**
>
> ``` r
> policies_use_clean <- policies |>
>   mutate(
>     vehicle_use = str_squish(vehicle_use),
>     vehicle_use = fct_collapse(
>       as_factor(vehicle_use),
>       Pleasure = c("Pleasure", "pleasure"),
>       Commute = c("Commute", "Com.mute")
>     )
>   )
>
> policies_use_clean |>
>   count(vehicle_use)
> ```
>
>     # A tibble: 2 × 2
>       vehicle_use     n
>       <fct>       <int>
>     1 Pleasure        7
>     2 Commute         8

### Exercise 7 - Parse an amount

Transform the following text amounts into numbers.

``` r
amounts <- tibble(
  amount = c("1 234.56", "950.00", "-999", "2 500.25")
)
```

> **NOTE:**
>
> ``` r
> amounts |>
>   mutate(
>     amount_num = parse_number(
>       amount,
>       locale = locale(decimal_mark = ".", grouping_mark = " ")
>     ),
>     amount_num = na_if(amount_num, -999)
>   )
> ```
>
>     # A tibble: 4 × 2
>       amount   amount_num
>       <chr>         <dbl>
>     1 1 234.56      1235.
>     2 950.00         950
>     3 -999            NA
>     4 2 500.25      2500.

### Exercise 8 - Detect invalid FSA codes

An FSA code should contain three characters. In the following table, identify invalid rows.

``` r
fsa_codes <- tibble(
  id = c("A", "B", "C", "D"),
  fsa_code = c("G1V", "H2X", "G1V1234", NA)
)
```

> **NOTE:**
>
> ``` r
> fsa_codes |>
>   mutate(fsa_invalid = is.na(fsa_code) | nchar(fsa_code) != 3) |>
>   filter(fsa_invalid)
> ```
>
>     # A tibble: 2 × 3
>       id    fsa_code fsa_invalid
>       <chr> <chr>    <lgl>
>     1 C     G1V1234  TRUE
>     2 D     <NA>     TRUE

## Block C - Document cleaning

### Exercise 9 - Create a log structure

Create a list `cleaning_log` with categories `VM`, `VA`, `FT`, `RC` and `TY`.

> **NOTE:**
>
> ``` r
> cleaning_log <- list(
>   VM = list(),
>   VA = list(),
>   FT = list(),
>   RC = list(),
>   TY = list()
> )
>
> str(cleaning_log)
> ```
>
>     List of 5
>      $ VM: list()
>      $ VA: list()
>      $ FT: list()
>      $ RC: list()
>      $ TY: list()

### Exercise 10 - Add a correction entry

Add an entry indicating that `-999` was replaced by `NA` in an amount variable.

> **NOTE:**
>
> ``` r
> cleaning_log$VM <- append(cleaning_log$VM, list(
>   list(
>     id = "exercise-7",
>     variables = "amount",
>     probleme = "Missing value coded as -999",
>     action = "Replace with NA",
>     justification = "The value -999 is not a real amount"
>   )
> ))
>
> cleaning_log$VM
> ```
>
>     [[1]]
>     [[1]]$id
>     [1] "exercise-7"
>
>     [[1]]$variables
>     [1] "amount"
>
>     [[1]]$probleme
>     [1] "Missing value coded as -999"
>
>     [[1]]$action
>     [1] "Replace with NA"
>
>     [[1]]$justification
>     [1] "The value -999 is not a real amount"

### Exercise 11 - Flag without correcting

Add an entry indicating that an invalid FSA code was flagged, but not corrected automatically.

> **NOTE:**
>
> ``` r
> cleaning_log$FT <- append(cleaning_log$FT, list(
>   list(
>     id = "C",
>     variables = "fsa_code",
>     probleme = "Invalid FSA code length",
>     action = "Flag without automatic correction",
>     justification = "The correct code cannot be inferred defensibly"
>   )
> ))
>
> cleaning_log$FT
> ```
>
>     [[1]]
>     [[1]]$id
>     [1] "C"
>
>     [[1]]$variables
>     [1] "fsa_code"
>
>     [[1]]$probleme
>     [1] "Invalid FSA code length"
>
>     [[1]]$action
>     [1] "Flag without automatic correction"
>
>     [[1]]$justification
>     [1] "The correct code cannot be inferred defensibly"

### Exercise 12 - Save a log to a temporary file

Save `cleaning_log` to a temporary file, then check that the file exists.

> **NOTE:**
>
> ``` r
> temp_path <- tempfile(fileext = ".Rdata")
> save(cleaning_log, file = temp_path)
> file.exists(temp_path)
> ```
>
>     [1] TRUE

## Block D - Excel, JSON and validation rules

### Exercise 13 - Read a specific Excel sheet

The file `resources/quotes_2024.xlsx` contains a sheet named `Q3`. Import it while skipping the first row.

> **NOTE:**
>
> ``` r
> quotes_q3 <- read_excel(
>   "resources/quotes_2024.xlsx",
>   sheet = "Q3",
>   skip = 1
> )
>
> glimpse(quotes_q3)
> ```
>
>     Rows: 4
>     Columns: 3
>     $ policy_id    <chr> "P005", "P008", "P012", "P015"
>     $ quote_date   <chr> "2024-04-15", "2024-05-03", "2024-06-20", "2024-07-01"
>     $ quote_amount <dbl> 525.40, 610.00, 845.75, 720.30

### Exercise 14 - Read a simple JSON file

Read `coverage.json`, then retrieve the collision coverage limit.

> **NOTE:**
>
> ``` r
> coverage <- read_json("coverage.json")
>
> coverage$coverage$collision$limit
> ```
>
>     [1] 10000

### Exercise 15 - Rectangle a JSON object

Transform the `coverage` section of the JSON file into a table.

> **NOTE:**
>
> ``` r
> coverage_tbl <- tibble(
>   coverage_type = names(coverage$coverage),
>   details = coverage$coverage
> ) |>
>   unnest_wider(details)
>
> coverage_tbl
> ```
>
>     # A tibble: 2 × 3
>       coverage_type  limit deductible
>       <chr>          <int>      <int>
>     1 collision      10000        500
>     2 liability     100000         NA

### Exercise 16 - Use a validation rule

The file `data/fictitious_equipment_rules.json` gives plausible installation years. Read this file and display the accepted bounds.

> **NOTE:**
>
> ``` r
> rules <- fromJSON("data/fictitious_equipment_rules.json")
>
> tibble(
>   year_min = rules$installation_year$min,
>   year_max = rules$installation_year$max
> )
> ```
>
>     # A tibble: 1 × 2
>       year_min year_max
>          <int>    <int>
>     1     1990     2026

## Case studies

### Case study 1 - Fictitious scholarship applications

The file `data/fictitious_scholarship_applications.csv` contains fictitious student scholarship applications. It does not represent a real system.

Complete the following tasks:

1.  import the file;
2.  clean column names;
3.  transform `requested_amount` into a number;
4.  replace `annual_income = -999` with `NA`;
5.  standardize program names;
6.  identify invalid FSA codes;
7.  create at least two cleaning-log entries.

> **NOTE:**
>
> ``` r
> scholarships <- read_csv(
>   "data/fictitious_scholarship_applications.csv",
>   show_col_types = FALSE
> ) |>
>   clean_names() |>
>   mutate(
>     requested_amount_num = parse_number(
>       requested_amount,
>       locale = locale(decimal_mark = ".", grouping_mark = " ")
>     ),
>     annual_income = na_if(annual_income, -999),
>     program_clean = str_to_lower(str_squish(program)),
>     program_clean = case_when(
>       str_detect(program_clean, "data|sci") ~ "data science",
>       str_detect(program_clean, "math") ~ "mathematics",
>       TRUE ~ program_clean
>     ),
>     status_clean = str_to_lower(str_squish(status)),
>     fsa_invalid = is.na(fsa_code) | nchar(fsa_code) != 3
>   )
>
> scholarships |>
>   count(program_clean, status_clean)
> ```
>
>     # A tibble: 8 × 3
>       program_clean status_clean     n
>       <chr>         <chr>        <int>
>     1 data science  complete         5
>     2 data science  incomplete       2
>     3 data science  pending          1
>     4 mathematics   complete         3
>     5 mathematics   incomplete       1
>     6 statistics    complete         2
>     7 statistics    pending          1
>     8 statistics    rejected         1
>
> ``` r
> scholarships |>
>   filter(fsa_invalid) |>
>   select(application_id, fsa_code)
> ```
>
>     # A tibble: 1 × 2
>       application_id fsa_code
>       <chr>          <chr>
>     1 B-010          G1V1234
>
> ``` r
> scholarship_log <- list(VM = list(), FT = list(), RC = list(), VA = list())
>
> scholarship_log$VM <- append(scholarship_log$VM, list(
>   list(
>     id = "B-004",
>     variables = "annual_income",
>     probleme = "Missing value coded as -999",
>     action = "Replace with NA",
>     justification = "The value -999 is not a real annual income"
>   )
> ))
>
> scholarship_log$FT <- append(scholarship_log$FT, list(
>   list(
>     id = "B-010",
>     variables = "fsa_code",
>     probleme = "Invalid FSA code length",
>     action = "Flag without automatic correction",
>     justification = "The correct code cannot be inferred from the file"
>   )
> ))
>
> scholarship_log
> ```
>
>     $VM
>     $VM[[1]]
>     $VM[[1]]$id
>     [1] "B-004"
>
>     $VM[[1]]$variables
>     [1] "annual_income"
>
>     $VM[[1]]$probleme
>     [1] "Missing value coded as -999"
>
>     $VM[[1]]$action
>     [1] "Replace with NA"
>
>     $VM[[1]]$justification
>     [1] "The value -999 is not a real annual income"
>
>
>
>     $FT
>     $FT[[1]]
>     $FT[[1]]$id
>     [1] "B-010"
>
>     $FT[[1]]$variables
>     [1] "fsa_code"
>
>     $FT[[1]]$probleme
>     [1] "Invalid FSA code length"
>
>     $FT[[1]]$action
>     [1] "Flag without automatic correction"
>
>     $FT[[1]]$justification
>     [1] "The correct code cannot be inferred from the file"
>
>
>
>     $RC
>     list()
>
>     $VA
>     list()

### Case study 2 - Fictitious municipal equipment records

The file `data/fictitious_municipal_equipment.csv` contains fictitious municipal equipment records. The file `data/fictitious_equipment_rules.json` contains validation rules.

Complete the following tasks:

1.  import the CSV and JSON files;
2.  clean `equipment_type` and `status`;
3.  transform `maintenance_cost` into a number;
4.  use the JSON rules to identify impossible years;
5.  identify unexpected statuses, if any;
6.  create a summary table by city;
7.  document at least two decisions.

> **NOTE:**
>
> ``` r
> rules <- fromJSON("data/fictitious_equipment_rules.json")
>
> equipment <- read_csv(
>   "data/fictitious_municipal_equipment.csv",
>   show_col_types = FALSE
> ) |>
>   clean_names() |>
>   mutate(
>     equipment_type = str_to_lower(str_squish(equipment_type)),
>     equipment_type = case_when(
>       str_detect(equipment_type, "bus") ~ "bus shelter",
>       str_detect(equipment_type, "play") ~ "play module",
>       TRUE ~ equipment_type
>     ),
>     status = str_to_lower(str_squish(status)),
>     maintenance_cost_num = parse_number(
>       maintenance_cost,
>       locale = locale(decimal_mark = ".", grouping_mark = " ")
>     ),
>     maintenance_cost_num = na_if(
>       maintenance_cost_num,
>       rules$maintenance_cost$coded_missing_value
>     ),
>     year_invalid = installation_year < rules$installation_year$min |
>       installation_year > rules$installation_year$max,
>     status_invalid = !status %in% rules$accepted_statuses,
>     month_invalid = !inspection_month %in% rules$expected_inspection_months
>   )
>
> equipment |>
>   filter(year_invalid | status_invalid | month_invalid) |>
>   select(equipment_id, installation_year, status, inspection_month)
> ```
>
>     # A tibble: 2 × 4
>       equipment_id installation_year status inspection_month
>       <chr>                    <dbl> <chr>  <chr>
>     1 EQ-004                    1890 active April
>     2 EQ-006                    2028 active June
>
> ``` r
> city_summary <- equipment |>
>   group_by(city) |>
>   summarise(
>     n_equipment = n(),
>     median_cost = median(maintenance_cost_num, na.rm = TRUE),
>     n_invalid_years = sum(year_invalid),
>     .groups = "drop"
>   )
>
> city_summary
> ```
>
>     # A tibble: 5 × 4
>       city           n_equipment median_cost n_invalid_years
>       <chr>                <int>       <dbl>           <int>
>     1 Gatineau                 3       1280                0
>     2 Levis                    3       1100                0
>     3 Quebec City              5       1250                1
>     4 Sherbrooke               3       1500                1
>     5 Trois-Rivieres           2        598.               0
>
> ``` r
> equipment_log <- list(VM = list(), VA = list(), RC = list())
>
> equipment_log$VA <- append(equipment_log$VA, list(
>   list(
>     id = equipment$equipment_id[equipment$year_invalid],
>     variables = "installation_year",
>     probleme = "Installation year outside JSON bounds",
>     action = "Flag without automatic correction",
>     justification = "The correct year cannot be inferred from the file"
>   )
> ))
>
> equipment_log$VM <- append(equipment_log$VM, list(
>   list(
>     id = "EQ-010",
>     variables = "maintenance_cost",
>     probleme = "Missing value coded as -999",
>     action = "Replace with NA",
>     justification = "The JSON rules state that -999 codes a missing value"
>   )
> ))
>
> equipment_log
> ```
>
>     $VM
>     $VM[[1]]
>     $VM[[1]]$id
>     [1] "EQ-010"
>
>     $VM[[1]]$variables
>     [1] "maintenance_cost"
>
>     $VM[[1]]$probleme
>     [1] "Missing value coded as -999"
>
>     $VM[[1]]$action
>     [1] "Replace with NA"
>
>     $VM[[1]]$justification
>     [1] "The JSON rules state that -999 codes a missing value"
>
>
>
>     $VA
>     $VA[[1]]
>     $VA[[1]]$id
>     [1] "EQ-004" "EQ-006"
>
>     $VA[[1]]$variables
>     [1] "installation_year"
>
>     $VA[[1]]$probleme
>     [1] "Installation year outside JSON bounds"
>
>     $VA[[1]]$action
>     [1] "Flag without automatic correction"
>
>     $VA[[1]]$justification
>     [1] "The correct year cannot be inferred from the file"
>
>
>
>     $RC
>     list()
