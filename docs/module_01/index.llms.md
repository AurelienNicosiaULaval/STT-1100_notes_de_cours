# Plongée en science des données

Module 01

Découvrir le rôle d’une analyse reproductible et les premiers gestes dans RStudio, R et Quarto.

Fil principalPremiers gestes R et Quarto

DonnéesMeteoQuebec et premiers tableaux

DéfiMini-rapport Quarto reproductible

## Produit fini du module

Produit final

### Un mini-rapport Quarto reproductible

Le chapitre mène vers un premier document HTML qui importe des données, affiche des résultats et peut être rendu de nouveau sans bricolage.

**rapport.html**

données chargées

résumés clairs

rendu reproductible

données chargées résumés clairs rendu reproductible

## Objectifs du module

À la fin de ce module, vous devriez être capable de

- Utiliser RStudio pour rédiger et exécuter du code R à l’aide de la console et de scripts.

- Installer et charger des packages.

- Créer et manipuler des objets R, utiliser des conditions, utiliser des fonctions existantes, écrire des fonctions simples.

- Rédiger le code R en suivant les conventions de style du tidyverse.

- Vérifier si un jeu de données est propre.

- Extraire une ligne ou une colonne, ajouter une colonne, filtrer des données en utilisant une ou plusieurs conditions.

- Rédiger un rapport simple dans Quarto, incluant du texte, des blocs de code, des titres de sections.

## Plan d’apprentissage

Les cartes reprennent les quatre blocs du plan: lectures, aventure, défi, exercices. L’aventure et le défi forment le fil narratif du module. Les exercices sont autonomes et servent à consolider les gestes techniques.

1 Lectures à faire Installer les repères R, RStudio, Quarto, dplyr et reproductibilité. [Mini-test](mini_test.llms.md) Ouvrir la carteRéduire

### Lectures initiales

Le module utilise R for Data Science comme livre de référence. Les lectures essentielles installent les premiers repères RStudio, script et reproductibilité.

#### Lectures essentielles

- [Page d’accueil du livre](https://r4ds.hadley.nz/)
  *Vue d’ensemble du livre et de la progression.*

- [Introduction](https://r4ds.hadley.nz/intro.html)
  *Pourquoi apprendre R pour la science des données.*

- [Workflow: basics](https://r4ds.hadley.nz/workflow-basics.html)
  *Console, scripts et premiers objets dans RStudio.*

- [Workflow: scripts and projects](https://r4ds.hadley.nz/workflow-scripts.html)
  *Garder le code dans des fichiers pour pouvoir le relancer.*

#### Lectures pour l’aventure et le défi

- [Hello, Quarto](https://quarto.org/docs/get-started/hello/rstudio.html)
  *Créer un document Quarto et produire une sortie HTML.*

- [Data transformation](https://r4ds.hadley.nz/data-transform.html)
  *Premiers verbes `dplyr` utiles pour filtrer, choisir et créer des colonnes.*

[Faire le mini-test formatif des lectures](mini_test.llms.md).

2 Aventure Créer un premier rapport à partir des données météo. [Aventure](aventure.llms.md) Ouvrir la carteRéduire

Objectif Passer de la lecture à la pratique guidée.

Ressource [Page Aventure](aventure.llms.md)

Action Suivre les consignes, exécuter le code et garder les sorties importantes.

Résultat Un premier objet de travail que vous pouvez expliquer.

Arrêtez-vous après chaque résultat important et formulez ce qu’il montre.

3 Défi Rendre un mini-rapport HTML clair et reproductible. Dans la carte Ouvrir la carteRéduire

### Défi

Dans ce premier défi, afin de vous faire la main avec les différents outils, vous devez créer un rapport Quarto au format HTML.

[Défi du module 1](defi.llms.md)

#### Lectures additionnelles

##### Approfondir les bonnes pratiques

Une fois les bases posées, il est essentiel d’adopter dès le départ des **habitudes de travail claires, reproductibles et cohérentes**. Les ressources ci-dessous vous aideront à améliorer la lisibilité, la structure et l’organisation de votre code.

------------------------------------------------------------------------

##### Compléments R4DS

- [Workflow: help](https://r4ds.hadley.nz/workflow-help.html)
  *Apprendre à poser les bonnes questions, à chercher efficacement dans la documentation et à formuler des demandes d’aide pertinentes.*

- [Quarto formats](https://r4ds.hadley.nz/quarto-formats.html)
  *Présentation des formats disponibles dans Quarto et comment personnaliser vos rapports, articles ou présentations.*

- [Workflow: style](https://r4ds.hadley.nz/workflow-style.html)
  *Pourquoi un style de code cohérent est crucial pour la collaboration et comment y parvenir avec le style tidyverse.*

------------------------------------------------------------------------

##### Guide de style du tidyverse

- [Chapitre 1: Files](https://style.tidyverse.org/files.html)
  *Conseils pour organiser vos fichiers, structurer vos projets et nommer vos scripts de façon claire.*

- [Chapitre 2: Syntax](https://style.tidyverse.org/syntax.html)
  *Règles de syntaxe pour écrire du code lisible, espacement, indentation et conventions de nommage.*

4 Exercices Pratiquer RStudio, Quarto, MeteoQuebec et deux études de cas. [Exercices](exercices.llms.md) Ouvrir la carteRéduire

Ressource [Page Exercices](exercices.llms.md)

Portée Ces exercices ne sont pas une étape du défi. Ils permettent de pratiquer RStudio, Quarto, les premiers objets R et deux cas fictifs.

Essayez chaque exercice avant d’ouvrir la solution, même si ça tire un peu sur les neurones.

## Données et outils

### Bases de données

[UlavalSSD::MeteoQuebec](../donnees.llms.md#dataset-card-meteo-quebec) [Bibliothèques fictives](data/bibliotheques_municipales_fictif.csv) [Coop étudiante fictive](data/coop_etudiante_fictif.csv)

### Packages R

[tidyverse](../packages.llms.md#tidyverse) [dplyr](../packages.llms.md#dplyr) [knitr](../packages.llms.md#knitr) [remotes](../packages.llms.md#remotes) [ulavalssd](../packages.llms.md#ulavalssd)

## Révision et prolongement

### Finir le module avec l’IA du cours

Avant de passer au module suivant, utilisez l’IA du cours comme partenaire de révision: demandez-lui de questionner votre raisonnement, de repérer les lignes de code fragiles et de proposer une amélioration réaliste du défi.

- Expliquez le produit fini en trois phrases.
- Collez un extrait de code ou de sortie et demandez un diagnostic.
- Demandez une variante plus ambitieuse, puis choisissez ce qui reste raisonnable.
