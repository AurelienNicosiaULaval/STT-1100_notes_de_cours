# Beyond data: text and dashboard

Module 10

Communicate an analysis with text, tables and reader-oriented outputs.

Main threadText, sentiment and dashboard

DataComments and working corpora

ChallengeLocal interactive dashboard

## Finished Product

Final product

### An interactive dashboard supported by text analysis

The final module combines text exploration, visualizations and communication in a dashboard that can be opened locally.

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

## Prepare for the module

### Prerequisites

Revisit model limits from Module 9, basic text transformations and privacy principles from Module 7. The template is in `Rmd` because the requested dashboard uses `flexdashboard`; the rest of the course remains in Quarto.

### Minimum route

Start with the supplied fictitious data. Make the template work locally, add one filter, one chart and a short conclusion. Text analysis supports the dashboard: it does not replace the deliverable.

### Extensions after the minimum

Then add sentiment, TF-IDF and numerical variables, followed only by more ambitious options such as a word cloud, `plotly` or advanced customization.

### Course feedback

Use real feedback only when the instructor confirms it. Remove identifying information, keep the minimum anonymized version and never share the data or a public link without explicit permission.

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

#### Posit cheat sheets

- [String manipulation with stringr :: Cheatsheet](https://rstudio.github.io/cheatsheets/strings.pdf) - clean text before tokenization.
- [Data tidying with tidyr :: Cheatsheet](https://rstudio.github.io/cheatsheets/tidyr.pdf) - reshape text outputs and dashboard tables.
- [Data transformation with dplyr :: Cheatsheet](https://rstudio.github.io/cheatsheets/data-transformation.pdf) - produce summaries and scores.
- [Data visualization with ggplot2 :: Cheat Sheet](https://rstudio.github.io/cheatsheets/data-visualization.pdf) - prepare static dashboard charts.
- [rmarkdown :: Cheatsheet](https://rstudio.github.io/cheatsheets/rmarkdown.pdf) - useful reference points for R Markdown based dashboards.
- [Shiny for R :: Cheatsheet](https://rstudio.github.io/cheatsheets/shiny.pdf) - interactive components and basic reactive logic.

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

Why Exercises are independent from the adventure and challenge. They use Données Québec descriptions and SIT Québec events to practise text analysis on real public text.

Redo at least one passage without looking at the solution immediately.

## Data and Tools

### Datasets

[Download the module workspace (.zip)](../../downloads/donnees/stt1100-module-10-en.zip)

[Working comments and texts](../donnees.llms.md#dataset-card-textes-module-10) [Données Québec descriptions](data/quebec_dataset_descriptions.csv) [Quebec tourism events](data/quebec_tourism_events.csv)

### R packages

[tidyverse](../packages.llms.md#tidyverse) [tidytext](../packages.llms.md#tidytext) [readr](../packages.llms.md#readr) [stringr](../packages.llms.md#stringr) [dplyr](../packages.llms.md#dplyr) [tibble](../packages.llms.md#tibble) [ggplot2](../packages.llms.md#ggplot2) [stopwords](../packages.llms.md#stopwords) [tidyr](../packages.llms.md#tidyr) [forcats](../packages.llms.md#forcats) [wordcloud](../packages.llms.md#wordcloud) [wordcloud2](../packages.llms.md#wordcloud2) [ggwordcloud](../packages.llms.md#ggwordcloud) [plotly](../packages.llms.md#plotly) [flexdashboard](../packages.llms.md#flexdashboard) [shiny](../packages.llms.md#shiny)

## Review and Extension

### Finish the module with the course AI assistant

Open [the AI page](../ia.llms.md) or [GPT STT-1100](https://chatgpt.com/g/g-682d165f32e881918633affa3fe9dfd6-gpt-stt-1100), then ask for targeted feedback:

*Here is my work for this module. Question my reasoning, identify one fragile line of code, check whether my interpretation answers the instructions, then suggest one realistic improvement I can make myself.*

- Explain the finished product in three sentences.
- Paste a code or output excerpt and ask for a diagnosis.
- Ask for a more ambitious variant, then choose what remains reasonable.
