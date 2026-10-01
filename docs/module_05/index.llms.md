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

## Préparer le module

### Reprendre après l’examen

Avant de commencer, rendez de nouveau un ancien document Quarto, relisez un graphique du module 3 ou 4 et vérifiez un petit résumé avec `dplyr`. Cette reprise est volontaire après la pause et l’examen.

### Parcours minimal

Construisez une variable de date, résumez une relation avec les tailles de groupe, produisez un graphique et écrivez une conclusion descriptive. Gardez toujours les termes « association » et « causalité » distincts.

### À ne pas surinterpréter

Une corrélation ou une tendance visible ne prouve pas qu’une variable cause l’autre. Les petits groupes et les valeurs manquantes doivent apparaître dans l’interprétation.

### Si vous bloquez

Reproduisez d’abord une analyse guidée sur les vols, puis adaptez une seule variable ou un seul graphique. Ajoutez les analyses secondaires seulement après un rendu clair.

## Plan d’apprentissage

Les cartes reprennent les cinq étapes du plan: lectures, aventure, défi, exercices et rétroaction avec ou sans IA. L’aventure et le défi forment le fil narratif du module. Les exercices sont indépendants et servent à consolider les mêmes gestes sur d’autres données. La rétroaction revient sur un élément du travail déjà réalisé; elle ne demande aucune remise supplémentaire.

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

- [**Introduction to modern statistics – Exploring numerical data**](https://openintrostat.github.io/ims/explore-numerical)
  Ce chapitre renforce les résumés numériques, les graphiques et les comparaisons descriptives.
- [**Introduction to modern statistics – Applications: Explore**](https://openintrostat.github.io/ims/explore-applications)
  Ce chapitre vous introduit aux bonnes pratiques de modélisation exploratoire des données.

#### Aide-mémoires Posit

- [Dates and times with lubridate :: Cheatsheet](https://rstudio.github.io/cheatsheets/lubridate.pdf)
  Créer, extraire et manipuler des dates et heures.
- [Data visualization with ggplot2 :: Cheat Sheet](https://rstudio.github.io/cheatsheets/data-visualization.pdf)
  Comparer distributions, tendances et associations.

Après les lectures, faites le [mini-test formatif](mini_test.llms.md). Il n'est pas noté; il sert à vérifier les bases avant l'aventure.

2 Aventure Explorer retards, dates et associations dans un grand tableau. [Aventure](aventure.llms.md) Ouvrir la carteRéduire

Objectif Passer de la lecture à la pratique guidée.

Ressource [Page Aventure](aventure.llms.md)

Action Suivre les consignes, exécuter le code et garder les sorties importantes.

Résultat Un premier objet de travail que vous pouvez expliquer.

Arrêtez-vous après chaque résultat important et formulez ce qu’il montre.

3 Défi Rédiger une analyse EDA prudente sur les retards. [Défi](defi.llms.md) Ouvrir la carteRéduire

### Défi - Rapport EDA

Vous préparez un court rapport exploratoire sur les retards de vols en reliant les graphiques, les associations observées et une conclusion prudente.

- But: formuler une question, produire des visualisations utiles et interpréter sans surconclure.
- Livrables: `rapport.qmd`, `rapport.html` et les données fournies.
- Point d'attention: distinguer clairement association et causalité.

La consigne complète est disponible dans la page [Défi 5](defi.llms.md).

4 Exercices Consolider graphiques, corrélations et interprétations. [Exercices](exercices.llms.md) Ouvrir la carteRéduire

Ressource [Page Exercices](exercices.llms.md)

Portée Ces exercices ne sont pas la suite du défi. Ils utilisent des comptages vélos de Laval, des mesures de qualité de l'air à Québec et des débits de circulation de Gatineau.

Refaites au moins un passage sans regarder la solution immédiatement.

5 Rétroaction Faire relire un extrait du travail, puis décider quoi améliorer soi-même. [Démarche et exemples](../ia.llms.md#feedback-cycle) Ouvrir la carteRéduire

### Rétroaction: une relation décrite avec prudence

Après une première tentative, choisissez un point à améliorer sur les variables temporelles, les associations et la corrélation. Utilisez la [démarche de rétroaction](../ia.llms.md#feedback-cycle) avec ou sans IA; cette routine n'ajoute pas de remise aux consignes.

Une demande adaptée au module 5

> Je travaille sur les variables temporelles, les associations et la corrélation. Voici la consigne, les critères pertinents et le code de préparation des dates, le graphique de relation et une conclusion descriptive. Relève un point réussi et au maximum deux améliorations, dont une confusion entre association et causalité ou un détail de date, de filtre ou d'unité à vérifier si les éléments fournis le montrent. Cite le passage concerné, distingue erreur observable et point à vérifier, puis propose un indice et un test. Ne réécris pas mon travail et attends ma correction.

- Vérifier: Contrôlez les dates et les observations utilisées. Comparez le graphique et le résumé numérique; vérifiez si une conclusion dépasse les données.
- Revenir sur la correction: présentez le changement et le résultat du test, puis demandez ce qui reste à vérifier.
- Refaire sans aide: Reformulez la conclusion sans causalité, puis expliquez une limite de l'association observée.

Sans IA, comparez votre tentative aux critères et aux exemples du cours, puis faites les mêmes vérifications. Gardez une trace courte dans la [fiche de suivi](../ia.llms.md#feedback-trace), si elle vous est utile.

Confidentialité Ne transmettez aucune donnée personnelle, confidentielle ou protégée.

## Données et outils

### Bases de données

[Télécharger le dossier de travail du module (.zip)](../downloads/donnees/stt1100-module-05-fr.zip)

[flights_merged_2023.rds](../donnees.llms.md#dataset-card-flights-merged-2023) [Comptages vélos de Laval](data/comptages_velos_laval_2016_06.csv) [Qualité de l'air à Québec](data/qualite_air_quebec_vieux_limoilou_2025_07.csv) [Débits de circulation de Gatineau](data/debits_circulation_gatineau_2016_2023.csv)

### Packages R

[tidyverse](../packages.llms.md#tidyverse) [lubridate](../packages.llms.md#lubridate) [dplyr](../packages.llms.md#dplyr) [ggplot2](../packages.llms.md#ggplot2)
