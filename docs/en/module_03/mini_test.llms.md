# Formative mini-test - Module 3 readings

STT-1100 Introduction to Data Science

# Formative Mini-Test

This mini-test checks the readings for module 3. It is not graded. Answer first without opening the solutions, then use the explanations to identify what should be reviewed before the adventure and challenge.

## Question 1

True or false: a categorical variable contains levels or groups, even if those levels are stored as text in R.

> **TIP:**
>
> True. A categorical variable can be stored as `character` or as `factor`. What matters is that its values represent categories.

## Question 2

Which `stringr` function detects whether a string contains a pattern?

1.  `str_detect()`
2.  `str_squish()`
3.  `str_replace()`
4.  `fct_lump()`

> **TIP:**
>
> Answer: a. `str_detect()` returns `TRUE` or `FALSE` depending on whether the pattern is present.

## Question 3

True or false: `str_squish()` removes leading and trailing spaces and reduces repeated spaces to a single space.

> **TIP:**
>
> True. This function is useful for harmonizing text fields before creating categories.

## Question 4

Which function can extract a Canadian postal code from an address when given an appropriate regular expression?

1.  `str_extract()`
2.  `summarise()`
3.  `geom_bar()`
4.  `count()`

> **TIP:**
>
> Answer: a. `str_extract()` extracts the part of a string matching the pattern.

## Question 5

Why convert a column such as `Amende` to a numeric variable before computing a mean?

1.  Because charts always require factors
2.  Because a mean cannot be computed correctly on a character string
3.  Because `ggplot2` cannot read text
4.  Because a GitHub commit is required

> **TIP:**
>
> Answer: b. If amounts are stored as text, you first need to create a reproducible numeric variable.

## Question 6

Which `dplyr` function is the most direct way to get a frequency table?

1.  `count()`
2.  `mutate()`
3.  `pull()`
4.  `slice()`

> **TIP:**
>
> Answer: a. `count(variable)` counts the number of observations in each level.

## Question 7

True or false: a standardized stacked bar chart with `position = "fill"` shows proportions rather than absolute counts.

> **TIP:**
>
> True. The total height of each bar is 1, which makes it possible to compare group composition.

## Question 8

Which tool is useful for grouping rare categories into an “Other” level?

1.  `forcats::fct_lump()`
2.  `readxl::read_excel()`
3.  `base::mean()`
4.  `ggplot2::theme_void()`

> **TIP:**
>
> Answer: a. `fct_lump()` groups infrequent levels, which can make a table or chart more readable.

## Question 9

True or false: a categorical chart should generally be ordered by a useful variable rather than left in an arbitrary alphabetical order.

> **TIP:**
>
> True. Ordering by frequency or by a summary value often helps the reader understand the chart message.

## Question 10

In the challenge, why should the original `listecondamnation` dataset remain intact?

1.  So the cleaning is documented in code and reproducible
2.  Because `UlavalSSD` forbids charts
3.  Because categories cannot be modified
4.  Because GitHub does not keep HTML files

> **TIP:**
>
> Answer: a. The report must render again after restarting R, with the same cleaning choices.

## Question 11

True or false: if a chart uses proportions, the text should state that it does not show absolute counts.

> **TIP:**
>
> True. Proportions are useful, but they can hide the actual size of groups.

## Question 12

Which sentence best matches a good narrative figure in a data article?

1.  “The variable is interesting.”
2.  “The chart is beautiful.”
3.  “About half of the records in the file are associated with Montreal postal codes, according to the criterion used.”
4.  “The code works.”

> **TIP:**
>
> Answer: c. A narrative figure combines a computed result, context and understandable wording.
