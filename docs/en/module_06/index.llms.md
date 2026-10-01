# Collaboration and Reproducibility in GitHub

Module 06

Move from individual work to a reproducible collaborative workflow.

Main threadGitHub, joins and reproducibility

Datanycflights23 and related tables

ChallengePeer review of a collaborative report

## Finished Product

Final product

### A reproducible collaborative report

The module leads to a Quarto report versioned in GitHub, enriched with joined data, visualizations and a clear trail of team decisions.

**collaboration**

branches

joins

review

report render issues

## Module Objectives

By the end of this module, you should be able to:

- collaborate effectively on a data science project with GitHub;
- use branches, commits and pull requests in a team context;
- join several tables with `dplyr`;
- produce a reproducible Quarto report;
- provide constructive feedback in a GitHub issue.

## Prepare for the module

### Prerequisites

Revisit the Module 2 GitHub repository and one rendered Quarto report. You should be able to locate a file, read commit history and recognize a simple join before starting.

### Minimum route

Read the `README`, check one join, render one report and write one precise issue. The goal is to make another team’s work understandable and actionable.

### Team work

A useful issue names one successful element, one precise suggestion, the relevant location and its rationale. Stay with observable work, never the person.

### If the assigned team is blocked

Document what you could verify, do not invent a problem and promptly tell the instructor or TA. Do not remain dependent on an external response.

## Learning Plan

The cards follow the five steps of the learning plan: readings, adventure, challenge, exercises and feedback with or without AI. The adventure and challenge form the module story. Exercises are independent and consolidate joins, reproducibility and constructive review on other data. Feedback revisits work you have already completed; it does not require an additional submission.

1 Readings Prepare GitHub collaboration, pull requests, issues and joins. [Mini-test](mini_test.llms.md) Open cardCollapse

### Module 6 Readings

These readings prepare collaborative work: follow history, discuss a change, open a useful issue and join tables.

#### GitHub Collaboration

- [GitHub Docs - GitHub flow](https://docs.github.com/en/get-started/using-github/github-flow)
  *Understand branches, commits, pull requests and merging in a collaboration workflow.*
- [GitHub Docs - Creating an issue](https://docs.github.com/en/issues/tracking-your-work-with-issues/using-issues/creating-an-issue)
  *Write useful and actionable feedback in a team repository.*

#### Joins with dplyr

- [R for Data Science - Joins](https://r4ds.hadley.nz/joins)
  *Connect several tables with keys and check which rows appear or disappear.*
- [dplyr - Mutating joins](https://dplyr.tidyverse.org/reference/mutate-joins.html)
  *Reference for `left_join()`, `inner_join()`, `right_join()` and `full_join()`.*

#### Posit cheat sheets

- [Data transformation with dplyr :: Cheatsheet](https://rstudio.github.io/cheatsheets/data-transformation.pdf)
  *Joins, grouped summaries and table checks.*
- [Publish and Share with Quarto :: Cheatsheet](https://rstudio.github.io/cheatsheets/quarto.pdf)
  *Produce a reproducible team report.*

[Complete the formative mini-test for the readings](mini_test.llms.md).

2 Adventure Produce a collaborative report on JFK flight delays. [Adventure](aventure.llms.md) Open cardCollapse

Goal Use GitHub, Quarto and `nycflights23` in teamwork.

Resource [Adventure page](aventure.llms.md)

Submit `rapport.qmd`, `rapport.html` and `README.md`.

3 Challenge Write a clear and actionable peer review. [Challenge](defi.llms.md) Open cardCollapse

### Challenge - Peer review

You assess another team's report as a collaborator: check reproducibility, write useful issues and respond to corrections.

- Goal: produce precise, actionable feedback tied to the code or report.
- Deliverables: GitHub issues, responses and accepted corrections.
- Watch point: a good issue must help the team know what to modify.

The full instructions are available in the [Challenge 6](defi.llms.md) page.

4 Exercises Practise joins on a real Québec data catalogue. [Exercises](exercices.llms.md) Open cardCollapse

Goal Consolidate joins, key diagnostics and GitHub reviews.

Resource [Exercises page](exercices.llms.md)

Scope These exercises are not the continuation of the challenge. They use a real relational extract from Données Québec: organizations, datasets, resources and tags.

5 Feedback Have one excerpt of your work reviewed, then decide what to improve yourself. [Process and examples](../ia.llms.md#feedback-cycle) Open cardCollapse

### Feedback: precise review and a checked join

After an initial attempt, choose one improvement related to joins, reproducibility and peer review. Use the [feedback process](../ia.llms.md#feedback-cycle) with or without AI; this routine adds no submission to the instructions.

A request tailored to module 6

> I am working on joins, reproducibility and peer review. Here are the instructions, relevant criteria and an issue I wrote and the observable elements supporting it. Identify one strength and at most two improvements, including vague wording or an insufficiently documented join or rendering check if the supplied evidence shows it. Cite the relevant passage, distinguish observable errors from items to check, then suggest a hint and test. Do not rewrite my work and wait for my correction.

- Verify: Check keys and row counts before and after the join, then test rendering. When reviewing an issue, check that it states where to act, why and how to verify the correction.
- Revisit the correction: present the change and test result, then ask what still needs checking.
- Repeat without help: Rewrite a vague suggestion as an actionable comment, then explain the expected follow-up after a team response.

Without AI, compare your attempt with the criteria and course examples, then perform the same checks. Keep a short record in the [tracking worksheet](../ia.llms.md#feedback-trace) if useful.

Privacy Do not share personal, confidential or protected data.

## Data and Tools

### Datasets

[Download the module workspace (.zip)](../../downloads/donnees/stt1100-module-06-en.zip)

[nycflights23::flights](../donnees.llms.md#dataset-card-nycflights23-flights) [nycflights23::airlines](../donnees.llms.md#dataset-card-nycflights23-airlines) [nycflights23::weather](../donnees.llms.md#dataset-card-nycflights23-weather) [Données Québec organizations](data/organisations_donnees_quebec.csv) [Données Québec datasets](data/jeux_donnees_quebec.csv) [Données Québec resources](data/ressources_donnees_quebec.csv) [Données Québec tags](data/etiquettes_donnees_quebec.csv)

### R packages

[tidyverse](../packages.llms.md#tidyverse) [nycflights23](../packages.llms.md#nycflights23) [dplyr](../packages.llms.md#dplyr) [readr](../packages.llms.md#readr) [ggplot2](../packages.llms.md#ggplot2)
