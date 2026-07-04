# Module 8 - Plan d’apprentissage

STT-1100 Introduction à la science des données

# Objectifs du module

À la fin de ce module, vous devriez être capable de :

- extraire des données textuelles d’une page web avec `rvest`;
- transformer des éléments HTML en tableau structuré;
- automatiser des tâches répétitives avec des fonctions et des boucles en R;
- distinguer un test technique comme `robots.txt` d’une autorisation complète de collecte;
- expliquer les limites techniques et éthiques d’une collecte automatisée.

# Lectures

Pour vous préparer, consultez les ressources suivantes :

- [R for Data Science - Web scraping](https://r4ds.hadley.nz/webscraping.html)
- [R for Data Science - Functions](https://r4ds.hadley.nz/functions.html)
- [R for Data Science - Iteration](https://r4ds.hadley.nz/iteration.html)
- [Documentation officielle de rvest](https://rvest.tidyverse.org/)
- [robots.txt documentation, MDN](https://developer.mozilla.org/en-US/docs/Glossary/Robots.txt)
- [Google Search Central - Introduction to robots.txt](https://developers.google.com/search/docs/crawling-indexing/robots/intro)
- [Documentation du package robotstxt](https://docs.ropensci.org/robotstxt/)

Après les lectures, faites le [mini-test formatif](../module_08/mini_test.llms.md). Il n’est pas noté; il sert seulement à vérifier les notions de base avant l’aventure.

# Aventure

Vous incarnez une personne consultante en science des données engagée pour développer une fonction d’extraction automatisée de métadonnées à partir du portail Données Québec.

Lien vers l’aventure : [Aventure 8 - Données ouvertes du Québec](../module_08/aventure.llms.md)

# Défi - Fonction de scraping

Le défi consiste à produire un fichier `IDUL.R` contenant une fonction `scrape_page(url)`.

La fonction doit :

- prendre en entrée l’URL d’une page de recherche de Données Québec;
- retourner un `data.frame` avec exactement les colonnes `titre`, `producteur`, `categorie`;
- gérer les libellés `Catégorie` et `Catégories`;
- pouvoir être chargée et testée dans une nouvelle session R.

Consigne complète : [Défi 8 - Fonction de scraping](../module_08/defi.llms.md)

Dépôt de départ : `STT-1100/aventure-8`

# Exercices de consolidation

Ces exercices sont indépendants de l’aventure et du défi. Ils utilisent des pages HTML fictives locales pour pratiquer les sélecteurs CSS, les fonctions d’extraction, l’automatisation sur plusieurs pages, la gestion des champs manquants et les limites éthiques d’une collecte.

Lien vers les exercices : [Exercices de consolidation](../module_08/exercices.llms.md)
