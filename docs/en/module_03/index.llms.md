# Categories in all their forms

Module 03

Clean, count and visualize categorical variables.

Main threadStrings, categories and charts

DataFood offences and fictitious practice data

ChallengeReproducible data article

## Finished product

Final product

### A data article about food offences

The module produces a cleaned dataset, checked categories, readable charts and a short Quarto article supported by key figures.

**article.html**

data cleaned

categories checked

article written

data cleaned categories checked article written

## Module objectives

By the end of this module, you should be able to:

- handle character strings with `stringr`;
- recognize simple patterns with regular expressions;
- clean amounts, postal codes and categories in a reproducible way;
- calculate and interpret frequencies, proportions and cross-tabulations;
- recode, lump and order categories with `dplyr` and `forcats`;
- produce and interpret bar charts, stacked bars and standardized stacked bars with `ggplot2`.

## Prepare for the module

### Prerequisites

Review `filter()`, `mutate()`, `group_by()`, `summarise()` and one `ggplot2` chart from Module 2. You do not need to memorize everything, but you should be able to reread an example.

### Minimum route

Clean one category, calculate a frequency or proportion, then explain one chart in a precise sentence. This is the core of the module.

### This module, then the next

Here, categories are used to count, compare and tell a story. Module 4 will deepen file quality, import and documentation of corrections.

### If you get stuck

Start with the fictitious exercise data. Once the move is understood, return to the food-offence data and record every recoding choice.

## Learning plan

1 Readings and mini-test Review strings, factors, frequencies and proportions. [Mini-test](mini_test.llms.md) Open cardCollapse

Read before the adventure:

- [R for Data Science - Strings](https://r4ds.hadley.nz/strings.html)
- [R for Data Science - Factors](https://r4ds.hadley.nz/factors.html)
- [Introduction to Modern Statistics - Explore categorical data](https://openintrostat.github.io/ims/explore-categorical)
- [The forcats documentation](https://forcats.tidyverse.org/)

### Posit cheat sheets

- [String manipulation with stringr :: Cheatsheet](https://rstudio.github.io/cheatsheets/strings.pdf)
- [Factors with forcats :: Cheatsheet](https://rstudio.github.io/cheatsheets/factors.pdf)
- [Data visualization with ggplot2 :: Cheat Sheet](https://rstudio.github.io/cheatsheets/data-visualization.pdf)

After the readings, complete the [formative mini-test](mini_test.llms.md).

2 Adventure Clean food offence data and extract key facts. [Adventure](aventure.llms.md) Open cardCollapse

Role Data journalist for Le Courrier Gourmand.

Action Clean categories, extract postal codes and produce first results.

Keep outputs that could become narrative figures in the article.

3 Challenge Write a Quarto article from the food offence data. [Challenge](defi.llms.md) Open cardCollapse

Your mission is to clean `listecondamnation`, extract key facts and write a reproducible Quarto article.

[Open the module 3 challenge](defi.llms.md)

- Deliverables: completed `template_article.qmd` and rendered HTML.
- Analysis: at least two narrative figures and two visuals, including one categorical chart.
- Optional extension: the fines map, with a note about geocoding reproducibility.
- GitHub: several clear commits and a complete repository.

4 Exercises Practice frequencies, cleaning, charts and two case studies. [Exercises](exercices.llms.md) Open cardCollapse

Resource [Exercises page](exercices.llms.md)

Scope These exercises are not a step in the challenge. They practise categories, strings, charts and three fictitious contexts.

Case studies Fictitious 311 requests and fictitious public transit complaints.

Redo at least one block without looking at the solution immediately.

## Data and tools

### Datasets

[Download the module workspace (.zip)](../../downloads/donnees/stt1100-module-03-en.zip)

[UlavalSSD::listecondamnation](../donnees.llms.md#dataset-card-listecondamnation) [Montréal 311 requests](data/requetes_311_montreal.csv) [Québec consumer complaints](data/plaintes_consommation_quebec.csv) [palmerpenguins::penguins_raw](../donnees.llms.md#dataset-card-penguins-raw) [titanic::titanic_train](../donnees.llms.md#dataset-card-titanic-train)

### R packages

[tidyverse](../packages.llms.md#tidyverse) [stringr](../packages.llms.md#stringr) [forcats](../packages.llms.md#forcats) [ggplot2](../packages.llms.md#ggplot2) [ulavalssd](../packages.llms.md#ulavalssd) [tidygeocoder](../packages.llms.md#tidygeocoder) [scales](../packages.llms.md#scales)

## Review and extension

### Finish the module with the course AI assistant

Open [the AI page](../ia.llms.md) or [GPT STT-1100](https://chatgpt.com/g/g-682d165f32e881918633affa3fe9dfd6-gpt-stt-1100), then ask for targeted feedback:

*Here is my work for this module. Question my reasoning, identify one fragile line of code, check whether my interpretation answers the instructions, then suggest one realistic improvement I can make myself.*

- Explain the finished product in three sentences.
- Paste a code or output excerpt and ask for a diagnosis.
- Ask for a more ambitious variant, then choose what remains reasonable.
