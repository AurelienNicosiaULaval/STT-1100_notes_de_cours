# Collaboration and reproducibility in GitHub

Module 06

Move from individual work to a reproducible collaborative workflow.

Main threadGitHub, joins and reproducibility

DataLinked tables and multiple datasets

ChallengeReproducible workflow with merged data

## Finished Product

Final product

### A reproducible collaboration logbook

The module leads to a structured GitHub work trace, enriched by joined data and explicit collaboration choices.

**collaboration**

joins

issues

peer review

joins issues peer review

## Module Objectives

At the end of this module, you should be able to:

- Collaborate effectively on data science projects using `GitHub`.
- Ensure the reproducibility of analyzes with `Quarto`.
- Merge and manage multiple datasets.
- Explain the data life cycle and the principles of `DataOps`.

## Learning Plan

The cards follow the four blocks of the learning plan: readings, adventure, challenge, exercises. Open the cards to see the expected action and useful link.

1 Readings Prepare GitHub collaboration, joins and relational data. In this card Open cardCollapse

### Readings

In this module, we’ll explore the basic concepts of collaboration and reproducibility in GitHub, as well as using Quarto to create dynamic reports. Here is some initial reading to prepare you:

- [GitHub Docs – Hello World](https://docs.github.com/en/get-started/quickstart/hello-world) First complete project: repository, branch, pull request then merge.
- [GitHub Docs – About pull requests](https://docs.github.com/en/pull-requests) Learn everything about code review, comments and conflict resolution.
- [Quarto Docs – Inline Code](https://quarto.org/docs/computations/inline-code.html) Insert R code directly into text to dynamically display values.
- [What is DataOps? (DataKitchen)](https://datakitchen.io/what-is-dataops/) DataOps fundamentals: automation, quality, and collaboration.
- [R for Data Science (2nd ed.) – Chapter 26: Joins](https://r4ds.hadley.nz/joins.html) Learn to combine data from different sources with `dplyr`.

2 Adventure Connect several tables and document team decisions. [Adventure](aventure.llms.md) Open cardCollapse

Goal Move from reading to guided practice.

Resource [Adventure page](aventure.llms.md)

Action Follow the instructions, run the code and keep important outputs.

Result A first work object that you can explain.

Pause after each important result and state what it shows.

3 Challenge Produce a useful peer review of logbooks. In this card Open cardCollapse

### Challenge — Cross-review of logbooks

> Each team must **share their logbook** with another team and provide **constructive feedback**. This step simulates the peer review process and reinforces critical communication skills.

#### Steps to take

1.  **Assignment of pairs**: the teacher will publish a table listing for each team the logbook to be examined.

2.  **Sharing the document**:

    - The repository manager adds the recipient team as a read/write *Collaborator* on GitHub.
    - The URL of the HTML logbook is communicated.

3.  **Peer Review**:

    - Each member of the review team opens an *Issue* in the review team repository and submits at least **one detailed comment** relating to:

      1.  **Clarity** of content (structure, titles, readability)
      2.  **Rigour** of the methodology (description of roles, reproducibility of the code)
      3.  **Relevance** of reflections (data life cycle, lessons learned)

    - Comments must contain:

      - A positive aspect statement (“what is successful”)
      - A specific suggestion for improvement (“what could be clarified”)

4.  **Acknowledgement of receipt & review**:

    - The receiving team responds to each *Issue* and, if deemed necessary, updates its logbook.

#### Deliverables

| Team | Deliverable | Where to drop it off |
|----|----|----|
| **Reviewing team** | ≥ 3 *Issues* (one per member) containing full feedback | GitHub repository of the reviewed team |
| **Revised team** | Updated logbook (if necessary modifications) + responses to *Issues* | Same GitHub repository |

#### Scale (20pts)

| Criterion                                                   | Pts |
|-------------------------------------------------------------|-----|
| Quality of comments (clarity, constructiveness, examples)   | 10  |
| Relevance of suggestions to reproducibility & collaboration | 5   |
| Follow-up and responses from the revised team               | 5   |

------------------------------------------------------------------------

> **Tip**: focus on actionable feedback (e.g. proposing a more descriptive title, adding an additional graphic, specifying a YAML parameter) rather than generic comments.

4 Exercises Revisit joins, issues and shared project reading. [Exercises](exercices.llms.md) Open cardCollapse

Resource [Exercises page](exercices.llms.md)

Why Exercises stay on a separate page because they take more space.

Redo at least one passage without looking at the solution immediately.

## Data and Tools

### Datasets

[gapminder::gapminder](../donnees.llms.md#dataset-card-gapminder) [dplyr::starwars](../donnees.llms.md#dataset-card-starwars) [Lahman::People](../donnees.llms.md#dataset-card-lahman) [weathercan](../donnees.llms.md#dataset-card-weathercan)

### R packages

[dplyr](../packages.llms.md#dplyr) [palmerpenguins](../packages.llms.md#palmerpenguins) [gapminder](../packages.llms.md#gapminder) [countrycode](../packages.llms.md#countrycode) [tibble](../packages.llms.md#tibble) [lahman](../packages.llms.md#lahman) [babynames](../packages.llms.md#babynames) [weathercan](../packages.llms.md#weathercan) [fivethirtyeight](../packages.llms.md#fivethirtyeight) [unvotes](../packages.llms.md#unvotes) [ggplot2movies](../packages.llms.md#ggplot2movies) [ggplot2](../packages.llms.md#ggplot2) [fires](../packages.llms.md#fires)

## Review and Extension

### Finish the module with the course AI assistant

Before moving to the next module, use the course AI assistant as a review partner: ask it to question your reasoning, identify fragile code and suggest one realistic improvement to the challenge.

- Explain the finished product in three sentences.
- Paste a code or output excerpt and ask for a diagnosis.
- Ask for a more ambitious variant, then choose what remains reasonable.
