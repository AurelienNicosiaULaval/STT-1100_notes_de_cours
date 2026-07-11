Catalogue des données

# Bases de données du cours

Cette page rassemble les jeux de données utilisés dans STT-1100. Elle sert à retrouver rapidement les fichiers à télécharger, les données fournies par des packages R et les fiches courtes des fichiers locaux.

[Démarrer](#utiliser-catalogue) [Par module](#catalogue-par-module) [Fiches locales](#fiches-fichiers-locaux) [Packages R](packages.llms.md)

CSV

Fichiers à importer et nettoyer

R

Données incluses dans des packages

JSON

Données imbriquées et listes

XLS

Feuilles Excel de pratique

Méthode de travail

## Utiliser le catalogue

Chaque carte donne un aperçu rapide, un lien vers la fiche locale si le fichier est fourni, ou un lien vers le package quand la donnée vient de R. Le catalogue ne remplace pas les consignes du module: il aide surtout à retrouver la bonne donnée et à comprendre son rôle.

1

### Repérer le module

Commencer par le module de l'exercice, de l'aventure ou du défi. Les cartes gardent cette progression.

2

### Identifier le type

Un fichier local se télécharge; une donnée de package se charge avec R; une page web demande une collecte prudente.

3

### Importer depuis le bon dossier

Dans les exercices, les chemins comme `data/fichier.csv` sont relatifs au dossier du module.

4

### Documenter la source

Un rapport reproductible indique toujours d'où vient la donnée et ce qu'elle permet, ou ne permet pas, de conclure.

Repères rapides

## Quel type de donnée cherchez-vous?

Les jeux de données du cours ne servent pas tous au même objectif. Certains sont faits pour pratiquer les bases, d'autres pour travailler les formats, les jointures, l'éthique ou la communication.

### Fichiers locaux

CSV, JSON, Excel, RDS et HTML fournis avec les modules. Ils sont les plus utiles pour les exercices indépendants.

### Données de packages

Jeux de données accessibles par R, utiles pour apprendre sans gérer tout de suite les chemins de fichiers.

### Données web

Pages ou dépôts externes utilisés pour discuter la collecte, les limites techniques et les conditions d'utilisation.

### Données fictives

Données simulées pour pratiquer sans exposer de renseignements personnels ni reproduire un système réel.

Dépannage

## Quand l'importation ne fonctionne pas

Avant de changer le code au hasard, vérifier ces quatre points. Ils règlent la majorité des blocages avec les fichiers du cours.

### Chemin du fichier

Ouvrir le projet ou le dossier du module avant d'utiliser un chemin relatif comme `data/fichier.csv`.

### Séparateur

Un CSV peut utiliser une virgule ou un point-virgule. Choisir `read_csv()` ou `read_delim()` selon le fichier.

### Format

Excel, JSON, RDS et HTML ne se lisent pas avec la même fonction. Le package utile est rappelé dans la page Packages R.

### Interprétation

Une donnée fictive sert à apprendre une méthode; elle ne doit pas être décrite comme une preuve sur le monde réel.

## Catalogue par module

### Module 01

[Module 01 ](packages.llms.md#ulavalssd)

## UlavalSSD::MeteoQuebec

Jeu de données utilisé pour les premiers gestes d’exploration dans R.Package RStructure à consulterVoir la documentation [Module 01 ](#module01-bibliotheques)

## bibliotheques_municipales_fictif.csv

Observations fictives sur la fréquentation, les prêts et les ateliers de bibliothèques municipales.Fichier local12 observations / 8 variablesVoir la fiche [Module 01 ](#module01-coop)

## coop_etudiante_fictif.csv

[Ventes fictives d’une coopérative étudiante.Fichier local12 observations / 7 variablesVoir la fiche](#module01-coop)

### Module 02

[Module 02 ](#manchots-donnees)

## manchots_donnees.xlsx

Fichier Excel de pratique sur les manchots.Fichier localStructure à consulterVoir la fiche [Module 02 ](#module02-arbres)

## arbres_urbains_fictif.csv

Inventaire fictif d’arbres urbains dans quelques quartiers.Fichier local24 observations / 7 variablesVoir la fiche [Module 02 ](#module02-velo)

## velo_partage_fictif.csv

Trajets fictifs de vélo-partage par station, mois et type de jour.Fichier local24 observations / 8 variablesVoir la fiche [Module 02 ](packages.llms.md#palmerpenguins)

## palmerpenguins::penguins

[Jeu de données de démonstration sur les manchots.Package RStructure à consulterVoir la documentation](packages.llms.md#palmerpenguins)

### Module 03

[Module 03 ](packages.llms.md#ulavalssd)

## UlavalSSD::listecondamnation

Constats d’infractions alimentaires utilisés pour l’article journalistique.Package RStructure à consulterVoir la documentation [Module 03 ](packages.llms.md#palmerpenguins)

## palmerpenguins::penguins_raw

Version plus brute du jeu de données sur les manchots.Package RStructure à consulterVoir la documentation [Module 03 ](packages.llms.md#titanic)

## titanic::titanic_train

Données de passagers du Titanic utilisées comme exemple de variables catégorielles.Package RStructure à consulterVoir la documentation [Module 03 ](#module03-requetes-311)

## requetes_311_fictif.csv

Requêtes 311 fictives pour quelques villes québécoises.Fichier local24 observations / 7 variablesVoir la fiche [Module 03 ](#module03-plaintes-transport)

## plaintes_transport_fictif.csv

[Plaintes fictives pour des réseaux de transport collectif.Fichier local24 observations / 7 variablesVoir la fiche](#module03-plaintes-transport)

### Module 04

[Module 04 ](#dataset-pratique)

## dataset_pratique.csv

Fichier CSV de pratique sur des soumissions d’assurance automobile.Fichier local101 768 observations / 23 variablesVoir la fiche [Module 04 ](#policies-module-04)

## policies.csv

Petit fichier CSV de polices d’assurance.Fichier local15 observations / 9 variablesVoir la fiche [Module 04 ](#coverage-module-04)

## coverage.json

Fichier JSON associé aux couvertures de polices.Fichier local2 observations / 2 variablesVoir la fiche [Module 04 ](#quotes-module-04)

## quotes_2024.xlsx

Fichier Excel contenant une feuille nommée Q3.Fichier localStructure à consulterVoir la fiche [Module 04 ](#module04-equipements)

## equipements_municipaux_fictif.csv

Enregistrements fictifs d’équipements municipaux avec formats volontairement imparfaits.Fichier local16 observations / 7 variablesVoir la fiche [Module 04 ](#module04-demandes-bourses)

## demandes_bourses_fictif.csv

Demandes fictives de bourses étudiantes.Fichier local16 observations / 8 variablesVoir la fiche [Module 04 ](#module04-regles-equipements)

## regles_equipements_fictif.json

[Règles fictives de validation pour les équipements municipaux.Fichier local4 observations / 2 variablesVoir la fiche](#module04-regles-equipements)

### Module 05

[Module 05 ](#flights-merged-2023)

## flights_merged_2023.rds

Objet R sérialisé contenant un tableau de vols enrichi.Fichier local435 352 observations / 50 variablesVoir la fiche [Module 05 ](#module05-ateliers-soutien)

## ateliers_soutien_fictif.csv

Ateliers fictifs de soutien universitaire avec participation, météo et satisfaction.Fichier local24 observations / 10 variablesVoir la fiche [Module 05 ](#module05-frequentation-bibliotheque)

## frequentation_bibliotheque_fictive.csv

Observations fictives de fréquentation dans des zones de bibliothèque.Fichier local24 observations / 8 variablesVoir la fiche [Module 05 ](#module05-demandes-services)

## demandes_services_campus_fictif.csv

[Demandes fictives adressées à des services de campus.Fichier local24 observations / 8 variablesVoir la fiche](#module05-demandes-services)

### Module 06

[Module 06 ](packages.llms.md#nycflights23)

## nycflights23::flights

Table des vols au départ de New York en 2023.Package R435 352 observations / 19 variablesVoir la documentation [Module 06 ](packages.llms.md#nycflights23)

## nycflights23::airlines

Table de correspondance entre codes de transporteurs et noms complets.Package R14 observations / 2 variablesVoir la documentation [Module 06 ](packages.llms.md#nycflights23)

## nycflights23::weather

Conditions météo horaires pour les aéroports de New York en 2023.Package R26 207 observations / 15 variablesVoir la documentation [Module 06 ](#module06-members)

## membres_equipe_fictif.csv

Membres fictifs de deux équipes de projet.Fichier local8 observations / 4 variablesVoir la fiche [Module 06 ](#module06-contributions)

## contributions_git_fictif.csv

Contributions Git fictives liées aux membres.Fichier local12 observations / 6 variablesVoir la fiche [Module 06 ](#module06-issues)

## issues_revue_fictif.csv

Issues fictives produites pendant une revue croisée.Fichier local7 observations / 7 variablesVoir la fiche [Module 06 ](#module06-report-files)

## fichiers_rapport_fictif.csv

Fichiers attendus dans de faux dépôts de rapport.Fichier local12 observations / 4 variablesVoir la fiche [Module 06 ](#module06-data-portal)

## portail_donnees_fictif.csv

Jeux de données fictifs d’un portail ouvert.Fichier local6 observations / 5 variablesVoir la fiche [Module 06 ](#module06-producers)

## producteurs_fictif.csv

Producteurs fictifs associés à un portail de données.Fichier local4 observations / 4 variablesVoir la fiche [Module 06 ](#module06-review-comments)

## commentaires_revue_fictif.csv

[Commentaires fictifs de revue sur des jeux de données.Fichier local6 observations / 6 variablesVoir la fiche](#module06-review-comments)

### Module 07

[Module 07 ](https://github.com/STT-1100/aventure-7)

## covid_module7_douteux.csv

Fichier CSV simulé contenant volontairement des problèmes de qualité, de confidentialité et de ré-identification.Web120 observations / 25 variablesVoir la documentation [Module 07 ](#module07-signalements)

## signalements_municipaux_fictif.csv

Signalements municipaux fictifs agrégés par quartier et type.Fichier local12 observations / 6 variablesVoir la fiche [Module 07 ](#module07-population)

## population_quartiers_fictif.csv

Population fictive de quartiers utilisée pour normaliser des signalements.Fichier local7 observations / 4 variablesVoir la fiche [Module 07 ](#module07-sondage)

## sondage_etudiant_fictif.csv

[Sondage étudiant fictif contenant des variables utiles et des champs à ne pas publier.Fichier local16 observations / 9 variablesVoir la fiche](#module07-sondage)

### Module 08

[Module 08 ](https://www.donneesquebec.ca/recherche/?sort=metadata_modified+desc&page=1)

## Recherche Données Québec

Page de recherche publique du portail Données Québec utilisée pour pratiquer l’extraction HTML.WebStructure à consulterVoir la documentation [Module 08 ](#module08-catalogue)

## catalogue_donnees_quebec.html

Instantané HTML de six fiches réelles du catalogue Données Québec provenant de six villes.Fichier local6 observations / 4 variablesVoir la fiche [Module 08 ](#module08-irregular)

## catalogue_donnees_quebec_irregulier.html

Instantané HTML de quatre fiches réelles, dont deux sans catégorie dans le portail.Fichier local4 observations / 4 variablesVoir la fiche [Module 08 ](#module08-evenements)

## evenements_sit_quebec.html

[Instantané HTML de six événements réels annoncés dans six villes du Québec.Fichier local6 observations / 4 variablesVoir la fiche](#module08-evenements)

### Module 09

[Module 09 ](#eleves-fictifs)

## eleves_fictifs.csv

Fichier CSV fictif sur des élèves.Fichier local1 000 observations / 6 variablesVoir la fiche [Module 09 ](#ecoles-primaires-qc)

## ecoles_primaires_qc.csv

Fichier CSV sur des écoles primaires du Québec.Fichier local1 963 observations / 11 variablesVoir la fiche [Module 09 ](#module09-logements-energie)

## logements_energie_fictif.csv

Logements fictifs avec consommation annuelle d’électricité.Fichier local32 observations / 8 variablesVoir la fiche [Module 09 ](#module09-subventions-culture)

## subventions_culture_fictif.csv

[Demandes fictives de subvention culturelle.Fichier local36 observations / 8 variablesVoir la fiche](#module09-subventions-culture)

### Module 10

[Module 10 ](#module10-commentaires-bibliotheques)

## commentaires_bibliotheques_fictif.csv

Commentaires fictifs sur des services de bibliothèques municipales.Fichier local24 observations / 8 variablesVoir la fiche [Module 10 ](#module10-ateliers-culture)

## ateliers_culture_fictif.csv

Rétroactions fictives sur des ateliers culturels publics.Fichier local24 observations / 8 variablesVoir la fiche [Module 10 ](packages.llms.md#tidytext)

## Commentaires et textes de travail

[Textes et commentaires préparés dans les activités.TexteStructure à consulterVoir la documentation](packages.llms.md#tidytext)

## Fiches des fichiers locaux

Les aperçus sont limités aux premières lignes afin de garder le site léger. Le profil des variables est donc un diagnostic rapide de l’aperçu affiché, pas une analyse exhaustive de tout le fichier.

### bibliotheques_municipales_fictif.csv

Observations fictives sur la fréquentation, les prêts et les ateliers de bibliothèques municipales.

[Télécharger bibliotheques_municipales_fictif.csv](module_01/data/bibliotheques_municipales_fictif.csv)

| Information | Valeur |
|:---|:---|
| Module | Module 01 |
| Observations | 12 |
| Variables | 8 |
| Utilisation | Pratiquer l’importation, l’inspection d’un tableau et les premiers résumés numériques. |
| Source | Données fictives créées pour les exercices du module 01. |
| Licence | Données simulées pour le cours. |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| message | character | 0 | 1 | Aperçu non disponible: ’/private/tmp/stt1100-module8.jcvbMq/repo/modul |

### coop_etudiante_fictif.csv

Ventes fictives d’une coopérative étudiante.

[Télécharger coop_etudiante_fictif.csv](module_01/data/coop_etudiante_fictif.csv)

| Information | Valeur |
|:---|:---|
| Module | Module 01 |
| Observations | 12 |
| Variables | 7 |
| Utilisation | Calculer des revenus, résumer des quantités, explorer les rabais et formuler de premières observations. |
| Source | Données fictives créées pour les exercices du module 01. |
| Licence | Données simulées pour le cours. |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| message | character | 0 | 1 | Aperçu non disponible: ’/private/tmp/stt1100-module8.jcvbMq/repo/modul |

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

### arbres_urbains_fictif.csv

Inventaire fictif d’arbres urbains dans quelques quartiers.

[Télécharger arbres_urbains_fictif.csv](module_02/data/arbres_urbains_fictif.csv)

| Information | Valeur |
|:---|:---|
| Module | Module 02 |
| Observations | 24 |
| Variables | 7 |
| Utilisation | Produire des graphiques de base, comparer des groupes et relier choix visuels et question descriptive. |
| Source | Données fictives créées pour les exercices du module 02. |
| Licence | Données simulées pour le cours. |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| message | character | 0 | 1 | Aperçu non disponible: ’/private/tmp/stt1100-module8.jcvbMq/repo/modul |

### velo_partage_fictif.csv

Trajets fictifs de vélo-partage par station, mois et type de jour.

[Télécharger velo_partage_fictif.csv](module_02/data/velo_partage_fictif.csv)

| Information | Valeur |
|:---|:---|
| Module | Module 02 |
| Observations | 24 |
| Variables | 8 |
| Utilisation | Explorer les relations entre trajets, météo et contexte temporel avec des visualisations. |
| Source | Données fictives créées pour les exercices du module 02. |
| Licence | Données simulées pour le cours. |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| message | character | 0 | 1 | Aperçu non disponible: ’/private/tmp/stt1100-module8.jcvbMq/repo/modul |

### requetes_311_fictif.csv

Requêtes 311 fictives pour quelques villes québécoises.

[Télécharger requetes_311_fictif.csv](module_03/data/requetes_311_fictif.csv)

| Information | Valeur |
|:---|:---|
| Module | Module 03 |
| Observations | 24 |
| Variables | 7 |
| Utilisation | Recoder des catégories, inspecter les statuts et résumer les délais de traitement. |
| Source | Données fictives créées pour les exercices du module 03. |
| Licence | Données simulées pour le cours. |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| message | character | 0 | 1 | Aperçu non disponible: ’/private/tmp/stt1100-module8.jcvbMq/repo/modul |

### plaintes_transport_fictif.csv

Plaintes fictives pour des réseaux de transport collectif.

[Télécharger plaintes_transport_fictif.csv](module_03/data/plaintes_transport_fictif.csv)

| Information | Valeur |
|:---|:---|
| Module | Module 03 |
| Observations | 24 |
| Variables | 7 |
| Utilisation | Travailler les facteurs, ordonner des catégories et résumer des plaintes par réseau, période et gravité. |
| Source | Données fictives créées pour les exercices du module 03. |
| Licence | Données simulées pour le cours. |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| message | character | 0 | 1 | Aperçu non disponible: ’/private/tmp/stt1100-module8.jcvbMq/repo/modul |

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
| Observations | 2                                                     |
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

### equipements_municipaux_fictif.csv

Enregistrements fictifs d’équipements municipaux avec formats volontairement imparfaits.

[Télécharger equipements_municipaux_fictif.csv](module_04/data/equipements_municipaux_fictif.csv)

| Information | Valeur |
|:---|:---|
| Module | Module 04 |
| Observations | 16 |
| Variables | 7 |
| Utilisation | Nettoyer des catégories, convertir des montants, vérifier des années plausibles et appliquer des règles de validation. |
| Source | Données fictives créées pour les exercices du module 04. |
| Licence | Données simulées pour le cours. |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| message | character | 0 | 1 | Aperçu non disponible: ’/private/tmp/stt1100-module8.jcvbMq/repo/modul |

### demandes_bourses_fictif.csv

Demandes fictives de bourses étudiantes.

[Télécharger demandes_bourses_fictif.csv](module_04/data/demandes_bourses_fictif.csv)

| Information | Valeur |
|:---|:---|
| Module | Module 04 |
| Observations | 16 |
| Variables | 8 |
| Utilisation | Nettoyer des statuts, des montants, des programmes et discuter les limites de variables administratives simulées. |
| Source | Données fictives créées pour les exercices du module 04. |
| Licence | Données simulées pour le cours. |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| message | character | 0 | 1 | Aperçu non disponible: ’/private/tmp/stt1100-module8.jcvbMq/repo/modul |

### regles_equipements_fictif.json

Règles fictives de validation pour les équipements municipaux.

[Télécharger regles_equipements_fictif.json](module_04/data/regles_equipements_fictif.json)

| Information | Valeur |
|:---|:---|
| Module | Module 04 |
| Observations | 4 |
| Variables | 2 |
| Utilisation | Lire un fichier JSON de paramètres et l’utiliser pour contrôler la cohérence d’un tableau. |
| Source | Données fictives créées pour les exercices du module 04. |
| Licence | Données simulées pour le cours. |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| message | character | 0 | 1 | Aperçu non disponible: cannot open the connection |

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

### ateliers_soutien_fictif.csv

Ateliers fictifs de soutien universitaire avec participation, météo et satisfaction.

[Télécharger ateliers_soutien_fictif.csv](module_05/data/ateliers_soutien_fictif.csv)

| Information | Valeur |
|:---|:---|
| Module | Module 05 |
| Observations | 24 |
| Variables | 10 |
| Utilisation | Explorer des relations entre variables numériques, contexte temporel et participation. |
| Source | Données fictives créées pour les exercices du module 05. |
| Licence | Données simulées pour le cours. |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| message | character | 0 | 1 | Aperçu non disponible: ’/private/tmp/stt1100-module8.jcvbMq/repo/modul |

### frequentation_bibliotheque_fictive.csv

Observations fictives de fréquentation dans des zones de bibliothèque.

[Télécharger frequentation_bibliotheque_fictive.csv](module_05/data/frequentation_bibliotheque_fictive.csv)

| Information | Valeur |
|:---|:---|
| Module | Module 05 |
| Observations | 24 |
| Variables | 8 |
| Utilisation | Comparer fréquentation, météo, heures et semaine d’examens sans confondre relation et causalité. |
| Source | Données fictives créées pour les exercices du module 05. |
| Licence | Données simulées pour le cours. |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| message | character | 0 | 1 | Aperçu non disponible: ’/private/tmp/stt1100-module8.jcvbMq/repo/modul |

### demandes_services_campus_fictif.csv

Demandes fictives adressées à des services de campus.

[Télécharger demandes_services_campus_fictif.csv](module_05/data/demandes_services_campus_fictif.csv)

| Information | Valeur |
|:---|:---|
| Module | Module 05 |
| Observations | 24 |
| Variables | 8 |
| Utilisation | Analyser les relations entre priorité, délai, satisfaction, coût estimé et statut. |
| Source | Données fictives créées pour les exercices du module 05. |
| Licence | Données simulées pour le cours. |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| message | character | 0 | 1 | Aperçu non disponible: ’/private/tmp/stt1100-module8.jcvbMq/repo/modul |

### membres_equipe_fictif.csv

Membres fictifs de deux équipes de projet.

[Télécharger membres_equipe_fictif.csv](module_06/data/membres_equipe_fictif.csv)

| Information  | Valeur                                                  |
|:-------------|:--------------------------------------------------------|
| Module       | Module 06                                               |
| Observations | 8                                                       |
| Variables    | 4                                                       |
| Utilisation  | Pratiquer les clés de jointure et les résumés par rôle. |
| Source       | Données fictives créées pour le cours.                  |
| Licence      | Données simulées pour le cours.                         |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| message | character | 0 | 1 | Aperçu non disponible: ’/private/tmp/stt1100-module8.jcvbMq/repo/modul |

### contributions_git_fictif.csv

Contributions Git fictives liées aux membres.

[Télécharger contributions_git_fictif.csv](module_06/data/contributions_git_fictif.csv)

| Information | Valeur |
|:---|:---|
| Module | Module 06 |
| Observations | 12 |
| Variables | 6 |
| Utilisation | Joindre des commits aux personnes et repérer les clés absentes. |
| Source | Données fictives créées pour le cours. |
| Licence | Données simulées pour le cours. |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| message | character | 0 | 1 | Aperçu non disponible: ’/private/tmp/stt1100-module8.jcvbMq/repo/modul |

### issues_revue_fictif.csv

Issues fictives produites pendant une revue croisée.

[Télécharger issues_revue_fictif.csv](module_06/data/issues_revue_fictif.csv)

| Information  | Valeur                                             |
|:-------------|:---------------------------------------------------|
| Module       | Module 06                                          |
| Observations | 7                                                  |
| Variables    | 7                                                  |
| Utilisation  | Résumer des issues par équipe, statut et priorité. |
| Source       | Données fictives créées pour le cours.             |
| Licence      | Données simulées pour le cours.                    |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| message | character | 0 | 1 | Aperçu non disponible: ’/private/tmp/stt1100-module8.jcvbMq/repo/modul |

### fichiers_rapport_fictif.csv

Fichiers attendus dans de faux dépôts de rapport.

[Télécharger fichiers_rapport_fictif.csv](module_06/data/fichiers_rapport_fictif.csv)

| Information | Valeur |
|:---|:---|
| Module | Module 06 |
| Observations | 12 |
| Variables | 4 |
| Utilisation | Vérifier la présence des livrables et diagnostiquer la reproductibilité. |
| Source | Données fictives créées pour le cours. |
| Licence | Données simulées pour le cours. |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| message | character | 0 | 1 | Aperçu non disponible: ’/private/tmp/stt1100-module8.jcvbMq/repo/modul |

### portail_donnees_fictif.csv

Jeux de données fictifs d’un portail ouvert.

[Télécharger portail_donnees_fictif.csv](module_06/data/portail_donnees_fictif.csv)

| Information | Valeur |
|:---|:---|
| Module | Module 06 |
| Observations | 6 |
| Variables | 5 |
| Utilisation | Pratiquer les jointures avec producteurs, licences et commentaires de revue. |
| Source | Données fictives créées pour le cours. |
| Licence | Données simulées pour le cours. |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| message | character | 0 | 1 | Aperçu non disponible: ’/private/tmp/stt1100-module8.jcvbMq/repo/modul |

### producteurs_fictif.csv

Producteurs fictifs associés à un portail de données.

[Télécharger producteurs_fictif.csv](module_06/data/producteurs_fictif.csv)

| Information  | Valeur                                               |
|:-------------|:-----------------------------------------------------|
| Module       | Module 06                                            |
| Observations | 4                                                    |
| Variables    | 4                                                    |
| Utilisation  | Repérer les producteurs manquants dans une jointure. |
| Source       | Données fictives créées pour le cours.               |
| Licence      | Données simulées pour le cours.                      |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| message | character | 0 | 1 | Aperçu non disponible: ’/private/tmp/stt1100-module8.jcvbMq/repo/modul |

### commentaires_revue_fictif.csv

Commentaires fictifs de revue sur des jeux de données.

[Télécharger commentaires_revue_fictif.csv](module_06/data/commentaires_revue_fictif.csv)

| Information  | Valeur                                           |
|:-------------|:-------------------------------------------------|
| Module       | Module 06                                        |
| Observations | 6                                                |
| Variables    | 6                                                |
| Utilisation  | Résumer les problèmes par dimension et sévérité. |
| Source       | Données fictives créées pour le cours.           |
| Licence      | Données simulées pour le cours.                  |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| message | character | 0 | 1 | Aperçu non disponible: ’/private/tmp/stt1100-module8.jcvbMq/repo/modul |

### signalements_municipaux_fictif.csv

Signalements municipaux fictifs agrégés par quartier et type.

[Télécharger signalements_municipaux_fictif.csv](module_07/data/signalements_municipaux_fictif.csv)

| Information | Valeur |
|:---|:---|
| Module | Module 07 |
| Observations | 12 |
| Variables | 6 |
| Utilisation | Comparer nombres bruts, taux par population et règles de masquage des petits effectifs. |
| Source | Données fictives créées pour le cours. |
| Licence | Données simulées pour le cours. |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| message | character | 0 | 1 | Aperçu non disponible: ’/private/tmp/stt1100-module8.jcvbMq/repo/modul |

### population_quartiers_fictif.csv

Population fictive de quartiers utilisée pour normaliser des signalements.

[Télécharger population_quartiers_fictif.csv](module_07/data/population_quartiers_fictif.csv)

| Information | Valeur |
|:---|:---|
| Module | Module 07 |
| Observations | 7 |
| Variables | 4 |
| Utilisation | Calculer des taux par 10 000 personnes et discuter les limites des comparaisons. |
| Source | Données fictives créées pour le cours. |
| Licence | Données simulées pour le cours. |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| message | character | 0 | 1 | Aperçu non disponible: ’/private/tmp/stt1100-module8.jcvbMq/repo/modul |

### sondage_etudiant_fictif.csv

Sondage étudiant fictif contenant des variables utiles et des champs à ne pas publier.

[Télécharger sondage_etudiant_fictif.csv](module_07/data/sondage_etudiant_fictif.csv)

| Information | Valeur |
|:---|:---|
| Module | Module 07 |
| Observations | 16 |
| Variables | 9 |
| Utilisation | Pratiquer l’anonymisation, les petits effectifs et la communication prudente. |
| Source | Données fictives créées pour le cours. |
| Licence | Données simulées pour le cours. |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| message | character | 0 | 1 | Aperçu non disponible: ’/private/tmp/stt1100-module8.jcvbMq/repo/modul |

### catalogue_donnees_quebec.html

Instantané HTML de six fiches réelles du catalogue Données Québec provenant de six villes.

[Télécharger catalogue_donnees_quebec.html](module_08/data/catalogue_donnees_quebec.llms.md)

| Information | Valeur |
|:---|:---|
| Module | Module 08 |
| Observations | 6 |
| Variables | 4 |
| Utilisation | Pratiquer les sélecteurs CSS, l’extraction de champs et la construction d’un tibble. |
| Source | API CKAN officielle de Données Québec, instantané du 11 juillet 2026. |
| Licence | CC BY 4.0. |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| message | character | 0 | 1 | Aucun aperçu disponible pour ce type de fichier. |

### catalogue_donnees_quebec_irregulier.html

Instantané HTML de quatre fiches réelles, dont deux sans catégorie dans le portail.

[Télécharger catalogue_donnees_quebec_irregulier.html](module_08/data/catalogue_donnees_quebec_irregulier.llms.md)

| Information | Valeur |
|:---|:---|
| Module | Module 08 |
| Observations | 4 |
| Variables | 4 |
| Utilisation | Tester une fonction d’extraction robuste et représenter les champs manquants par NA. |
| Source | API CKAN officielle de Données Québec, instantané du 11 juillet 2026. |
| Licence | CC BY 4.0. |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| message | character | 0 | 1 | Aucun aperçu disponible pour ce type de fichier. |

### evenements_sit_quebec.html

Instantané HTML de six événements réels annoncés dans six villes du Québec.

[Télécharger evenements_sit_quebec.html](module_08/data/evenements_sit_quebec.llms.md)

| Information | Valeur |
|:---|:---|
| Module | Module 08 |
| Observations | 6 |
| Variables | 4 |
| Utilisation | Construire une fonction d’extraction pour un second type de page HTML. |
| Source | Ministère du Tourisme, Système d’information touristique Québec, ressource du 5 juillet 2026. |
| Licence | CC BY 4.0. |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| message | character | 0 | 1 | Aucun aperçu disponible pour ce type de fichier. |

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
| Utilisation | Relier des indicateurs scolaires à des questions descriptives, prédire l’IMSE et discuter les limites liées aux données manquantes. |
| Source | Portail Données Québec, indices de défavorisation. |
| Licence | Voir les conditions du portail Données Québec. |

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

### logements_energie_fictif.csv

Logements fictifs avec consommation annuelle d’électricité.

[Télécharger logements_energie_fictif.csv](module_09/data/logements_energie_fictif.csv)

| Information | Valeur |
|:---|:---|
| Module | Module 09 |
| Observations | 32 |
| Variables | 8 |
| Utilisation | Pratiquer la régression linéaire, les prédictions, les erreurs et les limites d’extrapolation. |
| Source | Données fictives créées pour le cours. |
| Licence | Données simulées pour le cours. |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| logement_id | character | 0 | 32 | L001 |
| quartier | character | 0 | 11 | Montcalm |
| superficie_m2 | numeric | 0 | 32 | 62 |
| annee_construction | numeric | 0 | 32 | 1988 |
| nb_occupants | numeric | 0 | 5 | 1 |
| type_chauffage | character | 0 | 3 | Electricite |
| revenu_median_quartier | numeric | 0 | 11 | 64000 |
| consommation_kwh | numeric | 0 | 32 | 11800 |

### subventions_culture_fictif.csv

Demandes fictives de subvention culturelle.

[Télécharger subventions_culture_fictif.csv](module_09/data/subventions_culture_fictif.csv)

| Information | Valeur |
|:---|:---|
| Module | Module 09 |
| Observations | 36 |
| Variables | 8 |
| Utilisation | Comparer des taux de décision par groupe et discuter les biais descriptifs sans surinterpréter. |
| Source | Données fictives créées pour le cours. |
| Licence | Données simulées pour le cours. |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| dossier_id | character | 0 | 36 | S001 |
| region | character | 0 | 7 | Capitale-Nationale |
| discipline | character | 0 | 5 | Theatre |
| taille_organisme | character | 0 | 3 | Grand |
| premiere_demande | character | 0 | 2 | Non |
| budget_demande | numeric | 0 | 35 | 82000 |
| score_comite | numeric | 0 | 26 | 86 |
| decision | character | 0 | 2 | Acceptee |

### commentaires_bibliotheques_fictif.csv

Commentaires fictifs sur des services de bibliothèques municipales.

[Télécharger commentaires_bibliotheques_fictif.csv](module_10/data/commentaires_bibliotheques_fictif.csv)

| Information | Valeur |
|:---|:---|
| Module | Module 10 |
| Observations | 24 |
| Variables | 8 |
| Utilisation | Pratiquer la tokenisation, les stopwords, les scores de sentiment simples et le TF-IDF. |
| Source | Données fictives créées pour le cours. |
| Licence | Données simulées pour le cours. |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| commentaire_id | character | 0 | 24 | B001 |
| mois | numeric | 0 | 6 | 1 |
| arrondissement | character | 0 | 4 | Sainte-Foy |
| service | character | 0 | 4 | Comptoir |
| commentaire | character | 0 | 24 | Accueil tres clair et rapide, le personnel m’a bien orientee. |
| satisfaction | numeric | 0 | 5 | 5 |
| clarte | numeric | 0 | 5 | 5 |
| delai | numeric | 0 | 5 | 4 |

### ateliers_culture_fictif.csv

Rétroactions fictives sur des ateliers culturels publics.

[Télécharger ateliers_culture_fictif.csv](module_10/data/ateliers_culture_fictif.csv)

| Information | Valeur |
|:---|:---|
| Module | Module 10 |
| Observations | 24 |
| Variables | 8 |
| Utilisation | Préparer des synthèses textuelles et numériques pour un mini tableau de bord. |
| Source | Données fictives créées pour le cours. |
| Licence | Données simulées pour le cours. |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| reponse_id | character | 0 | 24 | A001 |
| edition | numeric | 0 | 6 | 1 |
| quartier | character | 0 | 4 | Montcalm |
| type_activite | character | 0 | 4 | Ecriture |
| commentaire | character | 0 | 24 | Atelier chaleureux, consignes claires et bonne ambiance. |
| participation | numeric | 0 | 5 | 5 |
| accessibilite | numeric | 0 | 5 | 5 |
| recommandation | numeric | 0 | 5 | 5 |
