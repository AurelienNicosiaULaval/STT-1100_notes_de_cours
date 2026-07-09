# Module 8 - Exercises

STT-1100 Introduction to Data Science

## Consolidation Exercises

These exercises are independent from the adventure and the challenge. They consolidate the technical moves of module 8: reading an HTML page, targeting elements with CSS selectors, turning an extraction into a function, automating repeated extraction and documenting collection limits.

The HTML pages used here are fictitious and local. They do not depend on any external website.

``` r
library(tidyverse)
library(rvest)
library(purrr)
```

## Readings to Review

- [R for Data Science - Web scraping](https://r4ds.hadley.nz/webscraping.html)
- [R for Data Science - Functions](https://r4ds.hadley.nz/functions.html)
- [R for Data Science - Iteration](https://r4ds.hadley.nz/iteration.html)
- [Official rvest documentation](https://rvest.tidyverse.org/)
- [MDN - robots.txt](https://developer.mozilla.org/en-US/docs/Glossary/Robots.txt)
- [Google Search Central - Introduction to robots.txt](https://developers.google.com/search/docs/crawling-indexing/robots/intro)

After the readings, also complete the [formative mini-test](../module_08/mini_test.llms.md). It is not graded.

## Block A - Read a Local HTML Page

### Exercise 1 - Import an HTML Page

Read `fictitious_data_catalog.html` with `read_html()`. Locate dataset cards with the `.dataset-card` selector.

> **NOTE:**
>
> ``` r
> catalog_page <- read_html("data/fictitious_data_catalog.html")
>
> cards <- catalog_page |>
>   html_elements(".dataset-card")
>
> length(cards)
> ```
>
>     [1] 5
>
> ``` r
> cards[[1]]
> ```
>
>     {html_node}
>     <article class="dataset-card">
>     [1] <h2 class="dataset-title">Monthly bicycle counts</h2>
>     [2] <p class="dataset-producer">Fictitious City of Saint-Laurent</p>
>     [3] <p class="dataset-category">Transport</p>
>     [4] <p class="dataset-updated">2026-01-15</p>

### Exercise 2 - Extract a First Vector

Extract dataset titles with the `.dataset-title` selector.

> **NOTE:**
>
> ``` r
> titles <- cards |>
>   html_element(".dataset-title") |>
>   html_text2()
>
> titles
> ```
>
>     [1] "Monthly bicycle counts"          "Public tree inventory"
>     [3] "Anonymized construction permits" "Air quality by sector"
>     [5] "Library attendance"

### Exercise 3 - Build a Table

Extract producers, categories and update dates. Combine them into a tibble.

> **NOTE:**
>
> ``` r
> catalog <- tibble(
>   title = html_element(cards, ".dataset-title") |> html_text2(),
>   producer = html_element(cards, ".dataset-producer") |> html_text2(),
>   category = html_element(cards, ".dataset-category") |> html_text2(),
>   updated_at = html_element(cards, ".dataset-updated") |>
>     html_text2() |>
>     as.Date()
> )
>
> catalog
> ```
>
>     # A tibble: 5 × 4
>       title                           producer                   category updated_at
>       <chr>                           <chr>                      <chr>    <date>
>     1 Monthly bicycle counts          Fictitious City of Saint-… Transpo… 2026-01-15
>     2 Public tree inventory           Fictitious Parks Service   Environ… 2026-01-22
>     3 Anonymized construction permits Fictitious Urban Planning… Urban p… 2026-02-02
>     4 Air quality by sector           Fictitious Environment Ob… Environ… 2026-02-08
>     5 Library attendance              Fictitious Library Network Culture  2026-02-12

## Block B - Turn Extraction into a Function

### Exercise 4 - Create a Helper Function

Create an `extract_text()` function that receives an HTML node and a CSS selector, then returns the corresponding text. If the element is missing, the function must return `NA_character_`.

> **NOTE:**
>
> ``` r
> extract_text <- function(node, selector) {
>   element <- html_element(node, selector)
>   text <- html_text2(element)
>
>   if (length(text) == 0 || is.na(text) || !nzchar(text)) {
>     return(NA_character_)
>   }
>
>   text
> }
>
> extract_text(cards[[1]], ".dataset-title")
> ```
>
>     [1] "Monthly bicycle counts"
>
> ``` r
> extract_text(cards[[1]], ".missing-field")
> ```
>
>     [1] NA

### Exercise 5 - Create an Extraction Function

Write an `extract_catalog(file)` function that reads a local HTML page and returns a tibble with the columns `title`, `producer`, `category`, `updated_at`.

> **NOTE:**
>
> ``` r
> extract_catalog <- function(file) {
>   page <- read_html(file)
>   cards <- html_elements(page, ".dataset-card")
>
>   tibble(
>     title = map_chr(cards, extract_text, ".dataset-title"),
>     producer = map_chr(cards, extract_text, ".dataset-producer"),
>     category = map_chr(cards, extract_text, ".dataset-category"),
>     updated_at = map_chr(cards, extract_text, ".dataset-updated") |>
>       as.Date()
>   )
> }
>
> extract_catalog("data/fictitious_data_catalog.html")
> ```
>
>     # A tibble: 5 × 4
>       title                           producer                   category updated_at
>       <chr>                           <chr>                      <chr>    <date>
>     1 Monthly bicycle counts          Fictitious City of Saint-… Transpo… 2026-01-15
>     2 Public tree inventory           Fictitious Parks Service   Environ… 2026-01-22
>     3 Anonymized construction permits Fictitious Urban Planning… Urban p… 2026-02-02
>     4 Air quality by sector           Fictitious Environment Ob… Environ… 2026-02-08
>     5 Library attendance              Fictitious Library Network Culture  2026-02-12

### Exercise 6 - Test an Irregular Page

Use the same function on `fictitious_irregular_catalog.html`. Which values are missing?

> **NOTE:**
>
> ``` r
> irregular_catalog <- extract_catalog("data/fictitious_irregular_catalog.html")
>
> irregular_catalog
> ```
>
>     # A tibble: 4 × 4
>       title                    producer                         category  updated_at
>       <chr>                    <chr>                            <chr>     <date>
>     1 Public charging stations Fictitious Mobility Office       Transport 2026-03-01
>     2 Community grants         <NA>                             Administ… 2026-03-04
>     3 Accessible public spaces Fictitious Inclusion Service     <NA>      2026-03-08
>     4 Planned roadwork         Fictitious Infrastructure Office Transport 2026-03-12
>
> ``` r
> irregular_catalog |>
>   summarise(
>     missing_producers = sum(is.na(producer)),
>     missing_categories = sum(is.na(category))
>   )
> ```
>
>     # A tibble: 1 × 2
>       missing_producers missing_categories
>                   <int>              <int>
>     1                 1                  1
>
> The function does not stop when a field is missing. It returns `NA`, which makes the problem diagnosable in a table.

### Exercise 7 - Automate Across Several Pages

Use `purrr::imap_dfr()` to apply `extract_catalog()` to both catalog pages and add a `source` column.

> **NOTE:**
>
> ``` r
> catalog_files <- c(
>   regular = "data/fictitious_data_catalog.html",
>   irregular = "data/fictitious_irregular_catalog.html"
> )
>
> combined_catalogs <- imap_dfr(
>   catalog_files,
>   function(file, source) {
>     extract_catalog(file) |>
>       mutate(source = source, .before = 1)
>   }
> )
>
> combined_catalogs
> ```
>
>     # A tibble: 9 × 5
>       source    title                           producer         category updated_at
>       <chr>     <chr>                           <chr>            <chr>    <date>
>     1 regular   Monthly bicycle counts          Fictitious City… Transpo… 2026-01-15
>     2 regular   Public tree inventory           Fictitious Park… Environ… 2026-01-22
>     3 regular   Anonymized construction permits Fictitious Urba… Urban p… 2026-02-02
>     4 regular   Air quality by sector           Fictitious Envi… Environ… 2026-02-08
>     5 regular   Library attendance              Fictitious Libr… Culture  2026-02-12
>     6 irregular Public charging stations        Fictitious Mobi… Transpo… 2026-03-01
>     7 irregular Community grants                <NA>             Adminis… 2026-03-04
>     8 irregular Accessible public spaces        Fictitious Incl… <NA>     2026-03-08
>     9 irregular Planned roadwork                Fictitious Infr… Transpo… 2026-03-12

## Block C - Collection Sobriety and Ethics

### Exercise 8 - Interpret a `robots.txt`

Here is a fictitious `robots.txt` example.

``` r
robots_example <- c(
  "User-agent: *",
  "Disallow: /admin/",
  "Disallow: /api/private/",
  "Crawl-delay: 1"
)

writeLines(robots_example)
```

    User-agent: *
    Disallow: /admin/
    Disallow: /api/private/
    Crawl-delay: 1

Identify paths to avoid and explain why this file is not full permission to collect data.

> **NOTE:**
>
> ``` r
> disallowed_paths <- robots_example |>
>   str_subset("^Disallow:") |>
>   str_remove("^Disallow:\\s*")
>
> disallowed_paths
> ```
>
>     [1] "/admin/"       "/api/private/"
>
> `robots.txt` provides technical instructions to crawlers. It does not replace terms of use, ethical judgment, caution about server load or written permission when collection and redistribution are sensitive.

## Case Study 1 - Fictitious Municipal Catalog

A fictitious municipality asks you to produce a short summary of the datasets visible in its mini-catalog.

### Exercise 9 - Summarize Categories

Starting from the two combined catalog pages, compute the number of datasets by category.

> **NOTE:**
>
> ``` r
> category_summary <- combined_catalogs |>
>   mutate(category = replace_na(category, "Not indicated")) |>
>   count(category, sort = TRUE)
>
> category_summary
> ```
>
>     # A tibble: 6 × 2
>       category           n
>       <chr>          <int>
>     1 Transport          3
>     2 Environment        2
>     3 Administration     1
>     4 Culture            1
>     5 Not indicated      1
>     6 Urban planning     1

### Exercise 10 - Write a Collection Note

Write three sentences explaining what your code collects, how it limits risks and what should be checked before applying it to a real website.

> **NOTE:**
>
> The code reads only local HTML pages prepared for the exercise and extracts aggregated public fields. In a real context, it would be necessary to limit the number of pages, add pauses between requests and avoid mass collection or bypassing protections. It would also be necessary to check `robots.txt`, terms of use, data licenses and redistribution rules before publishing a derived table.

## Case Study 2 - Public Events Page

A fictitious association publishes a small event page. You want to extract titles, dates, locations and themes to produce a calendar.

### Exercise 11 - Extract Events

Create an `extract_events(file)` function that returns a tibble with the columns `title`, `date`, `location`, `theme`.

> **NOTE:**
>
> ``` r
> extract_events <- function(file) {
>   page <- read_html(file)
>   events <- html_elements(page, ".event-card")
>
>   tibble(
>     title = map_chr(events, extract_text, ".event-title"),
>     date = html_element(events, ".event-date") |>
>       html_attr("datetime") |>
>       as.Date(),
>     location = map_chr(events, extract_text, ".event-location"),
>     theme = map_chr(events, extract_text, ".event-theme")
>   )
> }
>
> events <- extract_events("data/fictitious_public_events.html")
>
> events
> ```
>
>     # A tibble: 4 × 4
>       title                         date       location              theme
>       <chr>                         <date>     <chr>                 <chr>
>     1 Open data workshop            2026-02-18 Central library       Digital
>     2 Mobility consultation         2026-02-24 Citizen house         Transport
>     3 Neighbourhood climate meeting 2026-03-03 East community centre Environment
>     4 Citizen mapping training      2026-03-10 Urban lab             Digital

### Exercise 12 - Check the Result

Produce a summary of the number of events by theme and write one simple check that could be used as a test.

> **NOTE:**
>
> ``` r
> events |>
>   count(theme, sort = TRUE)
> ```
>
>     # A tibble: 3 × 2
>       theme           n
>       <chr>       <int>
>     1 Digital         2
>     2 Environment     1
>     3 Transport       1
>
> ``` r
> stopifnot(
>   nrow(events) == 4,
>   identical(names(events), c("title", "date", "location", "theme")),
>   all(!is.na(events$title))
> )
> ```
>
> These tests are simple, but they already detect common errors: wrong row count, incorrectly named columns or titles that were not extracted.
