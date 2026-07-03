Catalogue des données

# Bases de données du cours

Cette page rassemble les jeux de données utilisés dans STT-1100. Elle sert à retrouver rapidement les fichiers à télécharger, les données fournies par des packages R et les fiches courtes des fichiers locaux.

[Par module](#catalogue-par-module) [Fiches locales](#fiches-fichiers-locaux) [Packages R](packages.llms.md)

CSV

Fichiers à importer et nettoyer

R

Données incluses dans des packages

JSON

Données imbriquées et listes

XLS

Feuilles Excel de pratique

## Utiliser le catalogue

Chaque carte donne un aperçu rapide, un lien vers la fiche locale si le fichier est fourni, ou un lien vers le package quand la donnée vient de R.

## Catalogue par module

### Module 01

[Module 01 ](packages.llms.md#ulavalssd)

## UlavalSSD::MeteoQuebec

[Jeu de données utilisé pour les premiers gestes d’exploration dans R.Package RStructure à consulterVoir la documentation](packages.llms.md#ulavalssd)

### Module 02

[Module 02 ](#manchots-donnees)

## manchots_donnees.xlsx

Fichier Excel de pratique sur les manchots.Fichier localStructure à consulterVoir la fiche [Module 02 ](packages.llms.md#palmerpenguins)

## palmerpenguins::penguins

[Jeu de données de démonstration sur les manchots.Package RStructure à consulterVoir la documentation](packages.llms.md#palmerpenguins)

### Module 03

[Module 03 ](packages.llms.md#ulavalssd)

## UlavalSSD::listecondamnation

Constats d’infractions alimentaires utilisés pour l’article journalistique.Package RStructure à consulterVoir la documentation [Module 03 ](packages.llms.md#palmerpenguins)

## palmerpenguins::penguins_raw

Version plus brute du jeu de données sur les manchots.Package RStructure à consulterVoir la documentation [Module 03 ](packages.llms.md#titanic)

## titanic::titanic_train

[Données de passagers du Titanic utilisées comme exemple de variables catégorielles.Package RStructure à consulterVoir la documentation](packages.llms.md#titanic)

### Module 04

[Module 04 ](#dataset-pratique)

## dataset_pratique.csv

Fichier CSV de pratique sur des soumissions d’assurance automobile.Fichier local101 768 observations / 23 variablesVoir la fiche [Module 04 ](#policies-module-04)

## policies.csv

Petit fichier CSV de polices d’assurance.Fichier local15 observations / 9 variablesVoir la fiche [Module 04 ](#coverage-module-04)

## coverage.json

Fichier JSON associé aux couvertures de polices.Fichier local? observations / 2 variablesVoir la fiche [Module 04 ](#quotes-module-04)

## quotes_2024.xlsx

[Fichier Excel contenant une feuille nommée Q3.Fichier localStructure à consulterVoir la fiche](#quotes-module-04)

### Module 05

[Module 05 ](#flights-merged-2023)

## flights_merged_2023.rds

[Objet R sérialisé contenant un tableau de vols enrichi.Fichier local435 352 observations / 50 variablesVoir la fiche](#flights-merged-2023)

### Module 06

[Module 06 ](packages.llms.md#gapminder)

## gapminder::gapminder

Données pays-années utilisées en science des données.Package RStructure à consulterVoir la documentation [Module 06 ](packages.llms.md#dplyr)

## dplyr::starwars

Jeu de données de démonstration fourni par dplyr.Package RStructure à consulterVoir la documentation [Module 06 ](packages.llms.md#lahman)

## Lahman::People et Lahman::Batting

Tables de baseball utilisées pour combiner plusieurs sources.Package RStructure à consulterVoir la documentation [Module 06 ](packages.llms.md#weathercan)

## weathercan

[Données météorologiques canadiennes et métadonnées de stations.Package RStructure à consulterVoir la documentation](packages.llms.md#weathercan)

### Module 07

[Module 07 ](#covid-module-07)

## donnees_covid_module7.csv

[Petit fichier CSV de cas confirmés par région, âge et date.Fichier local50 observations / 4 variablesVoir la fiche](#covid-module-07)

### Module 08

[Module 08 ](packages.llms.md#rvest)

## Pages web analysées avec rvest

[Données extraites de pages HTML pendant les activités.WebStructure à consulterVoir la documentation](packages.llms.md#rvest)

### Module 09

[Module 09 ](#eleves-fictifs)

## eleves_fictifs.csv

Fichier CSV fictif sur des élèves.Fichier local1 000 observations / 6 variablesVoir la fiche [Module 09 ](#ecoles-primaires-qc)

## ecoles_primaires_qc.csv

[Fichier CSV sur des écoles primaires du Québec.Fichier local1 963 observations / 11 variablesVoir la fiche](#ecoles-primaires-qc)

### Module 10

[Module 10 ](packages.llms.md#tidytext)

## Commentaires et textes de travail

[Textes et commentaires préparés dans les activités.TexteStructure à consulterVoir la documentation](packages.llms.md#tidytext)

## Fiches des fichiers locaux

Les aperçus sont limités aux premières lignes afin de garder le site léger. Le profil des variables est donc un diagnostic rapide de l’aperçu affiché, pas une analyse exhaustive de tout le fichier.

### manchots_donnees.xlsx

Fichier Excel de pratique sur les manchots.

[Télécharger manchots_donnees.xlsx](module_02/resources/manchots_donnees.xlsx)

| Information | Valeur |
|:---|:---|
| Module | Module 02 |
| Observations | Non déterminé automatiquement |
| Variables | Non déterminé automatiquement |
| Utilisation | Importer un fichier Excel et inspecter un tableau dans RStudio. |
| Source | Fichier fourni avec le matériel du cours. |
| Licence | Matériel pédagogique du cours. |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| species | character | 0 | 3 | Gentoo |
| island | character | 0 | 3 | Dream |
| bill_length_mm | numeric | 0 | 50 | 41.6788627834779 |
| bill_depth_mm | numeric | 0 | 50 | 12.8432466901621 |
| flipper_length_mm | numeric | 0 | 50 | 197.314820493238 |
| body_mass_g | numeric | 0 | 50 | 4253.87883515575 |
| sex | character | 0 | 2 | male |

### dataset_pratique.csv

Fichier CSV de pratique sur des soumissions d’assurance automobile.

[Télécharger dataset_pratique.csv](module_04/dataset_pratique.csv)

| Information | Valeur |
|:---|:---|
| Module | Module 04 |
| Observations | 101 768 |
| Variables | 23 |
| Utilisation | Nettoyer un fichier volumineux, recoder des facteurs et inspecter les incohérences. |
| Source | Fichier fourni avec le matériel du cours. |
| Licence | Matériel pédagogique du cours. |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
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

Petit fichier CSV de polices d’assurance.

[Télécharger policies.csv](module_04/policies.csv)

| Information | Valeur |
|:---|:---|
| Module | Module 04 |
| Observations | 15 |
| Variables | 9 |
| Utilisation | Pratiquer les diagnostics rapides, les transformations et les résumés. |
| Source | Fichier fourni avec le matériel du cours. |
| Licence | Matériel pédagogique du cours. |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
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

Fichier JSON associé aux couvertures de polices.

[Télécharger coverage.json](module_04/coverage.json)

| Information  | Valeur                                                |
|:-------------|:------------------------------------------------------|
| Module       | Module 04                                             |
| Observations | Non déterminé automatiquement                         |
| Variables    | 2                                                     |
| Utilisation  | Lire des listes et comprendre des données imbriquées. |
| Source       | Fichier fourni avec le matériel du cours.             |
| Licence      | Matériel pédagogique du cours.                        |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| element | character | 0 | 2 | policy_id |
| valeur | character | 0 | 2 | chr “P001” |

### quotes_2024.xlsx

Fichier Excel contenant une feuille nommée Q3.

[Télécharger quotes_2024.xlsx](module_04/resources/quotes_2024.xlsx)

| Information | Valeur |
|:---|:---|
| Module | Module 04 |
| Observations | Non déterminé automatiquement |
| Variables | Non déterminé automatiquement |
| Utilisation | Importer un fichier Excel et vérifier la structure d’un tableau. |
| Source | Fichier fourni avec le matériel du cours. |
| Licence | Matériel pédagogique du cours. |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| Quotes Q3 2024 | character | 0 | 5 | policy_id |
| …2 | character | 0 | 5 | quote_date |
| …3 | character | 0 | 5 | quote_amount |

### flights_merged_2023.rds

Objet R sérialisé contenant un tableau de vols enrichi.

[Télécharger flights_merged_2023.rds](module_05/flights_merged_2023.rds)

| Information | Valeur |
|:---|:---|
| Module | Module 05 |
| Observations | 435 352 |
| Variables | 50 |
| Utilisation | Travailler sur un tableau volumineux, les dates et les relations entre variables. |
| Source | Fichier fourni avec le matériel du cours. |
| Licence | Matériel pédagogique du cours. |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
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

Petit fichier CSV de cas confirmés par région, âge et date.

[Télécharger donnees_covid_module7.csv](module_07/donnees_covid_module7.csv)

| Information  | Valeur                                              |
|:-------------|:----------------------------------------------------|
| Module       | Module 07                                           |
| Observations | 50                                                  |
| Variables    | 4                                                   |
| Utilisation  | Préparer des graphiques et des résumés descriptifs. |
| Source       | Fichier fourni avec le matériel du cours.           |
| Licence      | Matériel pédagogique du cours.                      |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| region | character | 0 | 3 | Québec |
| age | numeric | 0 | 27 | 78 |
| cas_confirmes | numeric | 0 | 39 | 111 |
| date | Date | 0 | 47 | 2022-08-03 |

### eleves_fictifs.csv

Fichier CSV fictif sur des élèves.

[Télécharger eleves_fictifs.csv](module_09/eleves_fictifs.csv)

| Information | Valeur |
|:---|:---|
| Module | Module 09 |
| Observations | 1 000 |
| Variables | 6 |
| Utilisation | Pratiquer les variables catégorielles, la classification et l’interprétation prudente. |
| Source | Données fictives créées pour le cours. |
| Licence | Données simulées pour le cours. |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| Sexe | character | 0 | 2 | Masculin |
| Age | numeric | 0 | 3 | 10 |
| Langue_maternelle | character | 0 | 3 | Français |
| Niveau_socio_economique | character | 0 | 2 | Faible |
| Acces_ressources | character | 0 | 2 | Non |
| Admission | character | 0 | 2 | Non |

### ecoles_primaires_qc.csv

Fichier CSV sur des écoles primaires du Québec.

[Télécharger ecoles_primaires_qc.csv](module_09/ecoles_primaires_qc.csv)

| Information | Valeur |
|:---|:---|
| Module | Module 09 |
| Observations | 1 963 |
| Variables | 11 |
| Utilisation | Relier des indicateurs scolaires à des questions descriptives. |
| Source | Fichier fourni avec le matériel du cours. |
| Licence | Voir la source indiquée dans le matériel du module. |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
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
