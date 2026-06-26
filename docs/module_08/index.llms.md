# Automatisation et exploration du web

Module 08

Automatiser des tâches répétitives et extraire de l’information de pages web.

Fil principalBoucles, fonctions et web scraping

DonnéesPages web et textes extraits

DéfiExtraction ou automatisation reproductible

## Produit fini du module

Produit final

### Une fonction de scraping reproductible

Le chapitre conduit à une extraction web rangée dans une fonction, avec des sorties contrôlées et une logique que l’on peut refaire.

**scraping**

sélecteurs

fonction

table finale

sélecteurs fonction table finale

## Objectifs du module

À la fin de ce module, vous devriez être capable de:

- Extraire des données textuelles d’une page web en utilisant `rvest`.
- Automatiser des tâches répétitives à l’aide de boucles et de fonctions en R.
- Identifier les aspects éthiques liés à la collecte automatisée de données en ligne.

## Plan d’apprentissage

Les cartes reprennent les quatre blocs du plan: lectures, aventure, défi, exercices. Ouvrez les cartes pour voir l’action attendue et le lien utile.

1 Lectures à faire Préparer HTML, sélecteurs CSS, fonctions et automatisation. Dans la carte Ouvrir la carteRéduire

### Lectures

Pour vous préparer, consultez les ressources suivantes :

- [R for Data Science — Web scraping](https://r4ds.hadley.nz/webscraping.html)
- [robots.txt documentation (MDN)](https://developer.mozilla.org/en-US/docs/Glossary/Robots.txt)

2 Aventure Extraire une page web et transformer le résultat en table. [Aventure](aventure.llms.md) Ouvrir la carteRéduire

Objectif Passer de la lecture à la pratique guidée.

Ressource [Page Aventure](aventure.llms.md)

Action Suivre les consignes, exécuter le code et garder les sorties importantes.

Résultat Un premier objet de travail que vous pouvez expliquer.

Arrêtez-vous après chaque résultat important et formulez ce qu’il montre.

3 Défi Construire une fonction de scraping claire et réutilisable. Dans la carte Ouvrir la carteRéduire

### Défi — Fonction de scraping

Vous devrez concevoir une fonction `scrape_page(url)` qui :

- prend en entrée une URL d’une page de recherche de Données Québec ;
- retourne un `data.frame` avec les colonnes `titre`, `producteur`, `categorie`.

Vous remettrez cette fonction dans un fichier `IDUL.R` dans votre dépôt GitHub. Elle sera testée automatiquement sur plusieurs pages.

4 Exercices Reprendre sélecteurs, boucles et nettoyage de texte web. [Exercices](exercices.llms.md) Ouvrir la carteRéduire

Ressource [Page Exercices](exercices.llms.md)

Pourquoi Les exercices sont gardés dans une page autonome parce qu'ils prennent plus de place.

Refaites au moins un passage sans regarder la solution immédiatement.

## Données et outils

### Bases de données

[Pages web analysées avec rvest](../donnees.llms.md#dataset-card-web-pages-module-08)

### Packages R

[tidyverse](../packages.llms.md#tidyverse) [rvest](../packages.llms.md#rvest) [purrr](../packages.llms.md#purrr)

## Révision et prolongement

### Finir le module avec l’IA du cours

Avant de passer au module suivant, utilisez l’IA du cours comme partenaire de révision: demandez-lui de questionner votre raisonnement, de repérer les lignes de code fragiles et de proposer une amélioration réaliste du défi.

- Expliquez le produit fini en trois phrases.
- Collez un extrait de code ou de sortie et demandez un diagnostic.
- Demandez une variante plus ambitieuse, puis choisissez ce qui reste raisonnable.
