# Diagnostic - Module 4

STT-1100 Introduction to Data Science

This ungraded diagnostic checks the concepts from module 4. It provides detailed correction, an overall result, a competency profile and a targeted review plan.

> **NOTE:**
>
> - First attempt: without documentation, without running the code and without outside help, to obtain an honest profile.
> - After the summary: consult the suggested resources, redo the targeted exercises and then retake the diagnostic.
> - Purpose: this diagnostic is ungraded and is not used to assign a mark or decide admission to the course.
> - Privacy: no answer is sent to the instructor. Progress and attempt history are stored only in this browser.

The thresholds are STT-1100 pedagogical guideposts. They have not undergone psychometric validation. A correct answer may also result from chance, so practical exercises remain essential.

## Question 1

True or false: if a file is separated by semicolons, `read_csv()` is always the best choice.

> **TIP:**
>
> False. `read_csv()` expects comma-separated files. For semicolon-separated files, use `read_delim(delim = ";")` or `read_csv2()` depending on the context.

## Question 2

Which function turns column names into names that are easier to use in R?

1.  `janitor::clean_names()`
2.  `ggplot2::labs()`
3.  `readxl::excel_sheets()`
4.  `forcats::fct_lump()`

> **TIP:**
>
> Answer: a. `clean_names()` converts names to a more regular form, often `snake_case`.

## Question 3

True or false: an identifier such as `"0012"` should often remain text, even if it contains only digits.

> **TIP:**
>
> True. An identifier is a label, not a quantity. Keeping it as text avoids losing leading zeros.

## Question 4

Which function is useful when a special value, for example `-999`, represents a missing value?

1.  `na_if()`
2.  `count()`
3.  `pivot_wider()`
4.  `geom_point()`

> **TIP:**
>
> Answer: a. `na_if(x, -999)` replaces values equal to `-999` with `NA`.

## Question 5

Which function transforms columns `q1`, `q2`, `q3`, `q4` into two columns named `quarter` and `value`?

1.  `pivot_longer()`
2.  `pivot_wider()`
3.  `arrange()`
4.  `read_json()`

> **TIP:**
>
> Answer: a. `pivot_longer()` turns several columns into a longer format.

## Question 6

True or false: a data correction should be documented only if it modifies more than 100 rows.

> **TIP:**
>
> False. Any correction that matters for interpretation should be documented, even if it affects only one row.

## Question 7

Which `forcats` function is useful for grouping several similar levels under one name?

1.  `fct_collapse()`
2.  `read_excel()`
3.  `glimpse()`
4.  `parse_number()`

> **TIP:**
>
> Answer: a. `fct_collapse()` merges several factor levels.

## Question 8

True or false: a JSON file can contain nested structures that do not immediately look like a rectangular table.

> **TIP:**
>
> True. A JSON file can contain lists within lists. It sometimes needs to be transformed to become a table.

## Question 9

Which function reads a specific sheet from an Excel file?

1.  `readxl::read_excel(sheet = ...)`
2.  `readr::write_csv()`
3.  `dplyr::filter()`
4.  `stringr::str_squish()`

> **TIP:**
>
> Answer: a. The `sheet` argument chooses which sheet to import.

## Question 10

True or false: an anomaly can be flagged without being corrected if no defensible correction is possible.

> **TIP:**
>
> True. In rigorous cleaning, it is sometimes better to flag an anomaly than to guess a correction.

## Question 11

Which field is not part of the minimal cleaning-log entry proposed in the module?

1.  `id`
2.  `variables`
3.  `probleme`
4.  `chart_colour`

> **TIP:**
>
> Answer: d. The log should at least document the identifier, affected variables, problem, action and justification.

## Question 12

Why is it useful to save the clean file with `write_csv()` at the end of a cleaning process?

1.  To produce a reproducible artefact from the code
2.  To hide corrections
3.  To avoid loading packages
4.  To replace the Quarto report

> **TIP:**
>
> Answer: a. The clean file becomes a reproducible output of the script or report.
