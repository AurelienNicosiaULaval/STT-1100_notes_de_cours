# Diagnostic - Module 8

STT-1100 Introduction to Data Science

This ungraded diagnostic checks the concepts from module 8. It provides detailed correction, an overall result, a competency profile and a targeted review plan.

> **NOTE:**
>
> - First attempt: without documentation, without running the code and without outside help, to obtain an honest profile.
> - After the summary: consult the suggested resources, redo the targeted exercises and then retake the diagnostic.
> - Purpose: this diagnostic is ungraded and is not used to assign a mark or decide admission to the course.
> - Privacy: no answer is sent to the instructor. Progress and attempt history are stored only in this browser.

The thresholds are STT-1100 pedagogical guideposts. They have not undergone psychometric validation. A correct answer may also result from chance, so practical exercises remain essential.

## Question 1

Which function reads an HTML page with `rvest`?

1.  `read_html()`
2.  `read_csv()`
3.  `geom_html()`
4.  `left_join()`

> **TIP:**
>
> Answer: a. `read_html()` reads a web page or HTML file and creates an object that `rvest` can query.

## Question 2

True or false: a CSS selector targets specific elements in an HTML page.

> **TIP:**
>
> True. For example, `.dataset-card` targets elements with the `dataset-card` class.

## Question 3

Which function extracts clean text from an HTML node?

1.  `html_text2()`
2.  `html_table2()`
3.  `text_join()`
4.  `parse_css()`

> **TIP:**
>
> Answer: a. `html_text2()` returns text while handling spaces better than `html_text()`.

## Question 4

True or false: a testable scraping function should depend on objects manually created in the console.

> **TIP:**
>
> False. A testable function should receive inputs through its arguments and work in a fresh R session.

## Question 5

Why turn an extraction into a function?

1.  To reuse and test it
2.  To avoid writing a variable name
3.  To make the code less readable
4.  To bypass terms of use

> **TIP:**
>
> Answer: a. A function groups logic, makes code reusable and allows the output contract to be tested.

## Question 6

True or false: `map_chr()` is useful when applying an extraction to several HTML blocks and expecting a character vector.

> **TIP:**
>
> True. `map_chr()` applies a function to each element and guarantees a character result.

## Question 7

What should a robust function return when an optional field is missing?

1.  `NA_character_`
2.  A deliberate error
3.  An interactive window
4.  The full page content

> **TIP:**
>
> Answer: a. `NA_character_` represents missing information without breaking the whole extraction.

## Question 8

True or false: `robots.txt` gives full permission to collect and redistribute data.

> **TIP:**
>
> False. `robots.txt` gives technical instructions to crawlers. It does not replace terms of use, licensing, ethics or written permission.

## Question 9

Which practice reduces server load when extracting several pages?

1.  Add a pause with `Sys.sleep()`
2.  Launch several thousand requests at the same time
3.  Ignore connection errors
4.  Hide your identity in the code

> **TIP:**
>
> Answer: a. A pause reduces pressure on the server.

## Question 10

True or false: a simple test can check the column names returned by a function.

> **TIP:**
>
> True. For example, `identical(names(result), c("titre", "producteur", "categorie"))` checks the output contract.

## Question 11

Which behavior is the most restrained for the challenge?

1.  Scrape one page at a time
2.  Download the whole site
3.  Bypass protections
4.  Publish raw copies without checking rights

> **TIP:**
>
> Answer: a. The challenge asks for a function that processes one page at a time; this is more controllable and respectful.

## Question 12

True or false: a local HTML test page helps make an exercise reproducible.

> **TIP:**
>
> True. A local page remains available even if an external site changes, blocks a request or becomes unavailable.
