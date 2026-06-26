# Facteurs et nettoyage de données

Module 04

Nettoyer des données réelles et préparer des variables utilisables pour l’analyse.

Fil principalImportation, nettoyage et listes

DonnéesCSV, Excel, JSON et données imbriquées

DéfiJeu de données nettoyé et documenté

## Produit fini du module

Produit final

### Un tableau nettoyé et documenté

Le chapitre aboutit à une version utilisable d’un fichier réel, avec les choix de nettoyage expliqués et les incohérences visibles.

**données nettoyées**

types corrigés

facteurs recodés

liste explorée

types corrigés facteurs recodés liste explorée

## Objectifs du module

À la fin de ce module, vous devriez être capable de

- Importer des données de différents formats (`txt`, `csv`, `excel`, `json`).
- Nettoyer et recoder des données pour assurer leur qualité.
- Utiliser les librairies `forcats` et `stringr` pour manipuler des facteurs et des chaînes de caractères.
- Créer et utiliser des listes.

## Plan d’apprentissage

Les cartes reprennent les quatre blocs du plan: lectures, aventure, défi, exercices. Ouvrez les cartes pour voir l’action attendue et le lien utile.

1 Lectures à faire Préparer importation, nettoyage, chaînes, facteurs et listes. Dans la carte Ouvrir la carteRéduire

### Lectures initiales

#### Lectures à faire avant l’aventure

Dans ce module, nous allons explorer les concepts de base de l’importation et du nettoyage de données. Voici quelques lectures initiales pour vous préparer :

- [**R for Data Science – Data import**](https://r4ds.hadley.nz/data-import.html)
  Ce chapitre vous introduit à l’importation de données avec le package `readr`.

- [**R for Data Science – Data tidying**](https://r4ds.hadley.nz/data-tidy.html)
  Ce chapitre vous introduit à la manipulation de données avec le package `dplyr`.

- [**R for Data Science – Factors**](https://r4ds.hadley.nz/factors.html)
  Ce chapitre vous introduit aux **facteurs** en R, qui sont des variables catégoriques.
  \> **Note** : Bien que ce chapitre soit plus largement utilisé au module 4, certaines fonctions utiles comme `factor()` ou `fct_reorder()` peuvent déjà vous aider pour manipuler des variables catégoriques (module 3).

- [**R for Data Science – Import spreadsheets**](https://r4ds.hadley.nz/spreadsheets.html)
  Ce chapitre vous introduit à l’importation de données à partir de fichiers Excel.

- [**R for Data Science – Lists**](https://r4ds.hadley.nz/rectangling.html#lists)
  Cette section vous introduit au concept de liste en programmation.

2 Aventure Diagnostiquer un fichier réel et corriger les variables fragiles. [Aventure](aventure.llms.md) Ouvrir la carteRéduire

Objectif Passer de la lecture à la pratique guidée.

Ressource [Page Aventure](aventure.llms.md)

Action Suivre les consignes, exécuter le code et garder les sorties importantes.

Résultat Un premier objet de travail que vous pouvez expliquer.

Arrêtez-vous après chaque résultat important et formulez ce qu’il montre.

3 Défi Livrer un tableau nettoyé avec transformations justifiées. Dans la carte Ouvrir la carteRéduire

### Défi

A la fin de l’aventure, vous devez être en mesure d’avoir déposer dans votre dossier Github les éléments suivants :

- le script `.qmd` de votre aventure, c’est à dire un document ou vous faites vos tests et construisez votre liste journal_nettoyage ;

- la liste `journal_nettoyage` dans un objet `.Rdata` ;

- la base de données nettoyée au format `.csv.`

4 Exercices Refaire les imports, recodages et contrôles de qualité. [Exercices](exercices.llms.md) Ouvrir la carteRéduire

Ressource [Page Exercices](exercices.llms.md)

Pourquoi Les exercices sont gardés dans une page autonome parce qu'ils prennent plus de place.

Refaites au moins un passage sans regarder la solution immédiatement.

## Données et outils

### Bases de données

[dataset_pratique.csv](../donnees.llms.md#dataset-card-dataset-pratique) [policies.csv](../donnees.llms.md#dataset-card-policies-module-04) [coverage.json](../donnees.llms.md#dataset-card-coverage-module-04) [quotes_2024.xlsx](../donnees.llms.md#dataset-card-quotes-module-04)

### Packages R

[readr](../packages.llms.md#readr) [readxl](../packages.llms.md#readxl) [dplyr](../packages.llms.md#dplyr) [tidyr](../packages.llms.md#tidyr) [jsonlite](../packages.llms.md#jsonlite) [janitor](../packages.llms.md#janitor) [stringr](../packages.llms.md#stringr) [forcats](../packages.llms.md#forcats) [messy](../packages.llms.md#messy)

## Révision et prolongement

### Finir le module avec l’IA du cours

Avant de passer au module suivant, utilisez l’IA du cours comme partenaire de révision: demandez-lui de questionner votre raisonnement, de repérer les lignes de code fragiles et de proposer une amélioration réaliste du défi.

- Expliquez le produit fini en trois phrases.
- Collez un extrait de code ou de sortie et demandez un diagnostic.
- Demandez une variante plus ambitieuse, puis choisissez ce qui reste raisonnable.
