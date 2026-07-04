# Formative Mini-Test - Module 9 Readings

STT-1100 Introduction to Data Science

# Formative Mini-Test

This mini-test checks the module 9 readings. It is not graded. Answer first without opening the responses, then use the explanations to identify what should be reread.

## Question 1

In simple linear regression, what does the slope associated with the explanatory variable represent?

1.  The average predicted change in the response when the explanatory variable increases by one unit
2.  The maximum value observed in the data
3.  The number of observations in the table
4.  The proportion of missing values

> **TIP:**
>
> Answer: a. The slope describes the average predicted change in the response for a one-unit increase in the explanatory variable.

## Question 2

True or false: a regression coefficient automatically proves a causal relationship.

> **TIP:**
>
> False. A regression model describes a conditional association in the data. A causal interpretation requires a study design and additional assumptions.

## Question 3

Which R function fits a linear model?

1.  `lm()`
2.  `geom_point()`
3.  `read_csv()`
4.  `pivot_longer()`

> **TIP:**
>
> Answer: a. `lm()` fits linear models in R.

## Question 4

Which function obtains predictions from a model fitted with `lm()`?

1.  `predict()`
2.  `filter()`
3.  `count()`
4.  `arrange()`

> **TIP:**
>
> Answer: a. `predict()` applies the model to new observations when the required variables are provided.

## Question 5

In the module exercises, the error is defined as `observed_value - predicted_value`. What does a positive error mean?

1.  The observed value is larger than the predicted value
2.  The predicted value is larger than the observed value
3.  The row always contains a missing value
4.  The model is necessarily invalid

> **TIP:**
>
> Answer: a. A positive error means the model predicted a value below the observed value.

## Question 6

True or false: a prediction made far outside the observed range of the data should be interpreted with caution.

> **TIP:**
>
> True. This is extrapolation. The model may become fragile when new values do not resemble the values used to fit it.

## Question 7

In multiple linear regression, how is the coefficient of an explanatory variable usually interpreted?

1.  As an average predicted change while holding the other variables in the model constant
2.  As proof that the variable causes the response
3.  As the percentage of missing data in that variable
4.  As the raw average of the response variable

> **TIP:**
>
> Answer: a. The usual interpretation is conditional on the other variables included in the model.

## Question 8

True or false: if a new observation is missing variables required by the model, `predict()` can always automatically produce a good prediction.

> **TIP:**
>
> False. The expected variables must be available and compatible with those used to fit the model.

## Question 9

True or false: a raw difference in rates between two groups, by itself, proves discrimination.

> **TIP:**
>
> False. A raw difference can flag a question to examine, but it is not enough to establish discrimination without context, relevant variables and careful analysis.

## Question 10

Which approach is the most careful for exploring descriptive bias?

1.  Compare outcomes by group, then also examine the available context variables
2.  Conclude only from the first calculated proportion
3.  Remove groups that do not confirm the hypothesis
4.  Replace the data with personal impressions

> **TIP:**
>
> Answer: a. A group comparison is a starting point, but interpretation must account for context and available variables.

## Question 11

True or false: a proxy variable can indirectly carry information linked to a sensitive or contextual group.

> **TIP:**
>
> True. For example, a geographic variable can sometimes indirectly reflect socioeconomic or demographic differences.

## Question 12

Which sentence best fits a responsible conclusion?

1.  The results suggest a lead to verify, with limits linked to the available variables and group sizes.
2.  The model definitively proves the cause of the phenomenon.
3.  No limits are needed if the chart is clear.
4.  Missing data can always be ignored.

> **TIP:**
>
> Answer: a. A responsible conclusion states limits, avoids overinterpretation and distinguishes association, prediction and causality.
