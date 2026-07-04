# Module 10 - Learning plan

STT-1100 Introduction to Data Science

# Module objectives

At the end of this module, you should be able to:

- Clean and analyze textual data.
- Build a simple sentiment lexicon in French.
- Visualize lexical and emotional trends over time.
- Use TF-IDF to identify distinctive words.
- Create an interactive dashboard with `flexdashboard` and `shiny`.

# Readings

To prepare, check out the following resources:

- [Text Mining with R](https://www.tidytextmining.com/) - Chapters 1 to 3 for tidy text format, sentiment analysis and TF-IDF.
- [tidytext documentation - `unnest_tokens()`](https://juliasilge.github.io/tidytext/reference/unnest_tokens.html)
- [tidytext documentation - `bind_tf_idf()`](https://juliasilge.github.io/tidytext/reference/bind_tf_idf.html)
- [flexdashboard documentation](https://rmarkdown.rstudio.com/flexdashboard/)
- [Using Shiny with flexdashboard](https://rstudio.github.io/flexdashboard/articles/shiny.html)
- [Posit - Shiny Basics](https://shiny.posit.co/r/getstarted/shiny-basics/lesson1/)

After the readings, complete the [module 10 formative mini-test](../module_10/mini_test.llms.md).

# Adventure

You are a junior business analyst hired by the Faculty of Science and Engineering at Laval University. Your mandate: analyze anonymous student comments on the STT-1100 course and produce an interactive dashboard for program management.

[Adventure 10 — Beyond data: text and dashboard](../module_10/aventure.llms.md)

# Challenge - Local or shared dashboard

You need to build an interactive dashboard from the template provided. This dashboard must:

- Display a sentiment score per week;
- Identify distinctive words (TF-IDF) or a word cloud;
- Analyze numerical variables (`plaisir`, `engagement`, `difficulte`);
- Be personalized (filtering, colors, summary);
- Work locally; be deployed or shared only if that instruction is given in class.

Complete instructions: [Challenge 10 — Feedback dashboard](../module_10/defi.llms.md)

Starter repository: `STT-1100/aventure-10`

# Consolidation Exercises

The exercises are independent from the adventure and the challenge. They use two fictitious datasets created for this module:

1.  `fictitious_library_comments.csv` to practise tokenization, stopwords, sentiment and TF-IDF;
2.  `fictitious_culture_workshops.csv` to prepare a mini dashboard summary from comments and numerical variables.

The series ends with two case studies: a library-service prioritization and a cultural-workshop summary.

Link to the exercises: [Consolidation Exercises](../module_10/exercices.llms.md)

# Evaluation grid

Each team must submit an interactive dashboard based on feedback from students in the course. Here is the grid used for the evaluation:

| Criterion | Description | Points |
|----|----|----|
| **Text cleaning** | Text well transformed, tokenized, stopwords removed | /10 |
| **Lexicon and sentiment score** | Clear construction of the FR lexicon, correct application per week | /15 |
| **TF-IDF or word cloud** | Clear and well-illustrated analysis of distinctive words | /15 |
| **Analysis of numerical variables** | Averages or trends well explored (`plaisir`, `engagement`, `difficulte`) | /15 |
| **Visualizations** | Readable, relevant, aesthetic graphics | /15 |
| **Interactive Dashboard (Shiny)** | Effective use of dynamic filters and components | /15 |
| **Personalization / creative effort** | Adaptation of the model provided, visual and editorial effort | /10 |
| **Accessibility and sharing** | Dashboard works locally, with a valid link only if deployment is requested | /5 |

**Total: /100**
