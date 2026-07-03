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
- [Official rvest documentation](https://rvest.tidyverse.org/)
- [robots.txt documentation, MDN](https://developer.mozilla.org/en-US/docs/Glossary/Robots.txt)

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

These exercises revisit the module’s technical skills in another context. Use the archived version of the IMDb Top 250 Movies page: <https://web.archive.org/web/20220201012049/https://www.imdb.com/chart/top/>

1.  Read the HTML page with `read_html()`.
2.  Locate the sections containing movie titles with a CSS selector.
3.  Extract the titles, years and ratings.
4.  Build a `data.frame` with these three variables.
5.  Check IMDb’s `robots.txt` file and explain why this check is not sufficient on its own.
