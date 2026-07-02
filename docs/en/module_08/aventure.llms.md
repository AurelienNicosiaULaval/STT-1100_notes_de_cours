# Adventure 8 - Open data from Quebec

STT-1100 Introduction to Data Science

# Scenario: Immerse yourself in the shoes of a freelance consultant

You work as a **freelancer** in data science. Unlike a salaried position, you are mandated from time to time by clients to resolve specific problems. You must be autonomous, rigorous and capable of delivering effective, reusable and well-documented solutions.

Freelance consultants are often called upon for their ability to unblock projects quickly and efficiently. They deliver tools that are well documented, testable, and easy to maintain by their customers. Clarity of the code, respect for standards and ethics are therefore key elements of their practice.

Today, you are hired by **Marie-Pier**, research director at the Quebec Institute for Sustainable Data. She wishes to explore the [dataquebec.ca](https://www.donneesquebec.ca) portal to identify the most recent and relevant datasets for her projects. Your mission: **design a reliable scraping tool** to extract titles, producers and categories from datasets, while respecting good ethical practices.

> **NOTE:**
>
> **Your contact: Marie-Pier**
> She accompanies you throughout this adventure: she will ask key questions, check your results, and help you refine your deliverables.

## Adventure Objectives

- Understand the basics of web scraping with `rvest`.
- Create a function to extract metadata from a web page.
- Automate extraction on multiple pages.
- Explore trends in Quebec open data.
- Evaluate the ethical and technical feasibility of scraping other websites.

------------------------------------------------------------------------

# Prerequisites

> **IMPORTANT:**
>
> *“What can we legally extract from this portal? Is scraping allowed here? »*

To answer this question, we will first consult the site’s `robots.txt` file. This file indicates the rules that indexing (and therefore scraping) robots must follow.

``` r
# Show robots.txt
robots <- safe_read_lines(
  "https://www.donneesquebec.ca/robots.txt",
  fallback = c(
    "User-agent: *",
    "Disallow: /api/",
    "Disallow: /dataset/rate/"
  )
)
cat("\nContents of robots.txt file:\n")
```


    Contents of robots.txt file:

``` r
writeLines(robots)
```

    User-agent: *
    Disallow: /wp-admin/
    Allow: /wp-admin/admin-ajax.php
    Disallow: /recherche/dataset/*?
    Disallow: /recherche/organization/*?
    Disallow: /recherche/group/*?
    Disallow: /recherche/dataset/rate/
    Disallow: /recherche/revision/
    Disallow: /recherche/dataset/*/history
    Disallow: /recherche/api/
    Disallow: /api/
    Crawl-Delay: 10

``` r
# Quick analysis
disinstructions <- robots[grepl("^Disallow", robots)]
cat("Paths prohibited for robots:\n")
```

    Paths prohibited for robots:

``` r
writeLines(disinstructions)
```

    Disallow: /wp-admin/
    Disallow: /recherche/dataset/*?
    Disallow: /recherche/organization/*?
    Disallow: /recherche/group/*?
    Disallow: /recherche/dataset/rate/
    Disallow: /recherche/revision/
    Disallow: /recherche/dataset/*/history
    Disallow: /recherche/api/
    Disallow: /api/

``` r
# Ethics note
cat("\n\nNote:\nPublic datasets listed in the result pages are not explicitly restricted.\nScraping of main search pages is therefore permitted, as long as we avoid the paths /api/, /dataset/rate/, etc.\n")
```



    Note:
    Public datasets listed in the result pages are not explicitly restricted.
    Scraping of main search pages is therefore permitted, as long as we avoid the paths /api/, /dataset/rate/, etc.

# Understanding web scraping with `rvest`

In this section, you will discover the essential functions of the `rvest` package. Your goal: learn how to extract structured HTML content from a website.

``` r
url <- "https://www.donneesquebec.ca/recherche/?sort=metadata_modified+desc&page=1"
page <- safe_read_html(url)
page
```

    {html_document}
    <html lang="fr">
    [1] <head>\n<meta http-equiv="Content-Type" content="text/html; charset=UTF-8 ...
    [2] <body data-site-root="https://www.donneesquebec.ca/recherche/" data-local ...

The `read_html()` function downloads and converts the web page to allow manipulation.

Marie-Pier asks you:

> **IMPORTANT:**
>
> *“Can you show me what the structure of this page looks like? Can you spot anything interesting? »*

We can now target HTML elements with `html_nodes()` (or `html_elements()` in recent versions):

``` r
blocks <- html_nodes(page, ".dataset-content")
length(blocks)
```

    [1] 20

``` r
blocks[[1]]
```

    {html_node}
    <div class="dataset-content">
    [1] <h3 class="dataset-heading short">\n    \n    \n      \n    \n    \n      ...
    [2] <div class="dqc_donne_spat">\n      <img src="/recherche/images/2_icone_g ...
    [3] <div class="dqc-org-cat">\n    Organisation : <a href="/recherche/organiz ...
    [4] <div class="dqc-org-cat">Catégories :\n      \n        <a href="/recherch ...
    [5] <div class="dqc-notes"> Mesure des stations de débit et de niveau des par ...

To extract text from an HTML node:

``` r
html_text(blocks[[1]])
```

    [1] "\n        \n  \n    \n    \n      \n    \n    \n      Stations débit/niveau - Grand public\n    \n    \n      \n      \n\n\n\n    \n  \n  \n  \n\n  \n  \n  \n  \n  \n    \n      \n  \n \n  \n  \n\n\n        \n  \n  \n    Organisation : Ministère de la Sécurité intérieure\n  \n  Catégories :\n      \n        Environnement, ressources naturelles et énergie;\n        Loi, justice et sécurité publique\n  \n     Mesure des stations de débit et de niveau des partenaires du ministère de la Sécurité publique (MSP). Les débits et les niveaux permettent de surveiller de façon automatique les... \n  \n\n      "

Now, let’s test the extraction of the **title**:

``` r
html_nodes(blocks[[1]], ".dataset-heading a") %>% html_text(trim = TRUE)
```

    [1] "Stations débit/niveau - Grand public"

And for the **producers**? It is necessary to identify a substructure containing the information:

``` r
orgs <- html_nodes(blocks[[1]], ".dqc-org-cat") %>% html_text(trim = TRUE)
orgs
```

    [1] "Organisation : Ministère de la Sécurité intérieure"
    [2] "Catégories :\n      \n        Environnement, ressources naturelles et énergie;\n        Loi, justice et sécurité publique"

We can filter the good element with `grepl()` then clean the string with `gsub()`:

``` r
org <- orgs[grepl("^Organization", orgs)][1]
org_clean <- gsub("^Organization: ", "", org)
org_clean
```

    [1] NA

> **TIP:**
>
> **Why use `map_chr()`?**
> `map_chr()` belongs to the **purrr** package, which is part of the `tidyverse`. This function allows you to apply a function to each element of a list (here each HTML block), and to return a character vector. This is perfect when you want one text value per block.
>
> > Example:
> >
> > ``` r
> > producers <- map_chr(blocks, function(block) {
> > orgs <- html_nodes(block, ".dqc-org-cat") %>% html_text(trim = TRUE)
> > org <- orgs[grepl("^Organization", orgs)][1]
> > gsub("^Organization: ", "", org)
> > })
> > ```

> **TIP:**
>
> **It’s up to you**: From this same HTML block, find how to extract: - the **categories** associated with each dataset

------------------------------------------------------------------------

# Guided creation of the `scrape_page()` function

Marie-Pier wants you to create a reusable function named `scrape_page()` which takes a URL as an argument and returns a `data.frame` with the columns: `title`, `producer`, `category`.

Here is a skeleton to complete:

``` r
scrape_page <- function(url) {
  # Read the HTML content of the page
  page <- read_html(url)

  # Select individual result blocks
  blocks <- html_nodes(page, ".dataset-content")

  # Title (already done for you)
  titles <- html_nodes(blocks, ".dataset-heading a") %>% html_text(trim = TRUE)

  # Producer (to be completed)
  producers <- map_chr(blocks, function(block) {
    #... your code here...
  })

  # Category (to be completed)
  categories <- map_chr(blocks, function(block) {
    #... your code here...
  })

  # Create a standard data.frame
  data.frame(
    title = titles,
    producer = producers,
    category = categories,
    stringsAsFactors = FALSE
  )
}
```

> **NOTE:**
>
> **Test your function with page 3**: it should return the 20 datasets on this page.

------------------------------------------------------------------------

# Manual repeat, then `for` loop

Now test the extraction of the **first 5 pages** by calling your function several times:

``` r
# Manual example (to be completed)
p1 <- scrape_page("...")
p2 <- scrape_page("...")
# etc.
```

> **TIP:**
>
> **Marie-Pier**: “Have you noticed what changes in the URL each time? Can you generalize this behavior? »

Reminder of **module 1**: a loop allows you to automate repetitive behavior. Here is the start of a `for` loop to complete:

``` r
results <- data.frame()

for (i in 1:5) {
  # Build URL here
  url <- "..."

  cat("Page", i, "current...\n")
  page_data <- scrape_page(url)

  results <- bind_rows(results, page_data)
  Sys.sleep(1)
}
```

------------------------------------------------------------------------

# Exploration guided by Marie-Pier

Use the `results` table to answer your client’s questions. She expects precise results from you, illustrated if necessary.

> **IMPORTANT:**
>
> 1.  What are the most common categories of datasets?
> 2.  Which organizations publish the most?
> 3.  Are we observing a diversity of fields or a concentration on a few themes?

------------------------------------------------------------------------

# Ethical reflection

> **NOTE:**
>
> Briefly report:
>
> - Does the Data Québec site explicitly allow scraping?
> - What behaviors have you adopted to remain respectful?
> - Choose **two other websites** (ex: bonjourquebec.com, ulaval.ca) and check if scraping seems authorized or not. Rely on the `robots.txt` files or terms of use.

------------------------------------------------------------------------

# Challenge to submit

You must submit a **file `IDUL.R`** containing your `scrape_page()` function.

- This file should be placed in your GitHub repository in the location indicated.
- We will automatically test your function with multiple pages.

Good luck — be rigorous in your function design!

------------------------------------------------------------------------

# Conclusion of the adventure

You’ve designed a functional, automated scraping tool, used a `for` loop, extracted structured metadata, and deepened your understanding of the ethics of scraping.

Well done, consultant!
