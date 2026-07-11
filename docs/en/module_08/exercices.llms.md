# Module 8 - Exercises

STT-1100 Introduction to Data Science

## Consolidation Exercises

These exercises are independent from the adventure and the challenge. They consolidate the technical moves of module 8: reading an HTML page, targeting elements with CSS selectors, turning an extraction into a function, automating repeated extraction and documenting collection limits.

The HTML pages used here are local snapshots of real Quebec data. Both catalogs come from the [official Données Québec API](https://www.donneesquebec.ca/page-api/); the events page comes from the Ministry of Tourism dataset [Événements - Système d’information touristique Québec](https://www.donneesquebec.ca/recherche/dataset/sit-quebec-evenements). The snapshots preserve the published values, while simplifying the HTML structure to keep the exercise stable and reproducible. The metadata and events are distributed under the CC BY 4.0 licence.

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

Read `catalogue_donnees_quebec.html` with `read_html()`. Locate the six dataset cards with the `.dataset-card` selector. They cover Quebec City, Gatineau, Sherbrooke, Trois-Rivières, Saguenay and Montreal.

> **NOTE:**
>
> ``` r
> catalog_page <- read_html("data/catalogue_donnees_quebec.html")
>
> cards <- catalog_page |>
>   html_elements(".dataset-card")
>
> length(cards)
> ```
>
>     [1] 6
>
> ``` r
> cards[[1]]
> ```
>
>     {html_node}
>     <article class="dataset-card" data-source-url="https://www.donneesquebec.ca/recherche/dataset/vque_31">
>     [1] <h2 class="dataset-title">Arbres non-répertoriés</h2>
>     [2] <p class="dataset-producer">Ville de Québec</p>
>     [3] <p class="dataset-category">Environnement, ressources naturelles et énerg ...
>     [4] <p class="dataset-updated">2026-07-10</p>

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
>     [1] "Arbres non-répertoriés"
>     [2] "Pistes cyclables"
>     [3] "Milieux humides RCI"
>     [4] "Avis de grands travaux"
>     [5] "Chantiers - 511"
>     [6] "RSQA - indice de la qualité de l'air temps réel (quotidien)"

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
>     # A tibble: 6 × 4
>       title                                             producer category updated_at
>       <chr>                                             <chr>    <chr>    <date>
>     1 Arbres non-répertoriés                            Ville d… Environ… 2026-07-10
>     2 Pistes cyclables                                  Ville d… Infrast… 2025-11-25
>     3 Milieux humides RCI                               Ville d… Environ… 2026-06-02
>     4 Avis de grands travaux                            Ville d… Infrast… 2026-07-11
>     5 Chantiers - 511                                   Ville d… Transpo… 2026-07-11
>     6 RSQA - indice de la qualité de l'air temps réel … Ville d… Environ… 2026-07-11

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
>     [1] "Arbres non-répertoriés"
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
> extract_catalog("data/catalogue_donnees_quebec.html")
> ```
>
>     # A tibble: 6 × 4
>       title                                             producer category updated_at
>       <chr>                                             <chr>    <chr>    <date>
>     1 Arbres non-répertoriés                            Ville d… Environ… 2026-07-10
>     2 Pistes cyclables                                  Ville d… Infrast… 2025-11-25
>     3 Milieux humides RCI                               Ville d… Environ… 2026-06-02
>     4 Avis de grands travaux                            Ville d… Infrast… 2026-07-11
>     5 Chantiers - 511                                   Ville d… Transpo… 2026-07-11
>     6 RSQA - indice de la qualité de l'air temps réel … Ville d… Environ… 2026-07-11

### Exercise 6 - Test an Irregular Page

Use the same function on `catalogue_donnees_quebec_irregulier.html`. Some official records have no category assigned in the portal. Which values are missing?

> **NOTE:**
>
> ``` r
> irregular_catalog <- extract_catalog("data/catalogue_donnees_quebec_irregulier.html")
>
> irregular_catalog
> ```
>
>     # A tibble: 4 × 4
>       title                                             producer category updated_at
>       <chr>                                             <chr>    <chr>    <date>
>     1 Débits de circulation                             Ville d… <NA>     2025-11-20
>     2 Sondage de satisfaction auprès des citoyens à l’… Ville d… <NA>     2026-04-07
>     3 Zones inondables                                  Ville d… Environ… 2026-06-01
>     4 Sentiers pédestres                                Ville d… Tourism… 2026-07-06
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
>     1                 0                  2
>
> The function does not stop when a field is missing. It returns `NA`, which makes the problem diagnosable in a table.

### Exercise 7 - Automate Across Several Pages

Use `purrr::imap_dfr()` to apply `extract_catalog()` to both catalog pages and add a `source` column.

> **NOTE:**
>
> ``` r
> catalog_files <- c(
>   regular = "data/catalogue_donnees_quebec.html",
>   irregular = "data/catalogue_donnees_quebec_irregulier.html"
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
>     # A tibble: 10 × 5
>        source    title                                  producer category updated_at
>        <chr>     <chr>                                  <chr>    <chr>    <date>
>      1 regular   Arbres non-répertoriés                 Ville d… Environ… 2026-07-10
>      2 regular   Pistes cyclables                       Ville d… Infrast… 2025-11-25
>      3 regular   Milieux humides RCI                    Ville d… Environ… 2026-06-02
>      4 regular   Avis de grands travaux                 Ville d… Infrast… 2026-07-11
>      5 regular   Chantiers - 511                        Ville d… Transpo… 2026-07-11
>      6 regular   RSQA - indice de la qualité de l'air … Ville d… Environ… 2026-07-11
>      7 irregular Débits de circulation                  Ville d… <NA>     2025-11-20
>      8 irregular Sondage de satisfaction auprès des ci… Ville d… <NA>     2026-04-07
>      9 irregular Zones inondables                       Ville d… Environ… 2026-06-01
>     10 irregular Sentiers pédestres                     Ville d… Tourism… 2026-07-06

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

## Case Study 1 - Quebec Municipal Catalog

You must produce a short summary of metadata published by several Quebec municipalities in Données Québec.

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
>     # A tibble: 7 × 2
>       category                                                                     n
>       <chr>                                                                    <int>
>     1 Environnement, ressources naturelles et énergie                              3
>     2 Not indicated                                                                2
>     3 Environnement, ressources naturelles et énergie; Loi, justice et sécuri…     1
>     4 Infrastructures                                                              1
>     5 Infrastructures; Transport                                                   1
>     6 Tourisme, sports et loisirs                                                  1
>     7 Transport                                                                    1

### Exercise 10 - Write a Collection Note

Write three sentences explaining what your code collects, how it limits risks and what should be checked before applying it to a real website.

> **NOTE:**
>
> The code reads only local HTML pages prepared for the exercise and extracts aggregated public fields. In a real context, it would be necessary to limit the number of pages, add pauses between requests and avoid mass collection or bypassing protections. It would also be necessary to check `robots.txt`, terms of use, data licenses and redistribution rules before publishing a derived table.

## Case Study 2 - Public Events Page

The Ministry of Tourism publishes SIT Québec events. The snapshot retains six announced events in Gatineau, Montreal, Quebec City, Saguenay, Sherbrooke and Trois-Rivières. You want to extract titles, dates, locations and types to produce a calendar.

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
> events <- extract_events("data/evenements_sit_quebec.html")
>
> events
> ```
>
>     # A tibble: 6 × 4
>       title                                                date       location theme
>       <chr>                                                <date>     <chr>    <chr>
>     1 Festival Parasol                                     2026-07-15 Gatineau Fest…
>     2 Rendez-vous familial des pompiers et pompières de M… 2026-07-11 Montréal Fête…
>     3 L'Horizon de Khéops à Québec                         2026-07-15 Québec   Expé…
>     4 Festival International des Rythmes du Monde          2026-07-16 Saguenay Fest…
>     5 La Fête du Lac des Nations Promutuel Assurance       2026-07-14 Sherbro… Fest…
>     6 Rendez-vous des coureurs des bois de Trois-Rivières  2026-07-17 Trois-R… Fest…

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
>       theme                                 n
>       <chr>                             <int>
>     1 Festival                              4
>     2 Expérience multimédia / immersive     1
>     3 Fête populaire                        1
>
> ``` r
> stopifnot(
>   nrow(events) == 6,
>   identical(names(events), c("title", "date", "location", "theme")),
>   all(!is.na(events$title))
> )
> ```
>
> These tests are simple, but they already detect common errors: wrong row count, incorrectly named columns or titles that were not extracted.
