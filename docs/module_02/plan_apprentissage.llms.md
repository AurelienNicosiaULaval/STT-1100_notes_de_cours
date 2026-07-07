# Module 2 - Plan d’apprentissage

STT-1100 Introduction à la science des données

# Objectifs du module

À la fin de ce module, vous devriez être capable de

- utiliser GitHub via RStudio pour cloner un dépôt, faire des commits et pousser vos changements;
- lire un fichier `xlsx` dans RStudio et documenter l’importation dans un rapport Quarto;
- gérer et transformer des données numériques avec `dplyr`, notamment `glimpse()`, `select()`, `mutate()`, `filter()`, `group_by()` et `summarise()`;
- calculer et interpréter des statistiques descriptives pour des variables numériques, incluant par sous-groupes;
- visualiser des variables numériques avec `ggplot2`, notamment avec des histogrammes, des boîtes à moustaches, des nuages de points et des facettes;
- améliorer la lisibilité d’un graphique avec des titres, des axes, des unités, des légendes et un thème cohérent;
- produire un court rapport d’analyse reproductible dans un dépôt GitHub.

# Lectures initiales

À l’automne 2026, le module 2 est préparé pendant la semaine du 7 septembre, puis travaillé en classe le 14 septembre. Le travail préparatoire installe le flux de travail GitHub, l’importation Excel et les premiers verbes `dplyr`; la séance de classe sert à mettre ces gestes en pratique et à consolider l’analyse exploratoire, les statistiques descriptives et la visualisation de variables numériques.

## Travail préparatoire - Projet, importation et premiers graphiques

- [Aide-mémoire RStudio et GitHub](../autre_materiel/aide-memoire-rstudio-github.llms.md) Cloner un dépôt, ouvrir un projet RStudio, comprendre commits et push, et reconnaître les problèmes d’authentification les plus fréquents.

- [R for Data Science - Data visualization](https://r4ds.hadley.nz/data-visualize.html) Premiers repères pour construire des graphiques avec `ggplot2`.

- [R for Data Science - Data transformation](https://r4ds.hadley.nz/data-transform.html) Introduction aux verbes `dplyr` qui reviennent dans l’aventure et dans le défi.

- [readxl - Documentation officielle](https://readxl.tidyverse.org/) Référence courte pour importer des fichiers Excel avec `read_excel()`.

## Approfondissement - Exploration et comparaison de distributions

- [R for Data Science - Exploratory Data Analysis](https://r4ds.hadley.nz/EDA.html) Explorer les distributions, repérer des valeurs extrêmes et formuler des hypothèses à partir des graphiques.

- [R for Data Science - Spreadsheets](https://r4ds.hadley.nz/spreadsheets.html) Reconnaître les structures de tableaux qui facilitent l’analyse et éviter les pièges fréquents des feuilles de calcul.

- [Introduction to Modern Statistics - Exploring numerical data](https://openintrostat.github.io/ims/explore-numerical) Résumer et interpréter des variables numériques avec les outils de statistique descriptive.

- [Tidyverse Style Guide - ggplot2](https://style.tidyverse.org/ggplot2.html) Quelques repères pour écrire du code graphique lisible.

## Aide-mémoires Posit

- [Data import with the tidyverse :: Cheatsheet](https://rstudio.github.io/cheatsheets/data-import.pdf) Importation avec `readr` et `readxl`, utile pour les fichiers CSV et Excel.

- [Data transformation with dplyr :: Cheatsheet](https://rstudio.github.io/cheatsheets/data-transformation.pdf) Verbes de transformation qui reviennent dans l’aventure et les exercices.

- [Data visualization with ggplot2 :: Cheat Sheet](https://rstudio.github.io/cheatsheets/data-visualization.pdf) Grammaire des graphiques, géométries, facettes, échelles et thèmes.

## Lecture optionnelle

- [Broman et Woo (2018) - Data Organization in Spreadsheets](https://www.tandfonline.com/doi/full/10.1080/00031305.2017.1375989) Une référence utile pour comprendre pourquoi on conserve les données brutes intactes et pourquoi les corrections doivent être documentées dans le code.

## Mini-test de lecture

Après les lectures essentielles, complétez le [mini-test formatif du module 2](../module_02/mini_test.llms.md). Il n’est pas noté, mais il vérifie les points qui reviennent dans l’aventure et dans le défi.

# Aventure

Ce module vous place dans le rôle d’un ou d’une scientifique de données qui aide la Dre Adélie Fortier à explorer des mesures physiques de manchots. Vous devez importer un fichier Excel, documenter votre démarche dans un journal de bord, produire des graphiques et garder une trace du travail dans GitHub.

[Aventure du module 2](../module_02/aventure.llms.md)

# Défi

Le défi du module 2 se fait dans le même dépôt GitHub que l’aventure. Vous devez remettre:

- `journal de bord.qmd`;
- `journal de bord.html`;
- `rapport_analyse.qmd`;
- `rapport_analyse.html`.

Le rapport d’analyse doit répondre à la demande de la Dre Adélie Fortier: comprendre comment les caractéristiques physiques des manchots varient selon les espèces.

[Défi du module 2](../module_02/defi.llms.md)

# Exercices de consolidation

La série d’exercices est indépendante de l’aventure et du défi. Elle comprend des exercices sur GitHub, l’importation Excel, `dplyr`, `ggplot2`, les statistiques descriptives, le style de code et deux études de cas finales avec de petits fichiers fictifs.

[Exercices de consolidation du module 2](../module_02/exercices.llms.md)
