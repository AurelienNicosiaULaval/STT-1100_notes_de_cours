# Factors and data cleaning

Module 04

Clean real data and prepare variables that can be used in analysis.

Main threadImport, cleaning and lists

DataCSV, Excel, JSON and nested data

ChallengeCleaned and documented dataset

## Finished Product

Final product

### A cleaned and documented table

The chapter leads to a usable version of a real file, with cleaning choices explained and inconsistencies made visible.

**clean data**

types corrected

factors recoded

list explored

types corrected factors recoded list explored

## Module Objectives

At the end of this module, you should be able to

- Import data from different formats (`txt`, `csv`, `excel`, `json`).
- Clean and recode data to ensure its quality.
- Use the `forcats` and `stringr` libraries to manipulate factors and character strings.
- Create and use lists.

## Learning Plan

The cards follow the four blocks of the learning plan: readings, adventure, challenge, exercises. Open the cards to see the expected action and useful link.

1 Readings Prepare import, cleaning, strings, factors and lists. In this card Open cardCollapse

### Initial readings

#### Readings to do before the adventure

In this module, we will explore the basic concepts of data import and data cleansing. Here is some initial reading to prepare you:

- [**R for Data Science – Data import**](https://r4ds.hadley.nz/data-import.html)
  This chapter introduces you to importing data with the `readr` package.

- [**R for Data Science – Data tidying**](https://r4ds.hadley.nz/data-tidy.html)
  This chapter introduces you to data manipulation with the `dplyr` package.

- [**R for Data Science – Factors**](https://r4ds.hadley.nz/factors.html)
  This chapter introduces you to **factors** in R, which are categorical variables.
  \> **Note**: Although this chapter is more widely used in module 4, some useful functions like `factor()` or `fct_reorder()` can already help you manipulate categorical variables (module 3).

- [**R for Data Science – Import spreadsheets**](https://r4ds.hadley.nz/spreadsheets.html)
  This chapter introduces you to importing data from Excel files.

- [**R for Data Science – Lists**](https://r4ds.hadley.nz/rectangling.html#lists)
  This section introduces you to the concept of lists in programming.

2 Adventure Diagnose a real file and correct fragile variables. [Adventure](aventure.llms.md) Open cardCollapse

Goal Move from reading to guided practice.

Resource [Adventure page](aventure.llms.md)

Action Follow the instructions, run the code and keep important outputs.

Result A first work object that you can explain.

Pause after each important result and state what it shows.

3 Challenge Deliver a cleaned table with justified transformations. In this card Open cardCollapse

### Challenge

At the end of the adventure, you should be able to have placed the following elements in your Github folder:

- the `.qmd` script for your adventure, that is to say a document where you do your tests and build your cleaning_journal list;

- the `journal_nettoyage` list in a `.Rdata` object;

- the cleaned database in `.csv.` format

4 Exercises Redo imports, recoding and quality checks. [Exercises](exercices.llms.md) Open cardCollapse

Resource [Exercises page](exercices.llms.md)

Why Exercises stay on a separate page because they take more space.

Redo at least one passage without looking at the solution immediately.

## Data and Tools

### Datasets

[dataset_pratique.csv](../donnees.llms.md#dataset-card-dataset-pratique) [policies.csv](../donnees.llms.md#dataset-card-policies-module-04) [coverage.json](../donnees.llms.md#dataset-card-coverage-module-04) [quotes_2024.xlsx](../donnees.llms.md#dataset-card-quotes-module-04)

### R packages

[readr](../packages.llms.md#readr) [readxl](../packages.llms.md#readxl) [dplyr](../packages.llms.md#dplyr) [tidyr](../packages.llms.md#tidyr) [jsonlite](../packages.llms.md#jsonlite) [janitor](../packages.llms.md#janitor) [stringr](../packages.llms.md#stringr) [forcats](../packages.llms.md#forcats) [messy](../packages.llms.md#messy)

## Review and Extension

### Finish the module with the course AI assistant

Before moving to the next module, use the course AI assistant as a review partner: ask it to question your reasoning, identify fragile code and suggest one realistic improvement to the challenge.

- Explain the finished product in three sentences.
- Paste a code or output excerpt and ask for a diagnosis.
- Ask for a more ambitious variant, then choose what remains reasonable.
