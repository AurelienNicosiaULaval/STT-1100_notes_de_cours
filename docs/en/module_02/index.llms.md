# GitHub and Data Visualization

Module 02

Organize data work, import an Excel file and produce readable visualizations.

Main threadGitHub, import and charts

DataPenguins, Excel and fictitious cases

ChallengeLogbook and GitHub report

## Finished Product

Final product

### A readable GitHub repository with an analysis report

The expected product combines an organized project, a logbook, a reproducible Quarto report and version-control messages that document the work.

**GitHub repo**

Excel import

annotated chart

rendered report

clean commit annotated chart rendered report

## Module Objectives

At the end of this module, you should be able to

- Use GitHub through RStudio to clone a repository, make commits and push your changes.

- Read an `xlsx` file in RStudio and document the import step in a Quarto report.

- Manage and transform numerical data with `dplyr` (`glimpse`, `select`, `mutate`, `filter`, `group_by`, `summarise`).

- Compute and interpret descriptive statistics for numerical variables, including by subgroup.

- Visualize numerical variables with `ggplot2` (`histogram`, `box plot`, `scatterplot`, `facets`) and interpret the resulting charts.

- Improve chart quality with titles, legends, readable axes, units and graphical consistency.

## Prepare for the module

### Prerequisites

You should be able to open an RStudio project, render a Quarto file and use the basic moves from Module 1. Confirm that you can sign in to GitHub before class.

### Minimum route

Clone the requested repository, open the project, import the Excel file, produce a first chart and make a readable commit. These five moves genuinely prepare you for the adventure.

### Learning priority

Start with one clear chart and a short summary before facets, secondary analyses or visual refinements. Extensions come after a first working render.

### Repository and help

Do not put personal data in GitHub. If access, cloning or pushing fails, keep the error message and ask for help before attempting a workaround.

## Learning Plan

The cards follow the five steps of the learning plan: readings, adventure, challenge, exercises and feedback with or without AI. The adventure and challenge form the module story. Exercises are autonomous and consolidate technical skills. Feedback revisits work you have already completed; it does not require an additional submission.

1 Readings Prepare GitHub, Excel import, dplyr and ggplot2. [Mini-test](mini_test.llms.md) Open cardCollapse

### Initial readings

In Fall 2026, Module 2 is prepared during the week of September 7, then worked through in class on September 14. The preparatory work sets up the GitHub repository, Excel import and first charts; the class meeting puts these skills into practice and consolidates numerical exploration and distribution comparison.

#### Preparatory work

- [SSH connection between GitHub and RStudio](../autre_materiel/connexion-ssh-github-rstudio.llms.md)
  *Configure the account with menus and buttons, then check the connection.*

- [RStudio and GitHub quick reference](../autre_materiel/aide-memoire-rstudio-github.llms.md)
  *Clone a repository, make commits and push to GitHub.*

- [R4DS - Data visualization](https://r4ds.hadley.nz/data-visualize.html)
  *Build first charts with `ggplot2`.*

- [R4DS - Data transformation](https://r4ds.hadley.nz/data-transform.html)
  *Manipulate tables with `dplyr` verbs.*

- [readxl documentation](https://readxl.tidyverse.org/)
  *Import Excel files with `read_excel()`.*

#### Extension

- [R4DS - Exploratory Data Analysis](https://r4ds.hadley.nz/EDA.html)
  *Explore distributions and identify extreme values.*

- [R4DS - Spreadsheets](https://r4ds.hadley.nz/spreadsheets.html)
  *Understand useful data structures in spreadsheets.*

- [IMS - Exploring numerical data](https://openintrostat.github.io/ims/explore-numerical)
  *Interpret numerical summaries, histograms and box plots.*

- [Tidyverse Style Guide - ggplot2](https://style.tidyverse.org/ggplot2.html)
  *Write more readable chart code.*

#### Posit cheat sheets

- [Data import with the tidyverse :: Cheatsheet](https://rstudio.github.io/cheatsheets/data-import.pdf)
  *Import with `readr` and `readxl`.*

- [Data transformation with dplyr :: Cheatsheet](https://rstudio.github.io/cheatsheets/data-transformation.pdf)
  *Transformation verbs used in the adventure and exercises.*

- [Data visualization with ggplot2 :: Cheat Sheet](https://rstudio.github.io/cheatsheets/data-visualization.pdf)
  *Grammar of graphics, geoms, facets, scales and themes.*

[Take the formative reading mini-test](mini_test.llms.md).

2 Adventure Explore penguin data and track the work in GitHub. [Adventure](aventure.llms.md) Open cardCollapse

Goal Move from reading to guided practice.

Resource [Adventure page](aventure.llms.md)

Action Import the data, run the code, produce charts and keep important outputs.

Result A logbook that you can explain.

Pause after each important result and state what it shows.

3 Challenge Submit the logbook and an analysis report in GitHub. [Challenge](defi.llms.md) Open cardCollapse

### Challenge

The module 2 challenge uses the same GitHub repository as the adventure. You must submit the logbook and a Quarto analysis report on the penguin data.

[Open the module 2 challenge](defi.llms.md)

- Part 1: complete and render the logbook.

- Part 2: create `rapport_analyse.qmd` and render `rapport_analyse.html`.

- GitHub: make several clear commits and push the changes.

4 Exercises Practise import, dplyr, charts, statistics and transfer cases. [Exercises](exercices.llms.md) Open cardCollapse

Resource [Exercises page](exercices.llms.md)

Scope These exercises are not a step in the challenge. They practise GitHub, Excel import, charts and two fictitious cases.

Try each exercise before opening the solution, especially when the chart almost works.

5 Feedback Have one excerpt of your work reviewed, then decide what to improve yourself. [Process and examples](../ia.llms.md#feedback-cycle) Open cardCollapse

### Feedback: verifiable summaries and graphs

After an initial attempt, choose one improvement related to Excel import, numerical summaries and visualization. Use the [feedback process](../ia.llms.md#feedback-cycle) with or without AI; this routine adds no submission to the instructions.

A request tailored to module 2

> I am working on Excel import, numerical summaries and visualization. Here are the instructions, relevant criteria and import or summary code, a graph and its interpretation. Identify one strength and at most two improvements, including a grouping choice, unit or missing value that could change the summary if the supplied evidence shows it. Cite the relevant passage, distinguish observable errors from items to check, then suggest a hint and test. Do not rewrite my work and wait for my correction.

- Verify: Compare the number of observations and summary with an inspected subset. Check axes, units and missing-value handling.
- Revisit the correction: present the change and test result, then ask what still needs checking.
- Repeat without help: Explain a useful commit message and justify a graph choice for another descriptive question.

Without AI, compare your attempt with the criteria and course examples, then perform the same checks. Keep a short record in the [tracking worksheet](../ia.llms.md#feedback-trace) if useful.

Privacy Do not share personal, confidential or protected data.

## Data and Tools

### Datasets

[Download the module workspace (.zip)](../../downloads/donnees/stt1100-module-02-en.zip)

[manchots_donnees.xlsx](../donnees.llms.md#dataset-card-manchots-donnees) [palmerpenguins::penguins](../donnees.llms.md#dataset-card-penguins) [Québec City public trees](data/arbres_repertories_quebec.csv) [Québec City cycling counters](data/comptages_cyclistes_quebec_2026.csv)

### R packages

[tidyverse](../packages.llms.md#tidyverse) [palmerpenguins](../packages.llms.md#palmerpenguins) [UlavalSSD](../packages.llms.md#ulavalssd) [readxl](../packages.llms.md#readxl) [ggplot2](../packages.llms.md#ggplot2) [patchwork](../packages.llms.md#patchwork)
