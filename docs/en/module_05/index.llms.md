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

## Learning Plan

The cards follow the four blocks of the learning plan: readings, adventure, challenge, exercises. The adventure and challenge form the module story. Exercises are independent and consolidate the same moves on other data.

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

- [**Introduction to modern statistics – Exploring numerical data**](https://openintro-ims.netlify.app/explore-numerical)
  This chapter reinforces numerical summaries, graphs and descriptive comparisons.
- [**Introduction to modern statistics – Applications: Explore**](https://openintro-ims.netlify.app/explore-applications)
  This chapter introduces you to best practices for exploratory data modeling.

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

Scope These exercises are not the continuation of the challenge. They use fictitious workshop, library and campus-service data to practise the same moves in other contexts.

Redo at least one passage without looking at the solution immediately.

## Data and Tools

### Datasets

[flights_merged_2023.rds](../donnees.llms.md#dataset-card-flights-merged-2023)

### R packages

[tidyverse](../packages.llms.md#tidyverse) [lubridate](../packages.llms.md#lubridate) [dplyr](../packages.llms.md#dplyr) [ggplot2](../packages.llms.md#ggplot2)

## Review and Extension

### Finish the module with the course AI assistant

Open [the AI page](../ia.llms.md) or [GPT STT-1100](https://chatgpt.com/g/g-682d165f32e881918633affa3fe9dfd6-gpt-stt-1100), then ask for targeted feedback:

*Here is my work for this module. Question my reasoning, identify one fragile line of code, check whether my interpretation answers the instructions, then suggest one realistic improvement I can make myself.*

- Explain the finished product in three sentences.
- Paste a code or output excerpt and ask for a diagnosis.
- Ask for a more ambitious variant, then choose what remains reasonable.
