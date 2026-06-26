# Consolidation Exercises

# Consolidation exercises

To put the learning from this module into practice, you will find below a series of exercises taken from the manual or adapted for STT-1100.

## Exercise 1 — Why learn R?

In one or two sentences, explain why learning R is useful for someone who wants to work with data.

> **TIP:**
>
> R is a powerful language designed for data manipulation, analysis and visualization. It is widely used in data science for its wealth of libraries and its integration with tools like Quarto.

## Exercise 2 — The console vs the script

In RStudio, type `3 + 4` in:

1.  the console

2.  a `.R` script which you then run with `Ctrl + Enter`

What is the difference between the two approaches?

> **TIP:**
>
> The console allows code to be executed immediately, but does not keep track. The script allows code to be written and saved, which is essential for reproducibility.

## Exercise 3 — Script structure

Create an `analysis.R` file containing the following elements:

- a header with your name and date

- a library loading (`tidyverse`)

- a simple statement (`mean(c(1, 2, 3, 4))`)

> **TIP:**
>
> ``` r
> # Weather analysis — A. Nicosia
> # Date: 2025-05-19
>
> library(tidyverse)
>
> mean(c(1, 2, 3, 4))
> ```

------------------------------------------------------------------------

## Exercise 4 — Finding help

Use R’s built-in help to understand how to use the `mean` function. Next, briefly explain what the `na.rm` argument is used for.

> **TIP:**
>
> You can type `?mean` or `help(mean)` in R to get the documentation.
>
> The `na.rm` argument indicates whether to ignore missing values ​​(`NA`) in calculating the average (`TRUE` or `FALSE`).

## Exercise 5 — Rewrite code with style

Fix the following code to follow tidyverse style best practices:

``` r
x=mean(c(3,NA,5),na.rm=TRUE)
```

> **TIP:**
>
> ``` r
> x <- mean(c(3, NA, 5), na.rm = TRUE)
> ```

------------------------------------------------------------------------

## Exercise 6 — Create an HTML report

Create a `rapport.qmd` file containing:

- a YAML header with a title and HTML format

- a block of code that displays the average of a vector

> **TIP:**
>
> ``` markdown
> ---
> title: "First report"
> format: html
> ---
>
> mean(c(1, 2, 3, 4, 5))
> ```
>
> \`\`\`
