Working in the course

# STT-1100 Toolkit

This page gathers the practical moves reused across modules: starting a project, importing data, transforming a table, visualizing, rendering a Quarto report, using GitHub and asking for help effectively.

[By situation](#by-situation) [Class supports](#class-supports) [R routines](#r-routines) [Quarto and GitHub](#quarto-github) [Troubleshooting](#troubleshooting)

R

Import, transform, visualize

Q

Write and render a report

Git

Track project versions

?

Search and ask for help

Starting point

## What do you need right now?

The toolkit is mainly here to help you choose the right reflex at the right time. If you are unsure where to start, begin with the situation closest to your problem.

### I am starting a module

Open the module page, check the readings, locate the data files and keep the cheat sheet nearby.

[View modules](modules.llms.md)

### I need to clone a repository

Use the RStudio and GitHub memo, choose the SSH link, then open the project in RStudio before editing files.

[Open the guide](autre_materiel/aide-memoire-rstudio-github.llms.md)

### I need to import data

Identify the file format, open the right project folder, then choose the appropriate import function.

[View datasets](donnees.llms.md)

### I am looking for an R function

Start from the task: import, transform, visualize, clean text, work with dates or produce a report.

[View packages](packages.llms.md)

### My report does not render

Render the document, read the first error message, check paths, then isolate the chunk that fails.

[Go to troubleshooting](#troubleshooting)

### I want to use AI

Use AI to clarify, test or compare, but keep statistical decisions and interpretation under your control.

[View AI page](ia.llms.md)

### I am preparing a submission

Check rendering, files, sources, figures, comments and commits if GitHub is required.

[View checklist](#before-submission)

## Class supports

These documents complement the modules. They help with challenge review, project preparation and procedures presented in class.

### STT-1100 cheat sheet

A compact reference for R commands, Quarto moves and core course habits.

[PDF cheat sheetShort support to print or keep nearby while practising.](autre_materiel/Cheat%20sheet/stt1100_cheatsheet_mod.pdf)

### RStudio and GitHub

Steps for cloning a repository with SSH, working in an RStudio project and understanding GitHub authentication errors.

[RStudio and GitHub memoStep-by-step guide to follow first when cloning a project.](autre_materiel/aide-memoire-rstudio-github.llms.md) [GitHub presentationFrench PDF support for reviewing repositories, commits, push and pull.](../autre_materiel/Github/Présentation%20Github.pdf)

### Search and get help

A method for phrasing a question, reading an error message and using the right help channels.

[How to searchGuide for using RStudio help, documentation, the Web and GPT STT-1100.](autre_materiel/chercher-aide.llms.md) [Reference materialUseful links for help, search and frequent questions.](references.llms.md)

### Data science roles

A presentation that connects the course to a real project cycle: import, cleaning, transformation, visualization, modeling and communication.

[Role panoramaModule 1 support about roles and the complete data project cycle.](autre_materiel/roles-science-donnees/)

## Frequent R routines

The cards below summarize what to use depending on the task. For details by package, use the package page.

### Import

`readr::read_csv()`, `readxl::read_excel()`, `haven::read_sav()`. Always check with `glimpse()`, `names()` and `skimr::skim()`.

### Select and filter

`dplyr::select()` keeps columns, `dplyr::filter()` keeps rows, `dplyr::arrange()` orders the table.

### Create and summarize

`dplyr::mutate()` creates variables, `dplyr::group_by()` defines groups, `dplyr::summarise()` computes summaries.

### Reshape

`tidyr::pivot_longer()` creates long data, `tidyr::pivot_wider()` widens a table, `tidyr::separate()` splits a column.

### Clean text and categories

`stringr` helps detect, replace and extract text. `forcats` recodes and reorders factors.

### Visualize

Start with `ggplot()`, define variables with `aes()`, choose a `geom_*`, then polish titles, axes and facets.

[View course packages](packages.llms.md) [View datasets](donnees.llms.md)

## Minimal workflow

In STT-1100, reproducible work follows the same logic: open the right project, load packages, import data, write code in a Quarto document, render the document, then save important steps with GitHub when the module asks for it.

[Review the start page](demarrage.llms.md) [Clone with RStudio](autre_materiel/aide-memoire-rstudio-github.llms.md)

### Project

One folder, one Quarto file, data in the right place and explicit file names.

### Report

A clear title, readable code blocks and results interpreted in short sentences.

### Version

Small and understandable commits when the work is ready to save.

Final check

## Before submitting or pushing

This checklist avoids the most expensive mistakes: a missing file, an unexplained chart, a render failure or a vague commit.

1

### Render

The `.qmd` file must render without error on your machine, not only run a few chunks in the Console.

2

### Check data

Required files must be in the repository or accessible through the path written in the report.

3

### Interpret

Every important table or chart should have a sentence saying what is observed and what cannot be concluded.

4

### Save

If GitHub is required, make a commit with a precise message, then check that the remote repository contains the expected files.

## Troubleshooting and help

Before asking for help, make the problem observable. This is also what makes the course AI useful.

### Read the error

Copy the full message. Identify the function, object or file mentioned.

### Reduce

Rerun only the block that fails. Check that packages are loaded and data exist.

### Compare

Compare with a module example, the cheat sheet or the official documentation.

### Phrase

State the goal, minimal code, error message and expected result.

### Check AI

When an answer comes from AI, ask: *Which line should I test and what hypothesis does this test verify?* Then run the code and keep a trace of what was used.

### Ask targeted help

A good question includes context, the instruction followed, minimal code, the error and what you already tried. Example: *Here is my goal, minimal code, full message and what I already tried.*

[Open GPT STT-1100](https://chatgpt.com/g/g-682d165f32e881918633affa3fe9dfd6-gpt-stt-1100) [Search guide](autre_materiel/chercher-aide.llms.md) [Course AI rules](ia.llms.md)
