Working in the course

# STT-1100 Toolkit

This page gathers the practical moves reused across modules: starting a project, importing data, transforming a table, visualizing, rendering a Quarto report, using GitHub and asking for help effectively.

[Class supports](#class-supports) [R routines](#r-routines) [Quarto and GitHub](#quarto-github) [Troubleshooting](#troubleshooting)

R

Import, transform, visualize

Q

Write and render a report

Git

Track project versions

?

Search and ask for help

## Class supports

These documents complement the modules. They help with challenge review, project preparation and procedures presented in class.

### STT-1100 cheat sheet

A compact reference for R commands, Quarto moves and core course habits.

[PDF cheat sheetShort support to print or keep nearby while practising.](../autre_materiel/Cheat%20sheet/stt1100_cheatsheet_mod.pdf)

### RStudio and GitHub

Steps for cloning a repository, working in an RStudio project and understanding GitHub authentication.

[RStudio and GitHub memoStep-by-step guide for cloning a project and configuring GitHub.](autre_materiel/Aide%20mémoire%20Rstudio%20et%20Github.llms.md) [GitHub presentationFrench class support about repositories, commits and versioned work.](../autre_materiel/Github/Présentation%20Github.pdf)

### Search and get help

A method for phrasing a question, reading an error message and using the right help channels.

[How to searchGuide for using RStudio help, documentation, the Web and GPT STT-1100.](autre_materiel/Ou%20et%20comment%20chercher/ou%20et%20comment%20chercher.llms.md) [Reference materialUseful links for help, search and frequent questions.](references.llms.md)

### Data science roles

A presentation that connects the course to a real project cycle: import, cleaning, transformation, visualization, modeling and communication.

[Career panoramaModule 1 support about roles and the complete data project cycle.](autre_materiel/Présentation%20des%20différents%20rôles/roles_presentation_v2.llms.md)

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

[Review the start page](demarrage.llms.md) [Clone with RStudio](autre_materiel/Aide%20mémoire%20Rstudio%20et%20Github.llms.md)

### Project

One folder, one Quarto file, data in the right place and explicit file names.

### Report

A clear title, readable code blocks and results interpreted in short sentences.

### Version

Small and understandable commits when the work is ready to save.

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

[Open GPT STT-1100](https://chatgpt.com/g/g-682d165f32e881918633affa3fe9dfd6-stt-1100) [Search guide](autre_materiel/Ou%20et%20comment%20chercher/ou%20et%20comment%20chercher.llms.md)
