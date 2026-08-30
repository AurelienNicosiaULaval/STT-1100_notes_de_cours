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

## Préparer le module

### Avant de commencer

Suivez la [procédure d’installation technique](../installation.llms.md) pour vérifier R, RStudio, Quarto et les packages de départ. Ouvrez ensuite RStudio, créez un fichier `.qmd` vide et rendez-le une première fois: ce test technique vient avant l’analyse.

### Parcours minimal

1.  Lire les repères essentiels.
2.  Répondre au mini-test sans regarder les réponses.
3.  Produire un petit rapport HTML qui se rend après un redémarrage de R.

### Données personnelles

Utilisez une date symbolique ou fictive dans le défi. Ne mettez pas votre date de naissance complète dans un rapport remis ou dans un dépôt.

### Si vous bloquez

Isolez l’erreur, gardez le message complet et vérifiez d’abord le rendu minimal. La boîte à outils aide ensuite à formuler une demande courte et reproductible.

## Plan d’apprentissage

Les cartes reprennent les cinq étapes du plan: lectures, aventure, défi, exercices et rétroaction IA. L’aventure et le défi forment le fil narratif du module. Les exercices sont autonomes et servent à consolider les gestes techniques. La rétroaction IA revient sur un élément du travail déjà réalisé; elle ne demande aucune remise supplémentaire.

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

#### Aide-mémoires Posit

- [RStudio IDE :: Cheatsheet](https://rstudio.github.io/cheatsheets/rstudio-ide.pdf)
  *Repères rapides pour l'environnement RStudio.*

- [Publish and Share with Quarto :: Cheatsheet](https://rstudio.github.io/cheatsheets/quarto.pdf)
  *Créer, rendre et partager un document Quarto.*

- [Data transformation with dplyr :: Cheatsheet](https://rstudio.github.io/cheatsheets/data-transformation.pdf)
  *Verbes `dplyr` utilisés dans les premières manipulations de tableaux.*

[Faire le mini-test formatif des lectures](mini_test.llms.md).

2 Aventure Créer un premier rapport à partir des données météo. [Aventure](aventure.llms.md) Ouvrir la carteRéduire

Objectif Passer de la lecture à la pratique guidée.

Ressource [Page Aventure](aventure.llms.md)

Action Suivre les consignes, exécuter le code et garder les sorties importantes.

Résultat Un premier objet de travail que vous pouvez expliquer.

Arrêtez-vous après chaque résultat important et formulez ce qu’il montre.

3 Défi Rendre un mini-rapport HTML clair et reproductible. [Défi](defi.llms.md) Ouvrir la carteRéduire

### Défi - Mini-rapport Quarto

Vous transformez la pratique guidée en un premier rapport HTML autonome. La carte donne seulement le repère: le défi complet est dans la page dédiée.

- But: produire un fichier Quarto lisible qui s'exécute sans erreur.
- Livrables: fichier source `.qmd` et rendu HTML.
- Point d'attention: structure du rapport, code visible et interprétation courte écrite dans vos mots.

La consigne complète est disponible dans la page [Défi 1](defi.llms.md).

4 Exercices Pratiquer RStudio, Quarto, MeteoQuebec et deux études de cas. [Exercices](exercices.llms.md) Ouvrir la carteRéduire

Ressource [Page Exercices](exercices.llms.md)

Portée Ces exercices ne sont pas une étape du défi. Ils permettent de pratiquer RStudio, Quarto, les premiers objets R et deux cas à partir de données ouvertes québécoises.

Essayez chaque exercice avant d’ouvrir la solution, même si ça tire un peu sur les neurones.

5 Rétroaction IA Faire relire un extrait du travail, puis décider quoi améliorer soi-même. [Mode /retroaction](../ia.llms.md) Ouvrir la carteRéduire

Point de départ Choisissez un seul élément réellement produit dans l'aventure, le défi ou les exercices: un extrait de code, un graphique, une interprétation ou un choix méthodologique.

Préparer Donnez la consigne, le contexte, ce que vous avez essayé et l'élément précis à relire.

Demander Ouvrez [GPT STT-1100](https://chatgpt.com/g/g-682d165f32e881918633affa3fe9dfd6-gpt-stt-1100) en mode `/retroaction`. Demandez un point solide, une fragilité à vérifier et une question qui vous aidera à corriger.

Décider Comparez la réponse aux données et à la consigne. Modifiez vous-même seulement ce que vous comprenez et pouvez expliquer.

Demande prête à copier

`/retroaction Je termine ce module. Voici la consigne visée, ce que j'ai essayé et l'extrait précis que je veux améliorer. Donne-moi un point solide, une fragilité à vérifier et une question qui m'aidera à corriger moi-même. Ne réécris pas tout le travail.`

Résultat attendu Une amélioration comprise et appliquée dans votre travail, ou une raison claire de ne pas suivre la suggestion. Il n'y a ni portfolio ni remise supplémentaire à produire.

Confidentialité Ne transmettez aucune donnée personnelle, confidentielle ou protégée.

## Données et outils

### Bases de données

[Télécharger le dossier de travail du module (.zip)](../downloads/donnees/stt1100-module-01-fr.zip)

[UlavalSSD::MeteoQuebec](../donnees.llms.md#dataset-card-meteo-quebec) [Bibliothèques publiques du Québec, 2024](data/bibliotheques_publiques_quebec_2024.csv) [Fréquentation du portail de Montréal, 2023](data/frequentation_portail_montreal_2023.csv)

### Packages R

[tidyverse](../packages.llms.md#tidyverse) [dplyr](../packages.llms.md#dplyr) [knitr](../packages.llms.md#knitr) [remotes](../packages.llms.md#remotes) [ulavalssd](../packages.llms.md#ulavalssd)
