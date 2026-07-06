# Module 3 - Plan d’apprentissage

STT-1100 Introduction à la science des données

# Objectifs du module

À la fin de ce module, vous devriez être capable de:

- manipuler des chaînes de caractères avec `stringr`;
- reconnaître des motifs simples avec des expressions régulières;
- nettoyer des montants, des codes postaux et des catégories de manière reproductible;
- produire des tableaux de fréquences, des proportions et des tableaux croisés;
- recoder, regrouper et ordonner des catégories avec `dplyr` et `forcats`;
- produire et interpréter des diagrammes à bandes, des bandes empilées et des bandes empilées standardisées avec `ggplot2`;
- rédiger un court article Quarto appuyé par des chiffres narratifs et des graphiques.

# Lectures à faire

Ces lectures donnent les repères nécessaires avant de commencer l’aventure.

- [R for Data Science - Strings](https://r4ds.hadley.nz/strings.html) Pour manipuler des chaînes de caractères avec `stringr`: détecter un mot, extraire un motif, uniformiser la casse et nettoyer des espaces.

- [R for Data Science - Factors](https://r4ds.hadley.nz/factors.html) Pour comprendre pourquoi l’ordre des modalités compte dans une analyse et dans un graphique.

- [Introduction to Modern Statistics - Explore categorical data](https://openintrostat.github.io/ims/explore-categorical) Pour revoir les fréquences, les proportions, les tableaux croisés et les graphiques adaptés aux variables catégoriques.

- [Documentation de `forcats`](https://forcats.tidyverse.org/) Pour regrouper des catégories rares, réordonner des modalités et rendre les graphiques plus lisibles.

Après les lectures, faites le [mini-test formatif](../module_03/mini_test.llms.md). Il n’est pas évalué, mais il vérifie les idées nécessaires pour l’aventure et le défi.

# Aventure

[Aventure 3](../module_03/aventure.llms.md)

Vous jouez le rôle d’un journaliste de données pour Le Courrier Gourmand. L’aventure vous guide dans le nettoyage du jeu `listecondamnation`, l’extraction de codes postaux, l’identification de catégories d’infractions et la construction de premiers résultats utiles pour un article.

# Défi

[Défi du module 3](../module_03/defi.llms.md)

Votre mission consiste à rédiger un article Quarto reproductible sur les infractions alimentaires. Le défi reprend le même contexte que l’aventure, mais vous laisse plus d’autonomie dans le choix des faits saillants et des graphiques.

Vous devrez remettre:

- `template_article.qmd` complété;
- `template_article.html` rendu;
- un dépôt GitHub avec plusieurs commits clairs.

L’article doit contenir au moins deux chiffres narratifs et deux visuels, dont un graphique de catégories. La carte des amendes est optionnelle.

# Exercices de consolidation

[Exercices du module 3](../module_03/exercices.llms.md)

Les exercices sont indépendants de l’aventure et du défi. Ils sont organisés en quatre blocs:

1.  reconnaître, compter et comparer des variables catégoriques;
2.  nettoyer des chaînes de caractères et extraire des motifs;
3.  nettoyer et résumer un petit jeu fictif de demandes de services;
4.  produire des visualisations catégoriques lisibles.

La série se termine par deux études de cas avec des données fictives différentes de celles de l’aventure: des requêtes 311 et des plaintes de transport collectif.
