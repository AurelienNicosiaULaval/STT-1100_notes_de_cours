# Consolidation Exercises

# Consolidation exercises

Here is an integrative exercise based on the `penguins` dataset from the `palmerpenguins` package. It combines modeling, interpretation and critical thinking.

## Study of penguin body mass

You work for an environmental NGO that wants to better understand the factors influencing the body mass of penguins in Antarctica. You have the `penguins` dataset, cleaned using the `drop_na()` function to avoid missing values.

``` r
library(palmerpenguins)
library(tidyverse)

df <- penguins %>%
  drop_na()
```

### 1. Visualization and hypothesis

Trace the relationship between `body_mass_g` and `flipper_length_mm`. Does a linear relationship seem plausible to you?

Solution

Use `ggplot(df, aes(x = flipper_length_mm, y = body_mass_g)) + geom_point() + geom_smooth(method = "lm")`. The relationship is clearly linear.

### 2. Simple regression

Fit a `body_mass_g~flipper_length_mm` model. Interpret the slope.

Solution

Each additional mm of fin length is associated with an average increase of X grams of body mass (see exact value in the model).

### 3. Multiple regression

Now adjust `body_mass_g ~ flipper_length_mm + sex`. What is the reference variable? What differences do you observe?

Solution

R uses the first alphabetical modality as a reference (here probably “female”). The `sexmale` coefficient represents the average difference in mass between males and females, at equal length.

### 4. Targeted Predictions

Predict the body mass for a penguin with 200 mm fin length, male.

Solution

Create a table `newdata <- tibble(flipper_length_mm = 200, sex = "male")` then do `predict(model, newdata)`.

### 5. Critical thinking

Is the `species` variable relevant to include? What precaution should you take if you add it?

Solution

Yes, `species` is highly correlated with mass. Attention should be paid to multicollinearity if it is strongly related to other predictors.

Happy exploring!
