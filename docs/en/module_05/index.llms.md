# Explore and understand relationships between variables

Module 05

Explore links between variables and interpret associations without overclaiming.

Main threadRelationships, dates and correlations

DataPolicies, coverage and flights

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

The cards follow the four blocks of the learning plan: readings, adventure, challenge, exercises. Open the cards to see the expected action and useful link.

1 Readings Prepare dates, correlations and relationships between variables. In this card Open cardCollapse

### Readings

In this module, we will explore the basic concepts of exploratory data analysis (EDA) and date and time manipulation. Here is some initial reading to prepare you:

- [**R for Data Science – EDA**](https://r4ds.hadley.nz/EDA.html)
  This chapter introduces you to exploratory data analysis (EDA) with the `ggplot2` package.

- [**R for Data Science – Dates and Times**](https://r4ds.hadley.nz/datetimes.html)
  This chapter introduces you to the manipulation of dates and times with the `lubridate` package.

You can also review the following chapter:

- [**R for Data Science – Tidy Data**](https://r4ds.hadley.nz/data-tidy.html)
  This chapter reminds you of the principles of the “tidy” data structure and how to apply them with `tidyr`.

In the free **IMS**:

- [**Introduction to modern statistics – Applications: Explore**](https://openintro-ims.netlify.app/explore-applications)
  This chapter introduces you to best practices for exploratory data modeling.

2 Adventure Explore delays, dates and associations in a large table. [Adventure](aventure.llms.md) Open cardCollapse

Goal Move from reading to guided practice.

Resource [Adventure page](aventure.llms.md)

Action Follow the instructions, run the code and keep important outputs.

Result A first work object that you can explain.

Pause after each important result and state what it shows.

3 Challenge Write a cautious EDA report about delays. In this card Open cardCollapse

### Challenge — Analyze delays to support decisions

In this challenge, you must submit a **professional report** intended for your supervisor, **Dr Sofia Martínez**, in order to answer the three major strategic questions posed in the adventure. Your role is to provide clear analysis, supported by relevant visualizations and rigorous interpretations.

#### What you should do

From the merged data provided (`flights_merged_2023.rds`), you must:

1.  **Explore temporal variables** (`date`, `day_week`, `moment_day`, etc.) and prepare them if necessary.
2.  **Answer Sofia’s three big questions**:
    - What time slots should you avoid to reduce delays?
    - To what extent is the weather responsible for the delays?
    - Are older planes more often delayed or canceled?
3.  For each question:
    - carry out a relevant **exploratory analysis**;
    - produce **at least one clear visualization**;
    - write a **concise interpretation** of your results.

#### What the report should contain

Your **`rapport.qmd`** file must include:

- A short **introduction** which recalls the context (work at JFK, role with Sofia, etc.).
- A section for each **question** of the brief.
- Your **analyses** (reproducible R code, tables or graphs, comments).
- Your **interpretations** to highlight the key findings.
- A **short conclusion** which summarizes the answers given to managers.

#### Upload and rendering

- Publish the report to your GitHub repository in the course organization.
- Make sure that the `.html` file is properly generated and readable.
- Do a final proofread to check **clarity, structure and presentation**.

> Tip: Put yourself in the shoes of a professional analyst — this report could be presented to the airport executive committee!

------------------------------------------------------------------------

#### Evaluation grid (10 points)

| Criterion | Description | Points |
|----|----|----|
| **Time exploration (`lubridate`)** | Creation of `date`, `day_week`, `moment_day` variables; good use of `lubridate`. | 2 |
| **Time slot analysis** | Relevance of the analysis, quality of visualization and interpretation. | 2 |
| **Weather analysis** | Judicious choice of weather variables, test of relationship with delays, correct interpretation. | 2 |
| **Analysis of old planes** | Construction of `age_avion`, correct analysis of delays or cancellations, relevant interpretation. | 2 |
| **Structure and presentation of the report** | Clear, well-structured, visually readable report; well-annotated visualizations; commented code. | 2 |

> **Bonus** possible (max +1) for an original additional analysis (e.g.: analysis by company or distance).

4 Exercises Consolidate charts, correlations and interpretations. [Exercises](exercices.llms.md) Open cardCollapse

Resource [Exercises page](exercices.llms.md)

Why Exercises stay on a separate page because they take more space.

Redo at least one passage without looking at the solution immediately.

## Data and Tools

### Datasets

[policies.csv](../donnees.llms.md#dataset-card-policies-module-05) [quotes_2024.xlsx](../donnees.llms.md#dataset-card-quotes-module-05)

### R packages

[lubridate](../packages.llms.md#lubridate) [readr](../packages.llms.md#readr) [readxl](../packages.llms.md#readxl) [dplyr](../packages.llms.md#dplyr) [tidyr](../packages.llms.md#tidyr) [jsonlite](../packages.llms.md#jsonlite) [janitor](../packages.llms.md#janitor) [ggcorrplot](../packages.llms.md#ggcorrplot)

## Review and Extension

### Finish the module with the course AI assistant

Before moving to the next module, use the course AI assistant as a review partner: ask it to question your reasoning, identify fragile code and suggest one realistic improvement to the challenge.

- Explain the finished product in three sentences.
- Paste a code or output excerpt and ask for a diagnosis.
- Ask for a more ambitious variant, then choose what remains reasonable.
