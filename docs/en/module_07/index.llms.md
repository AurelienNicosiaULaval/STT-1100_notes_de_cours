# Visualization, ethics and data security

Module 07

Connect visualization choices, responsibility and data protection.

Main threadResponsible visualization and privacy

DataCOVID data and ethical cases

ChallengeCommented visualizations and ethics note

## Finished Product

Final product

### Responsible visualizations with an ethics note

The expected result shows sensitive data carefully and explains choices about protection, interpretation and communication.

**ethical visuals**

clear message

risks noted

data protected

clear message risks noted data protected

## Module Objectives

At the end of this module, you should be able to:

- Identify ethical issues in visualizations.
- Correctly anonymize data.
- Apply good visualization practices to represent data clearly and honestly.
- Identify and avoid data presentation bias.
- Understand the ethical and confidentiality issues related to data science.
- Implement measures to protect and secure sensitive data.
- Explain the CRAP principles.
- Explain the FAIR principles.

## Prepare for the module

### Prerequisites

Revisit one chart from Module 5 and one cleaning decision from Module 4. This module asks you to connect a technical output to its consequences for people represented in the data.

### Minimum route

Identify one chart problem, one re-identification risk and one limit of the analysis, then propose a verifiable correction. A short, precise ethics note is better than a general promise.

### CRAP and FAIR in practice

Use CRAP to review contrast, repetition, alignment and proximity in a visualization. Use FAIR to ask whether data and documentation can be found, understood and responsibly reused.

### Readings and help

Start with the essential resources listed in the plan, then reserve deeper readings for review. When uncertain, do not publish potentially identifying information.

## Learning Plan

The cards follow the five steps of the learning plan: readings, adventure, challenge, exercises and AI feedback. The adventure and challenge form the module story. Exercises are autonomous and consolidate the same reflexes in other contexts. AI feedback revisits work you have already completed; it does not require an additional submission.

1 Readings Prepare responsible visualizations, confidentiality and ethics. In this card Open cardCollapse

### Readings

To prepare, check out the following resources:

- [R for Data Science - Communication](https://r4ds.hadley.nz/communication.html)
- [Fundamentals of Data Visualization - Directory of visualizations](https://clauswilke.com/dataviz/directory-of-visualizations.html)
- [Royal Statistical Society - Best Practices for Data Visualisation](https://royal-statistical-society.github.io/datavisguide/RSS-data-vis-guide.pdf)
- [Gouvernement du Québec - Anonymisation](https://www.quebec.ca/gouvernement/travailler-gouvernement/normes-gouvernance-pratiques-internes/protection-des-renseignements-personnels/anonymisation)
- [CNIL - Anonymisation of personal data](https://www.cnil.fr/fr/technologies/lanonymisation-de-donnees-personnelles)
- [Wilkinson et al. (2016) - FAIR Guiding Principles](https://www.nature.com/articles/sdata201618)

#### Posit cheat sheet

- [Data visualization with ggplot2 :: Cheat Sheet](https://rstudio.github.io/cheatsheets/data-visualization.pdf)
  Quick reference for rebuilding readable and defensible visualizations.

Check After the readings, complete the [formative mini-test](mini_test.llms.md).

2 Adventure Turn sensitive data into careful visual messages. [Adventure](aventure.llms.md) Open cardCollapse

Goal Move from reading to guided practice.

Resource [Adventure page](aventure.llms.md)

Action Follow the instructions, run the code and keep important outputs.

Result A first work object that you can explain.

Pause after each important result and state what it shows.

3 Challenge Analyze visualizations with an argued ethics note. [Challenge](defi.llms.md) Open cardCollapse

### Challenge - Ethical analysis and responsible visualizations

You will turn the adventure audit into a reproducible ethics note:

- identify specific problems in the initial report;
- produce an anonymized version of the data;
- create two corrected and defensible visualizations;
- state limitations and residual risks.

[View challenge 7](defi.llms.md)

4 Exercises Practise responsible charts, anonymization and ethics notes. [Exercises](exercices.llms.md) Open cardCollapse

Resource [Exercises page](exercices.llms.md)

Why Exercises use real aggregate data from Sherbrooke, Statistics Canada and Données Québec to practise responsible publication without repeating the challenge.

Before opening a solution, state the ethical or visual risk you are trying to reduce.

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

[Download the module workspace (.zip)](../../downloads/donnees/stt1100-module-07-en.zip)

[covid_module7_douteux.csv](../donnees.llms.md#dataset-card-covid-module-07) [Aggregated Sherbrooke incidents](data/incidents_securite_sherbrooke_agreges.csv) [Sherbrooke population](data/population_sherbrooke_2022_2024.csv) [Données Québec user survey](data/sondage_utilisateurs_donnees_quebec_2020_2025.csv)

### R packages

[tidyverse](../packages.llms.md#tidyverse) [ggplot2](../packages.llms.md#ggplot2) [dplyr](../packages.llms.md#dplyr) [readr](../packages.llms.md#readr) [lubridate](../packages.llms.md#lubridate) [scales](../packages.llms.md#scales)
