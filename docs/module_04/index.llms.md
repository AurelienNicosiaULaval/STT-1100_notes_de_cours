# Facteurs et nettoyage de données

Module 04

Nettoyer des données réelles et préparer des variables utilisables pour l’analyse.

Fil principalImportation, nettoyage et listes

DonnéesCSV, Excel, JSON et données imbriquées

DéfiJeu de données nettoyé et documenté

## Produit fini du module

Produit final

### Un tableau nettoyé et documenté

Le module aboutit à une version utilisable d'un fichier d'assurance, avec les choix de nettoyage expliqués, les anomalies visibles et un journal reproductible.

**données nettoyées**

import validé

variables nettoyées

journal documenté

types vérifiés valeurs recodées décisions tracées

## Objectifs du module

À la fin de ce module, vous devriez être capable de

- importer des données de différents formats (`csv`, Excel, JSON);
- inspecter les types, les dimensions, les valeurs manquantes et les anomalies;
- nettoyer des noms de colonnes, des montants textuels, des facteurs et des chaînes de caractères;
- transformer des tableaux avec `pivot_longer()`, `pivot_wider()` et `unnest()`;
- documenter les décisions de nettoyage dans une liste structurée.

## Plan d’apprentissage

Les cartes reprennent les quatre blocs du plan: lectures, aventure, défi, exercices. L’aventure et le défi forment le fil narratif du module. Les exercices sont indépendants et servent à pratiquer les mêmes gestes sur d’autres données.

1 Lectures à faire Préparer importation, valeurs manquantes, tableurs, JSON et listes. Dans la carte Ouvrir la carteRéduire

### Lectures à faire

Ces lectures préparent les gestes du module: importer, mettre en ordre, traiter les valeurs manquantes, lire des tableurs, lire du JSON et manipuler des listes.

- [R for Data Science - Data import](https://r4ds.hadley.nz/data-import.html): importer des fichiers délimités avec `readr`.
- [R for Data Science - Data tidying](https://r4ds.hadley.nz/data-tidy.html): restructurer un tableau avec les principes des données tidy.
- [R for Data Science - Missing values](https://r4ds.hadley.nz/missing-values.html): distinguer les valeurs manquantes explicites, codées et implicites.
- [R for Data Science - Factors](https://r4ds.hadley.nz/factors.html): manipuler des variables catégorielles.
- [R for Data Science - Spreadsheets](https://r4ds.hadley.nz/spreadsheets.html): importer des fichiers Excel proprement.
- [R for Data Science - Hierarchical data](https://r4ds.hadley.nz/rectangling.html): comprendre les listes, le JSON et les données imbriquées.

Après les lectures, faites le [mini-test formatif](mini_test.llms.md). Il n'est pas noté; il sert à vérifier les bases avant l'aventure.

2 Aventure Diagnostiquer un fichier réel et corriger les variables fragiles. [Aventure](aventure.llms.md) Ouvrir la carteRéduire

Objectif Diagnostiquer une archive d'assurance avec Alex et construire un premier journal de nettoyage.

Ressource [Page Aventure](aventure.llms.md)

Action Importer `dataset_pratique.csv`, repérer les anomalies et documenter les décisions.

Résultat Une première version explicable de `donnees_propres.csv` et de `journal_nettoyage`.

Le fil narratif est guidé: on cherche moins la perfection que la traçabilité.

3 Défi Livrer un tableau nettoyé avec transformations justifiées. [Défi](defi.llms.md) Ouvrir la carteRéduire

Objectif Reprendre le même fichier d'assurance en autonomie et livrer une version propre.

Ressource [Page Défi](defi.llms.md)

À remettre Un fichier `.qmd`, `donnees_propres.csv` et `journal_nettoyage.Rdata`.

Vérifiez que l'importation donne 23 colonnes avant de nettoyer.

4 Exercices Pratiquer les gestes techniques sur des données autonomes. [Exercices](exercices.llms.md) Ouvrir la carteRéduire

Ressource [Page Exercices](exercices.llms.md)

Portée Ces exercices ne sont pas la suite du défi. Ils utilisent `policies.csv`, `coverage.json`, `quotes_2024.xlsx` et deux jeux de données fictifs distincts.

Cas Une bourse universitaire et un parc d'équipements municipaux.

Refaites au moins un passage sans regarder la solution immédiatement.

## Données et outils

### Bases de données

[dataset_pratique.csv](../donnees.llms.md#dataset-card-dataset-pratique) [policies.csv](../donnees.llms.md#dataset-card-policies-module-04) [coverage.json](../donnees.llms.md#dataset-card-coverage-module-04) [quotes_2024.xlsx](../donnees.llms.md#dataset-card-quotes-module-04) [demandes_bourses_fictif.csv](data/demandes_bourses_fictif.csv) [equipements_municipaux_fictif.csv](data/equipements_municipaux_fictif.csv) [regles_equipements_fictif.json](data/regles_equipements_fictif.json)

### Packages R

[readr](../packages.llms.md#readr) [readxl](../packages.llms.md#readxl) [dplyr](../packages.llms.md#dplyr) [tidyr](../packages.llms.md#tidyr) [jsonlite](../packages.llms.md#jsonlite) [janitor](../packages.llms.md#janitor) [stringr](../packages.llms.md#stringr) [forcats](../packages.llms.md#forcats) [tibble](../packages.llms.md#tibble) [ggplot2](../packages.llms.md#ggplot2)

## Révision et prolongement

### Finir le module avec l’IA du cours

Avant de passer au module suivant, utilisez l’IA du cours comme partenaire de révision: demandez-lui de questionner votre raisonnement, de repérer les lignes de code fragiles et de proposer une amélioration réaliste du défi.

- Expliquez le produit fini en trois phrases.
- Collez un extrait de code ou de sortie et demandez un diagnostic.
- Demandez une variante plus ambitieuse, puis choisissez ce qui reste raisonnable.
