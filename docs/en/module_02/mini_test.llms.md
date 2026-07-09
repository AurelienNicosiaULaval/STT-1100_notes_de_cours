# Formative mini-test - Module 2 readings

STT-1100 Introduction to Data Science

## Formative Mini-Test

This mini-test checks the readings for module 2. It is not graded. Answer first without opening the solutions, then use the explanations to identify what should be reviewed before the adventure and challenge.

### Question 1

True or false: a commit records a step locally, while a push sends that step to GitHub.

> **TIP:**
>
> True. A commit records a snapshot in the local repository. A push then synchronizes local commits with the GitHub repository.

### Question 2

Which function imports an Excel file into R?

1.  `read_csv()`
2.  `read_excel()`
3.  `glimpse()`
4.  `geom_histogram()`

> **TIP:**
>
> Answer: b. `read_excel()` comes from the `readxl` package and imports Excel files such as `.xls` or `.xlsx`.

### Question 3

True or false: a reproducible Quarto report should import the data in a code block, even if you first tested the import through the RStudio interface.

> **TIP:**
>
> True. The report must render after restarting R, without depending on objects already present in the environment.

### Question 4

What is the main purpose of `glimpse()`?

1.  Produce a chart
2.  Display a compact view of variables and their types
3.  Save an HTML file
4.  Send a commit to GitHub

> **TIP:**
>
> Answer: b. `glimpse()` gives a quick view of a table structure: variable names, types and first values.

### Question 5

Which `dplyr` function keeps only selected columns?

1.  `select()`
2.  `filter()`
3.  `mutate()`
4.  `group_by()`

> **TIP:**
>
> Answer: a. `select()` chooses columns. To keep rows based on a condition, use `filter()`.

### Question 6

Which `dplyr` function creates a new variable?

1.  `summarise()`
2.  `mutate()`
3.  `arrange()`
4.  `facet_wrap()`

> **TIP:**
>
> Answer: b. `mutate()` adds or modifies columns in a table.

### Question 7

You want to compute the mean and standard deviation of body mass by species. Which combination is most appropriate?

1.  `group_by(species)` then `summarise()`
2.  `filter(species)` then `ggplot()`
3.  `select(body_mass_g)` then `read_excel()`
4.  `mutate(species)` then `commit()`

> **TIP:**
>
> Answer: a. `group_by(species)` defines the groups, then `summarise()` computes the statistics for each group.

### Question 8

True or false: the mean is always more robust than the median to extreme values.

> **TIP:**
>
> False. The median is generally less affected by extreme values than the mean.

### Question 9

Which chart is most appropriate for viewing the distribution of a single numerical variable?

1.  A histogram
2.  A map
3.  A pie chart
4.  A GitHub table

> **TIP:**
>
> Answer: a. A histogram shows how values of a numerical variable are distributed.

### Question 10

Which chart works well for comparing a numerical variable across several groups?

1.  A box plot
2.  A screenshot of the environment
3.  A commit message
4.  A package list

> **TIP:**
>
> Answer: a. A box plot compares the median, spread and potentially extreme values across groups.

### Question 11

Which chart works well for studying the relationship between two numerical variables?

1.  A scatterplot
2.  A file-name table
3.  A legend by itself
4.  A `push` command

> **TIP:**
>
> Answer: a. A scatterplot helps examine the relationship between two numerical variables.

### Question 12

True or false: directly editing the raw Excel file is a good practice if the final report contains only the corrected charts.

> **TIP:**
>
> False. It is better to keep the raw file intact and document corrections in R code so the analysis remains reproducible.
