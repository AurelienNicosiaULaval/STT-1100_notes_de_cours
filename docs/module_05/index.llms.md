# Explorer et comprendre les relations entre les variables

Module 05

Explorer les liens entre variables et interpréter des associations sans surinterpréter.

Fil principalRelations, dates et corrélations

DonnéesVols 2023 enrichis

DéfiExploration argumentée des relations

## Produit fini du module

Produit final

### Une analyse exploratoire des relations

Le produit fini met en relation des variables, compare des tendances et formule une interprétation prudente des associations observées.

**rapport EDA**

corrélation

dates

nuages de points

corrélation dates nuages de points

## Objectifs du module

À la fin de ce module, vous devriez être capable de:

- Gérer et analyser des variables temporelles à l’aide de `lubridate`.
- Étudier la relation entre deux variables à l’aide de graphiques et de statistiques descriptives, notamment à l’aide du coefficient de corrélation.
- Calculer et interpréter la corrélation entre deux variables numériques.
- Rédiger un rapport d’analyse exploratoire des données (EDA) mettant en évidence des tendances et des motifs dans les données.

## Plan d’apprentissage

Les cartes reprennent les quatre blocs du plan: lectures, aventure, défi, exercices. Ouvrez les cartes pour voir l’action attendue et le lien utile.

1 Lectures à faire Préparer dates, corrélations et relations entre variables. Dans la carte Ouvrir la carteRéduire

### Lectures

Dans ce module, nous allons explorer les concepts de base de l’analyse exploratoire des données (EDA) et de la manipulation des dates et heures. Voici quelques lectures initiales pour vous préparer :

- [**R for Data Science – EDA**](https://r4ds.hadley.nz/EDA.html)
  Ce chapitre vous introduit à l’analyse exploratoire des données (EDA) avec le package `ggplot2`.

- [**R for Data Science – Dates and Times**](https://r4ds.hadley.nz/datetimes.html)
  Ce chapitre vous introduit à la manipulation des dates et heures avec le package `lubridate`.

Vous pouvez aussi aller réviser le chapitre suivant:

- [**R for Data Science – Tidy Data**](https://r4ds.hadley.nz/data-tidy.html)
  Ce chapitre vous rappelle les principes de la structure des données « tidy » et comment les appliquer avec `tidyr`.

Dans le libre **IMS**:

- [**Introduction to modern statistics – Applications: Explore**](https://openintro-ims.netlify.app/explore-applications)
  Ce chapitre vous introduit aux bonnes pratiques de modélisation exploratoire des données.

2 Aventure Explorer retards, dates et associations dans un grand tableau. [Aventure](aventure.llms.md) Ouvrir la carteRéduire

Objectif Passer de la lecture à la pratique guidée.

Ressource [Page Aventure](aventure.llms.md)

Action Suivre les consignes, exécuter le code et garder les sorties importantes.

Résultat Un premier objet de travail que vous pouvez expliquer.

Arrêtez-vous après chaque résultat important et formulez ce qu’il montre.

3 Défi Rédiger une analyse EDA prudente sur les retards. [Défi](defi.llms.md) Ouvrir la carteRéduire

Objectif Remettre un rapport exploratoire sur les retards de vols.

Ressource [Page Défi](defi.llms.md)

À remettre `rapport.qmd`, `rapport.html` et les données fournies.

Distinguez clairement association et causalité dans vos conclusions.

4 Exercices Consolider graphiques, corrélations et interprétations. [Exercices](exercices.llms.md) Ouvrir la carteRéduire

Ressource [Page Exercices](exercices.llms.md)

Pourquoi Les exercices sont gardés dans une page autonome parce qu'ils prennent plus de place.

Refaites au moins un passage sans regarder la solution immédiatement.

## Données et outils

### Bases de données

[flights_merged_2023.rds](../donnees.llms.md#dataset-card-flights-merged-2023)

### Packages R

[tidyverse](../packages.llms.md#tidyverse) [lubridate](../packages.llms.md#lubridate) [dplyr](../packages.llms.md#dplyr) [ggplot2](../packages.llms.md#ggplot2)

## Révision et prolongement

### Finir le module avec l’IA du cours

Avant de passer au module suivant, utilisez l’IA du cours comme partenaire de révision: demandez-lui de questionner votre raisonnement, de repérer les lignes de code fragiles et de proposer une amélioration réaliste du défi.

- Expliquez le produit fini en trois phrases.
- Collez un extrait de code ou de sortie et demandez un diagnostic.
- Demandez une variante plus ambitieuse, puis choisissez ce qui reste raisonnable.
