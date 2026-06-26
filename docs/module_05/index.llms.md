# Explorer et comprendre les relations entre les variables

Module 05

Explorer les liens entre variables et interpréter des associations sans surinterpréter.

Fil principalRelations, dates et corrélations

DonnéesPolices, couvertures et vols

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

3 Défi Rédiger une analyse EDA prudente sur les retards. Dans la carte Ouvrir la carteRéduire

### Défi — Analyser les retards pour soutenir les décisions

Dans ce défi, vous devez remettre un **rapport professionnel** destiné à votre superviseure, **Dr Sofia Martínez**, afin de répondre aux trois grandes questions stratégiques posées dans l’aventure. Votre rôle est de fournir une analyse claire, appuyée sur des visualisations pertinentes et des interprétations rigoureuses.

#### Ce que vous devez faire

À partir des données fusionnées fournies (`flights_merged_2023.rds`), vous devez :

1.  **Explorer les variables temporelles** (`date`, `jour_semaine`, `moment_journee`, etc.) et les préparer si besoin.
2.  **Répondre aux trois grandes questions de Sofia** :
    - Quels sont les créneaux horaires à éviter pour réduire les retards ?
    - Dans quelle mesure la météo est-elle responsable des retards ?
    - Les avions plus âgés sont-ils plus souvent en retard ou annulés ?
3.  Pour chaque question :
    - effectuez une **analyse exploratoire** pertinente ;
    - produisez **au moins une visualisation claire** ;
    - rédigez une **interprétation concise** de vos résultats.

#### Ce que le rapport doit contenir

Votre fichier **`rapport.qmd`** doit inclure :

- Une courte **introduction** qui rappelle le contexte (travail à JFK, rôle avec Sofia, etc.).
- Une section pour chaque **question** du brief.
- Vos **analyses** (code R reproductible, tableaux ou graphes, commentaires).
- Vos **interprétations** pour faire ressortir les constats clés.
- Une **courte conclusion** qui résume les réponses apportées aux gestionnaires.

#### Mise en ligne et rendu

- Publiez le rapport sur votre dépôt GitHub dans l’organisation du cours.
- Assurez-vous que le fichier `.html` est bien généré et lisible.
- Faites une dernière relecture pour vérifier la **clarté, la structure et la présentation**.

> Astuce : Mettez-vous dans la peau d’un·e analyste professionnel·le — ce rapport pourrait être présenté au comité exécutif de l’aéroport !

------------------------------------------------------------------------

#### Grille d’évaluation (10 points)

| Critère | Description | Points |
|----|----|----|
| **Exploration temporelle (`lubridate`)** | Création de variables `date`, `jour_semaine`, `moment_journee` ; bonne utilisation de `lubridate`. | 2 |
| **Analyse des créneaux horaires** | Pertinence de l’analyse, qualité de la visualisation et interprétation. | 2 |
| **Analyse de la météo** | Choix judicieux des variables météo, test de relation avec les retards, interprétation correcte. | 2 |
| **Analyse des avions anciens** | Construction de `age_avion`, analyse correcte des retards ou annulations, interprétation pertinente. | 2 |
| **Structure et présentation du rapport** | Rapport clair, bien structuré, visuellement lisible ; visualisations bien annotées ; code commenté. | 2 |

> **Bonus** possible (max +1) pour une analyse complémentaire originale (ex. : analyse par compagnie ou distance).

4 Exercices Consolider graphiques, corrélations et interprétations. [Exercices](exercices.llms.md) Ouvrir la carteRéduire

Ressource [Page Exercices](exercices.llms.md)

Pourquoi Les exercices sont gardés dans une page autonome parce qu'ils prennent plus de place.

Refaites au moins un passage sans regarder la solution immédiatement.

## Données et outils

### Bases de données

[policies.csv](../donnees.llms.md#dataset-card-policies-module-05) [coverage.json](../donnees.llms.md#dataset-card-coverage-module-05) [quotes_2024.xlsx](../donnees.llms.md#dataset-card-quotes-module-05) [flights_merged_2023.rds](../donnees.llms.md#dataset-card-flights-merged-2023)

### Packages R

[lubridate](../packages.llms.md#lubridate) [readr](../packages.llms.md#readr) [readxl](../packages.llms.md#readxl) [dplyr](../packages.llms.md#dplyr) [tidyr](../packages.llms.md#tidyr) [jsonlite](../packages.llms.md#jsonlite) [janitor](../packages.llms.md#janitor) [ggcorrplot](../packages.llms.md#ggcorrplot)

## Révision et prolongement

### Finir le module avec l’IA du cours

Avant de passer au module suivant, utilisez l’IA du cours comme partenaire de révision: demandez-lui de questionner votre raisonnement, de repérer les lignes de code fragiles et de proposer une amélioration réaliste du défi.

- Expliquez le produit fini en trois phrases.
- Collez un extrait de code ou de sortie et demandez un diagnostic.
- Demandez une variante plus ambitieuse, puis choisissez ce qui reste raisonnable.
