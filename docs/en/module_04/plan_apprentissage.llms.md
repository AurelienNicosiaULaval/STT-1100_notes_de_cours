# Module 4 - Learning plan

STT-1100 Introduction to Data Science

# Module objectives

By the end of this module, you should be able to:

- import delimited, Excel and JSON files with the right tools;
- check dimensions, column names and types after import;
- clean column names, coded missing values and text amounts;
- recode categories with `stringr` and `forcats`;
- transform tables between long and wide formats;
- transform a simple list or JSON file into a table;
- document a cleaning decision in a structured list.

# Readings

These readings prepare the core moves of the module: import, clean, transform and document.

- [R for Data Science - Data import](https://r4ds.hadley.nz/data-import.html) To import rectangular files, control types and identify import problems.

- [`readr::read_delim()` documentation](https://readr.tidyverse.org/reference/read_delim.html) To understand the delimiter argument, especially when a file is not comma-separated.

- [R for Data Science - Data tidying](https://r4ds.hadley.nz/data-tidy.html) To review tidy data and long-wide transformations.

- [R for Data Science - Missing values](https://r4ds.hadley.nz/missing-values.html) To distinguish explicit missing values, coded missing values and implicit missing values.

- [R for Data Science - Factors](https://r4ds.hadley.nz/factors.html) To recode, lump and order categorical variables.

- [R for Data Science - Spreadsheets](https://r4ds.hadley.nz/spreadsheets.html) To import Excel files and select a specific sheet.

- [R for Data Science - Hierarchical data](https://r4ds.hadley.nz/rectangling.html) To understand lists, nested data and first rectangling moves.

After the readings, complete the [formative mini-test](../module_04/mini_test.llms.md). It is not graded; it only checks the basics before the adventure.

# Adventure

[Adventure 4](../module_04/aventure.llms.md)

You play the role of a junior data engineer. The adventure guides you through importing an insurance archive, detecting anomalies and documenting cleaning decisions.

# Challenge

[Challenge 4](../module_04/defi.llms.md)

The challenge is the direct continuation of the adventure. You work in the same insurance setting, with more autonomy, to produce:

- `defi_04.qmd`;
- `donnees_propres.csv`;
- `journal_nettoyage.Rdata`.

The goal is not to correct everything that is debatable. The goal is to show that your corrections are cautious, reproducible and documented.

# Consolidation exercises

[Module 4 exercises](../module_04/exercices.llms.md)

The exercises are independent from the adventure and challenge. They use other small fictitious datasets to consolidate technical skills:

1.  import CSV, Excel and JSON files;
2.  clean types, names and missing values;
3.  recode categories;
4.  manipulate lists and JSON files;
5.  document cleaning decisions in a list.

The series ends with two standalone case studies: fictitious scholarship applications and fictitious municipal equipment records.
