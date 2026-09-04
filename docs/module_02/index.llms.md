# GitHub et visualisation de données

Module 02

Organiser un travail de données, importer un fichier Excel et produire des visualisations lisibles.

Fil principalGitHub, importation et graphiques

DonnéesManchots, Excel et données ouvertes de Québec

DéfiJournal de bord et rapport GitHub

> **IMPORTANT:**
>
> L’aventure 2 comporte deux parties. Pour le travail autonome, faites seulement la partie 1.
>
> 1.  Acceptez l’invitation à votre dépôt privé `aventure-2-VOTRE-IDENTIFIANT`.
> 2.  Au besoin, suivez la page [Connexion SSH entre GitHub et RStudio](../autre_materiel/connexion-ssh-github-rstudio.llms.md).
> 3.  Clonez le dépôt dans RStudio, puis ouvrez `journal de bord.qmd`.
> 4.  Suivez la [page de l’aventure 2](../module_02/aventure.llms.md), du début jusqu’à l’encadré « Point d’arrêt de la partie 1 ».
> 5.  Rendez le journal en HTML, puis faites un commit et un push.
>
> Ne commencez pas la section « Le retour de la Dre Adélie Fortier » ni le rapport `rapport_analyse.qmd`. Ils appartiennent à la partie 2.

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

Les cartes reprennent les cinq étapes du plan: lectures, aventure, défi, exercices et rétroaction IA. L’aventure et le défi forment le fil narratif du module. Les exercices sont autonomes et servent à consolider les gestes techniques. La rétroaction IA revient sur un élément du travail déjà réalisé; elle ne demande aucune remise supplémentaire.

1 Lectures à faire Préparer GitHub, l'importation Excel, dplyr et ggplot2. [Mini-test](mini_test.llms.md) Ouvrir la carteRéduire

### Lectures initiales

À l'automne 2026, le module 2 est préparé pendant la semaine du 7 septembre, puis travaillé en classe le 14 septembre. Le travail préparatoire installe le dépôt GitHub, l'importation Excel et les premiers graphiques; la séance de classe sert à mettre ces gestes en pratique et à consolider l'exploration numérique et la comparaison de distributions.

#### Travail préparatoire

- [Connexion SSH entre GitHub et RStudio](../autre_materiel/connexion-ssh-github-rstudio.llms.md)
  *Configurer le compte avec les menus et les boutons, puis vérifier la connexion.*

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

[Télécharger le dossier de travail du module (.zip)](../downloads/donnees/stt1100-module-02-fr.zip)

[manchots_donnees.xlsx](../donnees.llms.md#dataset-card-manchots-donnees) [palmerpenguins::penguins](../donnees.llms.md#dataset-card-penguins) [Arbres répertoriés de Québec](data/arbres_repertories_quebec.csv) [Compteurs cyclistes de Québec](data/comptages_cyclistes_quebec_2026.csv)

### Packages R

[tidyverse](../packages.llms.md#tidyverse) [palmerpenguins](../packages.llms.md#palmerpenguins) [UlavalSSD](../packages.llms.md#ulavalssd) [readxl](../packages.llms.md#readxl) [ggplot2](../packages.llms.md#ggplot2) [patchwork](../packages.llms.md#patchwork)
