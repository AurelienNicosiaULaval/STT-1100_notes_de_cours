# Les catégories sous toutes leurs formes

Module 03

Comprendre, recoder et visualiser des variables catégorielles.

Fil principalCatégories, chaînes et graphiques

DonnéesInfractions alimentaires au Québec

DéfiArticle journalistique reproductible

## Produit fini du module

Produit final

### Un article de données sur les infractions alimentaires

Le module produit un jeu de données nettoyé, des catégories vérifiées, des graphiques lisibles et un court article Quarto appuyé par des chiffres.

**article.html**

données nettoyées

catégories vérifiées

article rédigé

données nettoyées catégories vérifiées article rédigé

## Objectifs du module

À la fin de ce module, vous devriez être capable de

- Manipuler des chaînes de caractères avec `stringr`.
- Reconnaitre des motifs avec des expressions régulières.
- Utiliser les expressions régulières pour sélectionner, manipuler et modifier des chaînes de caractères.
- Calculer et interpréter des statistiques descriptives pour des variables catégoriques (tableaux de fréquences, proportions, incluant par groupes, tableau croisé).
- Produire et interpréter des visualisations de variables catégoriques avec `ggplot2` (diagramme à bandes, en bâtons empilés, en bâtons empilés standardisé, en bâtons empilés groupés, en mosaïque, en secteurs et en gaufre).

## Plan d’apprentissage

Les cartes reprennent les quatre blocs du plan: lectures, aventure, défi, exercices. Ouvrez les cartes pour voir l’action attendue et le lien utile.

1 Lectures à faire Revoir catégories, facteurs et représentations adaptées. Dans la carte Ouvrir la carteRéduire

### Lectures initiales

#### Lectures à faire avant l’aventure

Dans ce module, nous allons explorer les variables **catégoriques** et la **visualisation adaptée** à ce type de données. Deux lectures sont proposées pour vous préparer :

- [**R for Data Science – Strings**](https://r4ds.hadley.nz/strings.html)
  Ce chapitre vous introduit à la manipulation des chaînes de caractères avec le package `stringr`.
  \> **Note** : Bien que ce chapitre soit plus largement utilisé au module 4, certaines fonctions utiles comme `str_detect()` ou `str_to_lower()` peuvent déjà vous aider pour nettoyer ou préparer des variables catégoriques.

- [**Introduction to Modern Statistics – Chapitre 6 : Explore categorical data**](https://openintro-ims.netlify.app/explore-categorical)
  Ce chapitre de **IMS** présente les concepts statistiques associés aux données catégoriques. On y parle notamment de tableaux de fréquence, de proportions et des façons de représenter visuellement ce type de variables.

Prenez le temps de parcourir ces deux ressources. Elles vous seront utiles pour comprendre comment traiter les **données qualitatives**, tant du point de vue **statistique** que **pratique**.

2 Aventure Recoder des modalités et comparer des groupes sans les déformer. [Aventure](aventure.llms.md) Ouvrir la carteRéduire

Objectif Passer de la lecture à la pratique guidée.

Ressource [Page Aventure](aventure.llms.md)

Action Suivre les consignes, exécuter le code et garder les sorties importantes.

Résultat Un premier objet de travail que vous pouvez expliquer.

Arrêtez-vous après chaque résultat important et formulez ce qu’il montre.

3 Défi Rédiger un article Quarto à partir des infractions alimentaires. [Défi](defi.llms.md) Ouvrir la carteRéduire

### Défi

Vous endosserez le rôle de journaliste de données pour *Le Courrier Gourmand*. Votre mission est de nettoyer `listecondamnation`, d’en extraire des faits marquants et de rédiger un article Quarto reproductible.

[Consulter le défi du module 3](defi.llms.md)

- Livrables : `template_article.qmd` complété et HTML rendu.

- Analyse : au moins deux chiffres narratifs et deux visuels, dont un graphique de catégories.

- GitHub : plusieurs commits clairs et un dépôt complet.

4 Exercices Stabiliser tableaux de fréquences, facteurs et regroupements. [Exercices](exercices.llms.md) Ouvrir la carteRéduire

Ressource [Page Exercices](exercices.llms.md)

Pourquoi Les exercices sont gardés dans une page autonome parce qu'ils prennent plus de place.

Refaites au moins un passage sans regarder la solution immédiatement.

## Données et outils

### Bases de données

[UlavalSSD::listecondamnation](../donnees.llms.md#dataset-card-listecondamnation) [palmerpenguins::penguins_raw](../donnees.llms.md#dataset-card-penguins-raw) [titanic::titanic_train](../donnees.llms.md#dataset-card-titanic-train)

### Packages R

[tidyverse](../packages.llms.md#tidyverse) [stringr](../packages.llms.md#stringr) [palmerpenguins](../packages.llms.md#palmerpenguins) [titanic](../packages.llms.md#titanic) [ulavalssd](../packages.llms.md#ulavalssd) [ggplot2](../packages.llms.md#ggplot2) [tidygeocoder](../packages.llms.md#tidygeocoder) [viridis](../packages.llms.md#viridis) [scales](../packages.llms.md#scales)

## Révision et prolongement

### Finir le module avec l’IA du cours

Avant de passer au module suivant, utilisez l’IA du cours comme partenaire de révision: demandez-lui de questionner votre raisonnement, de repérer les lignes de code fragiles et de proposer une amélioration réaliste du défi.

- Expliquez le produit fini en trois phrases.
- Collez un extrait de code ou de sortie et demandez un diagnostic.
- Demandez une variante plus ambitieuse, puis choisissez ce qui reste raisonnable.
