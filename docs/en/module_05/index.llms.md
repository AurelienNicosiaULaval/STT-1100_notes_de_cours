# Explore and understand relationships between variables

Module 05

Explore links between variables and interpret associations without overclaiming.

Main threadRelationships, dates and correlations

DataEnriched 2023 flights

ChallengeReasoned exploration of relationships

## Finished Product

Final product

### An exploratory analysis of relationships

The finished product connects variables, compares patterns and gives a cautious interpretation of observed associations.

**EDA report**

correlation

dates

scatterplots

correlation dates scatterplots

## Module Objectives

At the end of this module, you should be able to:

- Manage and analyze temporal variables using `lubridate`.
- Study the relationship between two variables using graphs and descriptive statistics, particularly using the correlation coefficient.
- Calculate and interpret the correlation between two numerical variables.
- Write an exploratory data analysis (EDA) report highlighting trends and patterns in the data.

## Prepare for the module

### Returning after the exam

Before starting, render an earlier Quarto document again, revisit a chart from Module 3 or 4 and check a small `dplyr` summary. This restart is intentional after the break and exam.

### Minimum route

Create a date variable, summarize a relationship with group sizes, produce a chart and write a descriptive conclusion. Keep the terms “association” and “causation” distinct.

### Do not overclaim

A correlation or visible trend does not prove that one variable causes another. Small groups and missing values belong in the interpretation.

### If you get stuck

First reproduce one guided analysis of the flights, then adapt one variable or one chart. Add secondary analyses only after a clear render.

## Learning Plan

The cards follow the five steps of the learning plan: readings, adventure, challenge, exercises and AI feedback. The adventure and challenge form the module story. Exercises are independent and consolidate the same moves on other data. AI feedback revisits work you have already completed; it does not require an additional submission.

1 Readings Prepare dates, correlations and relationships between variables. In this card Open cardCollapse

### Readings

In this module, we will explore the basic concepts of exploratory data analysis (EDA) and date and time manipulation. Here is some initial reading to prepare you:

- [**R for Data Science – EDA**](https://r4ds.hadley.nz/EDA.html)
  This chapter introduces you to exploratory data analysis (EDA) with the `ggplot2` package.

- [**R for Data Science – Dates and Times**](https://r4ds.hadley.nz/datetimes.html)
  This chapter introduces you to the manipulation of dates and times with the `lubridate` package.

You can also review the following chapters:

- [**R for Data Science – Data visualization**](https://r4ds.hadley.nz/data-visualize.html)
  This chapter helps you choose and annotate graphs suited to exploratory questions.

- [**R for Data Science – Missing values**](https://r4ds.hadley.nz/missing-values.html)
  This chapter reviews why missing values should be identified before interpreting a summary.

In the free **IMS**:

- [**Introduction to modern statistics – Exploring numerical data**](https://openintrostat.github.io/ims/explore-numerical)
  This chapter reinforces numerical summaries, graphs and descriptive comparisons.
- [**Introduction to modern statistics – Applications: Explore**](https://openintrostat.github.io/ims/explore-applications)
  This chapter introduces you to best practices for exploratory data modeling.

#### Posit cheat sheets

- [Dates and times with lubridate :: Cheatsheet](https://rstudio.github.io/cheatsheets/lubridate.pdf)
  Create, extract and manipulate dates and times.
- [Data visualization with ggplot2 :: Cheat Sheet](https://rstudio.github.io/cheatsheets/data-visualization.pdf)
  Compare distributions, trends and associations.

After the readings, complete the [formative mini-test](mini_test.llms.md). It is not graded; it checks the basics before the adventure.

2 Adventure Explore delays, dates and associations in a large table. [Adventure](aventure.llms.md) Open cardCollapse

Goal Move from reading to guided practice.

Resource [Adventure page](aventure.llms.md)

Action Follow the instructions, run the code and keep important outputs.

Result A first work object that you can explain.

Pause after each important result and state what it shows.

3 Challenge Write a cautious EDA report about delays. [Challenge](defi.llms.md) Open cardCollapse

### Challenge - EDA report

You prepare a short exploratory report on flight delays by connecting graphs, observed associations and a cautious conclusion.

- Goal: state a question, produce useful visualizations and interpret without overclaiming.
- Deliverables: `rapport.qmd`, `rapport.html` and the provided data.
- Watch point: clearly distinguish association from causation.

The full instructions are available in the [Challenge 5](defi.llms.md) page.

4 Exercises Consolidate charts, correlations and interpretations. [Exercises](exercices.llms.md) Open cardCollapse

Resource [Exercises page](exercices.llms.md)

Scope These exercises are not the continuation of the challenge. They use Laval bicycle counts, Québec City air-quality measurements and Gatineau traffic volumes.

Redo at least one passage without looking at the solution immediately.

5 AI feedback Have one excerpt of your work reviewed, then decide what to improve yourself. [/retroaction mode](../ia.llms.md) Open cardCollapse

Starting point Choose one actual element produced in the adventure, challenge or exercises: a code excerpt, chart, interpretation or methodological choice.

Prepare Provide the instruction, context, what you tried and the exact element you want reviewed.

Ask Open [GPT STT-1100](https://chatgpt.com/g/g-682d165f32e881918633affa3fe9dfd6-gpt-stt-1100) in `/retroaction` mode. Ask for one strength, one weakness to verify and one question that will help you revise.

Decide Compare the response with your data and the instructions. Revise only what you understand and can explain.

Copy-ready request

`/retroaction I am finishing this module. Here are the target instructions, what I tried and the exact excerpt I want to improve. Give me one strength, one weakness to verify and one question that will help me revise it myself. Do not rewrite the entire work.`

Expected result One improvement you understand and apply to your work, or a clear reason not to follow the suggestion. There is no portfolio or additional submission to produce.

Privacy Do not share personal, confidential or protected data.

## Data and Tools

### Datasets

[Download the module workspace (.zip)](../../downloads/donnees/stt1100-module-05-en.zip)

[flights_merged_2023.rds](../donnees.llms.md#dataset-card-flights-merged-2023) [Laval bicycle counts](data/comptages_velos_laval_2016_06.csv) [Québec City air quality](data/qualite_air_quebec_vieux_limoilou_2025_07.csv) [Gatineau traffic volumes](data/debits_circulation_gatineau_2016_2023.csv)

### R packages

[tidyverse](../packages.llms.md#tidyverse) [lubridate](../packages.llms.md#lubridate) [dplyr](../packages.llms.md#dplyr) [ggplot2](../packages.llms.md#ggplot2)
