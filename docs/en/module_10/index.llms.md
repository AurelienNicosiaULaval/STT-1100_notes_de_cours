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
- [Flexdashboard documentation (RStudio)](https://rmarkdown.rstudio.com/flexdashboard/) - this document guides you in creating interactive dashboards with `flexdashboard`.
- [Shiny for dashboards](https://rstudio.github.io/flexdashboard/using.html#shiny_interaction) - This guide shows you how to integrate interactive elements into your dashboards with `shiny`.

2 Adventure Turn texts into shareable visual results. [Adventure](aventure.llms.md) Open cardCollapse

Goal Move from reading to guided practice.

Resource [Adventure page](aventure.llms.md)

Action Follow the instructions, run the code and keep important outputs.

Result A first work object that you can explain.

Pause after each important result and state what it shows.

3 Challenge Deploy or present a coherent final dashboard. In this card Open cardCollapse

### Challenge — Deployed Dashboard

You need to build an interactive dashboard from the template provided. This dashboard must:

- Display a sentiment score per week;
- Identify distinctive words (TF-IDF) or a word cloud;
- Analyze numerical variables (`pleasure`, `commitment`, `difficulty`);
- Be personalized (filtering, colors, summary);
- Be deployed and shared with Anne-Sophie.

## Data and Tools

### Datasets

[Working comments and texts](../donnees.llms.md#dataset-card-texts-module-10)

### R packages

[tidytext](../packages.llms.md#tidytext) [stringr](../packages.llms.md#stringr) [dplyr](../packages.llms.md#dplyr) [tibble](../packages.llms.md#tibble) [ggplot2](../packages.llms.md#ggplot2) [stopwords](../packages.llms.md#stopwords) [tidyr](../packages.llms.md#tidyr) [forcats](../packages.llms.md#forcats) [wordcloud](../packages.llms.md#wordcloud) [wordcloud2](../packages.llms.md#wordcloud2) [ggwordcloud](../packages.llms.md#ggwordcloud) [plotly](../packages.llms.md#plotly) [flexdashboard](../packages.llms.md#flexdashboard) [shiny](../packages.llms.md#shiny)

## Review and Extension

### Finish the module with the course AI assistant

Before moving to the next module, use the course AI assistant as a review partner: ask it to question your reasoning, identify fragile code and suggest one realistic improvement to the challenge.

- Explain the finished product in three sentences.
- Paste a code or output excerpt and ask for a diagnosis.
- Ask for a more ambitious variant, then choose what remains reasonable.
