Data catalogue

# Course datasets

This page gathers the datasets used in STT-1100. It helps students find downloadable files, datasets provided by R packages and short profiles for local files.

[Download a module](#workspaces) [How it works](#use-catalogue) [By module](#catalogue-by-module) [Local profiles](#local-file-profiles) [R packages](packages.llms.md)

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

## Workspaces

Each workspace contains an RStudio project, a solution-free Quarto file and every file required by the exercises. Download one ZIP, unpack it and open the `.Rproj` file.

Module 01

## Workspace

Ready-to-open RStudio project with 2 supplied file(s).

[Download ZIP](../downloads/donnees/stt1100-module-01-en.zip)

Module 02

## Workspace

Ready-to-open RStudio project with 3 supplied file(s).

[Download ZIP](../downloads/donnees/stt1100-module-02-en.zip)

Module 03

## Workspace

Ready-to-open RStudio project with 2 supplied file(s).

[Download ZIP](../downloads/donnees/stt1100-module-03-en.zip)

Module 04

## Workspace

Ready-to-open RStudio project with 6 supplied file(s).

[Download ZIP](../downloads/donnees/stt1100-module-04-en.zip)

Module 05

## Workspace

Ready-to-open RStudio project with 3 supplied file(s).

[Download ZIP](../downloads/donnees/stt1100-module-05-en.zip)

Module 06

## Workspace

Ready-to-open RStudio project with 4 supplied file(s).

[Download ZIP](../downloads/donnees/stt1100-module-06-en.zip)

Module 07

## Workspace

Ready-to-open RStudio project with 3 supplied file(s).

[Download ZIP](../downloads/donnees/stt1100-module-07-en.zip)

Module 08

## Workspace

Ready-to-open RStudio project with 3 supplied file(s).

[Download ZIP](../downloads/donnees/stt1100-module-08-en.zip)

Module 09

## Workspace

Ready-to-open RStudio project with 2 supplied file(s).

[Download ZIP](../downloads/donnees/stt1100-module-09-en.zip)

Module 10

## Workspace

Ready-to-open RStudio project with 2 supplied file(s).

[Download ZIP](../downloads/donnees/stt1100-module-10-en.zip)

## Catalogue by module

### Module 01

[Module 01 ](#module01-portail)

## Montreal Open Data Portal traffic, 2023

Page traffic on Montreal’s Open Data Portal during one day.Local file126 observations / 6 variablesView profile [Module 01 ](#module01-bibliotheques)

## Quebec public libraries, 2024

Statistics for 188 Quebec public libraries and regional centres.Local file188 observations / 6 variablesView profile [Module 01 ](packages.llms.md#ulavalssd)

## UlavalSSD::MeteoQuebec

[Dataset used for the first exploration steps in R.R packageStructure to consultView documentation](packages.llms.md#ulavalssd)

### Module 02

[Module 02 ](#manchots-donnees)

## Penguin data for Excel

Excel workbook prepared for learning data import and visualization.Local file322 observations / 7 variablesView profile [Module 02 ](#module02-velo)

## Quebec City cycling counters, 2026

Snapshot of totals published by eleven cycling count sites.Local file11 observations / 6 variablesView profile [Module 02 ](#module02-arbres)

## Quebec City public trees

A 500-tree extract from Quebec City’s public inventory.Local file500 observations / 7 variablesView profile [Module 02 ](packages.llms.md#palmerpenguins)

## palmerpenguins::penguins

[Demonstration dataset about penguins.R packageStructure to consultView documentation](packages.llms.md#palmerpenguins)

### Module 03

[Module 03 ](#module03-requetes-311)

## Montreal 311 requests

A 750-row extract of 311 citizen service requests.Local file750 observations / 5 variablesView profile [Module 03 ](#module03-plaintes)

## Quebec consumer complaints

A 750-row extract of complaints received by Quebec’s consumer protection office.Local file750 observations / 5 variablesView profile [Module 03 ](packages.llms.md#ulavalssd)

## UlavalSSD::listecondamnation

Food offence records used for the journalistic article.R packageStructure to consultView documentation [Module 03 ](packages.llms.md#palmerpenguins)

## palmerpenguins::penguins_raw

Rawer version of the penguins dataset.R packageStructure to consultView documentation [Module 03 ](packages.llms.md#titanic)

## titanic::titanic_train

[Passenger data from the Titanic used as an example of categorical variables.R packageStructure to consultView documentation](packages.llms.md#titanic)

### Module 04

[Module 04 ](#quotes-module-04)

## 2024 insurance quotes

Excel workbook containing five practice quotes.Local file5 observations / 3 variablesView profile [Module 04 ](#coverage-module-04)

## Insurance coverage JSON

Small JSON file used to learn nested data.Local file2 observations / 2 variablesView profile [Module 04 ](#module04-afdr)

## Last-resort financial assistance, December 2022

Aggregated table of clients and benefits in Quebec.Local file43 observations / 12 variablesView profile [Module 04 ](#policies-module-04)

## Practice insurance policies

Small policy file used to diagnose types and values.Local file15 observations / 9 variablesView profile [Module 04 ](#module04-metadonnees)

## Sherbrooke facility metadata

ArcGIS metadata associated with the facility inventory.Local file84 observations / ? variablesView profile [Module 04 ](#module04-installations)

## Sherbrooke sports facilities

Inventory of 859 sports and recreational facilities.Local file859 observations / 8 variablesView profile [Module 04 ](#dataset-pratique)

## dataset_pratique.csv

[Practice CSV file about automobile insurance quotes.Local file101,768 observations / 23 variablesView profile](#dataset-pratique)

### Module 05

[Module 05 ](#module05-circulation)

## Gatineau traffic volumes

Extract of road traffic measurements from 2016 to 2023.Local file1,200 observations / 7 variablesView profile [Module 05 ](#module05-velos)

## Laval bicycle counts

Fifteen-minute counts at the Chevillon loop in June 2016.Local file2,688 observations / 5 variablesView profile [Module 05 ](#module05-air)

## Quebec City air quality, July 2025

Hourly measurements at the Quebec City Vieux-Limoilou station.Local file744 observations / 7 variablesView profile [Module 05 ](#flights-merged-2023)

## flights_merged_2023.rds

[Serialized R object containing an enriched flights table.Local file435,352 observations / 50 variablesView profile](#flights-merged-2023)

### Module 06

[Module 06 ](#module06-jeux)

## Données Québec datasets

Table of 312 Quebec datasets.Local file312 observations / 8 variablesView profile [Module 06 ](#module06-organisations)

## Données Québec organizations

Table of 142 organizations in the relational extract.Local file142 observations / 5 variablesView profile [Module 06 ](#module06-ressources)

## Données Québec resources

Table of 3,143 resources linked to datasets.Local file3,143 observations / 7 variablesView profile [Module 06 ](#module06-etiquettes)

## Données Québec tags

Table of 2,101 links between datasets and tags.Local file2,101 observations / 2 variablesView profile [Module 06 ](packages.llms.md#nycflights23)

## nycflights23::airlines

Lookup table between carrier codes and full carrier names.R package14 observations / 2 variablesView documentation [Module 06 ](packages.llms.md#nycflights23)

## nycflights23::flights

Flight table for departures from New York in 2023.R package435,352 observations / 19 variablesView documentation [Module 06 ](packages.llms.md#nycflights23)

## nycflights23::weather

[Hourly weather conditions for New York airports in 2023.R package26,207 observations / 15 variablesView documentation](packages.llms.md#nycflights23)

### Module 07

[Module 07 ](#module07-incidents)

## Aggregated Sherbrooke incidents

Incidents aggregated by month and type, without coordinates or exact dates.Local file258 observations / 4 variablesView profile [Module 07 ](#module07-sondage)

## Données Québec user survey

Aggregated responses to three public consultation questions.Local file168 observations / 5 variablesView profile [Module 07 ](#module07-population)

## Sherbrooke population, 2022 to 2024

Annual population estimates used to calculate rates.Local file3 observations / 3 variablesView profile [Module 07 ](https://github.com/STT-1100/aventure-7)

## covid_module7_douteux.csv

[Simulated CSV file deliberately containing quality, confidentiality and re-identification issues.Web120 observations / 25 variablesView documentation](https://github.com/STT-1100/aventure-7)

### Module 08

[Module 08 ](#module08-irregular)

## Catalog with missing categories

HTML snapshot of four records, including two without a category.Local file4 observations / 4 variablesView profile [Module 08 ](#module08-catalogue)

## Données Québec catalog

HTML snapshot of six real records from six cities.Local file6 observations / 4 variablesView profile [Module 08 ](#module08-evenements)

## SIT Québec events

HTML snapshot of six events announced in six cities.Local file6 observations / 4 variablesView profile [Module 08 ](https://www.donneesquebec.ca/recherche/?sort=metadata_modified+desc&page=1)

## Données Québec search page

[Public search page from the Données Québec portal used to practise HTML extraction.WebStructure to consultView documentation](https://www.donneesquebec.ca/recherche/?sort=metadata_modified+desc&page=1)

### Module 09

[Module 09 ](#module09-consommation-eau)

## Municipal water consumption, 2023

Residential consumption and distributed water in 496 municipalities.Local file496 observations / 10 variablesView profile [Module 09 ](#module09-validite)

## Water audit validity, 2023

Availability and validity-index results for 1,104 municipalities.Local file1,104 observations / 7 variablesView profile [Module 09 ](#ecoles-primaires-qc)

## ecoles_primaires_qc.csv

CSV file about primary schools in Quebec.Local file1,963 observations / 11 variablesView profile [Module 09 ](#eleves-fictifs)

## eleves_fictifs.csv

[Fictitious CSV file about students.Local file1,000 observations / 6 variablesView profile](#eleves-fictifs)

### Module 10

[Module 10 ](#module10-descriptions)

## Données Québec descriptions

Real descriptions of 89 datasets published by eight Quebec cities.Local file89 observations / 9 variablesView profile [Module 10 ](#module10-evenements)

## Quebec tourism events

Balanced sample of 151 tourism events.Local file151 observations / 11 variablesView profile [Module 10 ](packages.llms.md#tidytext)

## Comments and working texts

[Texts and comments prepared in the activities.TextStructure to consultView documentation](packages.llms.md#tidytext)

## Local file profiles

Previews are limited to the first rows to keep the site light. Variable profiles are therefore quick diagnostics of the displayed preview, not exhaustive analyses of each full file.

### Montreal Open Data Portal traffic, 2023

Page traffic on Montreal’s Open Data Portal during one day.

[Download frequentation_portail_montreal_2023.csv](module_01/data/frequentation_portail_montreal_2023.csv)

| Information | Value |
|:---|:---|
| Module | Module 01 |
| Observations | 126 |
| Variables | 6 |
| Course use | Page traffic on Montreal’s Open Data Portal during one day. |
| Source | https://donnees.montreal.ca/dataset/frequentation-du-portail-de-donnees-ouvertes |
| License | CC BY 4.0 |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| date | Date | 0 | 1 | 2023-06-21 |
| path | character | 0 | 50 | / |
| title | character | 0 | 46 | Bienvenue - Site web des données ouvertes de la Ville de Montréal |
| sessions | numeric | 0 | 14 | 70 |
| pageviews | numeric | 0 | 19 | 110 |
| duree_moyenne_session_secondes | numeric | 0 | 27 | 375.528571428571 |

### Quebec public libraries, 2024

Statistics for 188 Quebec public libraries and regional centres.

[Download bibliotheques_publiques_quebec_2024.csv](module_01/data/bibliotheques_publiques_quebec_2024.csv)

| Information | Value |
|:---|:---|
| Module | Module 01 |
| Observations | 188 |
| Variables | 6 |
| Course use | Statistics for 188 Quebec public libraries and regional centres. |
| Source | https://www.donneesquebec.ca/recherche/dataset/statistiques_des_bibliotheques_publiques_du_quebec |
| License | CC BY 4.0 |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| bibliotheque | character | 0 | 50 | Acton Vale |
| region | character | 0 | 15 | 16: Montérégie |
| population_desservie | numeric | 0 | 50 | 7823 |
| prets | numeric | 0 | 49 | 29919 |
| activites | numeric | 2 | 45 | 38 |
| visites | numeric | 3 | 47 | 15579 |

### Penguin data for Excel

Excel workbook prepared for learning data import and visualization.

[Download manchots_donnees.xlsx](module_02/resources/manchots_donnees.xlsx)

| Information | Value |
|:---|:---|
| Module | Module 02 |
| Observations | 322 |
| Variables | 7 |
| Course use | Excel workbook prepared for learning data import and visualization. |
| Source | https://allisonhorst.github.io/palmerpenguins/ |
| License | Matériel pédagogique du cours |

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

### Quebec City cycling counters, 2026

Snapshot of totals published by eleven cycling count sites.

[Download comptages_cyclistes_quebec_2026.csv](module_02/data/comptages_cyclistes_quebec_2026.csv)

| Information  | Value                                                       |
|:-------------|:------------------------------------------------------------|
| Module       | Module 02                                                   |
| Observations | 11                                                          |
| Variables    | 6                                                           |
| Course use   | Snapshot of totals published by eleven cycling count sites. |
| Source       | https://villedequebec.eco-counter.com/                      |
| License      | Conditions de la source                                     |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| site | character | 0 | 11 | Einstein |
| type_compteur | character | 0 | 2 | velo |
| annee_debut | numeric | 0 | 3 | 2016 |
| passages_velo_cumules | numeric | 0 | 11 | 38475 |
| latitude | numeric | 0 | 11 | 46.79517 |
| longitude | numeric | 0 | 11 | -71.29139 |

### Quebec City public trees

A 500-tree extract from Quebec City’s public inventory.

[Download arbres_repertories_quebec.csv](module_02/data/arbres_repertories_quebec.csv)

| Information | Value |
|:---|:---|
| Module | Module 02 |
| Observations | 500 |
| Variables | 7 |
| Course use | A 500-tree extract from Quebec City’s public inventory. |
| Source | https://www.donneesquebec.ca/recherche/dataset/34103a43-3712-4a29-92e1-039e9188e915 |
| License | CC BY 4.0 |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| id_arbre | numeric | 0 | 50 | 50674 |
| essence | character | 0 | 2 | alisier |
| type_arbre | character | 0 | 1 | Feuillu |
| diametre_cm | numeric | 0 | 14 | 22 |
| type_lieu | character | 0 | 2 | Lieu public |
| latitude | numeric | 0 | 50 | 46.8402910434486 |
| longitude | numeric | 0 | 50 | -71.2113116559127 |

### Montreal 311 requests

A 750-row extract of 311 citizen service requests.

[Download requetes_311_montreal.csv](module_03/data/requetes_311_montreal.csv)

| Information  | Value                                              |
|:-------------|:---------------------------------------------------|
| Module       | Module 03                                          |
| Observations | 750                                                |
| Variables    | 5                                                  |
| Course use   | A 750-row extract of 311 citizen service requests. |
| Source       | https://donnees.montreal.ca/dataset/requete-311    |
| License      | CC BY 4.0                                          |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| nature | character | 0 | 1 | Information |
| categorie | character | 0 | 33 | Organisme divers |
| arrondissement | character | 0 | 1 | Non assigné |
| statut | character | 0 | 1 | Sans statut |
| date_creation | Date | 0 | 15 | 2023-07-10 |

### Quebec consumer complaints

A 750-row extract of complaints received by Quebec’s consumer protection office.

[Download plaintes_consommation_quebec.csv](module_03/data/plaintes_consommation_quebec.csv)

| Information | Value |
|:---|:---|
| Module | Module 03 |
| Observations | 750 |
| Variables | 5 |
| Course use | A 750-row extract of complaints received by Quebec’s consumer protection office. |
| Source | https://www.donneesquebec.ca/recherche/dataset/liste-des-plaintes-recues |
| License | CC BY 4.0 |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| periode | character | 0 | 1 | 2026-07 |
| categorie_produit | character | 0 | 21 | 10060-Gros appareils ménagers |
| motif | character | 0 | 7 | Qualité des biens et services |
| secteur | character | 6 | 37 | Cabinets de dentistes |
| ville_siege_social | character | 9 | 26 | Montréal |

### 2024 insurance quotes

Excel workbook containing five practice quotes.

[Download quotes_2024.xlsx](module_04/resources/quotes_2024.xlsx)

| Information  | Value                                           |
|:-------------|:------------------------------------------------|
| Module       | Module 04                                       |
| Observations | 5                                               |
| Variables    | 3                                               |
| Course use   | Excel workbook containing five practice quotes. |
| Source       | NA                                              |
| License      | Matériel pédagogique du cours                   |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| Quotes Q3 2024 | character | 0 | 5 | policy_id |
| …2 | character | 0 | 5 | quote_date |
| …3 | character | 0 | 5 | quote_amount |

### Insurance coverage JSON

Small JSON file used to learn nested data.

[Download coverage.json](module_04/coverage.json)

| Information  | Value                                      |
|:-------------|:-------------------------------------------|
| Module       | Module 04                                  |
| Observations | 2                                          |
| Variables    | 2                                          |
| Course use   | Small JSON file used to learn nested data. |
| Source       | NA                                         |
| License      | Matériel pédagogique du cours              |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| element | character | 0 | 2 | policy_id |
| value | character | 0 | 2 | chr “P001” |

### Last-resort financial assistance, December 2022

Aggregated table of clients and benefits in Quebec.

[Download afdr_clientele_prestations_2022_12.csv](module_04/data/afdr_clientele_prestations_2022_12.csv)

| Information | Value |
|:---|:---|
| Module | Module 04 |
| Observations | 43 |
| Variables | 12 |
| Course use | Aggregated table of clients and benefits in Quebec. |
| Source | https://www.donneesquebec.ca/recherche/dataset/aide-financiere-de-dernier-recours-afdr-clientele-et-prestations |
| License | CC BY 4.0 |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| Caracteristique | character | 0 | 5 | Programme |
| Valeur | character | 0 | 42 | Programme d’aide sociale |
| Nb_menages | numeric | 0 | 43 | 133239 |
| Nb_adultes | numeric | 0 | 43 | 146204 |
| Nb_enfants | numeric | 0 | 38 | 51371 |
| Nb_prestataires | numeric | 0 | 43 | 197575 |
| Prestation_totale_versee | numeric | 0 | 43 | 107217063\.86 |
| Prestations_de_base | numeric | 0 | 42 | 92041 |
| Alloc_CTE | numeric | 0 | 40 | 39578 |
| Alloc_mixte | numeric | 0 | 32 | 1620 |
| Alloc_SS | numeric | 0 | 40 | 0 |
| Prest_base_Heberges | numeric | 0 | 16 | 0 |

### Practice insurance policies

Small policy file used to diagnose types and values.

[Download policies.csv](module_04/policies.csv)

| Information  | Value                                                |
|:-------------|:-----------------------------------------------------|
| Module       | Module 04                                            |
| Observations | 15                                                   |
| Variables    | 9                                                    |
| Course use   | Small policy file used to diagnose types and values. |
| Source       | NA                                                   |
| License      | Matériel pédagogique du cours                        |

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

### Sherbrooke facility metadata

ArcGIS metadata associated with the facility inventory.

[Download metadonnees_installations_sherbrooke.json](module_04/data/metadonnees_installations_sherbrooke.json)

| Information | Value |
|:---|:---|
| Module | Module 04 |
| Observations | 84 |
| Variables | Not determined automatically |
| Course use | ArcGIS metadata associated with the facility inventory. |
| Source | https://www.donneesquebec.ca/recherche/dataset/b6498f3436974ecbb8fa636a7d9c0b2f_0 |
| License | CC BY 4.0 |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| element | character | 0 | 84 | currentVersion |
| value | character | 0 | 46 | int 12 |

### Sherbrooke sports facilities

Inventory of 859 sports and recreational facilities.

[Download installations_sportives_sherbrooke.csv](module_04/data/installations_sportives_sherbrooke.csv)

| Information | Value |
|:---|:---|
| Module | Module 04 |
| Observations | 859 |
| Variables | 8 |
| Course use | Inventory of 859 sports and recreational facilities. |
| Source | https://www.donneesquebec.ca/recherche/dataset/b6498f3436974ecbb8fa636a7d9c0b2f_0 |
| License | CC BY 4.0 |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| TYPE | character | 0 | 6 | Tennis |
| DETAIL | character | 30 | 9 | Nombre de court(s) : 2 |
| NOM | character | 34 | 16 | Couturier 1 |
| SURFACE | character | 0 | 7 | Synthétique |
| ECLAIRAGE | character | 6 | 2 | Oui |
| OBJECTID | numeric | 0 | 50 | 1 |
| x | numeric | 0 | 50 | -8001483.0332582 |
| y | numeric | 0 | 50 | 5688767.14796452 |

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

### Gatineau traffic volumes

Extract of road traffic measurements from 2016 to 2023.

[Download debits_circulation_gatineau_2016_2023.csv](module_05/data/debits_circulation_gatineau_2016_2023.csv)

| Information | Value |
|:---|:---|
| Module | Module 05 |
| Observations | 1,200 |
| Variables | 7 |
| Course use | Extract of road traffic measurements from 2016 to 2023. |
| Source | https://www.donneesquebec.ca/recherche/dataset/debits-de-circulation |
| License | CC BY 4.0 |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| secteur | character | 0 | 2 | Gatineau |
| intersection | character | 0 | 8 | Canne / Stéphane |
| approche | character | 0 | 4 | Nord |
| direction_circulation | character | 0 | 4 | Sud |
| debit_total_24h | numeric | 0 | 22 | 4800 |
| pourcentage_vehicules_lourds | numeric | 7 | 14 | 1.2 |
| annee | numeric | 0 | 1 | 2016 |

### Laval bicycle counts

Fifteen-minute counts at the Chevillon loop in June 2016.

[Download comptages_velos_laval_2016_06.csv](module_05/data/comptages_velos_laval_2016_06.csv)

| Information | Value |
|:---|:---|
| Module | Module 05 |
| Observations | 2,688 |
| Variables | 5 |
| Course use | Fifteen-minute counts at the Chevillon loop in June 2016. |
| Source | https://www.donneesquebec.ca/recherche/dataset/comptages-velos |
| License | CC BY 4.0 |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| date | Date | 0 | 1 | 2016-06-01 |
| heure | hms | 0 | 50 | 00:00:00 |
| velos_total | numeric | 0 | 1 | 0 |
| velos_entrants | numeric | 0 | 1 | 0 |
| velos_sortants | numeric | 0 | 1 | 0 |

### Quebec City air quality, July 2025

Hourly measurements at the Quebec City Vieux-Limoilou station.

[Download qualite_air_quebec_vieux_limoilou_2025_07.csv](module_05/data/qualite_air_quebec_vieux_limoilou_2025_07.csv)

| Information | Value |
|:---|:---|
| Module | Module 05 |
| Observations | 744 |
| Variables | 7 |
| Course use | Hourly measurements at the Quebec City Vieux-Limoilou station. |
| Source | https://www.donneesquebec.ca/recherche/dataset/rsqaq-donnees-horaires-continues |
| License | CC BY 4.0 |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| station | character | 0 | 1 | 03006 - Québec - Vieux-Limoilou |
| date_heure | POSIXct | 0 | 50 | 2025-07-01 |
| carbone_noir | numeric | 0 | 50 | 7.1724 |
| monoxyde_carbone | numeric | 2 | 48 | 0.4897 |
| ozone | numeric | 0 | 50 | 6.6078 |
| particules_fines | numeric | 0 | 50 | 25.4002 |
| dioxyde_soufre | numeric | 0 | 42 | 0.0397 |

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

### Données Québec datasets

Table of 312 Quebec datasets.

[Download jeux_donnees_quebec.csv](module_06/data/jeux_donnees_quebec.csv)

| Information | Value |
|:---|:---|
| Module | Module 06 |
| Observations | 312 |
| Variables | 8 |
| Course use | Table of 312 Quebec datasets. |
| Source | https://www.donneesquebec.ca/recherche/api/3/action/package_search |
| License | CC BY 4.0 |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| jeu_id | character | 0 | 50 | 00ec17f8-c7f1-414c-9860-a12bd0c91824 |
| titre | character | 0 | 50 | Écocentres et points de dépôt municipaux |
| organisation_id | character | 0 | 11 | 0000b004-5e60-4585-b5b1-c0942d829fa5 |
| licence | character | 0 | 1 | Attribution (CC-BY 4.0) |
| date_creation | Date | 0 | 41 | 2023-08-30 |
| date_modification | Date | 0 | 20 | 2026-02-09 |
| nb_ressources | numeric | 0 | 8 | 3 |
| nb_etiquettes | numeric | 0 | 16 | 6 |

### Données Québec organizations

Table of 142 organizations in the relational extract.

[Download organisations_donnees_quebec.csv](module_06/data/organisations_donnees_quebec.csv)

| Information | Value |
|:---|:---|
| Module | Module 06 |
| Observations | 142 |
| Variables | 5 |
| Course use | Table of 142 organizations in the relational extract. |
| Source | https://www.donneesquebec.ca/recherche/api/3/action/package_search |
| License | CC BY 4.0 |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| organisation_id | character | 0 | 50 | 02ac2745-f6ac-432b-aebd-27037cbaa0fb |
| organisation_nom | character | 0 | 50 | AdMare |
| organisation_slug | character | 0 | 50 | admare |
| nb_jeux_catalogue | numeric | 0 | 12 | 1 |
| etat | character | 0 | 1 | active |

### Données Québec resources

Table of 3,143 resources linked to datasets.

[Download ressources_donnees_quebec.csv](module_06/data/ressources_donnees_quebec.csv)

| Information | Value |
|:---|:---|
| Module | Module 06 |
| Observations | 3,143 |
| Variables | 7 |
| Course use | Table of 3,143 resources linked to datasets. |
| Source | https://www.donneesquebec.ca/recherche/api/3/action/package_search |
| License | CC BY 4.0 |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| ressource_id | character | 0 | 50 | 6edbec58-9e50-4653-8c87-70b0d1755326 |
| jeu_id | character | 0 | 17 | 00ec17f8-c7f1-414c-9860-a12bd0c91824 |
| ressource_nom | character | 0 | 21 | Écocentres et points de dépôt municipaux |
| format | character | 0 | 5 | CSV |
| type_ressource | character | 0 | 2 | donnees |
| taille_octets | numeric | 12 | 38 | 44046 |
| date_modification | Date | 0 | 7 | 2023-08-30 |

### Données Québec tags

Table of 2,101 links between datasets and tags.

[Download etiquettes_donnees_quebec.csv](module_06/data/etiquettes_donnees_quebec.csv)

| Information | Value |
|:---|:---|
| Module | Module 06 |
| Observations | 2,101 |
| Variables | 2 |
| Course use | Table of 2,101 links between datasets and tags. |
| Source | https://www.donneesquebec.ca/recherche/api/3/action/package_search |
| License | CC BY 4.0 |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| jeu_id | character | 0 | 8 | 00ec17f8-c7f1-414c-9860-a12bd0c91824 |
| etiquette | character | 0 | 37 | Collecte des matières résiduelles |

### Aggregated Sherbrooke incidents

Incidents aggregated by month and type, without coordinates or exact dates.

[Download incidents_securite_sherbrooke_agreges.csv](module_07/data/incidents_securite_sherbrooke_agreges.csv)

| Information | Value |
|:---|:---|
| Module | Module 07 |
| Observations | 258 |
| Variables | 4 |
| Course use | Incidents aggregated by month and type, without coordinates or exact dates. |
| Source | https://www.donneesquebec.ca/recherche/dataset/64d19d62f0804f5896e4b24c32aea49d_0 |
| License | CC BY 4.0 |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| annee | numeric | 0 | 1 | 2022 |
| mois | numeric | 0 | 7 | 1 |
| type_incident | character | 0 | 8 | Accident avec blessés |
| nb_incidents | numeric | 0 | 39 | 28 |

### Données Québec user survey

Aggregated responses to three public consultation questions.

[Download sondage_utilisateurs_donnees_quebec_2020_2025.csv](module_07/data/sondage_utilisateurs_donnees_quebec_2020_2025.csv)

| Information  | Value                                                        |
|:-------------|:-------------------------------------------------------------|
| Module       | Module 07                                                    |
| Observations | 168                                                          |
| Variables    | 5                                                            |
| Course use   | Aggregated responses to three public consultation questions. |
| Source       | https://www.donneesquebec.ca/recherche/dataset/sondage       |
| License      | CC BY 4.0                                                    |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| annee | numeric | 0 | 2 | 2020 |
| question | numeric | 0 | 3 | 3 |
| reponse | character | 0 | 27 | Consulter les jeux de données les plus récents |
| nb_reponses | numeric | 8 | 28 | 1 |
| pourcentage | numeric | 8 | 35 | 1.1 |

### Sherbrooke population, 2022 to 2024

Annual population estimates used to calculate rates.

[Download population_sherbrooke_2022_2024.csv](module_07/data/population_sherbrooke_2022_2024.csv)

| Information | Value |
|:---|:---|
| Module | Module 07 |
| Observations | 3 |
| Variables | 3 |
| Course use | Annual population estimates used to calculate rates. |
| Source | https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=1710015501 |
| License | Licence ouverte du gouvernement du Canada |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| annee | numeric | 0 | 3 | 2022 |
| population_estimee | numeric | 0 | 3 | 177782 |
| geographie | character | 0 | 1 | Sherbrooke (V), Québec |

### Catalog with missing categories

HTML snapshot of four records, including two without a category.

[Download catalogue_donnees_quebec_irregulier.html](module_08/data/catalogue_donnees_quebec_irregulier.llms.md)

| Information | Value |
|:---|:---|
| Module | Module 08 |
| Observations | 4 |
| Variables | 4 |
| Course use | HTML snapshot of four records, including two without a category. |
| Source | https://www.donneesquebec.ca/page-api/ |
| License | CC BY 4.0 |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| message | character | 0 | 1 | No preview is available for this file type. |

### Données Québec catalog

HTML snapshot of six real records from six cities.

[Download catalogue_donnees_quebec.html](module_08/data/catalogue_donnees_quebec.llms.md)

| Information  | Value                                              |
|:-------------|:---------------------------------------------------|
| Module       | Module 08                                          |
| Observations | 6                                                  |
| Variables    | 4                                                  |
| Course use   | HTML snapshot of six real records from six cities. |
| Source       | https://www.donneesquebec.ca/page-api/             |
| License      | CC BY 4.0                                          |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| message | character | 0 | 1 | No preview is available for this file type. |

### SIT Québec events

HTML snapshot of six events announced in six cities.

[Download evenements_sit_quebec.html](module_08/data/evenements_sit_quebec.llms.md)

| Information | Value |
|:---|:---|
| Module | Module 08 |
| Observations | 6 |
| Variables | 4 |
| Course use | HTML snapshot of six events announced in six cities. |
| Source | https://www.donneesquebec.ca/recherche/dataset/sit-quebec-evenements |
| License | CC BY 4.0 |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| message | character | 0 | 1 | No preview is available for this file type. |

### Municipal water consumption, 2023

Residential consumption and distributed water in 496 municipalities.

[Download municipal_water_consumption_2023.csv](module_09/data/municipal_water_consumption_2023.csv)

| Information | Value |
|:---|:---|
| Module | Module 09 |
| Observations | 496 |
| Variables | 10 |
| Course use | Residential consumption and distributed water in 496 municipalities. |
| Source | https://www.donneesquebec.ca/recherche/dataset/sqeep-2019-2025 |
| License | CC BY 4.0 |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| municipality_code | character | 0 | 50 | 88055 |
| municipality | character | 0 | 50 | Amos |
| municipality_type | character | 0 | 5 | City |
| region | character | 0 | 2 | Abitibi-Témiscamingue |
| residential_consumption_l_person_day | numeric | 0 | 47 | 243 |
| population_served | numeric | 0 | 49 | 11771 |
| population_served_thousands | numeric | 0 | 49 | 11.771 |
| residences_served | numeric | 0 | 50 | 5740 |
| persons_per_residence | numeric | 0 | 42 | 2.05063495 |
| distributed_water_l_person_day | numeric | 0 | 48 | 414 |

### Water audit validity, 2023

Availability and validity-index results for 1,104 municipalities.

[Download water_audit_validity_2023.csv](module_09/data/water_audit_validity_2023.csv)

| Information | Value |
|:---|:---|
| Module | Module 09 |
| Observations | 1,104 |
| Variables | 7 |
| Course use | Availability and validity-index results for 1,104 municipalities. |
| Source | https://www.donneesquebec.ca/recherche/dataset/sqeep-2019-2025 |
| License | CC BY 4.0 |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| municipality_code | numeric | 0 | 50 | 88055 |
| municipality | character | 0 | 50 | Amos |
| municipality_type | character | 0 | 5 | City |
| region | character | 0 | 1 | Abitibi-Témiscamingue |
| validity_index_pct | numeric | 29 | 8 | 59 |
| metered_non_residential_connections_pct | numeric | 30 | 10 | 0.08867925 |
| validity_available | logical | 0 | 2 | TRUE |

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

### Données Québec descriptions

Real descriptions of 89 datasets published by eight Quebec cities.

[Download quebec_dataset_descriptions.csv](module_10/data/quebec_dataset_descriptions.csv)

| Information | Value |
|:---|:---|
| Module | Module 10 |
| Observations | 89 |
| Variables | 9 |
| Course use | Real descriptions of 89 datasets published by eight Quebec cities. |
| Source | https://www.donneesquebec.ca/page-api/ |
| License | CC BY 4.0 |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| dataset_id | character | 0 | 50 | pistes-cyclables-standard |
| producer | character | 0 | 5 | Ville de Gatineau |
| category | character | 0 | 14 | Infrastructures; Transport |
| title | character | 0 | 50 | Pistes cyclables |
| description | character | 0 | 49 | Pistes cyclables (standard du hackathon provincial à Sherbrooke du 10 |
| resource_count | numeric | 0 | 9 | 5 |
| updated_at | Date | 0 | 13 | 2025-11-25 |
| licence | character | 0 | 1 | Attribution (CC-BY 4.0) |
| snapshot_date | Date | 0 | 1 | 2026-07-11 |

### Quebec tourism events

Balanced sample of 151 tourism events.

[Download quebec_tourism_events.csv](module_10/data/quebec_tourism_events.csv)

| Information | Value |
|:---|:---|
| Module | Module 10 |
| Observations | 151 |
| Variables | 11 |
| Course use | Balanced sample of 151 tourism events. |
| Source | https://www.donneesquebec.ca/recherche/dataset/sit-quebec-evenements |
| License | CC BY 4.0 |

#### Preview

Preview limited to 12 rows and 12 columns to keep the page light.

#### Preview variables

| variable | type | missing_values_in_preview | distinct_values_in_preview | example |
|:---|:---|---:|---:|:---|
| event_id | character | 0 | 50 | EVENMTOV5016CZ |
| title | character | 0 | 50 | Carnaval de Lorrainville |
| event_type | character | 0 | 8 | Festival |
| theme | character | 25 | 13 | Littérature et poésie |
| tourism_region | character | 0 | 7 | Abitibi-Témiscamingue |
| municipality | character | 0 | 33 | Lorrainville |
| start_date | Date | 0 | 44 | 2026-01-29 |
| end_date | Date | 0 | 44 | 2026-01-31 |
| website_available | logical | 0 | 2 | TRUE |
| text | character | 0 | 50 | Carnaval de Lorrainville \| \| Concert, spectacle\|Course de véhicules mo |
| duration_days | numeric | 0 | 16 | 3 |
