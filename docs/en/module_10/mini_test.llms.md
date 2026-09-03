# Diagnostic - Module 10

STT-1100 Introduction to Data Science

This ungraded diagnostic checks the concepts from module 10. It provides detailed correction, an overall result, a competency profile and a targeted review plan.

> **NOTE:**
>
> - First attempt: without documentation, without running the code and without outside help, to obtain an honest profile.
> - After the summary: consult the suggested resources, redo the targeted exercises and then retake the diagnostic.
> - Purpose: this diagnostic is ungraded and is not used to assign a mark or decide admission to the course.
> - Privacy: no answer is sent to the instructor. Progress and attempt history are stored only in this browser.

The thresholds are STT-1100 pedagogical guideposts. They have not undergone psychometric validation. A correct answer may also result from chance, so practical exercises remain essential.

## Question 1

In `tidytext`, what does it mean to transform text into a tidy format?

1.  To obtain one row per token or relevant text unit
2.  To turn every comment into an image
3.  To remove every row from the table
4.  To replace the text with a numeric average

> **TIP:**
>
> Answer: a. Tidy text usually places one text unit, such as one word, on each row.

## Question 2

Which function splits a text column into tokens with `tidytext`?

1.  `unnest_tokens()`
2.  `bind_tf_idf()`
3.  `geom_col()`
4.  `select()`

> **TIP:**
>
> Answer: a. `unnest_tokens()` transforms a text column into tokens, often words.

## Question 3

True or false: stopwords are very frequent words that can hide more informative words.

> **TIP:**
>
> True. Words such as “de”, “le” or “et” can be removed when they do not help explain the content.

## Question 4

Why build a custom French sentiment lexicon in this module?

1.  To understand the principle of sentiment analysis while stating the lexicon’s limits
2.  To avoid all interpretation
3.  To prove that every comment is positive or negative
4.  To replace numerical data

> **TIP:**
>
> Answer: a. The custom lexicon is pedagogical. It helps students understand the principle, but it remains imperfect and must be interpreted carefully.

## Question 5

True or false: a sentiment score calculated with a small custom lexicon should be presented as an exact measure of student feeling.

> **TIP:**
>
> False. The score depends on the lexicon, cleaning and context. It is an exploratory indicator, not a definitive truth.

## Question 6

What does TF-IDF measure in text analysis?

1.  Words that are frequent in one group and relatively rare in other groups
2.  The number of charts in a report
3.  The average of numerical variables
4.  The size of the CSV file

> **TIP:**
>
> Answer: a. TF-IDF highlights distinctive words in a document or group, such as a week.

## Question 7

Which `tidytext` function adds the `tf`, `idf` and `tf_idf` columns to a count table?

1.  `bind_tf_idf()`
2.  `unnest_tokens()`
3.  `pivot_wider()`
4.  `arrange()`

> **TIP:**
>
> Answer: a. `bind_tf_idf()` calculates and adds TF, IDF and TF-IDF values.

## Question 8

True or false: a word with high TF-IDF is necessarily the most frequent word in the whole corpus.

> **TIP:**
>
> False. A word can have high TF-IDF because it is distinctive to one group, even if it is not the most frequent word in the full corpus.

## Question 9

In a dashboard, why add at least one interactive filter?

1.  To let the user explore a relevant subset of the data
2.  To hide difficult results
3.  To replace all analysis
4.  To make the code impossible to reread

> **TIP:**
>
> Answer: a. A useful filter lets users explore the data by period, group or theme without multiplying fixed charts.

## Question 10

True or false: before sharing a dashboard based on comments, you must check that no person is identifiable.

> **TIP:**
>
> True. Free-text comments can contain identifying information. Confidentiality must be checked before any sharing.

## Question 11

Which statement best describes a good dashboard conclusion?

1.  It summarizes visible trends, names limits and proposes a realistic action
2.  It repeats every table without interpretation
3.  It claims that the model explains everything
4.  It ignores missing data

> **TIP:**
>
> Answer: a. A useful conclusion stays concise, interprets without overpromising and states what could be improved.

## Question 12

True or false: `flexdashboard` can present several related visualizations in a dashboard page, and `shiny` can add interactivity.

> **TIP:**
>
> True. `flexdashboard` structures the dashboard; `shiny` can make selected elements reactive to user choices.
