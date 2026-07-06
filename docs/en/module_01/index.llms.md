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

The cards follow the four blocks of the learning plan: readings, adventure, challenge, exercises. The adventure and challenge form the module story. Exercises are autonomous and consolidate technical skills.

1 Readings Set up the R, RStudio, Quarto, dplyr and reproducibility landmarks. [Mini-test](mini_test.llms.md) Open cardCollapse

### Initial readings

The module uses R for Data Science as its reference book. The essential readings set up the first RStudio, script and reproducibility landmarks.

#### Essential readings

- [Book homepage](https://r4ds.hadley.nz/)
  *Overview of the book and its progression.*

- [Introduction](https://r4ds.hadley.nz/intro.html)
  *Why learn R for data science.*

- [Workflow: basics](https://r4ds.hadley.nz/workflow-basics.html)
  *Console, scripts and first objects in RStudio.*

- [Workflow: scripts and projects](https://r4ds.hadley.nz/workflow-scripts.html)
  *Keep code in files so it can be rerun.*

#### Readings for the adventure and challenge

- [Hello, Quarto](https://quarto.org/docs/get-started/hello/rstudio.html)
  *Create a Quarto document and produce HTML output.*

- [Data transformation](https://r4ds.hadley.nz/data-transform.html)
  *First `dplyr` verbs for filtering, selecting and creating columns.*

[Take the formative reading mini-test](mini_test.llms.md).

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

- [Workflow: style](https://r4ds.hadley.nz/workflow-style.html)
  *Why a consistent code style is crucial for collaboration and how to achieve it with tidyverse style.*

------------------------------------------------------------------------

##### Tidyverse Style Guide

- [Chapter 1: Files](https://style.tidyverse.org/files.html)
  *Tips for organizing your files, structuring your projects and naming your scripts clearly.*

- [Chapter 2: Syntax](https://style.tidyverse.org/syntax.html)
  *Syntax rules for writing readable code, spacing, indentation and naming conventions.*

4 Exercises Practise RStudio, Quarto, MeteoQuebec and two case studies. [Exercises](exercices.llms.md) Open cardCollapse

Resource [Exercises page](exercices.llms.md)

Scope These exercises are not a step in the challenge. They practise RStudio, Quarto, first R objects and two fictitious cases.

Try each exercise before opening the solution, even when it gives your brain a little workout.

## Data and Tools

### Datasets

[UlavalSSD::MeteoQuebec](../donnees.llms.md#dataset-card-meteo-quebec) [Fictitious libraries](data/fictitious_municipal_libraries.csv) [Fictitious student coop](data/fictitious_student_coop.csv)

### R packages

[tidyverse](../packages.llms.md#tidyverse) [dplyr](../packages.llms.md#dplyr) [knitr](../packages.llms.md#knitr) [remotes](../packages.llms.md#remotes) [ulavalssd](../packages.llms.md#ulavalssd)

## Review and Extension

### Finish the module with the course AI assistant

Open [the AI page](../ia.llms.md) or [GPT STT-1100](https://chatgpt.com/g/g-682d165f32e881918633affa3fe9dfd6-gpt-stt-1100), then ask for targeted feedback:

*Here is my work for this module. Question my reasoning, identify one fragile line of code, check whether my interpretation answers the instructions, then suggest one realistic improvement I can make myself.*

- Explain the finished product in three sentences.
- Paste a code or output excerpt and ask for a diagnosis.
- Ask for a more ambitious variant, then choose what remains reasonable.
