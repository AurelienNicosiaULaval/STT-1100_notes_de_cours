# Factors and data cleaning

Module 04

Clean real data and prepare variables that can be used in analysis.

Main threadImport, cleaning and lists

DataCSV, Excel, JSON and nested data

ChallengeCleaned and documented dataset

## Finished Product

Final product

### A cleaned and documented table

The module leads to a usable version of an insurance file, with cleaning choices explained, anomalies made visible and a reproducible log.

**clean data**

import checked

variables cleaned

log documented

types checked values recoded decisions traced

## Module Objectives

At the end of this module, you should be able to

- import data from different formats (`csv`, Excel, JSON);
- inspect types, dimensions, missing values and anomalies;
- clean column names, text amounts, factors and character strings;
- transform tables with `pivot_longer()`, `pivot_wider()` and `unnest()`;
- document cleaning decisions in a structured list.

## Prepare for the module

### Prerequisites

You should be able to import a simple table, inspect its columns and revisit the recoding work from Module 3. Prepare your RStudio project before opening the supplied files.

### Minimum route

Check names, types and missing values, then document at least one cleaning decision. A cautious, explained correction is better than a changed file with no trace.

### Keep for later

Long-wide formats, Excel and JSON are useful extensions. Start by diagnosing one table before multiplying formats and transformations.

### If you are unsure

Do not delete a value simply because it looks strange. Record it in the log, explain your decision and keep the work reproducible.

## Learning Plan

The cards follow the five steps of the learning plan: readings, adventure, challenge, exercises and feedback with or without AI. The adventure and challenge form the module story. The exercises are independent and practice the same techniques on other data. Feedback revisits work you have already completed; it does not require an additional submission.

1 Readings Prepare import, missing values, spreadsheets, JSON and lists. In this card Open cardCollapse

### Readings

These readings prepare the core module moves: import, tidy data, missing values, spreadsheets, JSON and lists.

- [R for Data Science - Data import](https://r4ds.hadley.nz/data-import.html): importing delimited files with `readr`.
- [R for Data Science - Data tidying](https://r4ds.hadley.nz/data-tidy.html): reshaping tables with tidy data principles.
- [R for Data Science - Missing values](https://r4ds.hadley.nz/missing-values.html): distinguishing explicit, coded and implicit missing values.
- [R for Data Science - Factors](https://r4ds.hadley.nz/factors.html): manipulating categorical variables.
- [R for Data Science - Spreadsheets](https://r4ds.hadley.nz/spreadsheets.html): importing Excel files cleanly.
- [R for Data Science - Hierarchical data](https://r4ds.hadley.nz/rectangling.html): understanding lists, JSON and nested data.

#### Posit cheat sheets

- [Data import with the tidyverse :: Cheatsheet](https://rstudio.github.io/cheatsheets/data-import.pdf): importing delimited and Excel files.
- [Data tidying with tidyr :: Cheatsheet](https://rstudio.github.io/cheatsheets/tidyr.pdf): reshaping tables between long and wide formats.
- [String manipulation with stringr :: Cheatsheet](https://rstudio.github.io/cheatsheets/strings.pdf): cleaning strings and detecting patterns.
- [Factors with forcats :: Cheatsheet](https://rstudio.github.io/cheatsheets/factors.pdf): cleaning and lumping levels.
- [Data transformation with dplyr :: Cheatsheet](https://rstudio.github.io/cheatsheets/data-transformation.pdf): inspecting, filtering and summarizing tables.

After the readings, complete the [formative mini-test](mini_test.llms.md). It is not graded; it checks the basics before the adventure.

2 Adventure Diagnose a real file and correct fragile variables. [Adventure](aventure.llms.md) Open cardCollapse

Goal Diagnose an insurance archive with Alex and build a first cleaning log.

Resource [Adventure page](aventure.llms.md)

Action Import `dataset_pratique.csv`, spot anomalies and document decisions.

Result A first explainable version of `donnees_propres.csv` and `journal_nettoyage`.

The story thread is guided: traceability matters more than perfection.

3 Challenge Deliver a cleaned table with justified transformations. [Challenge](defi.llms.md) Open cardCollapse

### Challenge - Documented cleaning

You rework the insurance file independently to produce a clean version and justify the cleaning decisions.

- Goal: import, diagnose, correct and document fragile variables.
- Deliverables: one `.qmd` file, `donnees_propres.csv` and `journal_nettoyage.Rdata`.
- Watch point: check that the import produces 23 columns before cleaning.

The full instructions are available in the [Challenge 4](defi.llms.md) page.

4 Exercises Practice technical moves on autonomous data. [Exercises](exercices.llms.md) Open cardCollapse

Resource [Exercises page](exercices.llms.md)

Scope These exercises are not a continuation of the challenge. They use `policies.csv`, `coverage.json`, `quotes_2024.xlsx` and two Québec public data sources.

Cases Last-resort financial assistance in Québec and Sherbrooke sports facilities.

Redo at least one passage without looking at the solution immediately.

5 Feedback Have one excerpt of your work reviewed, then decide what to improve yourself. [Process and examples](../ia.llms.md#feedback-cycle) Open cardCollapse

### Feedback: justified data cleaning

After an initial attempt, choose one improvement related to types, anomalies and cleaning decisions. Use the [feedback process](../ia.llms.md#feedback-cycle) with or without AI; this routine adds no submission to the instructions.

A request tailored to module 4

> I am working on types, anomalies and cleaning decisions. Here are the instructions, relevant criteria and a before-and-after excerpt, the code and justification for the change. Identify one strength and at most two improvements, including a transformation that could discard information or create missing values if the supplied evidence shows it. Cite the relevant passage, distinguish observable errors from items to check, then suggest a hint and test. Do not rewrite my work and wait for my correction.

- Verify: Compare dimensions, types and missing values before and after. Inspect changed rows and document exclusions.
- Revisit the correction: present the change and test result, then ask what still needs checking.
- Repeat without help: Justify a cleaning decision, then check another anomaly without automatically applying the same correction.

Without AI, compare your attempt with the criteria and course examples, then perform the same checks. Keep a short record in the [tracking worksheet](../ia.llms.md#feedback-trace) if useful.

Privacy Do not share personal, confidential or protected data.

## Data and Tools

### Datasets

[Download the exercise workspace (.zip)](../../downloads/donnees/stt1100-module-04-en.zip)

[dataset_pratique.csv](../donnees.llms.md#dataset-card-dataset-pratique) [policies.csv](../donnees.llms.md#dataset-card-policies-module-04) [coverage.json](../donnees.llms.md#dataset-card-coverage-module-04) [quotes_2024.xlsx](../donnees.llms.md#dataset-card-quotes-module-04) [Québec AFDR, December 2022](data/afdr_clientele_prestations_2022_12.csv) [Sherbrooke sports facilities](data/installations_sportives_sherbrooke.csv) [Sherbrooke ArcGIS metadata](data/metadonnees_installations_sherbrooke.json)

### R packages

[readr](../packages.llms.md#readr) [readxl](../packages.llms.md#readxl) [dplyr](../packages.llms.md#dplyr) [tidyr](../packages.llms.md#tidyr) [jsonlite](../packages.llms.md#jsonlite) [janitor](../packages.llms.md#janitor) [stringr](../packages.llms.md#stringr) [forcats](../packages.llms.md#forcats) [tibble](../packages.llms.md#tibble) [ggplot2](../packages.llms.md#ggplot2)
