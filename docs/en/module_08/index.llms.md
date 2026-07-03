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

## Learning Plan

The cards follow the four blocks of the learning plan: readings, adventure, challenge, exercises. Open the cards to see the expected action and useful link.

1 Readings Prepare HTML, CSS selectors, functions and automation. In this card Open cardCollapse

### Readings

To prepare, check out the following resources:

- [R for Data Science - Web scraping](https://r4ds.hadley.nz/webscraping.html)
- [robots.txt documentation (MDN)](https://developer.mozilla.org/en-US/docs/Glossary/Robots.txt)

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

4 Exercises Revisit selectors, loops and web text cleaning. [Exercises](exercices.llms.md) Open cardCollapse

Resource [Exercises page](exercices.llms.md)

Why Exercises stay on a separate page because they take more space.

Redo at least one passage without looking at the solution immediately.

## Data and Tools

### Datasets

[Web pages analyzed with rvest](../donnees.llms.md#dataset-card-web-pages-module-08)

### R packages

[tidyverse](../packages.llms.md#tidyverse) [rvest](../packages.llms.md#rvest) [purrr](../packages.llms.md#purrr)

## Review and Extension

### Finish the module with the course AI assistant

Before moving to the next module, use the course AI assistant as a review partner: ask it to question your reasoning, identify fragile code and suggest one realistic improvement to the challenge.

- Explain the finished product in three sentences.
- Paste a code or output excerpt and ask for a diagnosis.
- Ask for a more ambitious variant, then choose what remains reasonable.
