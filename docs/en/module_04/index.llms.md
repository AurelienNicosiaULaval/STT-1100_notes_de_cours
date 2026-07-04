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

## Learning Plan

The cards follow the four blocks of the learning plan: readings, adventure, challenge, exercises. The adventure and challenge form the module story. The exercises are independent and practice the same techniques on other data.

1 Readings Prepare import, missing values, spreadsheets, JSON and lists. In this card Open cardCollapse

### Readings

These readings prepare the core module moves: import, tidy data, missing values, spreadsheets, JSON and lists.

- [R for Data Science - Data import](https://r4ds.hadley.nz/data-import.html): importing delimited files with `readr`.
- [R for Data Science - Data tidying](https://r4ds.hadley.nz/data-tidy.html): reshaping tables with tidy data principles.
- [R for Data Science - Missing values](https://r4ds.hadley.nz/missing-values.html): distinguishing explicit, coded and implicit missing values.
- [R for Data Science - Factors](https://r4ds.hadley.nz/factors.html): manipulating categorical variables.
- [R for Data Science - Spreadsheets](https://r4ds.hadley.nz/spreadsheets.html): importing Excel files cleanly.
- [R for Data Science - Hierarchical data](https://r4ds.hadley.nz/rectangling.html): understanding lists, JSON and nested data.

After the readings, complete the [formative mini-test](mini_test.llms.md). It is not graded; it checks the basics before the adventure.

2 Adventure Diagnose a real file and correct fragile variables. [Adventure](aventure.llms.md) Open cardCollapse

Goal Diagnose an insurance archive with Alex and build a first cleaning log.

Resource [Adventure page](aventure.llms.md)

Action Import `dataset_pratique.csv`, spot anomalies and document decisions.

Result A first explainable version of `donnees_propres.csv` and `journal_nettoyage`.

The story thread is guided: traceability matters more than perfection.

3 Challenge Deliver a cleaned table with justified transformations. [Challenge](defi.llms.md) Open cardCollapse

Goal Rework the same insurance file independently and deliver a clean version.

Resource [Challenge page](defi.llms.md)

Submit A `.qmd` file, `donnees_propres.csv` and `journal_nettoyage.Rdata`.

Check that the import produces 23 columns before cleaning.

4 Exercises Practice technical moves on autonomous data. [Exercises](exercices.llms.md) Open cardCollapse

Resource [Exercises page](exercices.llms.md)

Scope These exercises are not a continuation of the challenge. They use `policies.csv`, `coverage.json`, `quotes_2024.xlsx` and two distinct fictitious datasets.

Cases A university scholarship file and a municipal equipment inventory.

Redo at least one passage without looking at the solution immediately.

## Data and Tools

### Datasets

[dataset_pratique.csv](../donnees.llms.md#dataset-card-dataset-pratique) [policies.csv](../donnees.llms.md#dataset-card-policies-module-04) [coverage.json](../donnees.llms.md#dataset-card-coverage-module-04) [quotes_2024.xlsx](../donnees.llms.md#dataset-card-quotes-module-04) [fictitious_scholarship_applications.csv](data/fictitious_scholarship_applications.csv) [fictitious_municipal_equipment.csv](data/fictitious_municipal_equipment.csv) [fictitious_equipment_rules.json](data/fictitious_equipment_rules.json)

### R packages

[readr](../packages.llms.md#readr) [readxl](../packages.llms.md#readxl) [dplyr](../packages.llms.md#dplyr) [tidyr](../packages.llms.md#tidyr) [jsonlite](../packages.llms.md#jsonlite) [janitor](../packages.llms.md#janitor) [stringr](../packages.llms.md#stringr) [forcats](../packages.llms.md#forcats) [tibble](../packages.llms.md#tibble) [ggplot2](../packages.llms.md#ggplot2)

## Review and Extension

### Finish the module with the course AI assistant

Before moving to the next module, use the course AI assistant as a review partner: ask it to question your reasoning, identify fragile code and suggest one realistic improvement to the challenge.

- Explain the finished product in three sentences.
- Paste a code or output excerpt and ask for a diagnosis.
- Ask for a more ambitious variant, then choose what remains reasonable.
