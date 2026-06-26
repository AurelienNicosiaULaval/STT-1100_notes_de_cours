# Data science dive

Module 01

Discover the role of reproducible analysis and the first practical moves in RStudio, R and Quarto.

Main threadFirst R and Quarto moves

DataMeteoQuebec and first tables

ChallengeReproducible mini Quarto report

## Finished Product

Final product

### A reproducible mini Quarto report

The chapter leads to a first HTML document that imports data, displays results and can be rendered again cleanly.

**report.html**

data loaded

clear summaries

reproducible render

data loaded clear summaries reproducible render

## Module Objectives

At the end of this module, you should be able to

- Use RStudio to write and run R code using the console and scripts.

- Install and load libraries.

- Create and manipulate R objects, use conditions, use existing functions, write simple functions.

- Write R code following tidyverse style conventions.

- Check if a dataset is clean.

- Extract a row or column, add a column, filter data using one or more conditions.

- Write a simple report in Quarto, including text, code blocks, section titles.

## Learning Plan

The cards follow the four blocks of the learning plan: readings, adventure, challenge, exercises. Open the cards to see the expected action and useful link.

1 Readings Set up the R, RStudio, Quarto and reproducibility landmarks. In this card Open cardCollapse

### Initial readings

#### The reference book

In this course, we will regularly rely on the book **R for Data Science** (*2nd edition*, by Hadley Wickham, Mine Çetinkaya-Rundel and Garrett Grolemund).

> Note: we will often abbreviate with **R4DS**

It is an **indispensable reference**, accessible free online and written in clear **English**. You will find complete explanations and concrete examples to learn how to work effectively with `tidyverse`.

\*\* Tip\*\*: If in doubt or stuck, consult the document [How to search and get help](../references.llms.md).

------------------------------------------------------------------------

##### To read for this module

- [Book homepage](https://r4ds.hadley.nz/)
  *An overview of the book, its authors and the themes covered in each part.*

- [Introduction](https://r4ds.hadley.nz/intro.html)
  *Why learn R for data science, and how to approach your learning in this course.*

- [Workflow: basics](https://r4ds.hadley.nz/workflow-basics.html)
  *The first steps in RStudio: the environment, scripts and interactive behavior of R.*

- [Workflow: scripts](https://r4ds.hadley.nz/workflow-scripts.html)
  *Why use scripts to make your work reproducible, clear and well structured.*

2 Adventure Create a first report from weather data. [Adventure](aventure.llms.md) Open cardCollapse

Goal Move from reading to guided practice.

Resource [Adventure page](aventure.llms.md)

Action Follow the instructions, run the code and keep important outputs.

Result A first work object that you can explain.

Pause after each important result and state what it shows.

3 Challenge Render a clear and reproducible mini HTML report. In this card Open cardCollapse

### Challenge

In this first challenge, in order to get used to the different tools, you must create a Quarto report in HTML format.

[Module 1 challenge](defi.llms.md)

#### Further reading

##### Deepen best practices

Once the foundations have been laid, it is essential to adopt **clear, reproducible and consistent work habits** from the start. The resources below will help you improve the readability, structure, and organization of your code.

------------------------------------------------------------------------

##### R4DS Add-ons

- [Workflow: help](https://r4ds.hadley.nz/workflow-help.html)
  *Learn to ask the right questions, search documentation effectively, and make relevant requests for help.*

- [Quarto formats](https://r4ds.hadley.nz/quarto-formats.html)
  *Introduction to the formats available in Quarto and how to customize your reports, articles or presentations.*

- [Workflow:style](https://r4ds.hadley.nz/workflow-style.html)
  *Why a consistent code style is crucial for collaboration and how to achieve it with tidyverse style.*

------------------------------------------------------------------------

##### Tidyverse Style Guide

- [Chapter 1: Files](https://style.tidyverse.org/files.html)
  *Tips for organizing your files, structuring your projects and naming your scripts clearly.*

- [Chapter 2: Syntax](https://style.tidyverse.org/syntax.html)
  *Syntax rules for writing readable code, spacing, indentation and naming conventions.*

4 Exercises Practise console, scripts, help and Quarto rendering. [Exercises](exercices.llms.md) Open cardCollapse

Resource [Exercises page](exercices.llms.md)

Why Exercises stay on a separate page because they take more space.

Redo at least one passage without looking at the solution immediately.

## Data and Tools

### Datasets

[UlavalSSD::MeteoQuebec](../donnees.llms.md#dataset-card-meteo-quebec)

### R packages

[tidyverse](../packages.llms.md#tidyverse) [dplyr](../packages.llms.md#dplyr) [knitr](../packages.llms.md#knitr) [remotes](../packages.llms.md#remotes) [ulavalssd](../packages.llms.md#ulavalssd)

## Review and Extension

### Finish the module with the course AI assistant

Before moving to the next module, use the course AI assistant as a review partner: ask it to question your reasoning, identify fragile code and suggest one realistic improvement to the challenge.

- Explain the finished product in three sentences.
- Paste a code or output excerpt and ask for a diagnosis.
- Ask for a more ambitious variant, then choose what remains reasonable.
