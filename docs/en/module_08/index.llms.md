# Automation and web exploration

Module 08

Automate repetitive tasks and extract information from web pages.

Main threadLoops, functions and web scraping

DataWeb pages and extracted texts

ChallengeTestable `scrape_page()` function

## Finished Product

Final product

### A reproducible scraping function

The chapter leads to web extraction organized in a function, with controlled outputs and logic that can be rerun.

**scraping**

selectors

function

final table

selectors function final table

## Module Objectives

At the end of this module, you should be able to:

- Extract text data from a web page using `rvest`.
- Automate repetitive tasks using loops and functions in R.
- Identify the ethical aspects linked to the automated collection of online data.

## Prepare for the module

### Prerequisites

You should be able to read a table, manipulate a character string and follow a simple R function. HTML snapshots of real Quebec data let you practise without relying on the availability of an external service.

### Minimum route

Start with a local page, extract a table whose columns meet the requested contract, then run the provided test. A live page is not required to demonstrate the move.

### Responsible collection

The challenge concerns one page at a time. `robots.txt` is a technical signal, not complete permission: never bypass protection or launch a bulk collection.

### If the site changes

Use the local page and repository test as the reference. Document the observed difference rather than forcing a fragile extraction.

## Learning Plan

The cards follow the four blocks of the learning plan: readings, adventure, challenge, exercises. The adventure and challenge form the module story. Exercises are autonomous and use local HTML pages to consolidate the same moves without depending on an external website.

1 Readings Prepare HTML, CSS selectors, functions and automation. In this card Open cardCollapse

### Readings

To prepare, check out the following resources:

- [R for Data Science - Web scraping](https://r4ds.hadley.nz/webscraping.html)
- [R for Data Science - Functions](https://r4ds.hadley.nz/functions.html)
- [R for Data Science - Iteration](https://r4ds.hadley.nz/iteration.html)
- [Official rvest documentation](https://rvest.tidyverse.org/)
- [robots.txt documentation (MDN)](https://developer.mozilla.org/en-US/docs/Glossary/Robots.txt)
- [Google Search Central - Introduction to robots.txt](https://developers.google.com/search/docs/crawling-indexing/robots/intro)

#### Posit cheat sheets

- [Apply functions with purrr :: Cheatsheet](https://rstudio.github.io/cheatsheets/purrr.pdf)
  Automation with `map()` and related functions.
- [String manipulation with stringr :: Cheatsheet](https://rstudio.github.io/cheatsheets/strings.pdf)
  Text cleaning and extraction after collection.

Check After the readings, complete the [formative mini-test](mini_test.llms.md).

2 Adventure Extract a web page and turn the result into a table. [Adventure](aventure.llms.md) Open cardCollapse

Goal Move from reading to guided practice.

Resource [Adventure page](aventure.llms.md)

Action Follow the instructions, run the code and keep important outputs.

Result A first work object that you can explain.

Pause after each important result and state what it shows.

3 Challenge Build a clear and reusable scraping function. [Challenge](defi.llms.md) Open cardCollapse

### Challenge - Scraping function

You will need to design a function `scrape_page(url)` which:

- takes as input a URL from a Data Québec search page;
- returns a `data.frame` with the columns `titre`, `producteur`, `categorie`.

You will put this function in an `IDUL.R` file in the `STT-1100/aventure-8` template repository. The full instructions are available in the [Challenge 8](defi.llms.md) page.

4 Exercises Practise selectors, functions, loops and collection limits. [Exercises](exercices.llms.md) Open cardCollapse

Resource [Exercises page](exercices.llms.md)

Why Exercises use local HTML snapshots from Données Québec and SIT Québec to remain reproducible and independent from the challenge.

Before opening a solution, name the CSS selector or output contract you want to test.

## Data and Tools

### Datasets

[Download the module workspace (.zip)](../../downloads/donnees/stt1100-module-08-en.zip)

[Web pages analyzed with rvest](../donnees.llms.md#dataset-card-web-pages-module-08) [Données Québec catalog](data/catalogue_donnees_quebec.llms.md) [Catalog with missing categories](data/catalogue_donnees_quebec_irregulier.llms.md) [SIT Québec events](data/evenements_sit_quebec.llms.md)

### R packages

[tidyverse](../packages.llms.md#tidyverse) [rvest](../packages.llms.md#rvest) [purrr](../packages.llms.md#purrr) [dplyr](../packages.llms.md#dplyr) [stringr](../packages.llms.md#stringr) [robotstxt](../packages.llms.md#robotstxt)

## Review and Extension

### Finish the module with the course AI assistant

Open [the AI page](../ia.llms.md) or [GPT STT-1100](https://chatgpt.com/g/g-682d165f32e881918633affa3fe9dfd6-gpt-stt-1100), then ask for targeted feedback:

*Here is my work for this module. Question my reasoning, identify one fragile line of code, check whether my interpretation answers the instructions, then suggest one realistic improvement I can make myself.*

- Explain the finished product in three sentences.
- Paste a code or output excerpt and ask for a diagnosis.
- Ask for a more ambitious variant, then choose what remains reasonable.
