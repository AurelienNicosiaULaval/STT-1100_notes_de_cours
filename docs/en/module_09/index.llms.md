# Prediction and bias

Module 09

Build a first prediction and discuss possible biases.

Main threadRegression, prediction and bias

DataSchools, students and municipal water data

Challenge180-second video capsule

## Finished Product

Final product

### A capsule explaining prediction and bias

The finished product explains what the model learns, what it misses and how bias can enter an automated decision.

prediction capsule

simple model

limits

bias discussed

simple model limits bias discussed

## Module Objectives

At the end of this module, you should be able to:

- Fit and interpret a simple linear regression model.
- Use a simple linear regression model to obtain predictions.
- Fit and interpret a multiple linear regression model.
- Recognize and discuss potential biases, particularly those related to discrimination, in data or models.

## Prepare for the module

### Prerequisites

Revisit the interpretation of an association from Module 5 and the limits of missing data from Module 4. A prediction helps describe a model; it is not a causal conclusion.

### Minimum route

Fit the supplied model, compare a few observed and predicted values, inspect errors and name one limit. These comparisons use the fitting data: they are diagnostics, not a guarantee of performance on new data.

### Accessible video capsule

Prepare a 180-second plan, a readable visual and a short transcript or captions. The capsule should be understandable without relying only on audio.

### If you get stuck

Choose one challenge option, state the question in one sentence and create a first visual result before recording the capsule.

## Learning Plan

The cards follow the five steps of the learning plan: readings, adventure, challenge, exercises and AI feedback. Open the cards to see the expected action and useful link. AI feedback revisits work you have already completed; it does not require an additional submission.

1 Readings Prepare prediction, descriptive diagnostics and algorithmic bias. In this card Open cardCollapse

### Readings

To prepare, check out the following resources:

- [Introduction to Modern Statistics - Chapter 7: Linear regression with a single predictor](https://openintrostat.github.io/ims/model-slr)

- [Introduction to Modern Statistics - Chapter 8: Linear regression with multiple predictors](https://openintrostat.github.io/ims/model-mlr)

- [Introduction to Modern Statistics - Chapter 25: Inference for linear regression with multiple predictors](https://openintrostat.github.io/ims/inf-model-mlr#sec-inf-mult-reg-soft)

- [R documentation - `lm()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/lm.html)

- [R documentation - `predict.lm()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/predict.lm.html)

- [Government of Canada - Guide on Automated Decision-Making](https://www.canada.ca/en/government/system/digital-government/digital-government-innovations/responsible-use-ai/guide-scope-directive-automated-decision-making.html)

- [NIST SP 1270 - Towards a Standard for Identifying and Managing Bias in Artificial Intelligence](https://www.nist.gov/publications/towards-standard-identifying-and-managing-bias-artificial-intelligence)

#### Posit cheat sheets

- [Data transformation with dplyr :: Cheatsheet](https://rstudio.github.io/cheatsheets/data-transformation.pdf)
  Prepare tables before fitting and interpreting the model.

- [Data visualization with ggplot2 :: Cheat Sheet](https://rstudio.github.io/cheatsheets/data-visualization.pdf)
  Visualize descriptive diagnostics, predictions and errors.

After the readings, check the key ideas with the [module 9 formative mini-test](mini_test.llms.md).

2 Adventure Build a simple model and read its errors. [Adventure](aventure.llms.md) Open cardCollapse

Goal Move from reading to guided practice.

Resource [Adventure page](aventure.llms.md)

Action Follow the instructions, run the code and keep important outputs.

Result A first work object that you can explain.

Pause after each important result and state what it shows.

3 Challenge Explain what the model learns and misses in a capsule. [Challenge](defi.llms.md) Open cardCollapse

### Challenge - Video capsule

You must produce a video capsule of 180 seconds maximum in which you present:

- either a predictive model built in Mission 1;
- or a critical analysis of a bias detected in Mission 2.

The capsule must include:

- a clear introduction;

- a brief methodology;

- visual results (graphs, tables);

- a conclusion with at least one recommendation.

The full instructions are available in the [Challenge 9](defi.llms.md) page. The starter repository is `STT-1100/aventure-9`.

4 Exercises Revisit variables, predictions and model limits. [Exercises](exercices.llms.md) Open cardCollapse

Resource [Exercises page](exercices.llms.md)

Why Exercises are independent from the adventure and challenge. They consolidate prediction, model errors and coverage bias with two real extracts from Quebec's drinking-water conservation strategy.

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

[Download the module workspace (.zip)](../../downloads/donnees/stt1100-module-09-en.zip)

[eleves_fictifs.csv](../donnees.llms.md#dataset-card-eleves-fictifs) [ecoles_primaires_qc.csv](../donnees.llms.md#dataset-card-ecoles-primaires-qc) [Municipal water consumption 2023](data/municipal_water_consumption_2023.csv) [Water audit validity 2023](data/water_audit_validity_2023.csv)

### R packages

[tidyverse](../packages.llms.md#tidyverse) [dplyr](../packages.llms.md#dplyr) [ggplot2](../packages.llms.md#ggplot2) [readr](../packages.llms.md#readr) [tibble](../packages.llms.md#tibble)
