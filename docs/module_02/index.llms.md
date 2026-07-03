# GitHub et visualisation de données

Module 02

Organiser un travail de données et produire des visualisations lisibles.

Fil principalGitHub, importation et graphiques

DonnéesManchots et tableaux Excel

DéfiJournal de bord et rapport GitHub

## Produit fini du module

Produit final

### Un dépôt GitHub lisible avec un rapport d'analyse

Le produit attendu combine un projet rangé, un journal de bord, un rapport Quarto et des messages de versionnement qui racontent le travail.

**dépôt GitHub**

commit propre

graphique annoté

projet partagé

commit propre graphique annoté projet partagé

## Objectifs du module

À la fin de ce module, vous devriez être capable de

- Utiliser GitHub via RStudio pour cloner un dépôt et faire des commits et des push.

- Lire un fichier `xlsx` dans RStudio.

- Gérer et transformer des données numériques à l’aide de `dplyr` (`glimpse`, `select`, `mutate`, `filter`).

- Calculer et interpréter des statistiques descriptives pour des variables numériques (`moyenne`, `médiane`, `écart-type`, `variance`, `étendue`, `quantiles`), incluant pour des sous-groupes de données.

- Visualiser des variables numériques avec `ggplot2` (`histogramme`, `boîte à moustaches`, `nuage de points`) et interpréter les graphiques obtenus.

- Produire et interpréter des graphiques comparant la distribution de variables continues entre des groupes (`histogrammes superposés`, `diagrammes en boîtes juxtaposés`, `densités empilées (ridge plots)`, `visualisation en facettes`).

- Utiliser les options de `ggplot2` pour améliorer la qualité de graphiques (titres, légendes, axes lisibles, cohérence graphique, `facets`).

## Plan d’apprentissage

Les cartes reprennent les quatre blocs du plan: lectures, aventure, défi, exercices. Ouvrez les cartes pour voir l’action attendue et le lien utile.

1 Lectures à faire Préparer GitHub, projets RStudio et grammaire graphique. Dans la carte Ouvrir la carteRéduire

### Lectures initiales

Comme le module 2 est étalé sur 2 semaines, il y a un peu plus de lecture. Pour vous préparer à la première partie du module, vous pouvez survoler les lectures et y revenir de façon plus précise en préparation de la partie 2.

On commence par quelques chapitres dans le fameux R4DS de Hadley Wickham et Garrett Grolemund:

- [Data visualization](https://r4ds.hadley.nz/data-visualize.html)
  *Découvrez comment utiliser `ggplot2` pour créer vos premiers graphiques. Cette introduction à la visualisation de données vous montre comment représenter efficacement des variables numériques et comment personnaliser vos graphiques.*

- [Data transformation](https://r4ds.hadley.nz/data-transform.html)
  *Apprenez à transformer vos jeux de données avec `dplyr` : filtrer, trier, créer de nouvelles colonnes et résumer l’information. Ce chapitre pose les bases de la manipulation de données dans le style du tidyverse.*

- [Exploratory Data Analysis (EDA)](https://r4ds.hadley.nz/EDA.html)
  *Explorez vos données pour en dégager des tendances, détecter des valeurs extrêmes et formuler des hypothèses. Ce chapitre présente des techniques simples mais puissantes d’analyse visuelle et statistique.*

- [Tidy data (spreadsheets)](https://r4ds.hadley.nz/spreadsheets.html)
  *Découvrez comment organiser vos données pour les rendre exploitables. Ce chapitre aborde le concept de “données propres” et vous montre comment reconnaître les structures de table communes dans des fichiers Excel ou CSV.*

##### Guide de style du tidyverse

- [Bonnes pratiques de visualisation avec ggplot2 (Tidyverse Style Guide)](https://style.tidyverse.org/ggplot2.html)

##### Un nouveau livre de référence

Dans ce module, nous introduisons un second ouvrage de référence : **Introduction to Modern Statistics** (*par Mine Çetinkaya-Rundel et Johanna Hardin*).

> Note : on abrègera souvent par **IMS**

Ce livre, également accessible gratuitement en ligne, propose une **approche moderne et appliquée de la statistique**. Il met l’accent sur la visualisation, l’intuition statistique et les bonnes pratiques en science des données. Il constitue un excellent complément à R4DS, notamment pour approfondir les aspects statistiques des analyses exploratoires.

- [Introduction to Modern Statistics – Chapitre 5 : Exploring numerical data](https://openintro-ims.netlify.app/explore-numerical)
  *Dans ce chapitre, vous apprendrez à explorer des données numériques à l’aide d’outils statistiques comme les résumés numériques, les histogrammes, et les boxplots. Il propose une vision claire et rigoureuse de la distribution des données.*

2 Aventure Construire des graphiques et suivre les versions du projet. [Aventure](aventure.llms.md) Ouvrir la carteRéduire

Objectif Passer de la lecture à la pratique guidée.

Ressource [Page Aventure](aventure.llms.md)

Action Suivre les consignes, exécuter le code et garder les sorties importantes.

Résultat Un premier objet de travail que vous pouvez expliquer.

Arrêtez-vous après chaque résultat important et formulez ce qu’il montre.

3 Défi Remettre le journal de bord et un rapport d'analyse dans GitHub. [Défi](defi.llms.md) Ouvrir la carteRéduire

### Défi

Le défi du module 2 se fait dans le même dépôt GitHub que l’aventure. Vous devez remettre le journal de bord et un rapport d’analyse Quarto sur les données des manchots.

[Consulter le défi du module 2](defi.llms.md)

- Partie 1 : compléter et rendre le journal de bord.

- Partie 2 : créer `rapport_analyse.qmd` et rendre `rapport_analyse.html`.

- GitHub : faire plusieurs commits clairs et pousser les changements.

4 Exercices Pratiquer graphiques, commits et interprétations courtes. [Exercices](exercices.llms.md) Ouvrir la carteRéduire

Ressource [Page Exercices](exercices.llms.md)

Pourquoi Les exercices sont gardés dans une page autonome parce qu'ils prennent plus de place.

Refaites au moins un passage sans regarder la solution immédiatement.

## Données et outils

### Bases de données

[manchots_donnees.xlsx](../donnees.llms.md#dataset-card-manchots-donnees) [palmerpenguins::penguins](../donnees.llms.md#dataset-card-penguins)

### Packages R

[tidyverse](../packages.llms.md#tidyverse) [palmerpenguins](../packages.llms.md#palmerpenguins) [ulavalssd](../packages.llms.md#ulavalssd) [readxl](../packages.llms.md#readxl) [ggplot2](../packages.llms.md#ggplot2) [patchwork](../packages.llms.md#patchwork)

## Révision et prolongement

### Finir le module avec l’IA du cours

Avant de passer au module suivant, utilisez l’IA du cours comme partenaire de révision: demandez-lui de questionner votre raisonnement, de repérer les lignes de code fragiles et de proposer une amélioration réaliste du défi.

- Expliquez le produit fini en trois phrases.
- Collez un extrait de code ou de sortie et demandez un diagnostic.
- Demandez une variante plus ambitieuse, puis choisissez ce qui reste raisonnable.
