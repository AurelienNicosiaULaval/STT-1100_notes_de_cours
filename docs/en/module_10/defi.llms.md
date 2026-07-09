# Challenge 10 — Feedback dashboard

STT-1100 • Introduction to Data Science

## Mission

Build an interactive dashboard from the fictitious file supplied in the repository. Real feedback may be used only when the instructor provides it in anonymized form and explicitly confirms its permitted use in this challenge.

The working file is `data/sentiments_cours.csv`. By default, use the non-real example version supplied in the repository. Do not copy real comments into your repository, even when they appear anonymous.

## Starter repository

The starter repository is:

`STT-1100/aventure-10`

The template to modify is:

`modele_dashboard.Rmd`

The course primarily uses Quarto. This template retains the `Rmd` format because the requested dashboard relies on `flexdashboard`; modify and render it in that format for this specific challenge.

## Data

The final dashboard must be designed to work with a `data/sentiments_cours.csv` file containing at least the following variables. The column names are kept in French to match the R template.

- `id`: anonymous identifier;
- `semaine`: week or module number;
- `commentaire`: free text to analyze;
- `difficulte`: perceived difficulty level;
- `engagement`: engagement level;
- `plaisir`: enjoyment level.

If you use a recoded or derived variable, state that clearly in the dashboard.

## Expected dashboard

### Minimum core to make work first

- open the template locally without an error;
- add at least one interactive filter;
- produce one readable chart;
- write a short conclusion linked to that chart.

### Elements to add after the core

Your dashboard must:

- display a sentiment score by week;
- identify distinctive words using TF-IDF or produce a word cloud;
- analyze the numerical variables `plaisir`, `engagement`, and `difficulte`;
- include at least one interactive filter;
- present a short summary of the main observations;
- be personalized without reducing readability.

## Confidentiality

Student feedback must remain anonymous. Do not publish comments that could identify a person. By default, fictitious data are the only data to place in GitHub.

If the instructor exceptionally authorizes a real file, use only the supplied version, keep the minimum required for the dashboard, do not republish it and follow the retention instructions given in class.

## Deliverables

Your GitHub repository must contain:

- the modified `modele_dashboard.Rmd` file;
- the final HTML output or the instructions needed to run the dashboard locally;
- the fictitious data needed for rendering, with no real feedback;
- a short `README.md` explaining how to open the dashboard locally and, if requested, how to deploy it.

The minimal deliverable is a reproducible dashboard that works locally. Public deployment or sharing an external link is required only if that instruction is given in class.

## Evaluation grid

| Criterion | Description | Points |
|----|----|----|
| Text cleaning | Text transformed, tokenized, stopwords removed, missing values handled | /10 |
| Lexicon and sentiment score | Clear French lexicon, correct weekly application, limits explained | /15 |
| TF-IDF or word cloud | Clear analysis of distinctive words, readable visualization | /15 |
| Numerical variables | Trends or averages well explored for `plaisir`, `engagement`, `difficulte` | /15 |
| Visualizations | Relevant, readable and well-titled charts | /15 |
| Interactivity | Useful Shiny filters or components for exploring the data | /15 |
| Personalization | Adaptation of the template, coherent visual choices, useful summary | /10 |
| Accessibility and sharing | Dashboard works locally, filters and charts are readable, with a valid link only if deployment is requested | /5 |

Total: /100
