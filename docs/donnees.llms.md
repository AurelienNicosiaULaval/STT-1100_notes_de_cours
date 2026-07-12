Catalogue des données

# Bases de données du cours

Cette page rassemble les jeux de données utilisés dans STT-1100. Elle sert à retrouver rapidement les fichiers à télécharger, les données fournies par des packages R et les fiches courtes des fichiers locaux.

[Télécharger un module](#dossiers-de-travail) [Mode d'emploi](#utiliser-catalogue) [Par module](#catalogue-par-module) [Fiches locales](#fiches-fichiers-locaux) [Packages R](packages.llms.md)

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

## Dossiers de travail

Chaque dossier contient un projet RStudio, un fichier Quarto sans solution et tous les fichiers requis par les exercices. Téléchargez un seul ZIP, décompressez-le, puis ouvrez le fichier `.Rproj`.

Module 01

## Dossier de travail

Projet RStudio prêt à ouvrir avec 2 fichier(s) fourni(s).

[Télécharger le ZIP](downloads/donnees/stt1100-module-01-fr.zip)

Module 02

## Dossier de travail

Projet RStudio prêt à ouvrir avec 3 fichier(s) fourni(s).

[Télécharger le ZIP](downloads/donnees/stt1100-module-02-fr.zip)

Module 03

## Dossier de travail

Projet RStudio prêt à ouvrir avec 2 fichier(s) fourni(s).

[Télécharger le ZIP](downloads/donnees/stt1100-module-03-fr.zip)

Module 04

## Dossier de travail

Projet RStudio prêt à ouvrir avec 6 fichier(s) fourni(s).

[Télécharger le ZIP](downloads/donnees/stt1100-module-04-fr.zip)

Module 05

## Dossier de travail

Projet RStudio prêt à ouvrir avec 3 fichier(s) fourni(s).

[Télécharger le ZIP](downloads/donnees/stt1100-module-05-fr.zip)

Module 06

## Dossier de travail

Projet RStudio prêt à ouvrir avec 4 fichier(s) fourni(s).

[Télécharger le ZIP](downloads/donnees/stt1100-module-06-fr.zip)

Module 07

## Dossier de travail

Projet RStudio prêt à ouvrir avec 3 fichier(s) fourni(s).

[Télécharger le ZIP](downloads/donnees/stt1100-module-07-fr.zip)

Module 08

## Dossier de travail

Projet RStudio prêt à ouvrir avec 3 fichier(s) fourni(s).

[Télécharger le ZIP](downloads/donnees/stt1100-module-08-fr.zip)

Module 09

## Dossier de travail

Projet RStudio prêt à ouvrir avec 2 fichier(s) fourni(s).

[Télécharger le ZIP](downloads/donnees/stt1100-module-09-fr.zip)

Module 10

## Dossier de travail

Projet RStudio prêt à ouvrir avec 2 fichier(s) fourni(s).

[Télécharger le ZIP](downloads/donnees/stt1100-module-10-fr.zip)

## Catalogue par module

### Module 01

[Module 01 ](#module01-bibliotheques)

## Bibliothèques publiques du Québec, 2024

Statistiques de 188 bibliothèques publiques et centres régionaux du Québec.Fichier local188 observations / 6 variablesVoir la fiche [Module 01 ](#module01-portail)

## Fréquentation du portail de Montréal, 2023

Fréquentation de pages du portail de données ouvertes de Montréal pendant une journée.Fichier local126 observations / 6 variablesVoir la fiche [Module 01 ](packages.llms.md#ulavalssd)

## UlavalSSD::MeteoQuebec

[Jeu de données utilisé pour les premiers gestes d’exploration dans R.Package RStructure à consulterVoir la documentation](packages.llms.md#ulavalssd)

### Module 02

[Module 02 ](#module02-arbres)

## Arbres répertoriés de Québec

Extrait de 500 arbres de l’inventaire public de la Ville de Québec.Fichier local500 observations / 7 variablesVoir la fiche [Module 02 ](#module02-velo)

## Compteurs cyclistes de Québec, 2026

Instantané des totaux publiés par onze sites de comptage cycliste.Fichier local11 observations / 6 variablesVoir la fiche [Module 02 ](#manchots-donnees)

## Données de manchots pour Excel

Feuille Excel préparée pour apprendre l’importation et la visualisation.Fichier local322 observations / 7 variablesVoir la fiche [Module 02 ](packages.llms.md#palmerpenguins)

## palmerpenguins::penguins

[Jeu de données de démonstration sur les manchots.Package RStructure à consulterVoir la documentation](packages.llms.md#palmerpenguins)

### Module 03

[Module 03 ](#module03-plaintes)

## Plaintes de consommation au Québec

Extrait de 750 plaintes reçues par l’Office de la protection du consommateur.Fichier local750 observations / 5 variablesVoir la fiche [Module 03 ](#module03-requetes-311)

## Requêtes 311 de Montréal

Extrait de 750 demandes de services citoyennes 311.Fichier local750 observations / 5 variablesVoir la fiche [Module 03 ](packages.llms.md#ulavalssd)

## UlavalSSD::listecondamnation

Constats d’infractions alimentaires utilisés pour l’article journalistique.Package RStructure à consulterVoir la documentation [Module 03 ](packages.llms.md#palmerpenguins)

## palmerpenguins::penguins_raw

Version plus brute du jeu de données sur les manchots.Package RStructure à consulterVoir la documentation [Module 03 ](packages.llms.md#titanic)

## titanic::titanic_train

[Données de passagers du Titanic utilisées comme exemple de variables catégorielles.Package RStructure à consulterVoir la documentation](packages.llms.md#titanic)

### Module 04

[Module 04 ](#module04-afdr)

## Aide financière de dernier recours, décembre 2022

Tableau agrégé de la clientèle et des prestations au Québec.Fichier local43 observations / 12 variablesVoir la fiche [Module 04 ](#coverage-module-04)

## Couvertures d’assurance en JSON

Petit fichier JSON utilisé pour apprendre les données imbriquées.Fichier local2 observations / 2 variablesVoir la fiche [Module 04 ](#module04-installations)

## Installations sportives de Sherbrooke

Inventaire de 859 installations sportives et récréatives.Fichier local859 observations / 8 variablesVoir la fiche [Module 04 ](#module04-metadonnees)

## Métadonnées des installations de Sherbrooke

Métadonnées ArcGIS associées à l’inventaire des installations.Fichier local84 observations / ? variablesVoir la fiche [Module 04 ](#policies-module-04)

## Polices d’assurance de pratique

Petit fichier de polices utilisé pour diagnostiquer les types et les valeurs.Fichier local15 observations / 9 variablesVoir la fiche [Module 04 ](#quotes-module-04)

## Soumissions d’assurance 2024

Feuille Excel contenant cinq soumissions de pratique.Fichier local5 observations / 3 variablesVoir la fiche [Module 04 ](#dataset-pratique)

## dataset_pratique.csv

[Fichier CSV de pratique sur des soumissions d’assurance automobile.Fichier local101 768 observations / 23 variablesVoir la fiche](#dataset-pratique)

### Module 05

[Module 05 ](#module05-velos)

## Comptages vélos de Laval

Comptages aux quinze minutes à la boucle Chevillon en juin 2016.Fichier local2 688 observations / 5 variablesVoir la fiche [Module 05 ](#module05-circulation)

## Débits de circulation de Gatineau

Extrait de mesures de circulation routière de 2016 à 2023.Fichier local1 200 observations / 7 variablesVoir la fiche [Module 05 ](#module05-air)

## Qualité de l’air à Québec, juillet 2025

Mesures horaires à la station Québec - Vieux-Limoilou.Fichier local744 observations / 7 variablesVoir la fiche [Module 05 ](#flights-merged-2023)

## flights_merged_2023.rds

[Objet R sérialisé contenant un tableau de vols enrichi.Fichier local435 352 observations / 50 variablesVoir la fiche](#flights-merged-2023)

### Module 06

[Module 06 ](#module06-jeux)

## Jeux de Données Québec

Table de 312 jeux de données québécois.Fichier local312 observations / 8 variablesVoir la fiche [Module 06 ](#module06-organisations)

## Organisations de Données Québec

Table des 142 organisations présentes dans l’extrait relationnel.Fichier local142 observations / 5 variablesVoir la fiche [Module 06 ](#module06-ressources)

## Ressources de Données Québec

Table de 3 143 ressources liées aux jeux de données.Fichier local3 143 observations / 7 variablesVoir la fiche [Module 06 ](#module06-etiquettes)

## Étiquettes de Données Québec

Table de 2 101 associations entre jeux et étiquettes.Fichier local2 101 observations / 2 variablesVoir la fiche [Module 06 ](packages.llms.md#nycflights23)

## nycflights23::airlines

Table de correspondance entre codes de transporteurs et noms complets.Package R14 observations / 2 variablesVoir la documentation [Module 06 ](packages.llms.md#nycflights23)

## nycflights23::flights

Table des vols au départ de New York en 2023.Package R435 352 observations / 19 variablesVoir la documentation [Module 06 ](packages.llms.md#nycflights23)

## nycflights23::weather

[Conditions météo horaires pour les aéroports de New York en 2023.Package R26 207 observations / 15 variablesVoir la documentation](packages.llms.md#nycflights23)

### Module 07

[Module 07 ](#module07-incidents)

## Incidents agrégés de Sherbrooke

Incidents agrégés par mois et par type, sans coordonnées ni dates exactes.Fichier local258 observations / 4 variablesVoir la fiche [Module 07 ](#module07-population)

## Population de Sherbrooke, 2022 à 2024

Estimations annuelles de population utilisées pour calculer des taux.Fichier local3 observations / 3 variablesVoir la fiche [Module 07 ](#module07-sondage)

## Sondage des utilisateurs de Données Québec

Réponses agrégées à trois questions de la consultation publique.Fichier local168 observations / 5 variablesVoir la fiche [Module 07 ](https://github.com/STT-1100/aventure-7)

## covid_module7_douteux.csv

[Fichier CSV simulé contenant volontairement des problèmes de qualité, de confidentialité et de ré-identification.Web120 observations / 25 variablesVoir la documentation](https://github.com/STT-1100/aventure-7)

### Module 08

[Module 08 ](#module08-catalogue)

## Catalogue Données Québec

Instantané HTML de six fiches réelles provenant de six villes.Fichier local6 observations / 4 variablesVoir la fiche [Module 08 ](#module08-irregular)

## Catalogue avec catégories absentes

Instantané HTML de quatre fiches, dont deux sans catégorie.Fichier local4 observations / 4 variablesVoir la fiche [Module 08 ](#module08-evenements)

## Événements du SIT Québec

Instantané HTML de six événements annoncés dans six villes.Fichier local6 observations / 4 variablesVoir la fiche [Module 08 ](https://www.donneesquebec.ca/recherche/?sort=metadata_modified+desc&page=1)

## Recherche Données Québec

[Page de recherche publique du portail Données Québec utilisée pour pratiquer l’extraction HTML.WebStructure à consulterVoir la documentation](https://www.donneesquebec.ca/recherche/?sort=metadata_modified+desc&page=1)

### Module 09

[Module 09 ](#module09-consommation-eau)

## Consommation d’eau municipale, 2023

Consommation résidentielle et eau distribuée dans 496 municipalités.Fichier local496 observations / 10 variablesVoir la fiche [Module 09 ](#module09-validite)

## Validité des audits de l’eau, 2023

Disponibilité et résultats de l’indice de validité pour 1 104 municipalités.Fichier local1 104 observations / 7 variablesVoir la fiche [Module 09 ](#ecoles-primaires-qc)

## ecoles_primaires_qc.csv

Fichier CSV sur des écoles primaires du Québec.Fichier local1 963 observations / 11 variablesVoir la fiche [Module 09 ](#eleves-fictifs)

## eleves_fictifs.csv

[Fichier CSV fictif sur des élèves.Fichier local1 000 observations / 6 variablesVoir la fiche](#eleves-fictifs)

### Module 10

[Module 10 ](#module10-descriptions)

## Descriptions de Données Québec

Descriptions réelles de 89 jeux publiés par huit villes québécoises.Fichier local89 observations / 9 variablesVoir la fiche [Module 10 ](#module10-evenements)

## Événements touristiques québécois

Échantillon équilibré de 151 événements touristiques.Fichier local151 observations / 11 variablesVoir la fiche [Module 10 ](packages.llms.md#tidytext)

## Commentaires et textes de travail

[Textes et commentaires préparés dans les activités.TexteStructure à consulterVoir la documentation](packages.llms.md#tidytext)

## Fiches des fichiers locaux

Les aperçus sont limités aux premières lignes afin de garder le site léger. Le profil des variables est donc un diagnostic rapide de l’aperçu affiché, pas une analyse exhaustive de tout le fichier.

### Bibliothèques publiques du Québec, 2024

Statistiques de 188 bibliothèques publiques et centres régionaux du Québec.

[Télécharger bibliotheques_publiques_quebec_2024.csv](module_01/data/bibliotheques_publiques_quebec_2024.csv)

| Information | Valeur |
|:---|:---|
| Module | Module 01 |
| Observations | 188 |
| Variables | 6 |
| Utilisation | Statistiques de 188 bibliothèques publiques et centres régionaux du Québec. |
| Source | https://www.donneesquebec.ca/recherche/dataset/statistiques_des_bibliotheques_publiques_du_quebec |
| Licence | CC BY 4.0 |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| bibliotheque | character | 0 | 50 | Acton Vale |
| region | character | 0 | 15 | 16: Montérégie |
| population_desservie | numeric | 0 | 50 | 7823 |
| prets | numeric | 0 | 49 | 29919 |
| activites | numeric | 2 | 45 | 38 |
| visites | numeric | 3 | 47 | 15579 |

### Fréquentation du portail de Montréal, 2023

Fréquentation de pages du portail de données ouvertes de Montréal pendant une journée.

[Télécharger frequentation_portail_montreal_2023.csv](module_01/data/frequentation_portail_montreal_2023.csv)

| Information | Valeur |
|:---|:---|
| Module | Module 01 |
| Observations | 126 |
| Variables | 6 |
| Utilisation | Fréquentation de pages du portail de données ouvertes de Montréal pendant une journée. |
| Source | https://donnees.montreal.ca/dataset/frequentation-du-portail-de-donnees-ouvertes |
| Licence | CC BY 4.0 |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| date | Date | 0 | 1 | 2023-06-21 |
| path | character | 0 | 50 | / |
| title | character | 0 | 46 | Bienvenue - Site web des données ouvertes de la Ville de Montréal |
| sessions | numeric | 0 | 14 | 70 |
| pageviews | numeric | 0 | 19 | 110 |
| duree_moyenne_session_secondes | numeric | 0 | 27 | 375.528571428571 |

### Arbres répertoriés de Québec

Extrait de 500 arbres de l’inventaire public de la Ville de Québec.

[Télécharger arbres_repertories_quebec.csv](module_02/data/arbres_repertories_quebec.csv)

| Information | Valeur |
|:---|:---|
| Module | Module 02 |
| Observations | 500 |
| Variables | 7 |
| Utilisation | Extrait de 500 arbres de l’inventaire public de la Ville de Québec. |
| Source | https://www.donneesquebec.ca/recherche/dataset/34103a43-3712-4a29-92e1-039e9188e915 |
| Licence | CC BY 4.0 |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| id_arbre | numeric | 0 | 50 | 50674 |
| essence | character | 0 | 2 | alisier |
| type_arbre | character | 0 | 1 | Feuillu |
| diametre_cm | numeric | 0 | 14 | 22 |
| type_lieu | character | 0 | 2 | Lieu public |
| latitude | numeric | 0 | 50 | 46.8402910434486 |
| longitude | numeric | 0 | 50 | -71.2113116559127 |

### Compteurs cyclistes de Québec, 2026

Instantané des totaux publiés par onze sites de comptage cycliste.

[Télécharger comptages_cyclistes_quebec_2026.csv](module_02/data/comptages_cyclistes_quebec_2026.csv)

| Information | Valeur |
|:---|:---|
| Module | Module 02 |
| Observations | 11 |
| Variables | 6 |
| Utilisation | Instantané des totaux publiés par onze sites de comptage cycliste. |
| Source | https://villedequebec.eco-counter.com/ |
| Licence | Conditions de la source |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| site | character | 0 | 11 | Einstein |
| type_compteur | character | 0 | 2 | velo |
| annee_debut | numeric | 0 | 3 | 2016 |
| passages_velo_cumules | numeric | 0 | 11 | 38475 |
| latitude | numeric | 0 | 11 | 46.79517 |
| longitude | numeric | 0 | 11 | -71.29139 |

### Données de manchots pour Excel

Feuille Excel préparée pour apprendre l’importation et la visualisation.

[Télécharger manchots_donnees.xlsx](module_02/resources/manchots_donnees.xlsx)

| Information | Valeur |
|:---|:---|
| Module | Module 02 |
| Observations | 322 |
| Variables | 7 |
| Utilisation | Feuille Excel préparée pour apprendre l’importation et la visualisation. |
| Source | https://allisonhorst.github.io/palmerpenguins/ |
| Licence | Matériel pédagogique du cours |

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

### Plaintes de consommation au Québec

Extrait de 750 plaintes reçues par l’Office de la protection du consommateur.

[Télécharger plaintes_consommation_quebec.csv](module_03/data/plaintes_consommation_quebec.csv)

| Information | Valeur |
|:---|:---|
| Module | Module 03 |
| Observations | 750 |
| Variables | 5 |
| Utilisation | Extrait de 750 plaintes reçues par l’Office de la protection du consommateur. |
| Source | https://www.donneesquebec.ca/recherche/dataset/liste-des-plaintes-recues |
| Licence | CC BY 4.0 |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| periode | character | 0 | 1 | 2026-07 |
| categorie_produit | character | 0 | 21 | 10060-Gros appareils ménagers |
| motif | character | 0 | 7 | Qualité des biens et services |
| secteur | character | 6 | 37 | Cabinets de dentistes |
| ville_siege_social | character | 9 | 26 | Montréal |

### Requêtes 311 de Montréal

Extrait de 750 demandes de services citoyennes 311.

[Télécharger requetes_311_montreal.csv](module_03/data/requetes_311_montreal.csv)

| Information  | Valeur                                              |
|:-------------|:----------------------------------------------------|
| Module       | Module 03                                           |
| Observations | 750                                                 |
| Variables    | 5                                                   |
| Utilisation  | Extrait de 750 demandes de services citoyennes 311. |
| Source       | https://donnees.montreal.ca/dataset/requete-311     |
| Licence      | CC BY 4.0                                           |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| nature | character | 0 | 1 | Information |
| categorie | character | 0 | 33 | Organisme divers |
| arrondissement | character | 0 | 1 | Non assigné |
| statut | character | 0 | 1 | Sans statut |
| date_creation | Date | 0 | 15 | 2023-07-10 |

### Aide financière de dernier recours, décembre 2022

Tableau agrégé de la clientèle et des prestations au Québec.

[Télécharger afdr_clientele_prestations_2022_12.csv](module_04/data/afdr_clientele_prestations_2022_12.csv)

| Information | Valeur |
|:---|:---|
| Module | Module 04 |
| Observations | 43 |
| Variables | 12 |
| Utilisation | Tableau agrégé de la clientèle et des prestations au Québec. |
| Source | https://www.donneesquebec.ca/recherche/dataset/aide-financiere-de-dernier-recours-afdr-clientele-et-prestations |
| Licence | CC BY 4.0 |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
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

### Couvertures d’assurance en JSON

Petit fichier JSON utilisé pour apprendre les données imbriquées.

[Télécharger coverage.json](module_04/coverage.json)

| Information | Valeur |
|:---|:---|
| Module | Module 04 |
| Observations | 2 |
| Variables | 2 |
| Utilisation | Petit fichier JSON utilisé pour apprendre les données imbriquées. |
| Source | NA |
| Licence | Matériel pédagogique du cours |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| element | character | 0 | 2 | policy_id |
| valeur | character | 0 | 2 | chr “P001” |

### Installations sportives de Sherbrooke

Inventaire de 859 installations sportives et récréatives.

[Télécharger installations_sportives_sherbrooke.csv](module_04/data/installations_sportives_sherbrooke.csv)

| Information | Valeur |
|:---|:---|
| Module | Module 04 |
| Observations | 859 |
| Variables | 8 |
| Utilisation | Inventaire de 859 installations sportives et récréatives. |
| Source | https://www.donneesquebec.ca/recherche/dataset/b6498f3436974ecbb8fa636a7d9c0b2f_0 |
| Licence | CC BY 4.0 |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| TYPE | character | 0 | 6 | Tennis |
| DETAIL | character | 30 | 9 | Nombre de court(s) : 2 |
| NOM | character | 34 | 16 | Couturier 1 |
| SURFACE | character | 0 | 7 | Synthétique |
| ECLAIRAGE | character | 6 | 2 | Oui |
| OBJECTID | numeric | 0 | 50 | 1 |
| x | numeric | 0 | 50 | -8001483.0332582 |
| y | numeric | 0 | 50 | 5688767.14796452 |

### Métadonnées des installations de Sherbrooke

Métadonnées ArcGIS associées à l’inventaire des installations.

[Télécharger metadonnees_installations_sherbrooke.json](module_04/data/metadonnees_installations_sherbrooke.json)

| Information | Valeur |
|:---|:---|
| Module | Module 04 |
| Observations | 84 |
| Variables | Non déterminé automatiquement |
| Utilisation | Métadonnées ArcGIS associées à l’inventaire des installations. |
| Source | https://www.donneesquebec.ca/recherche/dataset/b6498f3436974ecbb8fa636a7d9c0b2f_0 |
| Licence | CC BY 4.0 |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| element | character | 0 | 84 | currentVersion |
| valeur | character | 0 | 46 | int 12 |

### Polices d’assurance de pratique

Petit fichier de polices utilisé pour diagnostiquer les types et les valeurs.

[Télécharger policies.csv](module_04/policies.csv)

| Information | Valeur |
|:---|:---|
| Module | Module 04 |
| Observations | 15 |
| Variables | 9 |
| Utilisation | Petit fichier de polices utilisé pour diagnostiquer les types et les valeurs. |
| Source | NA |
| Licence | Matériel pédagogique du cours |

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

### Soumissions d’assurance 2024

Feuille Excel contenant cinq soumissions de pratique.

[Télécharger quotes_2024.xlsx](module_04/resources/quotes_2024.xlsx)

| Information  | Valeur                                                |
|:-------------|:------------------------------------------------------|
| Module       | Module 04                                             |
| Observations | 5                                                     |
| Variables    | 3                                                     |
| Utilisation  | Feuille Excel contenant cinq soumissions de pratique. |
| Source       | NA                                                    |
| Licence      | Matériel pédagogique du cours                         |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| Quotes Q3 2024 | character | 0 | 5 | policy_id |
| …2 | character | 0 | 5 | quote_date |
| …3 | character | 0 | 5 | quote_amount |

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

### Comptages vélos de Laval

Comptages aux quinze minutes à la boucle Chevillon en juin 2016.

[Télécharger comptages_velos_laval_2016_06.csv](module_05/data/comptages_velos_laval_2016_06.csv)

| Information | Valeur |
|:---|:---|
| Module | Module 05 |
| Observations | 2 688 |
| Variables | 5 |
| Utilisation | Comptages aux quinze minutes à la boucle Chevillon en juin 2016. |
| Source | https://www.donneesquebec.ca/recherche/dataset/comptages-velos |
| Licence | CC BY 4.0 |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| date | Date | 0 | 1 | 2016-06-01 |
| heure | hms | 0 | 50 | 00:00:00 |
| velos_total | numeric | 0 | 1 | 0 |
| velos_entrants | numeric | 0 | 1 | 0 |
| velos_sortants | numeric | 0 | 1 | 0 |

### Débits de circulation de Gatineau

Extrait de mesures de circulation routière de 2016 à 2023.

[Télécharger debits_circulation_gatineau_2016_2023.csv](module_05/data/debits_circulation_gatineau_2016_2023.csv)

| Information | Valeur |
|:---|:---|
| Module | Module 05 |
| Observations | 1 200 |
| Variables | 7 |
| Utilisation | Extrait de mesures de circulation routière de 2016 à 2023. |
| Source | https://www.donneesquebec.ca/recherche/dataset/debits-de-circulation |
| Licence | CC BY 4.0 |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| secteur | character | 0 | 2 | Gatineau |
| intersection | character | 0 | 8 | Canne / Stéphane |
| approche | character | 0 | 4 | Nord |
| direction_circulation | character | 0 | 4 | Sud |
| debit_total_24h | numeric | 0 | 22 | 4800 |
| pourcentage_vehicules_lourds | numeric | 7 | 14 | 1.2 |
| annee | numeric | 0 | 1 | 2016 |

### Qualité de l’air à Québec, juillet 2025

Mesures horaires à la station Québec - Vieux-Limoilou.

[Télécharger qualite_air_quebec_vieux_limoilou_2025_07.csv](module_05/data/qualite_air_quebec_vieux_limoilou_2025_07.csv)

| Information | Valeur |
|:---|:---|
| Module | Module 05 |
| Observations | 744 |
| Variables | 7 |
| Utilisation | Mesures horaires à la station Québec - Vieux-Limoilou. |
| Source | https://www.donneesquebec.ca/recherche/dataset/rsqaq-donnees-horaires-continues |
| Licence | CC BY 4.0 |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| station | character | 0 | 1 | 03006 - Québec - Vieux-Limoilou |
| date_heure | POSIXct | 0 | 50 | 2025-07-01 |
| carbone_noir | numeric | 0 | 50 | 7.1724 |
| monoxyde_carbone | numeric | 2 | 48 | 0.4897 |
| ozone | numeric | 0 | 50 | 6.6078 |
| particules_fines | numeric | 0 | 50 | 25.4002 |
| dioxyde_soufre | numeric | 0 | 42 | 0.0397 |

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

### Jeux de Données Québec

Table de 312 jeux de données québécois.

[Télécharger jeux_donnees_quebec.csv](module_06/data/jeux_donnees_quebec.csv)

| Information | Valeur |
|:---|:---|
| Module | Module 06 |
| Observations | 312 |
| Variables | 8 |
| Utilisation | Table de 312 jeux de données québécois. |
| Source | https://www.donneesquebec.ca/recherche/api/3/action/package_search |
| Licence | CC BY 4.0 |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| jeu_id | character | 0 | 50 | 00ec17f8-c7f1-414c-9860-a12bd0c91824 |
| titre | character | 0 | 50 | Écocentres et points de dépôt municipaux |
| organisation_id | character | 0 | 11 | 0000b004-5e60-4585-b5b1-c0942d829fa5 |
| licence | character | 0 | 1 | Attribution (CC-BY 4.0) |
| date_creation | Date | 0 | 41 | 2023-08-30 |
| date_modification | Date | 0 | 20 | 2026-02-09 |
| nb_ressources | numeric | 0 | 8 | 3 |
| nb_etiquettes | numeric | 0 | 16 | 6 |

### Organisations de Données Québec

Table des 142 organisations présentes dans l’extrait relationnel.

[Télécharger organisations_donnees_quebec.csv](module_06/data/organisations_donnees_quebec.csv)

| Information | Valeur |
|:---|:---|
| Module | Module 06 |
| Observations | 142 |
| Variables | 5 |
| Utilisation | Table des 142 organisations présentes dans l’extrait relationnel. |
| Source | https://www.donneesquebec.ca/recherche/api/3/action/package_search |
| Licence | CC BY 4.0 |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| organisation_id | character | 0 | 50 | 02ac2745-f6ac-432b-aebd-27037cbaa0fb |
| organisation_nom | character | 0 | 50 | AdMare |
| organisation_slug | character | 0 | 50 | admare |
| nb_jeux_catalogue | numeric | 0 | 12 | 1 |
| etat | character | 0 | 1 | active |

### Ressources de Données Québec

Table de 3 143 ressources liées aux jeux de données.

[Télécharger ressources_donnees_quebec.csv](module_06/data/ressources_donnees_quebec.csv)

| Information | Valeur |
|:---|:---|
| Module | Module 06 |
| Observations | 3 143 |
| Variables | 7 |
| Utilisation | Table de 3 143 ressources liées aux jeux de données. |
| Source | https://www.donneesquebec.ca/recherche/api/3/action/package_search |
| Licence | CC BY 4.0 |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| ressource_id | character | 0 | 50 | 6edbec58-9e50-4653-8c87-70b0d1755326 |
| jeu_id | character | 0 | 17 | 00ec17f8-c7f1-414c-9860-a12bd0c91824 |
| ressource_nom | character | 0 | 21 | Écocentres et points de dépôt municipaux |
| format | character | 0 | 5 | CSV |
| type_ressource | character | 0 | 2 | donnees |
| taille_octets | numeric | 12 | 38 | 44046 |
| date_modification | Date | 0 | 7 | 2023-08-30 |

### Étiquettes de Données Québec

Table de 2 101 associations entre jeux et étiquettes.

[Télécharger etiquettes_donnees_quebec.csv](module_06/data/etiquettes_donnees_quebec.csv)

| Information | Valeur |
|:---|:---|
| Module | Module 06 |
| Observations | 2 101 |
| Variables | 2 |
| Utilisation | Table de 2 101 associations entre jeux et étiquettes. |
| Source | https://www.donneesquebec.ca/recherche/api/3/action/package_search |
| Licence | CC BY 4.0 |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| jeu_id | character | 0 | 8 | 00ec17f8-c7f1-414c-9860-a12bd0c91824 |
| etiquette | character | 0 | 37 | Collecte des matières résiduelles |

### Incidents agrégés de Sherbrooke

Incidents agrégés par mois et par type, sans coordonnées ni dates exactes.

[Télécharger incidents_securite_sherbrooke_agreges.csv](module_07/data/incidents_securite_sherbrooke_agreges.csv)

| Information | Valeur |
|:---|:---|
| Module | Module 07 |
| Observations | 258 |
| Variables | 4 |
| Utilisation | Incidents agrégés par mois et par type, sans coordonnées ni dates exactes. |
| Source | https://www.donneesquebec.ca/recherche/dataset/64d19d62f0804f5896e4b24c32aea49d_0 |
| Licence | CC BY 4.0 |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| annee | numeric | 0 | 1 | 2022 |
| mois | numeric | 0 | 7 | 1 |
| type_incident | character | 0 | 8 | Accident avec blessés |
| nb_incidents | numeric | 0 | 39 | 28 |

### Population de Sherbrooke, 2022 à 2024

Estimations annuelles de population utilisées pour calculer des taux.

[Télécharger population_sherbrooke_2022_2024.csv](module_07/data/population_sherbrooke_2022_2024.csv)

| Information | Valeur |
|:---|:---|
| Module | Module 07 |
| Observations | 3 |
| Variables | 3 |
| Utilisation | Estimations annuelles de population utilisées pour calculer des taux. |
| Source | https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=1710015501 |
| Licence | Licence ouverte du gouvernement du Canada |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| annee | numeric | 0 | 3 | 2022 |
| population_estimee | numeric | 0 | 3 | 177782 |
| geographie | character | 0 | 1 | Sherbrooke (V), Québec |

### Sondage des utilisateurs de Données Québec

Réponses agrégées à trois questions de la consultation publique.

[Télécharger sondage_utilisateurs_donnees_quebec_2020_2025.csv](module_07/data/sondage_utilisateurs_donnees_quebec_2020_2025.csv)

| Information | Valeur |
|:---|:---|
| Module | Module 07 |
| Observations | 168 |
| Variables | 5 |
| Utilisation | Réponses agrégées à trois questions de la consultation publique. |
| Source | https://www.donneesquebec.ca/recherche/dataset/sondage |
| Licence | CC BY 4.0 |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| annee | numeric | 0 | 2 | 2020 |
| question | numeric | 0 | 3 | 3 |
| reponse | character | 0 | 27 | Consulter les jeux de données les plus récents |
| nb_reponses | numeric | 8 | 28 | 1 |
| pourcentage | numeric | 8 | 35 | 1.1 |

### Catalogue Données Québec

Instantané HTML de six fiches réelles provenant de six villes.

[Télécharger catalogue_donnees_quebec.html](module_08/data/catalogue_donnees_quebec.llms.md)

| Information | Valeur |
|:---|:---|
| Module | Module 08 |
| Observations | 6 |
| Variables | 4 |
| Utilisation | Instantané HTML de six fiches réelles provenant de six villes. |
| Source | https://www.donneesquebec.ca/page-api/ |
| Licence | CC BY 4.0 |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| message | character | 0 | 1 | Aucun aperçu disponible pour ce type de fichier. |

### Catalogue avec catégories absentes

Instantané HTML de quatre fiches, dont deux sans catégorie.

[Télécharger catalogue_donnees_quebec_irregulier.html](module_08/data/catalogue_donnees_quebec_irregulier.llms.md)

| Information  | Valeur                                                      |
|:-------------|:------------------------------------------------------------|
| Module       | Module 08                                                   |
| Observations | 4                                                           |
| Variables    | 4                                                           |
| Utilisation  | Instantané HTML de quatre fiches, dont deux sans catégorie. |
| Source       | https://www.donneesquebec.ca/page-api/                      |
| Licence      | CC BY 4.0                                                   |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| message | character | 0 | 1 | Aucun aperçu disponible pour ce type de fichier. |

### Événements du SIT Québec

Instantané HTML de six événements annoncés dans six villes.

[Télécharger evenements_sit_quebec.html](module_08/data/evenements_sit_quebec.llms.md)

| Information | Valeur |
|:---|:---|
| Module | Module 08 |
| Observations | 6 |
| Variables | 4 |
| Utilisation | Instantané HTML de six événements annoncés dans six villes. |
| Source | https://www.donneesquebec.ca/recherche/dataset/sit-quebec-evenements |
| Licence | CC BY 4.0 |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| message | character | 0 | 1 | Aucun aperçu disponible pour ce type de fichier. |

### Consommation d’eau municipale, 2023

Consommation résidentielle et eau distribuée dans 496 municipalités.

[Télécharger consommation_eau_municipalites_2023.csv](module_09/data/consommation_eau_municipalites_2023.csv)

| Information | Valeur |
|:---|:---|
| Module | Module 09 |
| Observations | 496 |
| Variables | 10 |
| Utilisation | Consommation résidentielle et eau distribuée dans 496 municipalités. |
| Source | https://www.donneesquebec.ca/recherche/dataset/sqeep-2019-2025 |
| Licence | CC BY 4.0 |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| code_municipalite | character | 0 | 50 | 88055 |
| municipalite | character | 0 | 50 | Amos |
| type_municipalite | character | 0 | 5 | Ville |
| region | character | 0 | 2 | Abitibi-Témiscamingue |
| consommation_residentielle_l_pers_j | numeric | 0 | 47 | 243 |
| population_desservie | numeric | 0 | 49 | 11771 |
| population_desservie_milliers | numeric | 0 | 49 | 11.771 |
| residences_desservies | numeric | 0 | 50 | 5740 |
| personnes_par_residence | numeric | 0 | 42 | 2.05063495 |
| eau_distribuee_l_pers_j | numeric | 0 | 48 | 414 |

### Validité des audits de l’eau, 2023

Disponibilité et résultats de l’indice de validité pour 1 104 municipalités.

[Télécharger validite_audits_eau_2023.csv](module_09/data/validite_audits_eau_2023.csv)

| Information | Valeur |
|:---|:---|
| Module | Module 09 |
| Observations | 1 104 |
| Variables | 7 |
| Utilisation | Disponibilité et résultats de l’indice de validité pour 1 104 municipalités. |
| Source | https://www.donneesquebec.ca/recherche/dataset/sqeep-2019-2025 |
| Licence | CC BY 4.0 |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| code_municipalite | numeric | 0 | 50 | 88055 |
| municipalite | character | 0 | 50 | Amos |
| type_municipalite | character | 0 | 5 | Ville |
| region | character | 0 | 1 | Abitibi-Témiscamingue |
| indice_validite_pct | numeric | 29 | 8 | 59 |
| branchements_non_residentiels_comptes_pct | numeric | 30 | 10 | 0.08867925 |
| validite_disponible | logical | 0 | 2 | TRUE |

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

### Descriptions de Données Québec

Descriptions réelles de 89 jeux publiés par huit villes québécoises.

[Télécharger descriptions_donnees_quebec.csv](module_10/data/descriptions_donnees_quebec.csv)

| Information | Valeur |
|:---|:---|
| Module | Module 10 |
| Observations | 89 |
| Variables | 9 |
| Utilisation | Descriptions réelles de 89 jeux publiés par huit villes québécoises. |
| Source | https://www.donneesquebec.ca/page-api/ |
| Licence | CC BY 4.0 |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| jeu_id | character | 0 | 50 | pistes-cyclables-standard |
| producteur | character | 0 | 5 | Ville de Gatineau |
| categorie | character | 0 | 14 | Infrastructures; Transport |
| titre | character | 0 | 50 | Pistes cyclables |
| description | character | 0 | 49 | Pistes cyclables (standard du hackathon provincial à Sherbrooke du 10 |
| nb_ressources | numeric | 0 | 9 | 5 |
| date_mise_a_jour | Date | 0 | 13 | 2025-11-25 |
| licence | character | 0 | 1 | Attribution (CC-BY 4.0) |
| date_instantane | Date | 0 | 1 | 2026-07-11 |

### Événements touristiques québécois

Échantillon équilibré de 151 événements touristiques.

[Télécharger evenements_touristiques_quebec.csv](module_10/data/evenements_touristiques_quebec.csv)

| Information | Valeur |
|:---|:---|
| Module | Module 10 |
| Observations | 151 |
| Variables | 11 |
| Utilisation | Échantillon équilibré de 151 événements touristiques. |
| Source | https://www.donneesquebec.ca/recherche/dataset/sit-quebec-evenements |
| Licence | CC BY 4.0 |

#### Aperçu

Aperçu limité à 12 lignes et 12 colonnes pour garder la page légère.

#### Variables de l’aperçu

| variable | type | valeurs_manquantes_apercu | valeurs_distinctes_apercu | exemple |
|:---|:---|---:|---:|:---|
| evenement_id | character | 0 | 50 | EVENMTOV5016CZ |
| titre | character | 0 | 50 | Carnaval de Lorrainville |
| type_evenement | character | 0 | 8 | Festival |
| theme | character | 25 | 13 | Littérature et poésie |
| region_touristique | character | 0 | 7 | Abitibi-Témiscamingue |
| municipalite | character | 0 | 33 | Lorrainville |
| date_debut | Date | 0 | 44 | 2026-01-29 |
| date_fin | Date | 0 | 44 | 2026-01-31 |
| site_web_disponible | logical | 0 | 2 | TRUE |
| texte | character | 0 | 50 | Carnaval de Lorrainville \| \| Concert, spectacle\|Course de véhicules mo |
| duree_jours | numeric | 0 | 16 | 3 |
