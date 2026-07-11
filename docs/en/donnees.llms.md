Data catalogue

# Course datasets

This page gathers the datasets used in STT-1100. It helps students find downloadable files, datasets provided by R packages and short profiles for local files.

[Start](#use-catalogue) [By module](#catalogue-by-module) [Local profiles](#local-file-profiles) [R packages](packages.llms.md)

CSV

Files to import and clean

R

Datasets included in packages

JSON

Nested data and lists

XLS

Practice Excel sheets

Working method

## Use the catalogue

Each card gives a quick preview, a link to the local profile when the file is provided, or a link to the package when the data come from R. The catalogue does not replace the module instructions: it mainly helps you find the right dataset and understand its role.

1

### Find the module

Start from the module connected to the exercise, adventure or challenge. The cards preserve this progression.

2

### Identify the type

A local file is downloaded; package data are loaded with R; a web page requires careful collection.

3

### Import from the right folder

In exercises, paths such as `data/file.csv` are relative to the module folder.

4

### Document the source

A reproducible report always says where the data come from and what they can, or cannot, support.

Quick landmarks

## Which type of data are you looking for?

The course datasets do not all serve the same purpose. Some are for practising basics, others for working with formats, joins, ethics or communication.

### Local files

CSV, JSON, Excel, RDS and HTML files provided with the modules. They are most useful for independent exercises.

### Package datasets

Datasets accessible from R, useful for learning before managing file paths in detail.

### Web data

External pages or repositories used to discuss collection, technical limits and terms of use.

### Fictitious data

Simulated data used to practise without exposing personal information or reproducing a real system.

Troubleshooting

## When importing does not work

Before changing code at random, check these four points. They solve most problems with course files.

### File path

Open the project or module folder before using a relative path such as `data/file.csv`.

### Separator

A CSV can use a comma or a semicolon. Choose `read_csv()` or `read_delim()` according to the file.

### Format

Excel, JSON, RDS and HTML are not read with the same function. The useful package is listed on the R packages page.

### Interpretation

Fictitious data are for learning a method; they should not be described as evidence about the real world.

## Catalogue by module

### Module 01

[Module 01 ](packages.llms.md#ulavalssd)

## UlavalSSD::MeteoQuebec

Dataset used for the first exploration steps in R.R packageStructure to consultView documentation [Module 01 ](#module01-bibliotheques)

## fictitious_municipal_libraries.csv

Fictitious observations about visits, loans and workshops in municipal libraries.Local file12 observations / 8 variablesView profile [Module 01 ](#module01-coop)

## fictitious_student_coop.csv

[Fictitious sales from a student cooperative.Local file12 observations / 7 variablesView profile](#module01-coop)

### Module 02

[Module 02 ](#manchots-donnees)

## manchots_donnees.xlsx

Practice Excel file about penguins.Local fileStructure to consultView profile [Module 02 ](#module02-arbres)

## fictitious_urban_trees.csv

Fictitious inventory of urban trees in a few neighbourhoods.Local file24 observations / 7 variablesView profile [Module 02 ](#module02-velo)

## fictitious_bike_share.csv

Fictitious bike-share trips by station, month and type of day.Local file24 observations / 8 variablesView profile [Module 02 ](packages.llms.md#palmerpenguins)

## palmerpenguins::penguins

[Demonstration dataset about penguins.R packageStructure to consultView documentation](packages.llms.md#palmerpenguins)

### Module 03

[Module 03 ](packages.llms.md#ulavalssd)

## UlavalSSD::listecondamnation

Food offence records used for the journalistic article.R packageStructure to consultView documentation [Module 03 ](packages.llms.md#palmerpenguins)

## palmerpenguins::penguins_raw

Rawer version of the penguins dataset.R packageStructure to consultView documentation [Module 03 ](packages.llms.md#titanic)

## titanic::titanic_train

Passenger data from the Titanic used as an example of categorical variables.R packageStructure to consultView documentation [Module 03 ](#module03-requetes-311)

## fictitious_311_requests.csv

Fictitious 311 requests for a few Quebec municipalities.Local file24 observations / 7 variablesView profile [Module 03 ](#module03-plaintes-transport)

## fictitious_transit_complaints.csv

[Fictitious complaints for public transit networks.Local file24 observations / 7 variablesView profile](#module03-plaintes-transport)

### Module 04

[Module 04 ](#dataset-pratique)

## dataset_pratique.csv

Practice CSV file about automobile insurance quotes.Local file101,768 observations / 23 variablesView profile [Module 04 ](#policies-module-04)

## policies.csv

Small CSV file about insurance policies.Local file15 observations / 9 variablesView profile [Module 04 ](#coverage-module-04)

## coverage.json

JSON file associated with policy coverages.Local file2 observations / 2 variablesView profile [Module 04 ](#quotes-module-04)

## quotes_2024.xlsx

Excel file containing one sheet named Q3.Local fileStructure to consultView profile [Module 04 ](#module04-equipements)

## fictitious_municipal_equipment.csv

Fictitious municipal equipment records with deliberately imperfect formats.Local file16 observations / 7 variablesView profile [Module 04 ](#module04-demandes-bourses)

## fictitious_scholarship_applications.csv

Fictitious student scholarship applications.Local file16 observations / 8 variablesView profile [Module 04 ](#module04-regles-equipements)

## fictitious_equipment_rules.json

[Fictitious validation rules for municipal equipment.Local file4 observations / 2 variablesView profile](#module04-regles-equipements)

### Module 05

[Module 05 ](#flights-merged-2023)

## flights_merged_2023.rds

Serialized R object containing an enriched flights table.Local file435,352 observations / 50 variablesView profile [Module 05 ](#module05-ateliers-soutien)

## fictitious_support_workshops.csv

Fictitious university support workshops with attendance, weather and satisfaction.Local file24 observations / 10 variablesView profile [Module 05 ](#module05-frequentation-bibliotheque)

## fictitious_library_visits.csv

Fictitious visit observations in library areas.Local file24 observations / 8 variablesView profile [Module 05 ](#module05-demandes-services)

## fictitious_campus_service_requests.csv

[Fictitious requests sent to campus services.Local file24 observations / 8 variablesView profile](#module05-demandes-services)

### Module 06

[Module 06 ](packages.llms.md#nycflights23)

## nycflights23::flights

Flight table for departures from New York in 2023.R package435,352 observations / 19 variablesView documentation [Module 06 ](packages.llms.md#nycflights23)

## nycflights23::airlines

Lookup table between carrier codes and full carrier names.R package14 observations / 2 variablesView documentation [Module 06 ](packages.llms.md#nycflights23)

## nycflights23::weather

Hourly weather conditions for New York airports in 2023.R package26,207 observations / 15 variablesView documentation [Module 06 ](#module06-members)

## fictitious_team_members.csv

Fictitious members from two project teams.Local file8 observations / 4 variablesView profile [Module 06 ](#module06-contributions)

## fictitious_git_contributions.csv

Fictitious Git contributions linked to members.Local file12 observations / 6 variablesView profile [Module 06 ](#module06-issues)

## fictitious_review_issues.csv

Fictitious issues produced during peer review.Local file7 observations / 7 variablesView profile [Module 06 ](#module06-report-files)

## fictitious_report_files.csv

Expected files in fake report repositories.Local file12 observations / 4 variablesView profile [Module 06 ](#module06-data-portal)

## fictitious_data_portal.csv

Fictitious datasets from an open-data portal.Local file6 observations / 5 variablesView profile [Module 06 ](#module06-producers)

## fictitious_producers.csv

Fictitious producers associated with a data portal.Local file4 observations / 4 variablesView profile [Module 06 ](#module06-review-comments)

## fictitious_review_comments.csv

[Fictitious review comments on datasets.Local file6 observations / 6 variablesView profile](#module06-review-comments)

### Module 07

[Module 07 ](https://github.com/STT-1100/aventure-7)

## covid_module7_douteux.csv

Simulated CSV file deliberately containing quality, confidentiality and re-identification issues.Web120 observations / 25 variablesView documentation [Module 07 ](#module07-signalements)

## fictitious_municipal_reports.csv

Fictitious municipal reports aggregated by neighbourhood and type.Local file12 observations / 6 variablesView profile [Module 07 ](#module07-population)

## fictitious_neighbourhood_population.csv

Fictitious neighbourhood population used to normalize reports.Local file7 observations / 4 variablesView profile [Module 07 ](#module07-sondage)

## fictitious_student_survey.csv

[Fictitious student survey with useful variables and fields that should not be published.Local file16 observations / 9 variablesView profile](#module07-sondage)

### Module 08

[Module 08 ](https://www.donneesquebec.ca/recherche/?sort=metadata_modified+desc&page=1)

## Données Québec search page

Public search page from the Données Québec portal used to practise HTML extraction.WebStructure to consultView documentation [Module 08 ](#module08-catalogue)

## catalogue_donnees_quebec.html

HTML snapshot of six real Données Québec catalog records from six cities.Local file6 observations / 4 variablesView profile [Module 08 ](#module08-irregular)

## catalogue_donnees_quebec_irregulier.html

HTML snapshot of four real records, including two without a category in the portal.Local file4 observations / 4 variablesView profile [Module 08 ](#module08-evenements)

## evenements_sit_quebec.html

[HTML snapshot of six real events announced in six Quebec cities.Local file6 observations / 4 variablesView profile](#module08-evenements)

### Module 09

[Module 09 ](#eleves-fictifs)

## eleves_fictifs.csv

Fictitious CSV file about students.Local file1,000 observations / 6 variablesView profile [Module 09 ](#ecoles-primaires-qc)

## ecoles_primaires_qc.csv

CSV file about primary schools in Quebec.Local file1,963 observations / 11 variablesView profile [Module 09 ](#module09-logements-energie)

## fictitious_housing_energy.csv

Fictitious housing units with annual electricity consumption.Local file32 observations / 8 variablesView profile [Module 09 ](#module09-subventions-culture)

## fictitious_culture_grants.csv

[Fictitious cultural grant applications.Local file36 observations / 8 variablesView profile](#module09-subventions-culture)

### Module 10

[Module 10 ](#module10-commentaires-bibliotheques)

## fictitious_library_comments.csv

Fictitious comments about municipal library services.Local file24 observations / 8 variablesView profile [Module 10 ](#module10-ateliers-culture)

## fictitious_culture_workshops.csv

Fictitious feedback about public cultural workshops.Local file24 observations / 8 variablesView profile [Module 10 ](packages.llms.md#tidytext)

## Comments and working texts

[Texts and comments prepared in the activities.TextStructure to consultView documentation](packages.llms.md#tidytext)

## Local file profiles

Previews are limited to the first rows to keep the site light. Variable profiles are therefore quick diagnostics of the displayed preview, not exhaustive analyses of each full file.

### fictitious_municipal_libraries.csv

Fictitious observations about visits, loans and workshops in municipal libraries.

[Download fictitious_municipal_libraries.csv](module_01/data/fictitious_municipal_libraries.csv)

| Information | Value |
|:---|:---|
| Module | Module 01 |
| Observations | 12 |
| Variables | 8 |
| Course use | Practise importing, inspecting a table and producing first numerical summaries. |
| Source | Fictitious data created for module 01 exercises. |
| License | Simulated course data. |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| message | character | 0 | 1 | Preview unavailable: ’/private/tmp/stt1100-module8.jcvbMq/repo/en/modu |

### fictitious_student_coop.csv

Fictitious sales from a student cooperative.

[Download fictitious_student_coop.csv](module_01/data/fictitious_student_coop.csv)

| Information | Value |
|:---|:---|
| Module | Module 01 |
| Observations | 12 |
| Variables | 7 |
| Course use | Compute revenue, summarize quantities, explore discounts and formulate first observations. |
| Source | Fictitious data created for module 01 exercises. |
| License | Simulated course data. |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| message | character | 0 | 1 | Preview unavailable: ’/private/tmp/stt1100-module8.jcvbMq/repo/en/modu |

### manchots_donnees.xlsx

Practice Excel file about penguins.

[Download manchots_donnees.xlsx](module_02/resources/manchots_donnees.xlsx)

| Information  | Value                                                |
|:-------------|:-----------------------------------------------------|
| Module       | Module 02                                            |
| Observations | Not determined automatically                         |
| Variables    | Not determined automatically                         |
| Course use   | Import an Excel file and inspect a table in RStudio. |
| Source       | File provided with the course material.              |
| License      | Course teaching material.                            |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| species | character | 0 | 3 | Gentoo |
| island | character | 0 | 3 | Dream |
| bill_length_mm | numeric | 0 | 50 | 41.6788627834779 |
| bill_depth_mm | numeric | 0 | 50 | 12.8432466901621 |
| flipper_length_mm | numeric | 0 | 50 | 197.314820493238 |
| body_mass_g | numeric | 0 | 50 | 4253.87883515575 |
| sex | character | 0 | 2 | male |

### fictitious_urban_trees.csv

Fictitious inventory of urban trees in a few neighbourhoods.

[Download fictitious_urban_trees.csv](module_02/data/fictitious_urban_trees.csv)

| Information | Value |
|:---|:---|
| Module | Module 02 |
| Observations | 24 |
| Variables | 7 |
| Course use | Produce basic charts, compare groups and connect visual choices to a descriptive question. |
| Source | Fictitious data created for module 02 exercises. |
| License | Simulated course data. |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| message | character | 0 | 1 | Preview unavailable: ’/private/tmp/stt1100-module8.jcvbMq/repo/en/modu |

### fictitious_bike_share.csv

Fictitious bike-share trips by station, month and type of day.

[Download fictitious_bike_share.csv](module_02/data/fictitious_bike_share.csv)

| Information | Value |
|:---|:---|
| Module | Module 02 |
| Observations | 24 |
| Variables | 8 |
| Course use | Explore relationships between trips, weather and temporal context with visualizations. |
| Source | Fictitious data created for module 02 exercises. |
| License | Simulated course data. |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| message | character | 0 | 1 | Preview unavailable: ’/private/tmp/stt1100-module8.jcvbMq/repo/en/modu |

### fictitious_311_requests.csv

Fictitious 311 requests for a few Quebec municipalities.

[Download fictitious_311_requests.csv](module_03/data/fictitious_311_requests.csv)

| Information | Value |
|:---|:---|
| Module | Module 03 |
| Observations | 24 |
| Variables | 7 |
| Course use | Recode categories, inspect statuses and summarize processing delays. |
| Source | Fictitious data created for module 03 exercises. |
| License | Simulated course data. |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| message | character | 0 | 1 | Preview unavailable: ’/private/tmp/stt1100-module8.jcvbMq/repo/en/modu |

### fictitious_transit_complaints.csv

Fictitious complaints for public transit networks.

[Download fictitious_transit_complaints.csv](module_03/data/fictitious_transit_complaints.csv)

| Information | Value |
|:---|:---|
| Module | Module 03 |
| Observations | 24 |
| Variables | 7 |
| Course use | Work with factors, order categories and summarize complaints by network, period and severity. |
| Source | Fictitious data created for module 03 exercises. |
| License | Simulated course data. |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| message | character | 0 | 1 | Preview unavailable: ’/private/tmp/stt1100-module8.jcvbMq/repo/en/modu |

### dataset_pratique.csv

Practice CSV file about automobile insurance quotes.

[Download dataset_pratique.csv](module_04/dataset_pratique.csv)

| Information | Value |
|:---|:---|
| Module | Module 04 |
| Observations | 101,768 |
| Variables | 23 |
| Course use | Clean a large file, recode factors and inspect inconsistencies. |
| Source | File provided with the course material. |
| License | Course teaching material. |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| ID_Variable | numeric | 0 | 50 | 40000001 |
| QUOTE_DATE | character | 0 | 2 | 02/01/2016 |
| SEASON | character | 0 | 1 | Winter |
| Quarter | character | 0 | 1 | Q1 |
| MONTH | character | 0 | 1 | January |
| VEHICLE_YEAR | numeric | 0 | 18 | 2006 |
| VEHICLE_MAKE | character | 0 | 21 | VOLKSWAGEN |
| VEHICLE_MODEL | character | 0 | 41 | JETTA |
| VEHICLE_TYPE | character | 0 | 4 | CAR |
| ANNUAL_KM | numeric | 0 | 12 | 10000 |
| COMMUTE_DISTANCE | numeric | 20 | 14 | 20 |
| VEHICLE_USE | character | 0 | 3 | Pleasure |
| FSA_CODE | character | 0 | 46 | J7E |
| REGIONAL_AREA | character | 0 | 11 | Western Quebec |
| MARITAL_STATUS | character | 0 | 4 | Married |
| GENDER | character | 0 | 2 | Male |
| MULTI_PRODUCT | character | 0 | 2 | No |
| YEARS_LICENSED | numeric | 0 | 30 | 25 |
| YEAR_OF_BIRTH | numeric | 0 | 36 | 1975 |
| AGE | numeric | 0 | 36 | 41 |
| GENERATION | character | 0 | 5 | Gen X |
| IS_BOUND | character | 0 | 2 | Not Bound |
| IS_BOUND_BINARY | numeric | 0 | 2 | 0 |

### policies.csv

Small CSV file about insurance policies.

[Download policies.csv](module_04/policies.csv)

| Information  | Value                                                      |
|:-------------|:-----------------------------------------------------------|
| Module       | Module 04                                                  |
| Observations | 15                                                         |
| Variables    | 9                                                          |
| Course use   | Practice quick diagnostics, transformations and summaries. |
| Source       | File provided with the course material.                    |
| License      | Course teaching material.                                  |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| policy_id | character | 0 | 15 | P001 |
| premium_amount | numeric | 0 | 15 | 750.5 |
| vehicle_type | character | 0 | 2 | car |
| vehicle_use | character | 0 | 4 | Pleasure |
| q1_claims | numeric | 0 | 4 | 2 |
| q2_claims | numeric | 0 | 3 | 1 |
| q3_claims | numeric | 0 | 3 | 0 |
| q4_claims | numeric | 0 | 3 | 1 |
| claim_amount | numeric | 0 | 11 | 1200 |

### coverage.json

JSON file associated with policy coverages.

[Download coverage.json](module_04/coverage.json)

| Information  | Value                                   |
|:-------------|:----------------------------------------|
| Module       | Module 04                               |
| Observations | 2                                       |
| Variables    | 2                                       |
| Course use   | Read lists and understand nested data.  |
| Source       | File provided with the course material. |
| License      | Course teaching material.               |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| element | character | 0 | 2 | policy_id |
| value | character | 0 | 2 | chr “P001” |

### quotes_2024.xlsx

Excel file containing one sheet named Q3.

[Download quotes_2024.xlsx](module_04/resources/quotes_2024.xlsx)

| Information  | Value                                                    |
|:-------------|:---------------------------------------------------------|
| Module       | Module 04                                                |
| Observations | Not determined automatically                             |
| Variables    | Not determined automatically                             |
| Course use   | Import an Excel file and check the structure of a table. |
| Source       | File provided with the course material.                  |
| License      | Course teaching material.                                |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| Quotes Q3 2024 | character | 0 | 5 | policy_id |
| …2 | character | 0 | 5 | quote_date |
| …3 | character | 0 | 5 | quote_amount |

### fictitious_municipal_equipment.csv

Fictitious municipal equipment records with deliberately imperfect formats.

[Download fictitious_municipal_equipment.csv](module_04/data/fictitious_municipal_equipment.csv)

| Information | Value |
|:---|:---|
| Module | Module 04 |
| Observations | 16 |
| Variables | 7 |
| Course use | Clean categories, convert amounts, check plausible years and apply validation rules. |
| Source | Fictitious data created for module 04 exercises. |
| License | Simulated course data. |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| message | character | 0 | 1 | Preview unavailable: ’/private/tmp/stt1100-module8.jcvbMq/repo/en/modu |

### fictitious_scholarship_applications.csv

Fictitious student scholarship applications.

[Download fictitious_scholarship_applications.csv](module_04/data/fictitious_scholarship_applications.csv)

| Information | Value |
|:---|:---|
| Module | Module 04 |
| Observations | 16 |
| Variables | 8 |
| Course use | Clean statuses, amounts and programs, then discuss limits of simulated administrative variables. |
| Source | Fictitious data created for module 04 exercises. |
| License | Simulated course data. |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| message | character | 0 | 1 | Preview unavailable: ’/private/tmp/stt1100-module8.jcvbMq/repo/en/modu |

### fictitious_equipment_rules.json

Fictitious validation rules for municipal equipment.

[Download fictitious_equipment_rules.json](module_04/data/fictitious_equipment_rules.json)

| Information | Value |
|:---|:---|
| Module | Module 04 |
| Observations | 4 |
| Variables | 2 |
| Course use | Read a JSON parameter file and use it to check the coherence of a table. |
| Source | Fictitious data created for module 04 exercises. |
| License | Simulated course data. |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| message | character | 0 | 1 | Preview unavailable: cannot open the connection |

### flights_merged_2023.rds

Serialized R object containing an enriched flights table.

[Download flights_merged_2023.rds](module_05/flights_merged_2023.rds)

| Information | Value |
|:---|:---|
| Module | Module 05 |
| Observations | 435,352 |
| Variables | 50 |
| Course use | Work on a large table, dates and relationships between variables. |
| Source | File provided with the course material. |
| License | Course teaching material. |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| year | numeric | 0 | 1 | 2023 |
| month | numeric | 0 | 1 | 1 |
| day | integer | 0 | 1 | 1 |
| hour | integer | 0 | 6 | 20 |
| dep_time | integer | 0 | 39 | 1 |
| sched_dep_time | integer | 0 | 24 | 2038 |
| dep_delay | numeric | 0 | 27 | 203 |
| arr_time | integer | 0 | 46 | 328 |
| sched_arr_time | integer | 0 | 46 | 3 |
| arr_delay | numeric | 0 | 34 | 205 |
| carrier | character | 0 | 7 | UA |
| flight | integer | 0 | 50 | 628 |
| tailnum | character | 0 | 50 | N25201 |
| origin | character | 0 | 3 | EWR |
| dest | character | 0 | 24 | SMF |
| air_time | numeric | 0 | 41 | 367 |
| distance | numeric | 0 | 36 | 2500 |
| minute | numeric | 0 | 14 | 38 |
| name | character | 0 | 7 | United Air Lines Inc. |
| plane_year | integer | 0 | 24 | 1999 |
| type | character | 0 | 1 | Fixed wing multi engine |
| manufacturer | character | 0 | 5 | BOEING |
| model | character | 0 | 23 | 737-824 |
| engines | integer | 0 | 1 | 2 |
| seats | integer | 0 | 19 | 149 |
| speed | integer | 0 | 1 | 0 |
| engine | character | 0 | 1 | Turbo-fan |
| temp | numeric | 0 | 9 | 57 |
| dewp | numeric | 0 | 9 | 33 |
| humid | numeric | 0 | 9 | 40.28 |
| wind_dir | numeric | 0 | 10 | 290 |
| wind_speed | numeric | 0 | 6 | 10.35702 |
| wind_gust | numeric | 0 | 6 | 11.9186514756 |
| precip | numeric | 0 | 3 | 0 |
| pressure | numeric | 0 | 10 | 1014.1 |
| visib | numeric | 0 | 8 | 10 |
| origin_name | character | 0 | 3 | Newark Liberty International Airport |
| origin_lat | numeric | 0 | 3 | 40.6925010681152 |
| origin_lon | numeric | 0 | 3 | -74.168701171875 |
| origin_alt | numeric | 0 | 3 | 18 |
| origin_tz_code | numeric | 0 | 1 | -5 |
| origin_dst | character | 0 | 1 | A |
| origin_tz | character | 0 | 1 | America/New_York |
| dest_name | character | 0 | 24 | Sacramento International Airport |
| dest_lat | numeric | 0 | 24 | 38.6954002380371 |
| dest_lon | numeric | 0 | 24 | -121.591003417969 |
| dest_alt | numeric | 0 | 23 | 27 |
| dest_tz_code | numeric | 0 | 5 | -8 |
| dest_dst | character | 0 | 2 | A |
| dest_tz | character | 0 | 7 | America/Los_Angeles |

### fictitious_support_workshops.csv

Fictitious university support workshops with attendance, weather and satisfaction.

[Download fictitious_support_workshops.csv](module_05/data/fictitious_support_workshops.csv)

| Information | Value |
|:---|:---|
| Module | Module 05 |
| Observations | 24 |
| Variables | 10 |
| Course use | Explore relationships between numerical variables, temporal context and participation. |
| Source | Fictitious data created for module 05 exercises. |
| License | Simulated course data. |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| message | character | 0 | 1 | Preview unavailable: ’/private/tmp/stt1100-module8.jcvbMq/repo/en/modu |

### fictitious_library_visits.csv

Fictitious visit observations in library areas.

[Download fictitious_library_visits.csv](module_05/data/fictitious_library_visits.csv)

| Information | Value |
|:---|:---|
| Module | Module 05 |
| Observations | 24 |
| Variables | 8 |
| Course use | Compare visits, weather, hours and exam weeks without confusing relationship and causality. |
| Source | Fictitious data created for module 05 exercises. |
| License | Simulated course data. |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| message | character | 0 | 1 | Preview unavailable: ’/private/tmp/stt1100-module8.jcvbMq/repo/en/modu |

### fictitious_campus_service_requests.csv

Fictitious requests sent to campus services.

[Download fictitious_campus_service_requests.csv](module_05/data/fictitious_campus_service_requests.csv)

| Information | Value |
|:---|:---|
| Module | Module 05 |
| Observations | 24 |
| Variables | 8 |
| Course use | Analyze relationships between priority, delay, satisfaction, estimated cost and status. |
| Source | Fictitious data created for module 05 exercises. |
| License | Simulated course data. |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| message | character | 0 | 1 | Preview unavailable: ’/private/tmp/stt1100-module8.jcvbMq/repo/en/modu |

### fictitious_team_members.csv

Fictitious members from two project teams.

[Download fictitious_team_members.csv](module_06/data/fictitious_team_members.csv)

| Information  | Value                                     |
|:-------------|:------------------------------------------|
| Module       | Module 06                                 |
| Observations | 8                                         |
| Variables    | 4                                         |
| Course use   | Practice join keys and summaries by role. |
| Source       | Fictitious data created for the course.   |
| License      | Simulated course data.                    |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| message | character | 0 | 1 | Preview unavailable: ’/private/tmp/stt1100-module8.jcvbMq/repo/en/modu |

### fictitious_git_contributions.csv

Fictitious Git contributions linked to members.

[Download fictitious_git_contributions.csv](module_06/data/fictitious_git_contributions.csv)

| Information  | Value                                             |
|:-------------|:--------------------------------------------------|
| Module       | Module 06                                         |
| Observations | 12                                                |
| Variables    | 6                                                 |
| Course use   | Join commits to people and identify missing keys. |
| Source       | Fictitious data created for the course.           |
| License      | Simulated course data.                            |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| message | character | 0 | 1 | Preview unavailable: ’/private/tmp/stt1100-module8.jcvbMq/repo/en/modu |

### fictitious_review_issues.csv

Fictitious issues produced during peer review.

[Download fictitious_review_issues.csv](module_06/data/fictitious_review_issues.csv)

| Information  | Value                                          |
|:-------------|:-----------------------------------------------|
| Module       | Module 06                                      |
| Observations | 7                                              |
| Variables    | 7                                              |
| Course use   | Summarize issues by team, status and priority. |
| Source       | Fictitious data created for the course.        |
| License      | Simulated course data.                         |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| message | character | 0 | 1 | Preview unavailable: ’/private/tmp/stt1100-module8.jcvbMq/repo/en/modu |

### fictitious_report_files.csv

Expected files in fake report repositories.

[Download fictitious_report_files.csv](module_06/data/fictitious_report_files.csv)

| Information  | Value                                            |
|:-------------|:-------------------------------------------------|
| Module       | Module 06                                        |
| Observations | 12                                               |
| Variables    | 4                                                |
| Course use   | Check deliverables and diagnose reproducibility. |
| Source       | Fictitious data created for the course.          |
| License      | Simulated course data.                           |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| message | character | 0 | 1 | Preview unavailable: ’/private/tmp/stt1100-module8.jcvbMq/repo/en/modu |

### fictitious_data_portal.csv

Fictitious datasets from an open-data portal.

[Download fictitious_data_portal.csv](module_06/data/fictitious_data_portal.csv)

| Information  | Value                                                        |
|:-------------|:-------------------------------------------------------------|
| Module       | Module 06                                                    |
| Observations | 6                                                            |
| Variables    | 5                                                            |
| Course use   | Practice joins with producers, licenses and review comments. |
| Source       | Fictitious data created for the course.                      |
| License      | Simulated course data.                                       |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| message | character | 0 | 1 | Preview unavailable: ’/private/tmp/stt1100-module8.jcvbMq/repo/en/modu |

### fictitious_producers.csv

Fictitious producers associated with a data portal.

[Download fictitious_producers.csv](module_06/data/fictitious_producers.csv)

| Information  | Value                                   |
|:-------------|:----------------------------------------|
| Module       | Module 06                               |
| Observations | 4                                       |
| Variables    | 4                                       |
| Course use   | Identify missing producers in a join.   |
| Source       | Fictitious data created for the course. |
| License      | Simulated course data.                  |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| message | character | 0 | 1 | Preview unavailable: ’/private/tmp/stt1100-module8.jcvbMq/repo/en/modu |

### fictitious_review_comments.csv

Fictitious review comments on datasets.

[Download fictitious_review_comments.csv](module_06/data/fictitious_review_comments.csv)

| Information  | Value                                         |
|:-------------|:----------------------------------------------|
| Module       | Module 06                                     |
| Observations | 6                                             |
| Variables    | 6                                             |
| Course use   | Summarize problems by dimension and severity. |
| Source       | Fictitious data created for the course.       |
| License      | Simulated course data.                        |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| message | character | 0 | 1 | Preview unavailable: ’/private/tmp/stt1100-module8.jcvbMq/repo/en/modu |

### fictitious_municipal_reports.csv

Fictitious municipal reports aggregated by neighbourhood and type.

[Download fictitious_municipal_reports.csv](module_07/data/fictitious_municipal_reports.csv)

| Information | Value |
|:---|:---|
| Module | Module 07 |
| Observations | 12 |
| Variables | 6 |
| Course use | Compare raw counts, population rates and small-count suppression rules. |
| Source | Fictitious data created for the course. |
| License | Simulated course data. |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| message | character | 0 | 1 | Preview unavailable: ’/private/tmp/stt1100-module8.jcvbMq/repo/en/modu |

### fictitious_neighbourhood_population.csv

Fictitious neighbourhood population used to normalize reports.

[Download fictitious_neighbourhood_population.csv](module_07/data/fictitious_neighbourhood_population.csv)

| Information | Value |
|:---|:---|
| Module | Module 07 |
| Observations | 7 |
| Variables | 4 |
| Course use | Compute rates per 10,000 people and discuss limits of comparisons. |
| Source | Fictitious data created for the course. |
| License | Simulated course data. |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| message | character | 0 | 1 | Preview unavailable: ’/private/tmp/stt1100-module8.jcvbMq/repo/en/modu |

### fictitious_student_survey.csv

Fictitious student survey with useful variables and fields that should not be published.

[Download fictitious_student_survey.csv](module_07/data/fictitious_student_survey.csv)

| Information | Value |
|:---|:---|
| Module | Module 07 |
| Observations | 16 |
| Variables | 9 |
| Course use | Practise anonymization, small-count checks and careful communication. |
| Source | Fictitious data created for the course. |
| License | Simulated course data. |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| message | character | 0 | 1 | Preview unavailable: ’/private/tmp/stt1100-module8.jcvbMq/repo/en/modu |

### catalogue_donnees_quebec.html

HTML snapshot of six real Données Québec catalog records from six cities.

[Download catalogue_donnees_quebec.html](module_08/data/catalogue_donnees_quebec.llms.md)

| Information | Value |
|:---|:---|
| Module | Module 08 |
| Observations | 6 |
| Variables | 4 |
| Course use | Practise CSS selectors, field extraction and tibble construction. |
| Source | Official Données Québec CKAN API, snapshot dated July 11, 2026. |
| License | CC BY 4.0. |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| message | character | 0 | 1 | No preview is available for this file type. |

### catalogue_donnees_quebec_irregulier.html

HTML snapshot of four real records, including two without a category in the portal.

[Download catalogue_donnees_quebec_irregulier.html](module_08/data/catalogue_donnees_quebec_irregulier.llms.md)

| Information | Value |
|:---|:---|
| Module | Module 08 |
| Observations | 4 |
| Variables | 4 |
| Course use | Test a robust extraction function and represent missing fields as NA. |
| Source | Official Données Québec CKAN API, snapshot dated July 11, 2026. |
| License | CC BY 4.0. |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| message | character | 0 | 1 | No preview is available for this file type. |

### evenements_sit_quebec.html

HTML snapshot of six real events announced in six Quebec cities.

[Download evenements_sit_quebec.html](module_08/data/evenements_sit_quebec.llms.md)

| Information | Value |
|:---|:---|
| Module | Module 08 |
| Observations | 6 |
| Variables | 4 |
| Course use | Build an extraction function for a second type of HTML page. |
| Source | Ministry of Tourism, Système d’information touristique Québec, resource dated July 5, 2026. |
| License | CC BY 4.0. |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| message | character | 0 | 1 | No preview is available for this file type. |

### eleves_fictifs.csv

Fictitious CSV file about students.

[Download eleves_fictifs.csv](module_09/eleves_fictifs.csv)

| Information | Value |
|:---|:---|
| Module | Module 09 |
| Observations | 1,000 |
| Variables | 6 |
| Course use | Practice categorical variables, classification and careful interpretation. |
| Source | Fictitious data created for the course. |
| License | Simulated course data. |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| Sexe | character | 0 | 2 | Masculin |
| Age | numeric | 0 | 3 | 10 |
| Langue_maternelle | character | 0 | 3 | Français |
| Niveau_socio_economique | character | 0 | 2 | Faible |
| Acces_ressources | character | 0 | 2 | Non |
| Admission | character | 0 | 2 | Non |

### ecoles_primaires_qc.csv

CSV file about primary schools in Quebec.

[Download ecoles_primaires_qc.csv](module_09/ecoles_primaires_qc.csv)

| Information | Value |
|:---|:---|
| Module | Module 09 |
| Observations | 1,963 |
| Variables | 11 |
| Course use | Connect school indicators to descriptive questions, predict IMSE and discuss limits linked to missing data. |
| Source | Données Québec portal, disadvantage indices. |
| License | See the Données Québec portal terms. |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| Code_Cs | numeric | 0 | 4 | 711000 |
| Nom_Cs | character | 0 | 4 | Centre de services scolaire des Monts-et-Marées (711000) |
| Code_Org | numeric | 0 | 50 | 711002 |
| Nom_Org | character | 0 | 50 | École Lac-au-Saumon (711002) |
| IMSE | numeric | 3 | 47 | 10.4187626666667 |
| Rang_Decile_IMSE | numeric | 3 | 10 | 9 |
| SFR | numeric | 3 | 47 | 1.33371857142857 |
| Rang_Decile_SFR | numeric | 3 | 7 | 2 |
| Nbre_Eleves | numeric | 3 | 42 | 105 |
| Diffusion | character | 0 | 2 | OUI |
| Annee_Scol | character | 0 | 1 | 2025-2026 |

### fictitious_housing_energy.csv

Fictitious housing units with annual electricity consumption.

[Download fictitious_housing_energy.csv](module_09/data/fictitious_housing_energy.csv)

| Information | Value |
|:---|:---|
| Module | Module 09 |
| Observations | 32 |
| Variables | 8 |
| Course use | Practise linear regression, predictions, errors and limits of extrapolation. |
| Source | Fictitious data created for the course. |
| License | Simulated course data. |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| housing_id | character | 0 | 32 | H001 |
| neighbourhood | character | 0 | 11 | Montcalm |
| area_m2 | numeric | 0 | 32 | 62 |
| year_built | numeric | 0 | 32 | 1988 |
| occupants | numeric | 0 | 5 | 1 |
| heating_type | character | 0 | 3 | Electricity |
| neighbourhood_median_income | numeric | 0 | 11 | 64000 |
| annual_kwh | numeric | 0 | 32 | 11800 |

### fictitious_culture_grants.csv

Fictitious cultural grant applications.

[Download fictitious_culture_grants.csv](module_09/data/fictitious_culture_grants.csv)

| Information | Value |
|:---|:---|
| Module | Module 09 |
| Observations | 36 |
| Variables | 8 |
| Course use | Compare decision rates by group and discuss descriptive bias without overinterpretation. |
| Source | Fictitious data created for the course. |
| License | Simulated course data. |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| application_id | character | 0 | 36 | G001 |
| region | character | 0 | 7 | Capitale-Nationale |
| discipline | character | 0 | 5 | Theatre |
| organization_size | character | 0 | 3 | Large |
| first_application | character | 0 | 2 | No |
| requested_budget | numeric | 0 | 35 | 82000 |
| committee_score | numeric | 0 | 26 | 86 |
| decision | character | 0 | 2 | Accepted |

### fictitious_library_comments.csv

Fictitious comments about municipal library services.

[Download fictitious_library_comments.csv](module_10/data/fictitious_library_comments.csv)

| Information | Value |
|:---|:---|
| Module | Module 10 |
| Observations | 24 |
| Variables | 8 |
| Course use | Practise tokenization, stopwords, simple sentiment scores and TF-IDF. |
| Source | Fictitious data created for the course. |
| License | Simulated course data. |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| comment_id | character | 0 | 24 | B001 |
| month | numeric | 0 | 6 | 1 |
| district | character | 0 | 4 | Sainte-Foy |
| service | character | 0 | 4 | Desk |
| comment | character | 0 | 24 | Accueil tres clair et rapide, le personnel m’a bien orientee. |
| satisfaction | numeric | 0 | 5 | 5 |
| clarity | numeric | 0 | 5 | 5 |
| wait_time | numeric | 0 | 5 | 4 |

### fictitious_culture_workshops.csv

Fictitious feedback about public cultural workshops.

[Download fictitious_culture_workshops.csv](module_10/data/fictitious_culture_workshops.csv)

| Information | Value |
|:---|:---|
| Module | Module 10 |
| Observations | 24 |
| Variables | 8 |
| Course use | Prepare textual and numerical summaries for a mini dashboard. |
| Source | Fictitious data created for the course. |
| License | Simulated course data. |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| response_id | character | 0 | 24 | A001 |
| edition | numeric | 0 | 6 | 1 |
| neighbourhood | character | 0 | 4 | Montcalm |
| activity_type | character | 0 | 4 | Writing |
| comment | character | 0 | 24 | Atelier chaleureux, consignes claires et bonne ambiance. |
| participation | numeric | 0 | 5 | 5 |
| accessibility | numeric | 0 | 5 | 5 |
| recommendation | numeric | 0 | 5 | 5 |
