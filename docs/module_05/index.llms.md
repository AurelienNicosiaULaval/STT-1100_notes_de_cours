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

Les cartes reprennent les quatre blocs du plan: lectures, aventure, défi, exercices. L’aventure et le défi forment le fil narratif du module. Les exercices sont indépendants et servent à consolider les mêmes gestes sur d’autres données.

1 Lectures à faire Préparer dates, corrélations et relations entre variables. Dans la carte Ouvrir la carteRéduire

### Lectures

Dans ce module, nous allons explorer les concepts de base de l’analyse exploratoire des données (EDA) et de la manipulation des dates et heures. Voici quelques lectures initiales pour vous préparer :

- [**R for Data Science – EDA**](https://r4ds.hadley.nz/EDA.html)
  Ce chapitre vous introduit à l’analyse exploratoire des données (EDA) avec le package `ggplot2`.

- [**R for Data Science – Dates and Times**](https://r4ds.hadley.nz/datetimes.html)
  Ce chapitre vous introduit à la manipulation des dates et heures avec le package `lubridate`.

Vous pouvez aussi aller réviser les chapitres suivants:

- [**R for Data Science – Data visualization**](https://r4ds.hadley.nz/data-visualize.html)
  Ce chapitre vous aide à choisir et annoter des graphiques adaptés aux questions exploratoires.

- [**R for Data Science – Missing values**](https://r4ds.hadley.nz/missing-values.html)
  Ce chapitre rappelle pourquoi les valeurs manquantes doivent être repérées avant d'interpréter un résumé.

Dans le libre **IMS**:

- [**Introduction to modern statistics – Exploring numerical data**](https://openintro-ims.netlify.app/explore-numerical)
  Ce chapitre renforce les résumés numériques, les graphiques et les comparaisons descriptives.
- [**Introduction to modern statistics – Applications: Explore**](https://openintro-ims.netlify.app/explore-applications)
  Ce chapitre vous introduit aux bonnes pratiques de modélisation exploratoire des données.

Après les lectures, faites le [mini-test formatif](mini_test.llms.md). Il n'est pas noté; il sert à vérifier les bases avant l'aventure.

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

Portée Ces exercices ne sont pas la suite du défi. Ils utilisent des données fictives d'ateliers, de bibliothèque et de services campus pour pratiquer les mêmes gestes dans d'autres contextes.

Refaites au moins un passage sans regarder la solution immédiatement.

## Données et outils

### Bases de données

[flights_merged_2023.rds](../donnees.llms.md#dataset-card-flights-merged-2023)

### Packages R

[tidyverse](../packages.llms.md#tidyverse) [lubridate](../packages.llms.md#lubridate) [dplyr](../packages.llms.md#dplyr) [ggplot2](../packages.llms.md#ggplot2)

## Révision et prolongement

### Finir le module avec l’IA du cours

Ouvrez [la page IA](../ia.llms.md) ou [GPT STT-1100](https://chatgpt.com/g/g-682d165f32e881918633affa3fe9dfd6-gpt-stt-1100), puis demandez une rétroaction ciblée:

*Voici mon travail pour ce module. Questionne mon raisonnement, repère une ligne de code fragile, vérifie si mon interprétation répond à la consigne, puis propose une seule amélioration réaliste que je peux faire moi-même.*

- Expliquez le produit fini en trois phrases.
- Collez un extrait de code ou de sortie et demandez un diagnostic.
- Demandez une variante plus ambitieuse, puis choisissez ce qui reste raisonnable.
