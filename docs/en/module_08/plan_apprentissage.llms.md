# Module 8 - Learning plan

STT-1100 Introduction to Data Science

# Module Objectives

At the end of this module, you should be able to:

- extract text data from a web page with `rvest`;
- turn HTML elements into a structured table;
- automate repetitive tasks with functions and loops in R;
- distinguish a technical check such as `robots.txt` from full permission to collect data;
- explain the technical and ethical limits of automated collection.

# Readings

To prepare, check out the following resources:

- [R for Data Science - Web scraping](https://r4ds.hadley.nz/webscraping.html)
- [R for Data Science - Functions](https://r4ds.hadley.nz/functions.html)
- [R for Data Science - Iteration](https://r4ds.hadley.nz/iteration.html)
- [Official rvest documentation](https://rvest.tidyverse.org/)
- [robots.txt documentation, MDN](https://developer.mozilla.org/en-US/docs/Glossary/Robots.txt)
- [Google Search Central - Introduction to robots.txt](https://developers.google.com/search/docs/crawling-indexing/robots/intro)
- [robotstxt package documentation](https://docs.ropensci.org/robotstxt/)

After the readings, complete the [formative mini-test](../module_08/mini_test.llms.md). It is not graded; it only checks the basic ideas before the adventure.

# Adventure

You play the role of a data science consultant hired to develop an automated metadata extraction function from the Données Québec portal.

Link to the adventure: [Adventure 8 - Quebec Open Data](../module_08/aventure.llms.md)

# Challenge - Scraping Function

The challenge is to produce an `IDUL.R` file containing a `scrape_page(url)` function.

The function must:

- take a Données Québec search page URL as input;
- return a `data.frame` with exactly the columns `titre`, `producteur`, `categorie`;
- handle the labels `Catégorie` and `Catégories`;
- be loadable and testable in a fresh R session.

Full instructions: [Challenge 8 - Scraping Function](../module_08/defi.llms.md)

Starter repository: `STT-1100/aventure-8`

# Consolidation Exercises

These exercises are independent from the adventure and the challenge. They use fictitious local HTML pages to practise CSS selectors, extraction functions, automation across several pages, missing-field handling and ethical limits of collection.

Link to the exercises: [Consolidation Exercises](../module_08/exercices.llms.md)
