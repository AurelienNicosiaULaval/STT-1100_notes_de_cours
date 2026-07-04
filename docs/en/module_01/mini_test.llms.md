# Formative mini-test - Module 1 readings

STT-1100 Introduction to Data Science

# Formative mini-test

This mini-test checks the module 1 readings. It is not graded. Answer first without opening the explanations, then use them to identify what should be reviewed.

## Question 1

True or false: writing code only in the console is enough to produce a reproducible analysis.

> **TIP:**
>
> False. The console is useful for testing, but a script or Quarto document keeps a record of the code.

## Question 2

In a Quarto document, which part is used to specify the title and output format?

1.  The YAML block at the beginning of the file
2.  The R console
3.  The Environment pane
4.  The folder name

> **TIP:**
>
> Answer: a. The YAML block at the beginning of the file can specify the title, author, date and output format.

## Question 3

True or false: if a report uses `MeteoQuebec`, the `.qmd` document should contain `library(UlavalSSD)`.

> **TIP:**
>
> True. The report must render after restarting R. The package loading must therefore be in the document.

## Question 4

What does `na.rm = TRUE` do in a function like `mean()`?

1.  It turns missing values into zero
2.  It removes missing values before the calculation
3.  It rounds the result
4.  It displays only missing values

> **TIP:**
>
> Answer: b. `na.rm = TRUE` removes missing values before the calculation.

## Question 5

True or false: an object name like `mean_temperature` is preferable to `mean temperature` in R code.

> **TIP:**
>
> True. Names without spaces are easier to use. Tidyverse style recommends explicit lowercase names with underscores.

## Question 6

Which `dplyr` function is mainly used to keep rows based on a condition?

1.  `select()`
2.  `filter()`
3.  `library()`
4.  `mean()`

> **TIP:**
>
> Answer: b. `filter()` keeps rows that satisfy one or more conditions.

## Question 7

Which `dplyr` function is mainly used to choose columns?

1.  `select()`
2.  `filter()`
3.  `summary()`
4.  `install.packages()`

> **TIP:**
>
> Answer: a. `select()` chooses columns.

## Question 8

True or false: rendering a Quarto document after restarting R is a good way to check reproducibility.

> **TIP:**
>
> True. If the document renders after a restart, it indicates that the packages, data and objects needed are created in the document itself.
