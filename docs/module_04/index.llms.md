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

## Préparer le module

### Prérequis

Vous devez pouvoir importer un tableau simple, inspecter ses colonnes et relire les recodages du module 3. Préparez aussi votre projet RStudio avant d’ouvrir les fichiers fournis.

### Parcours minimal

Vérifiez les noms, les types et les valeurs manquantes, puis documentez au moins une décision de nettoyage. Une correction prudente et expliquée vaut mieux qu’un fichier modifié sans trace.

### À garder pour plus tard

Les formats long-large, Excel et JSON sont des prolongements utiles. Commencez par le diagnostic d’un tableau avant de multiplier les formats et les transformations.

### Si vous hésitez

N’effacez pas une valeur seulement parce qu’elle semble étrange. Signalez-la dans le journal, expliquez votre décision et conservez une démarche reproductible.

## Plan d’apprentissage

Les cartes reprennent les cinq étapes du plan: lectures, aventure, défi, exercices et rétroaction IA. L’aventure et le défi forment le fil narratif du module. Les exercices sont indépendants et servent à pratiquer les mêmes gestes sur d’autres données. La rétroaction IA revient sur un élément du travail déjà réalisé; elle ne demande aucune remise supplémentaire.

1 Lectures à faire Préparer importation, valeurs manquantes, tableurs, JSON et listes. Dans la carte Ouvrir la carteRéduire

### Lectures à faire

Ces lectures préparent les gestes du module: importer, mettre en ordre, traiter les valeurs manquantes, lire des tableurs, lire du JSON et manipuler des listes.

- [R for Data Science - Data import](https://r4ds.hadley.nz/data-import.html): importer des fichiers délimités avec `readr`.
- [R for Data Science - Data tidying](https://r4ds.hadley.nz/data-tidy.html): restructurer un tableau avec les principes des données tidy.
- [R for Data Science - Missing values](https://r4ds.hadley.nz/missing-values.html): distinguer les valeurs manquantes explicites, codées et implicites.
- [R for Data Science - Factors](https://r4ds.hadley.nz/factors.html): manipuler des variables catégorielles.
- [R for Data Science - Spreadsheets](https://r4ds.hadley.nz/spreadsheets.html): importer des fichiers Excel proprement.
- [R for Data Science - Hierarchical data](https://r4ds.hadley.nz/rectangling.html): comprendre les listes, le JSON et les données imbriquées.

#### Aide-mémoires Posit

- [Data import with the tidyverse :: Cheatsheet](https://rstudio.github.io/cheatsheets/data-import.pdf): importer des fichiers délimités et Excel.
- [Data tidying with tidyr :: Cheatsheet](https://rstudio.github.io/cheatsheets/tidyr.pdf): transformer des tableaux entre formats long et large.
- [String manipulation with stringr :: Cheatsheet](https://rstudio.github.io/cheatsheets/strings.pdf): nettoyer des chaînes et détecter des motifs.
- [Factors with forcats :: Cheatsheet](https://rstudio.github.io/cheatsheets/factors.pdf): nettoyer et regrouper des modalités.
- [Data transformation with dplyr :: Cheatsheet](https://rstudio.github.io/cheatsheets/data-transformation.pdf): inspecter, filtrer et résumer des tableaux.

Après les lectures, faites le [mini-test formatif](mini_test.llms.md). Il n'est pas noté; il sert à vérifier les bases avant l'aventure.

2 Aventure Diagnostiquer un fichier réel et corriger les variables fragiles. [Aventure](aventure.llms.md) Ouvrir la carteRéduire

Objectif Diagnostiquer une archive d'assurance avec Alex et construire un premier journal de nettoyage.

Ressource [Page Aventure](aventure.llms.md)

Action Importer `dataset_pratique.csv`, repérer les anomalies et documenter les décisions.

Résultat Une première version explicable de `donnees_propres.csv` et de `journal_nettoyage`.

Le fil narratif est guidé: on cherche moins la perfection que la traçabilité.

3 Défi Livrer un tableau nettoyé avec transformations justifiées. [Défi](defi.llms.md) Ouvrir la carteRéduire

### Défi - Nettoyage documenté

Vous reprenez le fichier d'assurance en autonomie pour produire une version propre et justifier les décisions de nettoyage.

- But: importer, diagnostiquer, corriger et documenter les variables fragiles.
- Livrables: un fichier `.qmd`, `donnees_propres.csv` et `journal_nettoyage.Rdata`.
- Point d'attention: vérifier que l'importation donne 23 colonnes avant de nettoyer.

La consigne complète est disponible dans la page [Défi 4](defi.llms.md).

4 Exercices Pratiquer les gestes techniques sur des données autonomes. [Exercices](exercices.llms.md) Ouvrir la carteRéduire

Ressource [Page Exercices](exercices.llms.md)

Portée Ces exercices ne sont pas la suite du défi. Ils utilisent `policies.csv`, `coverage.json`, `quotes_2024.xlsx` et deux sources publiques québécoises.

Cas L'aide financière de dernier recours au Québec et les installations sportives de Sherbrooke.

Refaites au moins un passage sans regarder la solution immédiatement.

5 Rétroaction IA Faire relire un extrait du travail, puis décider quoi améliorer soi-même. [Mode /retroaction](../ia.llms.md) Ouvrir la carteRéduire

Point de départ Choisissez un seul élément réellement produit dans l'aventure, le défi ou les exercices: un extrait de code, un graphique, une interprétation ou un choix méthodologique.

Préparer Donnez la consigne, le contexte, ce que vous avez essayé et l'élément précis à relire.

Demander Ouvrez [GPT STT-1100](https://chatgpt.com/g/g-682d165f32e881918633affa3fe9dfd6-gpt-stt-1100) en mode `/retroaction`. Demandez un point solide, une fragilité à vérifier et une question qui vous aidera à corriger.

Décider Comparez la réponse aux données et à la consigne. Modifiez vous-même seulement ce que vous comprenez et pouvez expliquer.

Demande prête à copier

`/retroaction Je termine ce module. Voici la consigne visée, ce que j'ai essayé et l'extrait précis que je veux améliorer. Donne-moi un point solide, une fragilité à vérifier et une question qui m'aidera à corriger moi-même. Ne réécris pas tout le travail.`

Résultat attendu Une amélioration comprise et appliquée dans votre travail, ou une raison claire de ne pas suivre la suggestion. Il n'y a ni portfolio ni remise supplémentaire à produire.

Confidentialité Ne transmettez aucune donnée personnelle, confidentielle ou protégée.

## Données et outils

### Bases de données

[Télécharger le dossier de travail du module (.zip)](../downloads/donnees/stt1100-module-04-fr.zip)

[dataset_pratique.csv](../donnees.llms.md#dataset-card-dataset-pratique) [policies.csv](../donnees.llms.md#dataset-card-policies-module-04) [coverage.json](../donnees.llms.md#dataset-card-coverage-module-04) [quotes_2024.xlsx](../donnees.llms.md#dataset-card-quotes-module-04) [AFDR, Québec, décembre 2022](data/afdr_clientele_prestations_2022_12.csv) [Installations sportives de Sherbrooke](data/installations_sportives_sherbrooke.csv) [Métadonnées ArcGIS de Sherbrooke](data/metadonnees_installations_sherbrooke.json)

### Packages R

[readr](../packages.llms.md#readr) [readxl](../packages.llms.md#readxl) [dplyr](../packages.llms.md#dplyr) [tidyr](../packages.llms.md#tidyr) [jsonlite](../packages.llms.md#jsonlite) [janitor](../packages.llms.md#janitor) [stringr](../packages.llms.md#stringr) [forcats](../packages.llms.md#forcats) [tibble](../packages.llms.md#tibble) [ggplot2](../packages.llms.md#ggplot2)
