# Beyond data: text and dashboard

Module 10

Communicate an analysis with text, tables and reader-oriented outputs.

Main threadText, sentiment and dashboard

DataComments and working corpora

ChallengeText analysis or dashboard

## Finished Product

Final product

### A shareable dashboard or text analysis

The final module combines text exploration, visualizations and communication in an object another person can consult.

**dashboard**

text prepared

chart

interactive reading

text prepared chart interactive reading

## Module Objectives

At the end of this module, you should be able to:

- Clean and analyze textual data.
- Build a simple sentiment lexicon in French.
- Visualize lexical and emotional trends over time.
- Use TF-IDF to identify distinctive words.
- Create an interactive dashboard with `flexdashboard` and `shiny`.

## Learning Plan

The cards follow the four blocks of the learning plan: readings, adventure, challenge, exercises. Open the cards to see the expected action and useful link.

1 Readings Prepare text, dashboards and interactive communication. In this card Open cardCollapse

### Readings

To prepare, check out the following resources:

- [Tidytext Text Mining](https://www.tidytextmining.com/) – Chapters 1 to 3 - This book introduces you to the basics of word processing with R.
- [tidytext documentation - `unnest_tokens()`](https://juliasilge.github.io/tidytext/reference/unnest_tokens.html) - This page explains how to transform a text column into tokens.
- [tidytext documentation - `bind_tf_idf()`](https://juliasilge.github.io/tidytext/reference/bind_tf_idf.html) - This page describes TF-IDF calculation in a tidy table.
- [Flexdashboard documentation (RStudio)](https://rmarkdown.rstudio.com/flexdashboard/) - this document guides you in creating interactive dashboards with `flexdashboard`.
- [Using Shiny with flexdashboard](https://rstudio.github.io/flexdashboard/articles/shiny.html) - This guide shows how to integrate interactive elements into dashboards with `shiny`.
- [Posit - Shiny Basics](https://shiny.posit.co/r/getstarted/shiny-basics/lesson1/) - This introduction situates the structure of an interactive application.

After the readings, check the key ideas with the [module 10 formative mini-test](mini_test.llms.md).

2 Adventure Turn texts into shareable visual results. [Adventure](aventure.llms.md) Open cardCollapse

Goal Move from reading to guided practice.

Resource [Adventure page](aventure.llms.md)

Action Follow the instructions, run the code and keep important outputs.

Result A first work object that you can explain.

Pause after each important result and state what it shows.

3 Challenge Open locally or share a coherent final dashboard. [Challenge](defi.llms.md) Open cardCollapse

### Challenge - Local or shared dashboard

You need to build an interactive dashboard from the template provided. This dashboard must:

- Display a sentiment score per week;
- Identify distinctive words (TF-IDF) or a word cloud;
- Analyze numerical variables (`plaisir`, `engagement`, `difficulte`);
- Be personalized (filtering, colors, summary);
- Work locally; be deployed or shared only if that instruction is given in class.

The complete instructions are available on the [Challenge 10](defi.llms.md) page. The starter repository is `STT-1100/aventure-10`. Local functionality is the minimum expectation; deployment depends on the instructions given in class.

4 Exercises Consolidate tokens, sentiment, TF-IDF and dashboard summaries. [Exercises](exercices.llms.md) Open cardCollapse

Resource [Exercises page](exercices.llms.md)

Why Exercises are independent from the adventure and challenge. They use fictitious library and cultural-workshop comments to practise text analysis without touching STT-1100 feedback.

Redo at least one passage without looking at the solution immediately.

## Data and Tools

### Datasets

[Working comments and texts](../donnees.llms.md#dataset-card-textes-module-10) [fictitious_library_comments.csv](../donnees.llms.md#dataset-card-module10-commentaires-bibliotheques) [fictitious_culture_workshops.csv](../donnees.llms.md#dataset-card-module10-ateliers-culture)

### R packages

[tidyverse](../packages.llms.md#tidyverse) [tidytext](../packages.llms.md#tidytext) [readr](../packages.llms.md#readr) [stringr](../packages.llms.md#stringr) [dplyr](../packages.llms.md#dplyr) [tibble](../packages.llms.md#tibble) [ggplot2](../packages.llms.md#ggplot2) [stopwords](../packages.llms.md#stopwords) [tidyr](../packages.llms.md#tidyr) [forcats](../packages.llms.md#forcats) [wordcloud](../packages.llms.md#wordcloud) [wordcloud2](../packages.llms.md#wordcloud2) [ggwordcloud](../packages.llms.md#ggwordcloud) [plotly](../packages.llms.md#plotly) [flexdashboard](../packages.llms.md#flexdashboard) [shiny](../packages.llms.md#shiny)

## Review and Extension

### Finish the module with the course AI assistant

Before moving to the next module, use the course AI assistant as a review partner: ask it to question your reasoning, identify fragile code and suggest one realistic improvement to the challenge.

- Explain the finished product in three sentences.
- Paste a code or output excerpt and ask for a diagnosis.
- Ask for a more ambitious variant, then choose what remains reasonable.
