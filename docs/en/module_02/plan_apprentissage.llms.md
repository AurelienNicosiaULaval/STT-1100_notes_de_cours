# Module 2 - Learning Plan

STT-1100 Introduction to Data Science

## Module Objectives

At the end of this module, you should be able to

- use GitHub through RStudio to clone a repository, make commits and push your changes;
- read an `xlsx` file in RStudio and document the import step in a Quarto report;
- manage and transform numerical data with `dplyr`, including `glimpse()`, `select()`, `mutate()`, `filter()`, `group_by()` and `summarise()`;
- compute and interpret descriptive statistics for numerical variables, including by subgroup;
- visualize numerical variables with `ggplot2`, including histograms, box plots, scatterplots and facets;
- improve chart readability with titles, axes, units, legends and a coherent theme;
- produce a short reproducible analysis report in a GitHub repository.

## Initial Readings

In Fall 2026, Module 2 is prepared during the week of September 7, then worked through in class on September 14. The preparatory work sets up the GitHub workflow, Excel import and first `dplyr` verbs; the class meeting puts these skills into practice and consolidates exploratory analysis, descriptive statistics and numerical-variable visualization.

> **IMPORTANT:**
>
> Complete Part 1 of Adventure 2 only. Accept the repository invitation, configure SSH if needed, clone the repository in RStudio and follow the adventure page to the “End of Part 1” box. Render `journal de bord.qmd`, then commit and push your work.
>
> The `rapport_analyse.qmd` report and “The return of Dr Adélie Fortier” belong to Part 2. Do not start them yet.

### Recommended order

1.  Before starting: accept the invitation, configure SSH if needed and clone the repository in RStudio.
2.  Part 1: complete the logbook to the stopping point shown in the adventure, then render it to HTML.
3.  End of Part 1: make a clear commit and push it to GitHub.
4.  Part 2, later: prepare the analysis report requested in the challenge.

Facets, additional comparisons and visual refinements come after this minimum core.

### Preparatory work - Project, Import and First Charts

- [SSH connection between GitHub and RStudio](../autre_materiel/connexion-ssh-github-rstudio.llms.md) Configure the account with menus and buttons, then check the connection.

- [RStudio and GitHub quick reference](../autre_materiel/aide-memoire-rstudio-github.llms.md) Clone a repository, open an RStudio project, understand commits and pushes, and recognize common authentication issues.

- [R for Data Science - Data visualization](https://r4ds.hadley.nz/data-visualize.html) First landmarks for building charts with `ggplot2`.

- [R for Data Science - Data transformation](https://r4ds.hadley.nz/data-transform.html) Introduction to the `dplyr` verbs that return in the adventure and challenge.

- [readxl - Official documentation](https://readxl.tidyverse.org/) Short reference for importing Excel files with `read_excel()`.

### Extension - Exploration and Distribution Comparison

- [R for Data Science - Exploratory Data Analysis](https://r4ds.hadley.nz/EDA.html) Explore distributions, identify extreme values and formulate hypotheses from charts.

- [R for Data Science - Spreadsheets](https://r4ds.hadley.nz/spreadsheets.html) Recognize table structures that make analysis easier and avoid common spreadsheet pitfalls.

- [Introduction to Modern Statistics - Exploring numerical data](https://openintrostat.github.io/ims/explore-numerical) Summarize and interpret numerical variables with descriptive statistics.

- [Tidyverse Style Guide - ggplot2](https://style.tidyverse.org/ggplot2.html) A few landmarks for writing readable chart code.

### Posit cheat sheets

- [Data import with the tidyverse :: Cheatsheet](https://rstudio.github.io/cheatsheets/data-import.pdf) Import with `readr` and `readxl`, useful for CSV and Excel files.

- [Data transformation with dplyr :: Cheatsheet](https://rstudio.github.io/cheatsheets/data-transformation.pdf) Transformation verbs used in the adventure and exercises.

- [Data visualization with ggplot2 :: Cheat Sheet](https://rstudio.github.io/cheatsheets/data-visualization.pdf) Grammar of graphics, geoms, facets, scales and themes.

### Optional Reading

- [Broman and Woo (2018) - Data Organization in Spreadsheets](https://www.tandfonline.com/doi/full/10.1080/00031305.2017.1375989) A useful reference for understanding why raw data should remain intact and why corrections should be documented in code.

### Reading Mini-Test

After the essential readings, complete the [module 2 formative mini-test](../module_02/mini_test.llms.md). It is not graded, but it checks points that return in the adventure and in the challenge.

## Adventure

This module places you in the role of a data scientist helping Dr. Adélie Fortier explore physical measurements of penguins. You must import an Excel file, document your work in a logbook, produce charts and keep track of the work in GitHub.

[Module 2 adventure](../module_02/aventure.llms.md)

## Challenge

The module 2 challenge uses the same GitHub repository as the adventure. You must submit:

- `journal de bord.qmd`;
- `journal de bord.html`;
- `rapport_analyse.qmd`;
- `rapport_analyse.html`.

The analysis report must answer Dr. Adélie Fortier’s request: understand how penguin physical characteristics vary by species.

[Module 2 challenge](../module_02/defi.llms.md)

## Consolidation Exercises

The exercise series is independent from the adventure and challenge. It includes practice on GitHub, Excel import, `dplyr`, `ggplot2`, descriptive statistics, code style and two final case studies with small fictitious files.

[Module 2 consolidation exercises](../module_02/exercices.llms.md)
