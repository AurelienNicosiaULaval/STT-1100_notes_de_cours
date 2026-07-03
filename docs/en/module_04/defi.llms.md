# Challenge 4 - Clean and document an insurance dataset

STT-1100 Introduction to Data Science

# Mission

You work with Alex on an insurance dataset from an old system. Your mission is to produce a cleaned version of `dataset_pratique.csv` and clearly document the decisions you made.

The goal is not to correct every questionable value. The goal is to show that you can import the file correctly, identify anomalies, choose defensible corrections and keep a structured record of your work.

# Starting Data

The main file is `dataset_pratique.csv`. It is separated by semicolons.

``` r
library(readr)
library(dplyr)
library(janitor)
library(ggplot2)
library(stringr)
library(forcats)

base <- read_delim(
  "dataset_pratique.csv",
  delim = ";",
  trim_ws = TRUE,
  show_col_types = FALSE
) |>
  clean_names()
```

After import, check that you have 23 columns. If you get only one column, the import is incorrect.

# Deliverables

Your GitHub repository must contain the following three files:

- `defi_04.qmd`: your reproducible working document;
- `donnees_propres.csv`: the cleaned dataset;
- `journal_nettoyage.Rdata`: an R object containing the `journal_nettoyage` list.

Your `.qmd` file must render to HTML without error.

# Minimal Log Structure

Your `journal_nettoyage` object must be a named list. Each entry must contain at least the fields `id`, `variables`, `probleme`, `action` and `justification`.

``` r
journal_nettoyage <- list(
  VM = list(),
  DF = list(),
  IF = list(),
  VA = list(),
  FT = list(),
  RC = list(),
  TY = list(),
  LG = list(),
  CI = list(),
  RU = list(),
  TR = list(),
  EC = list()
)
```

Example entry:

``` r
journal_nettoyage$RC <- append(journal_nettoyage$RC, list(
  list(
    id = 40064548,
    variables = "vehicle_type",
    probleme = "Aberrant level in a vehicle-type variable",
    action = "Replace 'ANIMAL' with NA",
    justification = "The value does not describe a usable vehicle type"
  )
))
```

# Minimum Requirements

Your work must include:

1.  a correct import of the file;
2.  an overview of the data structure;
3.  at least five quality checks;
4.  at least three corrections applied to the data;
5.  at least five documented entries in `journal_nettoyage`;
6.  a saved clean dataset;
7.  a saved `journal_nettoyage`.

Corrections must be cautious. If an anomaly is real but no obvious correction is defensible, record it in your log or in your text and explain why you do not correct it.

# Suggested Checks

These are useful starting points. You do not have to correct all of them.

- `vehicle_type` contains an aberrant value.
- `vehicle_year` contains an impossible year.
- `fsa_code` should contain three characters.
- `quarter` and `season` can be compared.
- `years_licensed` should not exceed `age`.
- `commute_distance` contains missing values and high values.
- Some categorical variables are easier to work with after conversion to factors.

# Saving Results

At the end of your document, save both submission objects.

``` r
write_csv(donnees_propres, "donnees_propres.csv")
save(journal_nettoyage, file = "journal_nettoyage.Rdata")
```

# Evaluation Grid

| Criterion | Excellent | Satisfactory | Needs improvement |
|----|----|----|----|
| Import | The file is imported correctly and the structure is checked | The file is imported, but checks are limited | The file is imported incorrectly or the structure is not checked |
| Diagnosis | Several real anomalies are identified with useful output | A few anomalies are identified | Diagnoses are vague or not reproducible |
| Corrections | Corrections are cautious, justified and reproducible | Corrections are present but weakly justified | Corrections are missing or arbitrary |
| Log | The log is structured, complete and consistent with the code | The log exists but some entries are incomplete | The log is missing or hard to use |
| Reproducibility | The `.qmd` renders without error and produces the expected files | The `.qmd` needs small fixes | The work cannot be reproduced |

# Checklist Before Submission

- The `.qmd` file renders to HTML.
- `donnees_propres.csv` is created by the code.
- `journal_nettoyage.Rdata` is created by the code.
- Variable names used in the code are the names obtained after `clean_names()`.
- The GitHub repository contains the expected files.
