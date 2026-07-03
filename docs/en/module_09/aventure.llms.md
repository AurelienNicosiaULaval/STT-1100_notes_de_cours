# Adventure 9 - Prediction and Algorithmic Bias

STT-1100 Introduction to Data Science

# Scenario: Quality Control in Education

You work as a junior data scientist in the quality control and equity department at the Quebec Ministry of Education. Your mandate is to use real and fictitious data to build a first prediction, then examine the limits and possible biases of that prediction.

Michel Dufour, deputy director of the department, gives you the following mandate:

> Welcome to the team. Our work is to produce useful analyses without giving a false impression of certainty. A model can help us understand a situation, but it can also hide important limits.

> **NOTE:**
>
> Your contact: Michel Dufour
>
> He accompanies you throughout this adventure. He asks key questions and expects you to explain your results in accessible language.

## Adventure Objectives

- Fit a multiple linear regression model.
- Use `predict()` to produce targeted predictions.
- Compare predicted values with observed values.
- Detect a descriptive bias in a fictitious dataset.
- Formulate a careful recommendation from an analysis.

# Mission 1: Predictive Model at the School Level

Michel gives you the `ecoles_primaires_qc.csv` file. It contains information on disadvantage indices in Quebec primary schools.

> **IMPORTANT:**
>
> Column names are not always intuitive. Before modeling, inspect the variables and check which rows are usable.

## Step 1: Exploration and Cleaning

Start by loading the data and inspecting its structure.

``` r
df_schools <- read_csv("ecoles_primaires_qc.csv")

glimpse(df_schools)

df_schools |>
  summarise(
    n = n(),
    missing_imse = sum(is.na(IMSE)),
    missing_sfr = sum(is.na(SFR)),
    missing_enrolment = sum(is.na(Nbre_Eleves))
  )
```

To build the model, use only schools for which the required variables are available.

``` r
df_model <- df_schools |>
  filter(
    Diffusion == "OUI",
    !is.na(IMSE),
    !is.na(SFR),
    !is.na(Nbre_Eleves)
  )

nrow(df_model)
```

> **NOTE:**
>
> Rows where `Diffusion == "NON"` do not contain `IMSE`, `SFR` or `Nbre_Eleves` in the local file. Therefore, the requested model cannot predict these rows without additional information.

## Step 2: Regression Model

> **IMPORTANT:**
>
> Build a linear regression model to predict `IMSE` from `SFR` and `Nbre_Eleves`. Then explain the coefficients in simple language.

``` r
model <- lm(IMSE ~ SFR + Nbre_Eleves, data = df_model)

summary(model)
```

Questions to answer:

- What does the coefficient associated with `SFR` mean, if `Nbre_Eleves` stays constant?
- What does the coefficient associated with `Nbre_Eleves` mean, if `SFR` stays constant?
- Does a statistical association allow us to conclude that there is a causal relationship?

## Step 3: Targeted Predictions

Use `predict()` to produce predictions on observed schools.

``` r
df_predictions <- df_model |>
  mutate(
    predicted_imse = predict(model, newdata = df_model),
    error = IMSE - predicted_imse
  )
```

Michel asks you for two targeted comparisons.

``` r
df_predictions |>
  slice_max(Nbre_Eleves, n = 10) |>
  select(Nom_Org, IMSE, predicted_imse, error, SFR, Nbre_Eleves)
```

``` r
df_predictions |>
  slice_max(SFR, n = 10) |>
  select(Nom_Org, IMSE, predicted_imse, error, SFR, Nbre_Eleves)
```

> **IMPORTANT:**
>
> Does the model seem equally reliable for all schools? Which schools have the largest errors? What does this tell you about the model’s limits?

## Step 4: Non-Disclosed Cases and Model Limits

In the file, some rows have `Diffusion == "NON"`. These rows do not contain values for the variables required by the model.

``` r
df_schools |>
  count(Diffusion)

df_schools |>
  filter(Diffusion == "NON") |>
  summarise(
    n = n(),
    missing_imse = sum(is.na(IMSE)),
    missing_sfr = sum(is.na(SFR)),
    missing_enrolment = sum(is.na(Nbre_Eleves))
  )
```

> **IMPORTANT:**
>
> Can we predict the IMSE of non-disclosed schools with this model? If not, what additional data would we need? And why would it be risky to automatically replace these missing values with a prediction?

# Mission 2: Detecting a Descriptive Bias

Michel also provides a fictitious dataset of 1000 students, `eleves_fictifs.csv`. At first glance, this dataset looks neutral. But is it really?

``` r
df_students <- read_csv("eleves_fictifs.csv")

glimpse(df_students)
```

## Step 1: Overall Admission Rate

Start by calculating the overall admission rate.

``` r
overall_rate <- df_students |>
  count(Admission) |>
  mutate(pct = n / sum(n))

overall_rate
```

## Step 2: Admission Rate by Sex

Then explore admission rates by `Sexe`.

``` r
rate_sex <- df_students |>
  count(Sexe, Admission) |>
  group_by(Sexe) |>
  mutate(pct = n / sum(n)) |>
  ungroup()

rate_sex
```

Produce a clear graph.

``` r
ggplot(rate_sex, aes(x = Sexe, y = pct, fill = Admission)) +
  geom_col(position = "dodge") +
  labs(
    title = "Admission Rate by Sex",
    x = "Sexe",
    y = "Proportion",
    fill = "Admission"
  ) +
  theme_minimal()
```

## Step 3: Guided Discussion

Answer the following questions:

- Do you observe a notable difference between groups?
- Is this difference enough to prove discrimination?
- What other variables should be examined before drawing a conclusion?
- Can we speak of a descriptive bias in this dataset? Why?

## Step 4: Other Variables

Repeat the same logic for other variables, for example `Langue_maternelle`, `Niveau_socio_economique` or `Acces_ressources`.

``` r
df_students |>
  count(Acces_ressources, Admission) |>
  group_by(Acces_ressources) |>
  mutate(pct = n / sum(n)) |>
  ungroup()
```

# Challenge to Submit

The challenge associated with this adventure is described on the page [Challenge 9 - Video Capsule](../module_09/defi.llms.md).

You must produce a video capsule of 180 seconds maximum. You may present either your predictive model from Mission 1 or your bias analysis from Mission 2. The starter repository is the GitHub template `STT-1100/aventure-9`.

# Conclusion of the Adventure

You built a first predictive model, produced targeted predictions and identified a descriptive bias in fictitious data. The central point of the adventure is caution: a model can be useful, but it must always be accompanied by a discussion of its limits, missing data and possible effects.
