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

Vous devez pouvoir lire un tableau, manipuler une chaîne de caractères et suivre une fonction R simple. Les instantanés HTML de données réelles du Québec permettent de pratiquer sans dépendre de la disponibilité d’un service externe.

### Parcours minimal

Commencez sur une page locale, extrayez un tableau dont les colonnes respectent le contrat demandé, puis lancez le test fourni. Une page réelle n’est pas nécessaire pour démontrer le geste.

### Collecte responsable

Le défi porte sur une page à la fois. `robots.txt` est un indice technique, pas une autorisation complète: ne contournez jamais une protection et ne lancez pas de collecte massive.

### Si le site change

Utilisez la page locale et le test du dépôt comme référence. Documentez la différence observée plutôt que de bricoler une extraction fragile.

## Plan d’apprentissage

Les cartes reprennent les cinq étapes du plan: lectures, aventure, défi, exercices et rétroaction avec ou sans IA. L’aventure et le défi forment le fil narratif du module. Les exercices sont autonomes et utilisent des pages HTML locales pour consolider les mêmes gestes sans dépendre d’un site externe. La rétroaction revient sur un élément du travail déjà réalisé; elle ne demande aucune remise supplémentaire.

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

Pourquoi Les exercices utilisent des instantanés HTML locaux provenant de Données Québec et du SIT Québec afin de rester reproductibles et indépendants du défi.

Avant d'ouvrir une solution, nommez le sélecteur CSS ou le contrat de sortie que vous voulez tester.

5 Rétroaction Faire relire un extrait du travail, puis décider quoi améliorer soi-même. [Démarche et exemples](../ia.llms.md#feedback-cycle) Ouvrir la carteRéduire

### Rétroaction: une collecte web qui résiste aux erreurs

Après une première tentative, choisissez un point à améliorer sur les fonctions, les sélecteurs et la collecte web responsable. Utilisez la [démarche de rétroaction](../ia.llms.md#feedback-cycle) avec ou sans IA; cette routine n'ajoute pas de remise aux consignes.

Une demande adaptée au module 8

> Je travaille sur les fonctions, les sélecteurs et la collecte web responsable. Voici la consigne, les critères pertinents et ma fonction, un extrait HTML autorisé, la sortie attendue et la sortie obtenue. Relève un point réussi et au maximum deux améliorations, dont une hypothèse fragile sur la structure de la page ou un cas d'entrée non traité si les éléments fournis le montrent. Cite le passage concerné, distingue erreur observable et point à vérifier, puis propose un indice et un test. Ne réécris pas mon travail et attends ma correction.

- Vérifier: Testez la fonction sur la copie HTML fournie et un cas où l'élément manque. Contrôlez le nombre et le type des résultats; vérifiez les consignes de collecte avant toute requête supplémentaire.
- Revenir sur la correction: présentez le changement et le résultat du test, puis demandez ce qui reste à vérifier.
- Refaire sans aide: Expliquez le rôle d'un sélecteur, puis adaptez votre fonction à un autre élément de la copie HTML.

Sans IA, comparez votre tentative aux critères et aux exemples du cours, puis faites les mêmes vérifications. Gardez une trace courte dans la [fiche de suivi](../ia.llms.md#feedback-trace), si elle vous est utile.

Confidentialité Ne transmettez aucune donnée personnelle, confidentielle ou protégée.

## Données et outils

### Bases de données

[Télécharger le dossier de travail du module (.zip)](../downloads/donnees/stt1100-module-08-fr.zip)

[Pages web analysées avec rvest](../donnees.llms.md#dataset-card-web-pages-module-08) [Catalogue Données Québec](data/catalogue_donnees_quebec.llms.md) [Catalogue avec catégories absentes](data/catalogue_donnees_quebec_irregulier.llms.md) [Événements du SIT Québec](data/evenements_sit_quebec.llms.md)

### Packages R

[tidyverse](../packages.llms.md#tidyverse) [rvest](../packages.llms.md#rvest) [purrr](../packages.llms.md#purrr) [dplyr](../packages.llms.md#dplyr) [stringr](../packages.llms.md#stringr) [robotstxt](../packages.llms.md#robotstxt)
