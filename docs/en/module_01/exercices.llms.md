# Consolidation exercises

# Consolidation exercises

These exercises consolidate the first practical moves of the course: using RStudio, writing code in a script, creating a Quarto report, loading packages, inspecting data and producing a small reproducible analysis.

Work in a `.R` file, a `.qmd` file, or both. Answers are folded so you can try first and compare afterwards.

## Exercise 1 - Console or script?

In RStudio, run `3 + 4` in the console, then in a `.R` script.

Explain in one sentence why the script is preferable for work that must be submitted.

> **TIP:**
>
> The console is useful for quick testing. The script keeps a record of the code, which makes it possible to rerun and verify the work later.

## Exercise 2 - Create objects

Create the following objects:

- `city` containing `"Quebec"`;
- `temperatures` containing the values `4`, `7`, `NA`, `10`;
- `mean_temperature` containing the mean of `temperatures`, ignoring the missing value.

> **TIP:**
>
> ``` r
> city <- "Quebec"
> temperatures <- c(4, 7, NA, 10)
> mean_temperature <- mean(temperatures, na.rm = TRUE)
>
> mean_temperature
> ```

## Exercise 3 - Understand a missing value

What does the following code return? Explain why.

``` r
mean(c(4, 7, NA, 10))
```

> **TIP:**
>
> The result is `NA`, because R cannot compute the mean without knowing what to do with the missing value. You need `na.rm = TRUE` to ignore it.

## Exercise 4 - Write a condition

Create an object `temperature <- -8`, then write a condition that returns:

- `"freezing"` if the temperature is below 0;
- `"not freezing"` otherwise.

> **TIP:**
>
> ``` r
> temperature <- -8
>
> if (temperature < 0) {
>   "freezing"
> } else {
>   "not freezing"
> }
> ```

## Exercise 5 - Write a simple function

Create a function `temperature_range()` that receives two arguments, `minimum` and `maximum`, then returns the difference between them.

Test the function with `minimum = -3` and `maximum = 8`.

> **TIP:**
>
> ``` r
> temperature_range <- function(minimum, maximum) {
>   maximum - minimum
> }
>
> temperature_range(minimum = -3, maximum = 8)
> ```

## Exercise 6 - Find help

Use R’s built-in help to read the documentation for `mean()`.

Then answer in one sentence: what is the `na.rm` argument used for?

> **TIP:**
>
> ``` r
> ?mean
> ```
>
> The `na.rm` argument indicates whether missing values should be removed before the calculation.

## Exercise 7 - Rewrite code with style

Rewrite the following code using a more readable style.

``` r
x=mean(c(3,NA,5),na.rm=TRUE)
```

> **TIP:**
>
> ``` r
> x <- mean(c(3, NA, 5), na.rm = TRUE)
> ```

## Exercise 8 - Create a first Quarto report

Create a `report.qmd` file containing:

- a title;
- HTML output format;
- a short introductory sentence;
- a code block that computes the mean of `c(1, 2, 3, 4, 5)`.

> **TIP:**
>
> ``` markdown
> ---
> title: "First report"
> format: html
> ---
>
> This report presents a first reproducible calculation.
> ```
>
> In an R code block in the document:
>
> ``` r
> mean(c(1, 2, 3, 4, 5))
> ```

## Exercise 9 - Load the module packages

In a script or Quarto document, load the packages needed to access `MeteoQuebec` and manipulate tables with `dplyr`.

> **TIP:**
>
> ``` r
> library(UlavalSSD)
> library(dplyr)
> ```
>
> The package loading should be in the document or script, not only in the console.

## Exercise 10 - Inspect `MeteoQuebec`

After loading `UlavalSSD`, use three different functions to inspect `MeteoQuebec`.

Your goal is to understand variable names, first rows and possible missing values.

> **TIP:**
>
> ``` r
> library(UlavalSSD)
>
> names(MeteoQuebec)
> head(MeteoQuebec)
> summary(MeteoQuebec)
> ```

## Exercise 11 - Find missing values

Use `summary()` to identify at least one variable in `MeteoQuebec` that contains missing values.

Then write one sentence explaining why this matters before doing an analysis.

> **TIP:**
>
> ``` r
> library(UlavalSSD)
>
> summary(MeteoQuebec)
> ```
>
> One possible sentence:
>
> > Some variables contain missing values. I need to account for them before computing means or comparing years, otherwise the analysis may become incomplete or return `NA`.

## Exercise 12 - Extract columns

Extract the `mean_temp` column from `MeteoQuebec` in two ways:

1.  with the `$` operator;
2.  with brackets.

> **TIP:**
>
> ``` r
> library(UlavalSSD)
>
> temperature_1 <- MeteoQuebec$mean_temp
> temperature_2 <- MeteoQuebec[, "mean_temp"]
> ```

## Exercise 13 - Filter a date

Choose a symbolic date by defining:

``` r
chosen_month <- "06"
chosen_day <- "24"
```

Filter `MeteoQuebec` to keep only observations for this month and day.

> **TIP:**
>
> ``` r
> library(UlavalSSD)
> library(dplyr)
>
> chosen_month <- "06"
> chosen_day <- "24"
>
> weather_date <- MeteoQuebec |>
>   filter(month == chosen_month, day == chosen_day)
>
> weather_date
> ```

## Exercise 14 - Add a column

Create a column `temp_range` that computes the difference between maximum and minimum temperature.

> **TIP:**
>
> ``` r
> library(UlavalSSD)
> library(dplyr)
>
> weather_with_range <- MeteoQuebec |>
>   mutate(temp_range = max_temp - min_temp)
>
> head(weather_with_range)
> ```

# Case studies

The following two case studies use small fictitious files. They do not represent real data; they are only meant to practise the technical moves of the module in contexts other than weather.

## Case study 1 - Municipal libraries

File: `data/fictitious_municipal_libraries.csv`

You are helping a small municipal team prepare an overview of library attendance. The file contains fictitious monthly observations for a few cities.

Complete the following tasks:

1.  Import the file with `readr::read_csv()`.
2.  Display the column names and first rows.
3.  Identify variables that contain missing values.
4.  Compute the mean of `visits`, ignoring missing values.
5.  Keep only rows where `workshops` is greater than or equal to 10.
6.  Write two sentences summarizing what you observed.

> **TIP:**
>
> ``` r
> library(readr)
> library(dplyr)
>
> libraries <- read_csv("data/fictitious_municipal_libraries.csv")
>
> names(libraries)
> head(libraries)
> summary(libraries)
>
> mean(libraries$visits, na.rm = TRUE)
>
> libraries_workshops <- libraries |>
>   filter(workshops >= 10)
>
> libraries_workshops
> ```

## Case study 2 - Student coop

File: `data/fictitious_student_coop.csv`

You are preparing a mini-report for a fictitious student coop. The file contains aggregated sales by product.

Complete the following tasks:

1.  Import the file.
2.  Create a `revenue` column with the formula `unit_price * quantity * (1 - discount)`.
3.  Compute total revenue.
4.  Keep rows where `satisfaction` is less than or equal to 3.
5.  Identify a category that deserves attention.
6.  Create a short Quarto report with code and two interpretation sentences.

> **TIP:**
>
> ``` r
> library(readr)
> library(dplyr)
>
> coop <- read_csv("data/fictitious_student_coop.csv")
>
> coop_revenue <- coop |>
>   mutate(revenue = unit_price * quantity * (1 - discount))
>
> sum(coop_revenue$revenue, na.rm = TRUE)
>
> coop_to_watch <- coop_revenue |>
>   filter(satisfaction <= 3)
>
> coop_to_watch
> ```
