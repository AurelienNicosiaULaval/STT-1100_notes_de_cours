# Adventure 8 - Open Data from Quebec

STT-1100 Introduction to Data Science

## Scenario

You work as an independent data science consultant. Unlike a salaried position, consulting work is organized around specific client mandates. You must be autonomous, rigorous and able to deliver effective, reusable and well-documented solutions.

Today, you are hired by Marie-Pier, research director at the Quebec Institute for Sustainable Data. She wants to explore the [Données Québec](https://www.donneesquebec.ca) portal to identify recent and relevant datasets. Your mission is to design a reliable scraping tool that extracts dataset titles, producers and categories, while respecting good technical and ethical practices.

> **NOTE:**
>
> Your contact: Marie-Pier
>
> She accompanies you throughout this adventure. She asks key questions, checks your results and helps you clarify your deliverables.

Character card

Your role Independent data science consultant

Main contact Marie-Pier

Organization and context Quebec Institute for Sustainable Data

Mission Create a robust, testable and respectful scraping tool

Data Données Québec page or small local HTML test page

Deliverable `IDUL.R` with `scrape_page()`

### Adventure Objectives

- Understand the basics of web scraping with `rvest`.
- Create a function to extract metadata from a web page.
- Automate extraction over several pages.
- Explore trends in Quebec open data.
- Evaluate the ethical and technical limits of automated collection.

> **NOTE:**
>
> - You read the structure of a web page as a data source.
> - You turn a manual extraction into a reusable function.
> - You test your function on a local page to remain independent of portal changes.
> - You connect code to ethical limits: `robots.txt`, terms of use and server load.

## Before Scraping: Check the Context

> **IMPORTANT:**
>
> *What can we extract from this portal? Is scraping reasonable here?*

A first reflex is to consult the site’s `robots.txt` file. This file indicates the paths a site asks robots to avoid. It does not replace terms of use, ethical judgment or respect for server load, but it gives a useful signal before automating collection.

``` r
robots <- safe_read_lines(
  "https://www.donneesquebec.ca/robots.txt",
  fallback = c(
    "User-agent: *",
    "Disallow: /api/",
    "Disallow: /dataset/rate/"
  )
)

cat("Contents of robots.txt:\n")
```

    Contents of robots.txt:

``` r
writeLines(robots)
```

    User-agent: *
    Disallow: /api/
    Disallow: /dataset/rate/

``` r
disinstructions <- robots[grepl("^Disallow", robots)]

cat("\nPaths prohibited for robots:\n")
```


    Paths prohibited for robots:

``` r
writeLines(disinstructions)
```

    Disallow: /api/
    Disallow: /dataset/rate/

> **WARNING:**
>
> A `robots.txt` file that does not explicitly forbid a page does not mean that everything is automatically acceptable. In this module, we limit collection to a few public result pages, add a pause between requests and do not bypass protection mechanisms.

## Understanding Web Scraping with `rvest`

In this section, you discover the essential functions of the `rvest` package. The goal is to extract structured HTML content from a search page.

``` r
url <- "https://www.donneesquebec.ca/recherche/?sort=metadata_modified+desc&page=1"
page <- safe_read_html(url)
page
```

    {html_document}
    <html>
    [1] <body>\n<div class="dataset-content">\n<h3 class="dataset-heading short"> ...

In the rendered course page, `safe_read_html()` uses a stable local copy that reproduces the Données Québec result structure. In your own work, you can test the same function with the public URL if the site is available.

> **IMPORTANT:**
>
> *Can you show me what the structure of this page looks like? Can you spot an interesting element?*

We can now target HTML elements with `html_elements()`:

``` r
blocks <- html_elements(page, ".dataset-content")
length(blocks)
```

    [1] 20

``` r
blocks[[1]]
```

    {html_node}
    <div class="dataset-content">
    [1] <h3 class="dataset-heading short"><a>Avertissement routier</a></h3>\n
    [2] <div class="dqc_donne_spat"><img src="/recherche/images/2_icone_g.png" al ...
    [3] <div class="dqc-org-cat">Organisation : Ministère des Transports et de la ...
    [4] <div class="dqc-org-cat">Catégories : Infrastructures; Transport</div>\n
    [5] <div class="dqc-notes"> Localisation des avertissements tels que les ferm ...

To extract text from an HTML element:

``` r
html_text2(blocks[[1]])
```

    [1] "Avertissement routier\nOrganisation : Ministère des Transports et de la Mobilité durable\nCatégories : Infrastructures; Transport\nLocalisation des avertissements tels que les fermetures de route et de pont ou d'incident empêchant le libre passage sur un segment routier ou sur une structure."

Now, let us test extraction of the title:

``` r
html_elements(blocks[[1]], ".dataset-heading a") |>
  html_text2()
```

    [1] "Avertissement routier"

And for the producer? We need to locate a substructure containing the information:

``` r
info <- html_elements(blocks[[1]], ".dqc-org-cat") |>
  html_text2()

info
```

    [1] "Organisation : Ministère des Transports et de la Mobilité durable"
    [2] "Catégories : Infrastructures; Transport"

The Données Québec page used here returns French labels. A robust function should therefore handle labels such as `Organisation`, `Catégorie` and `Catégories`, even when you are reading the English version of the course.

``` r
producer <- extract_value(
  info,
  "^(Organisation|Organisme|Producteur|Producer|Organization)\\s*:?\\s*"
)

producer
```

    [1] "Ministère des Transports et de la Mobilité durable"

> **TIP:**
>
> Why use `map_chr()`?
>
> `map_chr()` belongs to the `purrr` package, which is part of the `tidyverse`. This function applies a function to each element of a list and returns a character vector. This is exactly what we need when we want one text value per HTML block.
>
> ``` r
> producteurs <- map_chr(blocks, function(block) {
>   info <- html_elements(block, ".dqc-org-cat") |>
>     html_text2()
>
>   extract_value(
>     info,
>     "^(Organisation|Organisme|Producteur|Producer|Organization)\\s*:?\\s*"
>   )
> })
> ```

> **TIP:**
>
> Your turn: from this same HTML block, find how to extract the categories associated with each dataset. The observed label may be `Catégorie`, `Catégories`, `Category` or `Categories`.

## Guided Creation of the `scrape_page()` Function

Marie-Pier wants you to create a reusable function named `scrape_page()`. It takes a URL as input and returns a `data.frame` with exactly the following columns:

- `titre`;
- `producteur`;
- `categorie`.

The column names remain in French because the automatic tests will check this exact contract.

> **NOTE:**
>
> The template repository contains a small local HTML page so the function can be tested even if the portal changes or the network is unavailable. Your function must therefore work with both a public page and this local source, without changing the output contract.

Here is a skeleton to complete:

``` r
scrape_page <- function(url) {
  page <- rvest::read_html(url)

  blocks <- rvest::html_elements(page, ".dataset-content")

  titres <- rvest::html_elements(blocks, ".dataset-heading a") |>
    rvest::html_text2()

  producteurs <- purrr::map_chr(blocks, function(block) {
    info <- rvest::html_elements(block, ".dqc-org-cat") |>
      rvest::html_text2()

    # Extract the organization or producer.
  })

  categories <- purrr::map_chr(blocks, function(block) {
    info <- rvest::html_elements(block, ".dqc-org-cat") |>
      rvest::html_text2()

    # Extract the category or categories.
  })

  data.frame(
    titre = titres,
    producteur = producteurs,
    categorie = categories,
    stringsAsFactors = FALSE
  )
}
```

> **NOTE:**
>
> Test your function with page 3. It should return 20 rows and exactly the columns `titre`, `producteur`, `categorie`.

## Manual Repetition, Then a `for` Loop

Now test the extraction of the first five pages by calling your function several times:

``` r
p1 <- scrape_page("https://www.donneesquebec.ca/recherche/?sort=metadata_modified+desc&page=1")
p2 <- scrape_page("https://www.donneesquebec.ca/recherche/?sort=metadata_modified+desc&page=2")
```

> **TIP:**
>
> Marie-Pier: *Have you noticed what changes in the URL each time? Can you generalize this behavior?*

Reminder from module 1: a loop automates repetitive behavior.

``` r
results <- data.frame()

for (i in 1:5) {
  url <- paste0(
    "https://www.donneesquebec.ca/recherche/?sort=metadata_modified+desc&page=",
    i
  )

  cat("Page", i, "in progress...\n")
  page_data <- scrape_page(url)

  results <- bind_rows(results, page_data)
  Sys.sleep(1)
}
```

## Exploration Guided by Marie-Pier

Use the `results` table to answer your client’s questions. She expects precise and careful results.

> **IMPORTANT:**
>
> 1.  What are the most common dataset categories?
> 2.  Which organizations publish the most?
> 3.  Do we observe a diversity of fields or a concentration around a few themes?

## Ethical Reflection

> **NOTE:**
>
> Briefly report:
>
> - what the `robots.txt` file indicates;
> - the limits of this check;
> - the behaviors you adopted to remain respectful, such as limiting the number of pages, adding a pause and not bypassing protection;
> - the situation for two other websites, for example `bonjourquebec.com` or `ulaval.ca`, using `robots.txt` or terms of use.

## Challenge to Submit

The challenge associated with this adventure is described on the page [Challenge 8 - Scraping Function](../module_08/defi.llms.md).

You must submit an `IDUL.R` file containing your `scrape_page()` function. The starter repository is the GitHub template `STT-1100/aventure-8`.

Completed work

At the end of the adventure, check that your work includes the following elements. This is not a separate portfolio.

- the output contract for `scrape_page()`;
- one successful test on a local HTML page;
- an ethics note about `robots.txt`, server load and terms of use;
- a short exploration of the results, if a public page is available.

## Conclusion of the Adventure

You have designed a functional and automatable scraping tool, used a `for` loop, extracted structured metadata and deepened your understanding of scraping ethics.
