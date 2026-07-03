Data catalogue

# Course datasets

This page gathers the datasets used in STT-1100. It helps students find downloadable files, datasets provided by R packages and short profiles for local files.

[By module](#catalogue-by-module) [Local profiles](#local-file-profiles) [R packages](packages.llms.md)

CSV

Files to import and clean

R

Datasets included in packages

JSON

Nested data and lists

XLS

Practice Excel sheets

## Use the catalogue

Each card gives a quick preview, a link to the local profile when the file is provided, or a link to the package when the data come from R.

## Catalogue by module

### Module 01

[Module 01 ](packages.llms.md#ulavalssd)

## UlavalSSD::MeteoQuebec

[Dataset used for the first exploration steps in R.R packageStructure to consultView documentation](packages.llms.md#ulavalssd)

### Module 02

[Module 02 ](#manchots-donnees)

## manchots_donnees.xlsx

Practice Excel file about penguins.Local fileStructure to consultView profile [Module 02 ](packages.llms.md#palmerpenguins)

## palmerpenguins::penguins

[Demonstration dataset about penguins.R packageStructure to consultView documentation](packages.llms.md#palmerpenguins)

### Module 03

[Module 03 ](packages.llms.md#ulavalssd)

## UlavalSSD::listecondamnation

Food offence records used for the journalistic article.R packageStructure to consultView documentation [Module 03 ](packages.llms.md#palmerpenguins)

## palmerpenguins::penguins_raw

Rawer version of the penguins dataset.R packageStructure to consultView documentation [Module 03 ](packages.llms.md#titanic)

## titanic::titanic_train

[Passenger data from the Titanic used as an example of categorical variables.R packageStructure to consultView documentation](packages.llms.md#titanic)

### Module 04

[Module 04 ](#dataset-pratique)

## dataset_pratique.csv

Practice CSV file about automobile insurance quotes.Local file101,768 observations / 23 variablesView profile [Module 04 ](#policies-module-04)

## policies.csv

Small CSV file about insurance policies.Local file15 observations / 9 variablesView profile [Module 04 ](#coverage-module-04)

## coverage.json

JSON file associated with policy coverages.Local file? observations / 2 variablesView profile [Module 04 ](#quotes-module-04)

## quotes_2024.xlsx

[Excel file containing one sheet named Q3.Local fileStructure to consultView profile](#quotes-module-04)

### Module 05

[Module 05 ](#policies-module-05)

## policies.csv

Small CSV file about insurance policies.Local file15 observations / 9 variablesView profile [Module 05 ](#coverage-module-05)

## coverage.json

JSON file associated with policy coverages.Local file? observations / 2 variablesView profile [Module 05 ](#quotes-module-05)

## quotes_2024.xlsx

Excel file containing one sheet named Q3.Local fileStructure to consultView profile [Module 05 ](#flights-merged-2023)

## flights_merged_2023.rds

[Serialized R object containing an enriched flights table.Local file435,352 observations / 50 variablesView profile](#flights-merged-2023)

### Module 06

[Module 06 ](packages.llms.md#gapminder)

## gapminder::gapminder

Country-year data commonly used in data science.R packageStructure to consultView documentation [Module 06 ](packages.llms.md#dplyr)

## dplyr::starwars

Demonstration dataset provided by dplyr.R packageStructure to consultView documentation [Module 06 ](packages.llms.md#lahman)

## Lahman::People and Lahman::Batting

Baseball tables used to combine several sources.R packageStructure to consultView documentation [Module 06 ](packages.llms.md#weathercan)

## weathercan

[Canadian weather data and station metadata.R packageStructure to consultView documentation](packages.llms.md#weathercan)

### Module 07

[Module 07 ](#covid-module-07)

## donnees_covid_module7.csv

[Small CSV file of confirmed cases by region, age and date.Local file50 observations / 4 variablesView profile](#covid-module-07)

### Module 08

[Module 08 ](packages.llms.md#rvest)

## Web pages analyzed with rvest

[Data extracted from HTML pages during the activities.WebStructure to consultView documentation](packages.llms.md#rvest)

### Module 09

[Module 09 ](#eleves-fictifs)

## eleves_fictifs.csv

Fictitious CSV file about students.Local file1,000 observations / 6 variablesView profile [Module 09 ](#ecoles-primaires-qc)

## ecoles_primaires_qc.csv

[CSV file about primary schools in Quebec.Local file1,963 observations / 11 variablesView profile](#ecoles-primaires-qc)

### Module 10

[Module 10 ](packages.llms.md#tidytext)

## Comments and working texts

[Texts and comments prepared in the activities.TextStructure to consultView documentation](packages.llms.md#tidytext)

## Local file profiles

Previews are limited to the first rows to keep the site light. Variable profiles are therefore quick diagnostics of the displayed preview, not exhaustive analyses of each full file.

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
| Observations | Not determined automatically            |
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

### policies.csv

Small CSV file about insurance policies.

[Download policies.csv](module_05/policies.csv)

| Information  | Value                                                |
|:-------------|:-----------------------------------------------------|
| Module       | Module 05                                            |
| Observations | 15                                                   |
| Variables    | 9                                                    |
| Course use   | Build summaries and prepare links between variables. |
| Source       | File provided with the course material.              |
| License      | Course teaching material.                            |

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

[Download coverage.json](module_05/coverage.json)

| Information  | Value                                          |
|:-------------|:-----------------------------------------------|
| Module       | Module 05                                      |
| Observations | Not determined automatically                   |
| Variables    | 2                                              |
| Course use   | Practice nested data and their transformation. |
| Source       | File provided with the course material.        |
| License      | Course teaching material.                      |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| element | character | 0 | 2 | policy_id |
| value | character | 0 | 2 | chr “P001” |

### quotes_2024.xlsx

Excel file containing one sheet named Q3.

[Download quotes_2024.xlsx](module_05/resources/quotes_2024.xlsx)

| Information  | Value                                              |
|:-------------|:---------------------------------------------------|
| Module       | Module 05                                          |
| Observations | Not determined automatically                       |
| Variables    | Not determined automatically                       |
| Course use   | Import an Excel file and connect multiple sources. |
| Source       | File provided with the course material.            |
| License      | Course teaching material.                          |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| Quotes Q3 2024 | character | 0 | 5 | policy_id |
| …2 | character | 0 | 5 | quote_date |
| …3 | character | 0 | 5 | quote_amount |

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

### donnees_covid_module7.csv

Small CSV file of confirmed cases by region, age and date.

[Download donnees_covid_module7.csv](module_07/donnees_covid_module7.csv)

| Information  | Value                                     |
|:-------------|:------------------------------------------|
| Module       | Module 07                                 |
| Observations | 50                                        |
| Variables    | 4                                         |
| Course use   | Prepare charts and descriptive summaries. |
| Source       | File provided with the course material.   |
| License      | Course teaching material.                 |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| region | character | 0 | 3 | Québec |
| age | numeric | 0 | 27 | 78 |
| cas_confirmes | numeric | 0 | 39 | 111 |
| date | Date | 0 | 47 | 2022-08-03 |

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

| Information  | Value                                               |
|:-------------|:----------------------------------------------------|
| Module       | Module 09                                           |
| Observations | 1,963                                               |
| Variables    | 11                                                  |
| Course use   | Connect school indicators to descriptive questions. |
| Source       | File provided with the course material.             |
| License      | See the source indicated in the module material.    |

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
