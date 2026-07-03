# Module 9 - Learning Plan

STT-1100 Introduction to Data Science

# Module Objectives

At the end of this module, you should be able to:

- fit and interpret a linear regression model;
- use `predict()` to obtain predictions;
- compare observed and predicted values;
- identify limits linked to missing data;
- discuss descriptive biases in data or models with caution.

# Readings

To prepare, consult the following resources:

- [Introduction to Modern Statistics - Chapter 7: Linear regression with a single predictor](https://openintro-ims.netlify.app/model-slr)
- [Introduction to Modern Statistics - Chapter 8: Linear regression with multiple predictors](https://openintro-ims.netlify.app/model-mlr)
- [Introduction to Modern Statistics - Chapter 25: Inference for linear regression with multiple predictors](https://openintro-ims.netlify.app/inf-model-mlr#sec-inf-mult-reg-soft)

# Adventure

You play the role of a data scientist at the Quebec Ministry of Education. Your mandate is twofold: build a predictive model from primary school data, then explore a fictitious dataset to detect a descriptive bias.

Link to the adventure: [Adventure 9 - Prediction and Algorithmic Bias](../module_09/aventure.llms.md)

# Challenge - Video Capsule

You must produce a video capsule of 180 seconds maximum. Choose either the predictive model from Mission 1 or the bias analysis from Mission 2.

Full instructions: [Challenge 9 - Video Capsule](../module_09/defi.llms.md)

Starter repository: `STT-1100/aventure-9`

# Consolidation Exercises

The exercises revisit linear regression with the `penguins` dataset from the `palmerpenguins` package.

1.  Visualize the relationship between `body_mass_g` and `flipper_length_mm`.
2.  Fit the model `body_mass_g ~ flipper_length_mm`.
3.  Interpret the slope.
4.  Fit the model `body_mass_g ~ flipper_length_mm + sex`.
5.  Use `predict()` for a hypothetical observation.
6.  Discuss one possible limitation if you add `species`.
