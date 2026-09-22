# Quarto model: make an article readable

Challenge 3 • hide code, choose outputs and tell the story

## The expected result

Your `.qmd` file contains code, but your HTML file should read like an article. A reader who does not know R should see first:

- a title and a lead that make the question clear;
- paragraphs that explain choices and findings;
- readable charts with titles and captions;
- numbers integrated naturally into sentences.

The reader should not have to read the R console to understand your conclusion. Keep the code in the source file for reproducibility, but usually hide it in the submitted article.

> **IMPORTANT:**
>
> Render your `.qmd`, open the resulting HTML file and read it as a reader. If you see code blocks, `##`, `[1]`, package messages or raw output from `head()`, revise the presentation before submitting.

## 1. Set up the document

A simple header produces a self-contained HTML article. The `embed-resources: true` option includes the resources needed by the HTML file.

``` markdown
---
title: "Your article title"
author: "First name Last name"
lang: en
format:
  html:
    theme: journal
    toc: true
    embed-resources: true
execute:
  warning: false
  message: false
---
```

The `warning` and `message` options keep routine messages out of the article. They do not fix an analysis error. An error that prevents rendering must be understood and fixed.

## 2. Options that control what is displayed

Quarto lets you choose separately whether code and results are displayed. Options after `#|` apply to the following chunk.

| Option | What the reader sees | Use in the article |
|----|----|----|
| `echo: false` | results, but not code | usual choice for a useful chart or table |
| `include: false` | neither code nor results | package loading and preparation calculations |
| `output: false` | code, but not results | debugging or a demonstration; rarely useful in the final article |
| `warning: false` | no displayed warnings | hide a warning you already understand; do not hide a fragile analysis |
| `message: false` | no package messages | keep the page clean after `library()` |
| `eval: false` | code without running it | show syntax in a tutorial; do not use it for a submitted result |

### Hide a preparation chunk completely

This chunk runs. It creates the objects you need, but nothing appears in the article.

```` markdown
```{r setup, include=FALSE}
library(tidyverse)
library(UlavalSSD)

condamnations <- listecondamnation
```
````

The equivalent Quarto syntax can put the option inside the chunk:

```` markdown
```{r}
#| include: false

results <- condamnations |>
  count(SOC_NOM_ARTCL_INFRC, sort = TRUE)
```
````

### Show a chart without showing its code

The code runs and the chart remains. Only the chart appears in the HTML.

```` markdown
```{r fig-offences}
#| echo: false
#| label: fig-offences
#| fig-cap: "The most frequent offence categories."
#| fig-alt: "Bar chart showing the number of findings for the main offence categories."

results |>
  slice_head(n = 6) |>
  ggplot(aes(x = reorder(SOC_NOM_ARTCL_INFRC, n), y = n)) +
  geom_col(fill = "#176b87") +
  coord_flip() +
  labs(x = NULL, y = "Number of findings")
```
````

The chart title, axes and interpretation are part of the article. A chart placed alone, without a sentence explaining its message, is not a clear result.

### Show code while hiding a temporary output

This can help during a demonstration or while debugging. It does not turn a code block into an article paragraph.

```` markdown
```{r diagnostic}
#| output: false

summary(condamnations)
```
````

For a submission, usually use `include: false` for preparation calculations, then communicate the finding in a sentence or chart.

### Show code on demand

In a tutorial, code can be folded:

``` yaml
format:
  html:
    code-fold: true
    code-summary: "Show code"
```

This is useful for teaching or documentation. For Challenge 3, the clearest choice is usually to hide analysis code unless you have a specific pedagogical reason to keep it available.

## 3. Replace raw output with a sentence

An expression left alone in a chunk can create console-like output:

```` markdown
```{r bad-example}
nrow(condamnations)
```
````

The reader may then see code and an isolated output. Calculate the number in a hidden chunk and put the result into a sentence with inline code.

```` markdown
```{r article-numbers, include=FALSE}
n_findings <- nrow(condamnations)
n_categories <- n_distinct(condamnations$SOC_NOM_ARTCL_INFRC)
```

The dataset contains r n_findings findings across r n_categories offence categories. This describes the scope of the file; it is not by itself evidence of a difference between categories.
````

Inline code written as `r expression` inside Quarto delimiters keeps the number synchronized with the analysis. Do not type a calculated result manually into the text: if the data or filter changes, the manual text can become wrong.

An example actually calculated on this page: the dataset contains **1712 findings** and **33 non-missing categories**. The reader sees the sentence and numbers, not the code that produces them.

### Format a percentage or amount

The calculation stays hidden; only the formatted value is inserted into the sentence.

```` markdown
```{r formatted-numbers, include=FALSE}
proportion <- nrow(filter(condamnations, est_grand_montreal)) / nrow(condamnations)
median_fine <- median(condamnations$amende_num, na.rm = TRUE)
```

The Greater Montreal area represents r scales::percent(proportion, accuracy = 0.1) of findings. The median fine is r scales::dollar(median_fine, prefix = "", suffix = " $", big.mark = " ", decimal.mark = ",").
````

Adapt object names and filters to your own analysis. The model shows the form of a sentence, not a conclusion to copy without checking the data.

## 4. Make a figure look like an article figure

A chart for an article should answer one precise question. Use an informative title, understandable axes, units where needed and a legend that does not force the reader to guess.

![Horizontal bar chart showing the six most frequent offence categories.](modele_article_quarto_files/figure-html/fig-article-1.png)

Figure 1: A chart should be followed by a sentence stating its main message.

The sentence after the chart should interpret the result. For example: “The categories at the top of the chart account for a large share of findings; this describes observed frequency, not risk per establishment.” Replace this with your own interpretation based on your analysis.

For figures, the most useful options are often:

- `echo: false` to hide code;
- `fig-cap` for a visible caption;
- `fig-alt` for an accessible description;
- `fig-width` and `fig-height` to avoid a figure that is too small;
- `label: fig-...` if you want to refer to the figure with `@fig-...`.

## 5. Remove these elements before submitting

The following are useful during exploration, but should not remain visible without explanation in the final article:

```` markdown
```{r exploration}
head(condamnations)
glimpse(condamnations)
table(condamnations$Type_etablissement)
```
````

Replace them with a description in prose, a table built for the reader or a chart that answers your question. `summary()` output is not a discussion. One line of code is not an explained method. A figure without a title is not yet a publishable result.

> **TIP:**
>
> Ask someone who does not know your code to read only the HTML. Can they identify the question, understand the two main findings and see what each chart contributes without opening RStudio? If not, rewrite the text or figure before submitting.

## 6. Rendering checklist

Before pushing your challenge to GitHub:

I rendered the `.qmd` after restarting R.

I opened the resulting `.html` and checked its appearance.

Analysis code does not appear in the article, or it is folded for a clear reason.

I do not see `##`, `[1]`, `head()`, `glimpse()` or an accidental package message.

Every important result is explained in a sentence.

Every chart has an informative title or caption, readable axes and alternative text.

Numbers in the text are calculated by the document or checked against the data.

The document renders from a clean R session, without objects created manually in the console.

`template_article.qmd` and `template_article.html` are present in the repository.

## Useful references

- [Quarto execution options](https://quarto.org/docs/computations/execution-options.html): `echo`, `include`, `output`, `warning`, `message`, `eval` and figure options.
- [Inline code in Quarto](https://quarto.org/docs/computations/inline-code.html): insert a computed result directly into a sentence.
- [Figures in Quarto](https://quarto.org/docs/authoring/figures.html): captions, alternative text and figure cross-references.
