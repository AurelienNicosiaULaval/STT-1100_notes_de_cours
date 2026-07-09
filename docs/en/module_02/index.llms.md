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

The cards follow the four blocks of the learning plan: readings, adventure, challenge, exercises. The adventure and challenge form the module story. Exercises are autonomous and consolidate technical skills.

1 Readings Prepare GitHub, Excel import, dplyr and ggplot2. [Mini-test](mini_test.llms.md) Open cardCollapse

### Initial readings

In Fall 2026, Module 2 is prepared during the week of September 7, then worked through in class on September 14. The preparatory work sets up the GitHub repository, Excel import and first charts; the class meeting puts these skills into practice and consolidates numerical exploration and distribution comparison.

#### Preparatory work

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

## Data and Tools

### Datasets

[manchots_donnees.xlsx](../donnees.llms.md#dataset-card-manchots-donnees) [palmerpenguins::penguins](../donnees.llms.md#dataset-card-penguins) [Fictitious urban trees](data/fictitious_urban_trees.csv) [Fictitious bike share](data/fictitious_bike_share.csv)

### R packages

[tidyverse](../packages.llms.md#tidyverse) [palmerpenguins](../packages.llms.md#palmerpenguins) [UlavalSSD](../packages.llms.md#ulavalssd) [readxl](../packages.llms.md#readxl) [ggplot2](../packages.llms.md#ggplot2) [patchwork](../packages.llms.md#patchwork)

## Review and Extension

### Finish the module with the course AI assistant

Open [the AI page](../ia.llms.md) or [GPT STT-1100](https://chatgpt.com/g/g-682d165f32e881918633affa3fe9dfd6-gpt-stt-1100), then ask for targeted feedback:

*Here is my work for this module. Question my reasoning, identify one fragile line of code, check whether my interpretation answers the instructions, then suggest one realistic improvement I can make myself.*

- Explain the finished product in three sentences.
- Paste a code or output excerpt and ask for a diagnosis.
- Ask for a more ambitious variant, then choose what remains reasonable.
