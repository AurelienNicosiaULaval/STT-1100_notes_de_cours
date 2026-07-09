# Automatisation et exploration du web

Module 08

Automatiser des tâches répétitives et extraire de l’information de pages web.

Fil principalBoucles, fonctions et web scraping

DonnéesPages web et textes extraits

DéfiFonction `scrape_page()` testable

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

## Préparer le module

### Prérequis

Vous devez pouvoir lire un tableau, manipuler une chaîne de caractères et suivre une fonction R simple. Les pages HTML fictives du module permettent de pratiquer sans dépendre d’un service externe.

### Parcours minimal

Commencez sur une page locale, extrayez un tableau dont les colonnes respectent le contrat demandé, puis lancez le test fourni. Une page réelle n’est pas nécessaire pour démontrer le geste.

### Collecte responsable

Le défi porte sur une page à la fois. `robots.txt` est un indice technique, pas une autorisation complète: ne contournez jamais une protection et ne lancez pas de collecte massive.

### Si le site change

Utilisez la page locale et le test du dépôt comme référence. Documentez la différence observée plutôt que de bricoler une extraction fragile.

## Plan d’apprentissage

Les cartes reprennent les quatre blocs du plan: lectures, aventure, défi, exercices. L’aventure et le défi forment le fil narratif du module. Les exercices sont autonomes et utilisent des pages HTML locales pour consolider les mêmes gestes sans dépendre d’un site externe.

1 Lectures à faire Préparer HTML, sélecteurs CSS, fonctions et automatisation. Dans la carte Ouvrir la carteRéduire

### Lectures

Pour vous préparer, consultez les ressources suivantes :

- [R for Data Science - Web scraping](https://r4ds.hadley.nz/webscraping.html)
- [R for Data Science - Functions](https://r4ds.hadley.nz/functions.html)
- [R for Data Science - Iteration](https://r4ds.hadley.nz/iteration.html)
- [Documentation officielle de rvest](https://rvest.tidyverse.org/)
- [robots.txt documentation (MDN)](https://developer.mozilla.org/en-US/docs/Glossary/Robots.txt)
- [Google Search Central - Introduction to robots.txt](https://developers.google.com/search/docs/crawling-indexing/robots/intro)

#### Aide-mémoires Posit

- [Apply functions with purrr :: Cheatsheet](https://rstudio.github.io/cheatsheets/purrr.pdf)
  Automatisation avec `map()` et fonctions apparentées.
- [String manipulation with stringr :: Cheatsheet](https://rstudio.github.io/cheatsheets/strings.pdf)
  Nettoyage et extraction de texte après la collecte.

Vérification Après les lectures, faites le [mini-test formatif](mini_test.llms.md).

2 Aventure Extraire une page web et transformer le résultat en table. [Aventure](aventure.llms.md) Ouvrir la carteRéduire

Objectif Passer de la lecture à la pratique guidée.

Ressource [Page Aventure](aventure.llms.md)

Action Suivre les consignes, exécuter le code et garder les sorties importantes.

Résultat Un premier objet de travail que vous pouvez expliquer.

Arrêtez-vous après chaque résultat important et formulez ce qu’il montre.

3 Défi Construire une fonction de scraping claire et réutilisable. [Défi](defi.llms.md) Ouvrir la carteRéduire

### Défi - Fonction de scraping

Vous devrez concevoir une fonction `scrape_page(url)` qui :

- prend en entrée une URL d’une page de recherche de Données Québec ;
- retourne un `data.frame` avec les colonnes `titre`, `producteur`, `categorie`.

Vous remettrez cette fonction dans un fichier `IDUL.R` dans le dépôt template `STT-1100/aventure-8`. La consigne complète est disponible dans la page [Défi 8](defi.llms.md).

4 Exercices Pratiquer sélecteurs, fonctions, boucles et limites de collecte. [Exercices](exercices.llms.md) Ouvrir la carteRéduire

Ressource [Page Exercices](exercices.llms.md)

Pourquoi Les exercices utilisent des pages HTML fictives et locales pour rester reproductibles et indépendants du défi.

Avant d'ouvrir une solution, nommez le sélecteur CSS ou le contrat de sortie que vous voulez tester.

## Données et outils

### Bases de données

[Pages web analysées avec rvest](../donnees.llms.md#dataset-card-web-pages-module-08) [catalogue_donnees_fictif.html](../donnees.llms.md#dataset-card-module08-catalogue) [catalogue_irregulier_fictif.html](../donnees.llms.md#dataset-card-module08-irregular) [evenements_publics_fictif.html](../donnees.llms.md#dataset-card-module08-evenements)

### Packages R

[tidyverse](../packages.llms.md#tidyverse) [rvest](../packages.llms.md#rvest) [purrr](../packages.llms.md#purrr) [dplyr](../packages.llms.md#dplyr) [stringr](../packages.llms.md#stringr) [robotstxt](../packages.llms.md#robotstxt)

## Révision et prolongement

### Finir le module avec l’IA du cours

Ouvrez [la page IA](../ia.llms.md) ou [GPT STT-1100](https://chatgpt.com/g/g-682d165f32e881918633affa3fe9dfd6-gpt-stt-1100), puis demandez une rétroaction ciblée:

*Voici mon travail pour ce module. Questionne mon raisonnement, repère une ligne de code fragile, vérifie si mon interprétation répond à la consigne, puis propose une seule amélioration réaliste que je peux faire moi-même.*

- Expliquez le produit fini en trois phrases.
- Collez un extrait de code ou de sortie et demandez un diagnostic.
- Demandez une variante plus ambitieuse, puis choisissez ce qui reste raisonnable.
