# GitHub et visualisation de données

Module 02

Organiser un travail de données, importer un fichier Excel et produire des visualisations lisibles.

Fil principalGitHub, importation et graphiques

DonnéesManchots, Excel et données ouvertes de Québec

DéfiJournal de bord et rapport GitHub

## Produit fini du module

Produit final

### Un dépôt GitHub lisible avec un rapport d'analyse

Le produit attendu combine un projet rangé, un journal de bord, un rapport Quarto reproductible et des messages de versionnement qui racontent le travail.

**dépôt GitHub**

import Excel

graphique annoté

rapport rendu

commit propre graphique annoté rapport rendu

## Objectifs du module

À la fin de ce module, vous devriez être capable de

- Utiliser GitHub via RStudio pour cloner un dépôt, faire des commits et pousser vos changements.

- Lire un fichier `xlsx` dans RStudio et documenter l’importation dans un rapport Quarto.

- Gérer et transformer des données numériques avec `dplyr` (`glimpse`, `select`, `mutate`, `filter`, `group_by`, `summarise`).

- Calculer et interpréter des statistiques descriptives pour des variables numériques, incluant pour des sous-groupes de données.

- Visualiser des variables numériques avec `ggplot2` (`histogramme`, `boîte à moustaches`, `nuage de points`, `facettes`) et interpréter les graphiques obtenus.

- Améliorer la qualité de graphiques avec des titres, des légendes, des axes lisibles, des unités et une cohérence graphique.

## Préparer le module

### Prérequis

Vous devez savoir ouvrir un projet RStudio, rendre un fichier Quarto et utiliser les gestes de base vus au module 1. Vérifiez aussi que vous pouvez vous connecter à GitHub avant la séance.

### Parcours minimal

Clonez le dépôt demandé, ouvrez le projet, importez le fichier Excel, produisez un premier graphique et faites un commit lisible. Ces cinq gestes vous préparent réellement à l’aventure.

### Priorité pédagogique

Commencez par un graphique clair et un court résumé avant les facettes, les analyses secondaires ou les améliorations visuelles. Les extensions viennent après un premier rendu fonctionnel.

### Dépôt et aide

Ne déposez pas de données personnelles dans GitHub. Si l’accès, le clone ou le push bloque, conservez le message d’erreur et demandez de l’aide avant de contourner le problème.

## Plan d’apprentissage

Les cartes reprennent les quatre blocs du plan: lectures, aventure, défi, exercices. L’aventure et le défi forment le fil narratif du module. Les exercices sont autonomes et servent à consolider les gestes techniques.

1 Lectures à faire Préparer GitHub, l'importation Excel, dplyr et ggplot2. [Mini-test](mini_test.llms.md) Ouvrir la carteRéduire

### Lectures initiales

À l'automne 2026, le module 2 est préparé pendant la semaine du 7 septembre, puis travaillé en classe le 14 septembre. Le travail préparatoire installe le dépôt GitHub, l'importation Excel et les premiers graphiques; la séance de classe sert à mettre ces gestes en pratique et à consolider l'exploration numérique et la comparaison de distributions.

#### Travail préparatoire

- [Aide-mémoire RStudio et GitHub](../autre_materiel/aide-memoire-rstudio-github.llms.md)
  *Cloner un dépôt, faire des commits et pousser vers GitHub.*

- [R4DS - Data visualization](https://r4ds.hadley.nz/data-visualize.html)
  *Construire les premiers graphiques avec `ggplot2`.*

- [R4DS - Data transformation](https://r4ds.hadley.nz/data-transform.html)
  *Manipuler des tableaux avec les verbes `dplyr`.*

- [Documentation readxl](https://readxl.tidyverse.org/)
  *Importer des fichiers Excel avec `read_excel()`.*

#### Approfondissement

- [R4DS - Exploratory Data Analysis](https://r4ds.hadley.nz/EDA.html)
  *Explorer les distributions et repérer les valeurs extrêmes.*

- [R4DS - Spreadsheets](https://r4ds.hadley.nz/spreadsheets.html)
  *Comprendre les structures de données utiles dans les feuilles de calcul.*

- [IMS - Exploring numerical data](https://openintrostat.github.io/ims/explore-numerical)
  *Interpréter des résumés numériques, histogrammes et boîtes à moustaches.*

- [Tidyverse Style Guide - ggplot2](https://style.tidyverse.org/ggplot2.html)
  *Écrire du code graphique plus lisible.*

#### Aide-mémoires Posit

- [Data import with the tidyverse :: Cheatsheet](https://rstudio.github.io/cheatsheets/data-import.pdf)
  *Importation avec `readr` et `readxl`.*

- [Data transformation with dplyr :: Cheatsheet](https://rstudio.github.io/cheatsheets/data-transformation.pdf)
  *Verbes de transformation utilisés dans l'aventure et les exercices.*

- [Data visualization with ggplot2 :: Cheat Sheet](https://rstudio.github.io/cheatsheets/data-visualization.pdf)
  *Grammaire des graphiques, géométries, facettes, échelles et thèmes.*

[Faire le mini-test formatif des lectures](mini_test.llms.md).

2 Aventure Explorer les données de manchots et suivre le travail dans GitHub. [Aventure](aventure.llms.md) Ouvrir la carteRéduire

Objectif Passer de la lecture à la pratique guidée.

Ressource [Page Aventure](aventure.llms.md)

Action Importer les données, exécuter le code, produire les graphiques et garder les sorties importantes.

Résultat Un journal de bord que vous pouvez expliquer.

Arrêtez-vous après chaque résultat important et formulez ce qu’il montre.

3 Défi Remettre le journal de bord et un rapport d'analyse dans GitHub. [Défi](defi.llms.md) Ouvrir la carteRéduire

### Défi

Le défi du module 2 se fait dans le même dépôt GitHub que l'aventure. Vous devez remettre le journal de bord et un rapport d'analyse Quarto sur les données des manchots.

[Consulter le défi du module 2](defi.llms.md)

- Partie 1: compléter et rendre le journal de bord.

- Partie 2: créer `rapport_analyse.qmd` et rendre `rapport_analyse.html`.

- GitHub: faire plusieurs commits clairs et pousser les changements.

4 Exercices Pratiquer import, dplyr, graphiques, statistiques et cas de transfert. [Exercices](exercices.llms.md) Ouvrir la carteRéduire

Ressource [Page Exercices](exercices.llms.md)

Portée Ces exercices ne sont pas une étape du défi. Ils pratiquent GitHub, l'importation Excel, les graphiques et deux cas à partir de données ouvertes de Québec.

Essayez chaque exercice avant d’ouvrir la solution, surtout quand le graphique semble presque fonctionner.

## Données et outils

### Bases de données

[Télécharger le dossier de travail du module (.zip)](../downloads/donnees/stt1100-module-02-fr.zip)

[manchots_donnees.xlsx](../donnees.llms.md#dataset-card-manchots-donnees) [palmerpenguins::penguins](../donnees.llms.md#dataset-card-penguins) [Arbres répertoriés de Québec](data/arbres_repertories_quebec.csv) [Compteurs cyclistes de Québec](data/comptages_cyclistes_quebec_2026.csv)

### Packages R

[tidyverse](../packages.llms.md#tidyverse) [palmerpenguins](../packages.llms.md#palmerpenguins) [UlavalSSD](../packages.llms.md#ulavalssd) [readxl](../packages.llms.md#readxl) [ggplot2](../packages.llms.md#ggplot2) [patchwork](../packages.llms.md#patchwork)

## Révision et prolongement

### Finir le module avec l’IA du cours

Ouvrez [la page IA](../ia.llms.md) ou [GPT STT-1100](https://chatgpt.com/g/g-682d165f32e881918633affa3fe9dfd6-gpt-stt-1100), puis demandez une rétroaction ciblée:

*Voici mon travail pour ce module. Questionne mon raisonnement, repère une ligne de code fragile, vérifie si mon interprétation répond à la consigne, puis propose une seule amélioration réaliste que je peux faire moi-même.*

- Expliquez le produit fini en trois phrases.
- Collez un extrait de code ou de sortie et demandez un diagnostic.
- Demandez une variante plus ambitieuse, puis choisissez ce qui reste raisonnable.
