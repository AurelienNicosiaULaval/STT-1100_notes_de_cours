# Formative Mini-Test - Module 6 Readings

STT-1100 Introduction to Data Science

# Formative Mini-Test

This mini-test checks the module 6 readings. It is not graded. Answer first without opening the responses, then use the explanations to identify what you should review.

## Question 1

True or false: a useful GitHub issue should describe an observable problem or a precise suggestion.

> **TIP:**
>
> True. A useful issue states what is observed, where to find it and why an action would help.

## Question 2

Which join keeps all rows from the left table?

1.  `left_join()`
2.  `inner_join()`
3.  `anti_join()`
4.  `semi_join()`

> **TIP:**
>
> Answer: a. `left_join()` keeps all rows from the left table and adds matching columns from the right table.

## Question 3

True or false: `inner_join()` keeps rows with no match in either table.

> **TIP:**
>
> False. `inner_join()` only keeps rows that have a match in both tables.

## Question 4

Which function is useful for finding rows in `x` that have no match in `y`?

1.  `anti_join(x, y)`
2.  `summarise(x, y)`
3.  `arrange(x, y)`
4.  `geom_col(x, y)`

> **TIP:**
>
> Answer: a. `anti_join(x, y)` is often used to diagnose missing or miscoded keys.

## Question 5

True or false: a pull request is only used to upload a final HTML file.

> **TIP:**
>
> False. A pull request is used to propose, discuss, review and merge changes.

## Question 6

In a Quarto report, what is inline code used for?

1.  Insert a calculated result directly into a sentence
2.  Create a GitHub branch
3.  Remove missing values
4.  Merge two pull requests

> **TIP:**
>
> Answer: a. Inline code lets you insert a number or result calculated by R directly into text.

## Question 7

True or false: if an HTML report exists, it is automatically reproducible.

> **TIP:**
>
> False. You must also check the source file, packages, data, paths and ability to render the document.

## Question 8

Which information is most useful in a review issue?

1.  A specific section or line of the report
2.  A general opinion without an example
3.  A comment like “needs improvement” without detail
4.  A request to redo everything

> **TIP:**
>
> Answer: a. A precise reference helps the team understand and fix the issue.

## Question 9

True or false: a merge conflict necessarily means that the work is lost.

> **TIP:**
>
> False. A conflict means Git cannot automatically choose between two changes. The team must resolve the conflict and document the decision.

## Question 10

Which join is useful for keeping only rows in `x` that have a match in `y`, without adding columns from `y`?

1.  `semi_join()`
2.  `full_join()`
3.  `right_join()`
4.  `mutate()`

> **TIP:**
>
> Answer: a. `semi_join()` filters `x` according to whether a match exists in `y`.

## Question 11

True or false: in a join, you must understand the keys before interpreting the results.

> **TIP:**
>
> True. A wrong key can duplicate rows, lose observations or join incorrect information.

## Question 12

Which wording is the most constructive?

1.  “Your report is bad.”
2.  “Graph 2 would be clearer with a unit on the y-axis because we cannot tell whether delay is measured in minutes.”
3.  “I do not like this graph.”
4.  “Everything is confusing.”

> **TIP:**
>
> Answer: b. The comment is precise, localized and actionable.
