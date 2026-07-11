# Module 9 - Learning Plan

STT-1100 Introduction to Data Science

## Module Objectives

At the end of this module, you should be able to:

- fit and interpret a linear regression model;
- use `predict()` to obtain predictions;
- compare observed and predicted values;
- identify limits linked to missing data;
- discuss descriptive biases in data or models with caution.

## Readings

To prepare, consult the following resources:

- [Introduction to Modern Statistics - Chapter 7: Linear regression with a single predictor](https://openintrostat.github.io/ims/model-slr)
- [Introduction to Modern Statistics - Chapter 8: Linear regression with multiple predictors](https://openintrostat.github.io/ims/model-mlr)
- [Introduction to Modern Statistics - Chapter 25: Inference for linear regression with multiple predictors](https://openintrostat.github.io/ims/inf-model-mlr#sec-inf-mult-reg-soft)
- [R documentation - `lm()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/lm.html)
- [R documentation - `predict.lm()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/predict.lm.html)
- [Government of Canada - Guide on Automated Decision-Making](https://www.canada.ca/en/government/system/digital-government/digital-government-innovations/responsible-use-ai/guide-scope-directive-automated-decision-making.html)
- [NIST SP 1270 - Towards a Standard for Identifying and Managing Bias in Artificial Intelligence](https://www.nist.gov/publications/towards-standard-identifying-and-managing-bias-artificial-intelligence)

### Posit cheat sheets

- [Data transformation with dplyr :: Cheatsheet](https://rstudio.github.io/cheatsheets/data-transformation.pdf) Table preparation before fitting and interpreting the model.

- [Data visualization with ggplot2 :: Cheat Sheet](https://rstudio.github.io/cheatsheets/data-visualization.pdf) Descriptive diagnostics, predictions and error visualizations.

After the readings, complete the [module 9 formative mini-test](../module_09/mini_test.llms.md).

> The observed-predicted comparisons in this module are diagnostics on the data used to fit the model. They help discuss its limits, but they are not a validation of performance on new data.

## Adventure

You play the role of a data scientist at the Quebec Ministry of Education. Your mandate is twofold: build a predictive model from primary school data, then explore a fictitious dataset to detect a descriptive bias.

Link to the adventure: [Adventure 9 - Prediction and Algorithmic Bias](../module_09/aventure.llms.md)

## Challenge - Video Capsule

You must produce a video capsule of 180 seconds maximum. Choose either the predictive model from Mission 1 or the bias analysis from Mission 2.

Full instructions: [Challenge 9 - Video Capsule](../module_09/defi.llms.md)

Starter repository: `STT-1100/aventure-9`

## Consolidation Exercises

The exercises are independent from the adventure and the challenge. They use two real extracts from Quebec’s drinking-water conservation strategy:

1.  `municipal_water_consumption_2023.csv` to fit a linear regression, produce predictions and examine errors;
2.  `water_audit_validity_2023.csv` to compare index availability across groups and discuss coverage bias carefully.

The series ends with two case studies: a distributed-water forecast and an audit of validity-data coverage.

Link to the exercises: [Consolidation Exercises](../module_09/exercices.llms.md)
