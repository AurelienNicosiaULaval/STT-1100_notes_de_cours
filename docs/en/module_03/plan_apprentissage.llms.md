# Module 3 - Learning plan

STT-1100 Introduction to Data Science

# Module objectives

By the end of this module, you should be able to:

- handle character strings with `stringr`;
- recognize simple patterns with regular expressions;
- clean amounts, postal codes and categories in a reproducible way;
- produce frequency tables, proportions and cross-tabulations;
- recode, lump and order categories with `dplyr` and `forcats`;
- produce and interpret bar charts, stacked bars and standardized stacked bars with `ggplot2`;
- write a short Quarto article supported by narrative figures and charts.

# Readings

These readings provide the background needed before starting the adventure.

- [R for Data Science - Strings](https://r4ds.hadley.nz/strings.html) To manipulate character strings with `stringr`: detect words, extract patterns, standardize case and clean extra spaces.

- [R for Data Science - Factors](https://r4ds.hadley.nz/factors.html) To understand why the order of categories matters in an analysis and in a chart.

- [Introduction to Modern Statistics - Explore categorical data](https://openintrostat.github.io/ims/explore-categorical) To review frequencies, proportions, cross-tabulations and charts for categorical variables.

- [The `forcats` documentation](https://forcats.tidyverse.org/) To lump rare categories, reorder levels and make categorical charts easier to read.

## Posit cheat sheets

- [String manipulation with stringr :: Cheatsheet](https://rstudio.github.io/cheatsheets/strings.pdf) `stringr` functions for detecting, extracting, replacing and cleaning text.

- [Factors with forcats :: Cheatsheet](https://rstudio.github.io/cheatsheets/factors.pdf) Recoding, lumping and reordering categories.

- [Data visualization with ggplot2 :: Cheat Sheet](https://rstudio.github.io/cheatsheets/data-visualization.pdf) Categorical charts and frequent visual adjustments.

After the readings, complete the [formative mini-test](../module_03/mini_test.llms.md). It is not graded, but it checks the ideas needed for the adventure and the challenge.

# Adventure

[Adventure 3](../module_03/aventure.llms.md)

You play the role of a data journalist for Le Courrier Gourmand. The adventure guides you through cleaning the `listecondamnation` dataset, extracting postal codes, identifying offence categories and building first results for an article.

# Challenge

[Module 3 challenge](../module_03/defi.llms.md)

Your mission is to write a reproducible Quarto article about food offences. The challenge uses the same context as the adventure, but gives you more autonomy in choosing key facts and charts.

You must submit:

- `template_article.qmd` completed;
- `template_article.html` rendered;
- a GitHub repository with several clear commits.

The article must contain at least two narrative figures and two visuals, including one categorical chart. The fines map is optional.

# Consolidation exercises

[Module 3 exercises](../module_03/exercices.llms.md)

The exercises are independent from the adventure and challenge. They are organized into four blocks:

1.  recognize, count and compare categorical variables;
2.  clean character strings and extract patterns;
3.  clean and summarize a small fictitious service-request dataset;
4.  produce readable categorical visualizations.

The series ends with two case studies using fictitious data different from the adventure data: 311 requests and public transit complaints.
