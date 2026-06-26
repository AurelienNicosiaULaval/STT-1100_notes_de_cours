# Module 3 - Learning plan

STT-1100 Introduction to Data Science

# Module objectives

At the end of this module, you should be able to

- Handle character strings with `stringr`.
- Recognize patterns with regular expressions.
- Use regular expressions to select, manipulate and modify character strings.
- Calculate and interpret descriptive statistics for categorical variables (frequency tables, proportions, including by groups, cross-tabulation).
- Produce and interpret visualizations of categorical variables with `ggplot2` (bar, stacked bar, standardized stacked bar, grouped stacked bar, mosaic, pie and waffle plots).

# Initial readings

## Readings to do before the adventure

In this module, we will explore **categorical** variables and **visualization adapted** to this type of data. Two readings are suggested to prepare you:

- [**R for Data Science – Strings**](https://r4ds.hadley.nz/strings.html)
  This chapter introduces you to the manipulation of character strings with the `stringr` package.
  \> **Note**: Although this chapter is most widely used in module 4, some useful functions like `str_detect()` or `str_to_lower()` can already help you clean or prepare categorical variables.

- [**Introduction to Modern Statistics – Chapter 6: Explore categorical data**](https://openintro-ims.netlify.app/explore-categorical)
  This chapter of **IMS** introduces statistical concepts associated with categorical data. We talk in particular about frequency tables, proportions and ways to visually represent this type of variable.

Take the time to browse these two resources. They will be useful for you to understand how to process **qualitative data**, both from a **statistical** and **practical** point of view.

# Adventure

[Adventure 3](../module_03/aventure.llms.md)

# Challenge

At the end of this module, **you will take on the role of data journalist** for *Le Courrier Gourmand*.
Your mission:

1.  **Explore and clean** the `listecondemnation` game (food offenses in Quebec).
2.  **Extract key facts** (top offenses, fine amounts, Montreal/non-Montreal comparison).
3.  **Illustrate your analyses** with at least **two visuals** (a category graph + the fines map).
4.  **Write a Quarto article (HTML)** clear and eye-catching: hat -\> context -\> methodology -\> results -\> recommendations.
5.  **Cite two narrative figures** and **integrate a short quote from Alexander** to humanize the conclusion.

> **To be submitted**: the `.qmd` file and the generated HTML, delivered via your GitHub repository before the deadline.

## Evaluation grid

Your article will be evaluated according to the following criteria. Make sure you follow the template provided and the instructions given.

| Criterion | Excellent (3) | Satisfactory (2) | To improve (1) | Comment |
|----|----|----|----|----|
| \*\* Introductory hat\*\* | Punchy hook, clear angle, well-chosen key figures | Present but not very engaging or unclear | Absent or very vague |  |
| \*\* Context & presentation of data\*\* | Well identified source, relevance explained, limitations mentioned | Partial context or summary explanation | Source absent or not justified |  |
| \*\* Methodology (section without code)\*\* | Well summarized, clear and logical approach | Present but confusing or too technical | Absent or very unclear |  |
| \*\* Key result \#1 (graph + interpretation)\*\* | Clear visual, good interpretation, obvious analytical contribution | Visual or in-depth commentary | Visual or analysis absent |  |
| \*\* Key result \#2 (graph + interpretation)\*\* | Relevant visual, well-formulated insight | Correct visual but weak analysis | Result little exploited or missing |  |
| \*\* Key result \#3 (graph + interpretation)\*\* | Original or complementary result, well explained | Present but underdeveloped | Lacking or superficial |  |
| \*\* Discussion (section 4)\*\* | Critical reflection, putting results into perspective | Partial or descriptive discussion | Discussion absent or without added value |  |
| \*\* Conclusion & recommendations\*\* | Clear, useful, well-formulated action messages | Messages present but not convincing | Unclear or off-topic |  |
| \*\* Narrative figures + quote from Alexandre\*\* | Two well-chosen figures + well-integrated quote | One of the elements present only | None or poorly integrated |  |
| \*\* Render quality (Quarto + GitHub repository)\*\* | `.qmd` functional, readable HTML, clean and complete repository | Some technical problems or disorganized filing | Unable to execute or rendered partial/absent |  |

------------------------------------------------------------------------

**Total out of 30 points**: `XX / 30`

> *Don’t forget to reread the checklist at the end of the template before publishing your article.*

# Consolidation exercises

``` r
# Load the necessary libraries
library(tidyverse)
library(stringr)
```

------------------------------------------------------------------------

### Exercise 1 – Identify categorical variables

Here is a small dataset:

``` r
data <- tibble::tibble(
  sex = c("Man", "Woman", "Woman", "Man", "Man"),
  age = c(25, 32, 29, 40, 23),
  region = c("East", "West", "East", "North", "South")
)
```

> Among the three variables above, which are categorical?

> **NOTE:**
>
> The `sex` and `region` variables are **categorical**. `age` is **numeric**.

------------------------------------------------------------------------

### Exercise 2 – Frequency table

Creates a frequency table for the variable `sex`.

> **TIP:**
>
> Uses `count()` from the `dplyr` package.

> **NOTE:**
>
> ``` r
> data %>% count(sex)
> ```
>
>     # A tibble: 2 × 2
>       sex       n
>       <chr> <int>
>     1 Man       3
>     2 Woman     2

------------------------------------------------------------------------

### Exercise 3 – Proportions

Calculates the percentages for each category of the `region` variable.

> **TIP:**
>
> Adds a column with `mutate(n / sum(n))`.

> **NOTE:**
>
> ``` r
> data %>% count(region) %>% mutate(percent = n / sum(n) * 100)
> ```
>
>     # A tibble: 4 × 3
>       region     n percent
>       <chr>  <int>   <dbl>
>     1 East       2      40
>     2 North      1      20
>     3 South      1      20
>     4 West       1      20

------------------------------------------------------------------------

### Exercise 4 – Barplot of a categorical variable

Make a barplot representing the `region` variable.

> **TIP:**
>
> Use `geom_bar()` with `aes(x = region)`.

> **NOTE:**
>
> ``` r
> ggplot(data, aes(x = region)) + geom_bar()
> ```
>
> ![](plan_apprentissage_files/figure-html/unnamed-chunk-5-1.png)

------------------------------------------------------------------------

### Exercise 5 – Comparison of two categorical variables

Adds a color by `sex` in the previous graph.

> **NOTE:**
>
> ``` r
> ggplot(data, aes(x = region, fill = sex)) + geom_bar(position = "dodge")
> ```
>
> ![](plan_apprentissage_files/figure-html/unnamed-chunk-6-1.png)

------------------------------------------------------------------------

### Exercise 6 – Cleaning a categorical variable

Here is an inconsistent categorical variable:

``` r
answers <- c("Yes", "yes", "No", "no", "YES", "NO")
```

Cleans up this variable so that all responses are lowercase **and without duplicates**.

> **NOTE:**
>
> ``` r
> unique(str_to_lower(answers))
> ```
>
>     [1] "yes" "no"

------------------------------------------------------------------------

### Exercise 7 – Crosstab

Here is another dataset:

``` r
data2 <- tibble(
  smoker = c("Yes", "No", "No", "Yes", "Yes", "No", "No"),
  sport = c("Yes", "Yes", "No", "No", "Yes", "No", "No")
)
```

Creates a crosstab (contingency) between the two variables.

> **NOTE:**
>
> ``` r
> data2 %>% count(smoker, sport) %>% pivot_wider(names_from = sport, values_from = n, values_fill = 0)
> ```
>
>     # A tibble: 2 × 3
>       smoker    No   Yes
>       <chr>  <int> <int>
>     1 No         3     1
>     2 Yes        1     2

------------------------------------------------------------------------

### Exercise 8 – To go further: Mosaic plot

Uses the `ggplot2` package (or `ggmosaic` if available) to visually represent the relationship between `smoking` and `sport`.

> **NOTE:**
>
> ``` r
> # By grouping into grouped bars for an approximation
> ggplot(data2, aes(x = smoker, fill = sport)) +
>   geom_bar(position = "fill") +
>   ylab("Proportion")
> ```
>
> ![](plan_apprentissage_files/figure-html/unnamed-chunk-11-1.png)

------------------------------------------------------------------------

## Problems

### Exercise 9 – Palmer Penguins

We use the `penguins` dataset from the `palmerpenguins` package.

- Categorical variable: `species`, `island`, `sex`
- Numeric variable: `flipper_length_mm`, `body_mass_g`

Questions: 1. Create a frequency table for `species` 2. Visualize the distribution of species by island 3. Compare the sexes for each species

> **NOTE:**
>
> ``` r
> library(palmerpenguins)
> ```
>
>
>     Attaching package: 'palmerpenguins'
>
>     The following objects are masked from 'package:datasets':
>
>         penguins, penguins_raw
>
> ``` r
> penguins %>% count(species)
> ```
>
>     # A tibble: 3 × 2
>       species       n
>       <fct>     <int>
>     1 Adelie      152
>     2 Chinstrap    68
>     3 Gentoo      124
>
> ``` r
> ggplot(penguins, aes(x = island, fill = species)) + geom_bar(position = "dodge")
> ```
>
> ![](plan_apprentissage_files/figure-html/unnamed-chunk-12-1.png)
>
> ``` r
> ggplot(penguins, aes(x = species, fill = sex)) + geom_bar(position = "fill")
> ```
>
> ![](plan_apprentissage_files/figure-html/unnamed-chunk-12-2.png)

------------------------------------------------------------------------

### Exercise 10 – Titanic Data

Use `titanic::titanic_train`

Categorical variables: `Sex`, `Embarked`, `Survived`

Questions: 1. Cross-tabulation between `Sex` and `Survived` 2. Proportion of survival by port of embarkation (`Embarked`) 3. Cross-tabulation `Sex` × `Embarked` × `Survived`

> **NOTE:**
>
> ``` r
> library(titanic)
> titanic_train <- titanic::titanic_train
>
> titanic_train %>% count(Sex, Survived)
> ```
>
>          Sex Survived   n
>     1 female        0  81
>     2 female        1 233
>     3   male        0 468
>     4   male        1 109
>
> ``` r
> titanic_train %>% count(Embarked, Survived) %>%
>   group_by(Embarked) %>% mutate(p = n / sum(n))
> ```
>
>     # A tibble: 7 × 4
>     # Groups:   Embarked [4]
>       Embarked Survived     n     p
>       <chr>       <int> <int> <dbl>
>     1 ""              1     2 1
>     2 "C"             0    75 0.446
>     3 "C"             1    93 0.554
>     4 "Q"             0    47 0.610
>     5 "Q"             1    30 0.390
>     6 "S"             0   427 0.663
>     7 "S"             1   217 0.337
>
> ``` r
> ggplot(titanic_train, aes(x = Embarked, fill = factor(Survived))) +
>   geom_bar(position = "fill") +
>   facet_wrap(~Sex)
> ```
>
> ![](plan_apprentissage_files/figure-html/unnamed-chunk-13-1.png)
