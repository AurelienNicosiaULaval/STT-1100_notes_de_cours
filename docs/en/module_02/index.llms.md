# GitHub and data visualization

Module 02

Organize data work and produce readable visualizations.

Main threadGitHub, import and charts

DataPenguins and Excel tables

ChallengeGitHub repository and commented charts

## Finished Product

Final product

### A readable GitHub repository with commented charts

The expected product combines an organized project, a few charts and version-control messages that document the work.

**GitHub repo**

clean commit

annotated chart

shared project

clean commit annotated chart shared project

## Module Objectives

At the end of this module, you should be able to

- Use GitHub via RStudio to clone a repository and make commits and pushes.

- Read an `xls` file in RStudio.

- Manage and transform digital data using `dplyr` (`glimpse`, `select`, `mutate`, `filter`).

- Calculate and interpret descriptive statistics for numerical variables (`mean`, `median`, `standard deviation`, `variance`, `range`, `quantiles`), including for subgroups of data.

- Visualize numerical variables with `ggplot2` (`histogram`, `box plot`, `scatter plot`) and interpret the resulting graphs.

- Produce and interpret graphs comparing the distribution of continuous variables between groups (`superimposed histograms`, `juxtaposed box plots`, `stacked densities (ridge plots)`, `facet visualization`).

- Use `ggplot2` options to improve the quality of graphs (titles, legends, readable axes, graphic consistency, `facets`).

## Learning Plan

The cards follow the four blocks of the learning plan: readings, adventure, challenge, exercises. Open the cards to see the expected action and useful link.

1 Readings Prepare GitHub, RStudio projects and the grammar of graphics. In this card Open cardCollapse

### Initial readings

As module 2 is spread over 2 weeks, there is a little more reading, to prepare yourself for the first part of the module you can skim the readings and come back to them in more detail in preparation for part 2.

We start with a few chapters in the famous R4DS by Hadley Wickham and Garrett Grolemund:

- [Data visualization](https://r4ds.hadley.nz/data-visualize.html)
  *Learn how to use `ggplot2` to create your first graphs. This introduction to data visualization shows you how to effectively represent numerical variables and how to customize your charts.*

- [Data transformation](https://r4ds.hadley.nz/data-transform.html)
  *Learn how to transform your datasets with `dplyr`: filter, sort, create new columns and summarize information. This chapter lays the foundation for tidyverse-style data manipulation.*

- [Exploratory Data Analysis (EDA)](https://r4ds.hadley.nz/EDA.html)
  *Explore your data to identify trends, detect extreme values and formulate hypotheses. This chapter presents simple but powerful techniques for visual and statistical analysis.*

- [Tidy data (spreadsheets)](https://r4ds.hadley.nz/spreadsheets.html)
  *Find out how to organize your data to make it actionable. This chapter discusses the concept of “clean data” and shows you how to recognize common table structures in Excel or CSV files.*

##### Tidyverse Style Guide

- [Best practices for visualization with ggplot2 (Tidyverse Style Guide)](https://style.tidyverse.org/ggplot2.html)

##### A new reference book

In this module, we introduce a second reference work: **Introduction to Modern Statistics** (*by Mine Çetinkaya-Rundel and Johanna Hardin*).

> Note: we will often abbreviate with **IMS**

This book, also available free online, offers a **modern and applied approach to statistics**. It emphasizes visualization, statistical intuition and best practices in data science. It constitutes an excellent complement to R4DS, in particular for deepening the statistical aspects of exploratory analyses.

- [Introduction to Modern Statistics – Chapter 5: Exploring numerical data](https://openintro-ims.netlify.app/explore-numerical)
  *In this chapter, you will learn how to explore numerical data using statistical tools like numerical summaries, histograms, and boxplots. It offers a clear and rigorous vision of data distribution.*

2 Adventure Build charts and track project versions. [Adventure](aventure.llms.md) Open cardCollapse

Goal Move from reading to guided practice.

Resource [Adventure page](aventure.llms.md)

Action Follow the instructions, run the code and keep important outputs.

Result A first work object that you can explain.

Pause after each important result and state what it shows.

3 Challenge Share a repository with commented charts and readable history. [Challenge](defi.llms.md) Open cardCollapse

### Challenge

Here is the challenge you will have to complete for **module 2**. It is divided into two parts:

**Part 1**: Complete your logbook and submit it to GitHub. Ten (10) logbooks will be selected at random and will be subject to a **summative evaluation**.

**Part 2**: Submit the **data analysis report** on GitHub that Dr. Adélie can use as part of her grant application.

The complete instructions are available on the [Challenge 2](defi.llms.md) page.

4 Exercises Practise charts, commits and short interpretations. [Exercises](exercices.llms.md) Open cardCollapse

Resource [Exercises page](exercices.llms.md)

Why Exercises stay on a separate page because they take more space.

Redo at least one passage without looking at the solution immediately.

## Data and Tools

### Datasets

[manchots_donnees.xlsx](../donnees.llms.md#dataset-card-manchots-donnees) [palmerpenguins::penguins](../donnees.llms.md#dataset-card-penguins)

### R packages

[tidyverse](../packages.llms.md#tidyverse) [palmerpenguins](../packages.llms.md#palmerpenguins) [ulavalssd](../packages.llms.md#ulavalssd) [readxl](../packages.llms.md#readxl) [ggplot2](../packages.llms.md#ggplot2) [patchwork](../packages.llms.md#patchwork)

## Review and Extension

### Finish the module with the course AI assistant

Before moving to the next module, use the course AI assistant as a review partner: ask it to question your reasoning, identify fragile code and suggest one realistic improvement to the challenge.

- Explain the finished product in three sentences.
- Paste a code or output excerpt and ask for a diagnosis.
- Ask for a more ambitious variant, then choose what remains reasonable.
