# Collaboration et reproductibilité dans GitHub

Module 06

Passer d’un travail individuel à un flux collaboratif reproductible.

Fil principalGitHub, jointures et reproductibilité

Donnéesnycflights23 et tables reliées

DéfiRevue croisée d’un rapport collaboratif

## Produit fini du module

Produit final

### Un rapport collaboratif reproductible

Le module mène à un rapport Quarto versionné dans GitHub, enrichi par des données jointes, des visualisations et une trace claire des décisions d'équipe.

**collaboration**

branches

jointures

revue

rapport rendu issues

## Objectifs du module

À la fin de ce module, vous devriez être capable de :

- collaborer efficacement sur un projet de science des données avec GitHub;
- utiliser branches, commits et pull requests dans un contexte d’équipe;
- fusionner plusieurs tables avec `dplyr`;
- produire un rapport Quarto reproductible;
- formuler une rétroaction constructive dans une issue GitHub.

## Préparer le module

### Prérequis

Reprenez le dépôt GitHub du module 2 et un rapport Quarto rendu. Vous devez savoir localiser un fichier, lire l’historique des commits et reconnaître une jointure simple avant de commencer.

### Parcours minimal

Lisez le `README`, vérifiez une jointure, rendez un rapport et rédigez une issue précise. Le but est de rendre le travail d’une autre équipe compréhensible et actionnable.

### Travail d’équipe

Une issue utile nomme un élément réussi, une suggestion précise, l’endroit concerné et sa justification. Restez sur le travail observable, jamais sur la personne.

### Si l’équipe attribuée bloque

Documentez ce que vous avez pu vérifier, n’inventez pas de problème et signalez rapidement la situation à l’enseignant·e ou à l’auxiliaire. Ne restez pas dépendant d’une réponse externe.

## Plan d’apprentissage

Les cartes reprennent les cinq étapes du plan: lectures, aventure, défi, exercices et rétroaction avec ou sans IA. L’aventure et le défi forment le fil narratif du module. Les exercices sont indépendants et servent à consolider les jointures, la reproductibilité et la revue constructive sur d’autres données. La rétroaction revient sur un élément du travail déjà réalisé; elle ne demande aucune remise supplémentaire.

1 Lectures à faire Préparer collaboration GitHub, pull requests, issues et jointures. [Mini-test](mini_test.llms.md) Ouvrir la carteRéduire

### Lectures du module 6

Ces lectures préparent le travail collaboratif: suivre l'historique, discuter une modification, ouvrir une issue utile et joindre des tables.

#### Collaboration GitHub

- [GitHub Docs - Flux GitHub](https://docs.github.com/fr/get-started/using-github/github-flow)
  *Comprendre branches, commits, pull requests et fusion dans un flux de collaboration.*
- [GitHub Docs - Créer une issue](https://docs.github.com/fr/issues/tracking-your-work-with-issues/using-issues/creating-an-issue)
  *Formuler une rétroaction utile et actionnable dans le dépôt d'une équipe.*

#### Jointures avec dplyr

- [R for Data Science - Joins](https://r4ds.hadley.nz/joins)
  *Relier plusieurs tables avec des clés et vérifier les lignes qui apparaissent ou disparaissent.*
- [dplyr - Mutating joins](https://dplyr.tidyverse.org/reference/mutate-joins.html)
  *Référence des fonctions `left_join()`, `inner_join()`, `right_join()` et `full_join()`.*

#### Aide-mémoires Posit

- [Data transformation with dplyr :: Cheatsheet](https://rstudio.github.io/cheatsheets/data-transformation.pdf)
  *Jointures, regroupements et vérifications de tables.*
- [Publish and Share with Quarto :: Cheatsheet](https://rstudio.github.io/cheatsheets/quarto.pdf)
  *Produire un rapport reproductible en équipe.*

[Faire le mini-test formatif des lectures](mini_test.llms.md).

2 Aventure Produire un rapport collaboratif sur les retards de vols à JFK. [Aventure](aventure.llms.md) Ouvrir la carteRéduire

Objectif Utiliser GitHub, Quarto et `nycflights23` dans un travail d'équipe.

Ressource [Page Aventure](aventure.llms.md)

À produire `rapport.qmd`, `rapport.html` et `README.md`.

3 Défi Faire une revue croisée claire et actionnable. [Défi](defi.llms.md) Ouvrir la carteRéduire

### Défi - Revue croisée

Vous évaluez le rapport d'une autre équipe comme collaborateur: vérifier la reproductibilité, formuler des issues utiles et répondre aux corrections.

- But: produire une rétroaction précise, actionnable et liée au code ou au rapport.
- Livrables: issues GitHub, réponses et corrections retenues.
- Point d'attention: une bonne issue doit permettre à l'équipe de savoir quoi modifier.

La consigne complète est disponible dans la page [Défi 6](defi.llms.md).

4 Exercices Pratiquer les jointures sur un véritable catalogue québécois. [Exercices](exercices.llms.md) Ouvrir la carteRéduire

Objectif Consolider les jointures, les diagnostics de clés et les revues GitHub.

Ressource [Page Exercices](exercices.llms.md)

Portée Ces exercices ne sont pas la suite du défi. Ils utilisent un extrait relationnel réel de Données Québec: organisations, jeux, ressources et étiquettes.

5 Rétroaction Faire relire un extrait du travail, puis décider quoi améliorer soi-même. [Démarche et exemples](../ia.llms.md#feedback-cycle) Ouvrir la carteRéduire

### Rétroaction: une revue précise et une jointure contrôlée

Après une première tentative, choisissez un point à améliorer sur les jointures, la reproductibilité et la revue entre pairs. Utilisez la [démarche de rétroaction](../ia.llms.md#feedback-cycle) avec ou sans IA; cette routine n'ajoute pas de remise aux consignes.

Une demande adaptée au module 6

> Je travaille sur les jointures, la reproductibilité et la revue entre pairs. Voici la consigne, les critères pertinents et une issue que j'ai écrite et les éléments observables sur lesquels elle s'appuie. Relève un point réussi et au maximum deux améliorations, dont une formulation vague ou une vérification de jointure ou de rendu insuffisamment documentée si les éléments fournis le montrent. Cite le passage concerné, distingue erreur observable et point à vérifier, puis propose un indice et un test. Ne réécris pas mon travail et attends ma correction.

- Vérifier: Vérifiez les clés et les effectifs avant et après jointure, puis testez le rendu. Si vous examinez une issue, vérifiez qu'elle indique où agir, pourquoi et comment contrôler la correction.
- Revenir sur la correction: présentez le changement et le résultat du test, puis demandez ce qui reste à vérifier.
- Refaire sans aide: Réécrivez une suggestion vague en commentaire actionnable, puis expliquez le suivi attendu après une réponse de l'équipe.

Sans IA, comparez votre tentative aux critères et aux exemples du cours, puis faites les mêmes vérifications. Gardez une trace courte dans la [fiche de suivi](../ia.llms.md#feedback-trace), si elle vous est utile.

Confidentialité Ne transmettez aucune donnée personnelle, confidentielle ou protégée.

## Données et outils

### Bases de données

[Télécharger le dossier de travail du module (.zip)](../downloads/donnees/stt1100-module-06-fr.zip)

[nycflights23::flights](../donnees.llms.md#dataset-card-nycflights23-flights) [nycflights23::airlines](../donnees.llms.md#dataset-card-nycflights23-airlines) [nycflights23::weather](../donnees.llms.md#dataset-card-nycflights23-weather) [Organisations de Données Québec](data/organisations_donnees_quebec.csv) [Jeux de Données Québec](data/jeux_donnees_quebec.csv) [Ressources de Données Québec](data/ressources_donnees_quebec.csv) [Étiquettes de Données Québec](data/etiquettes_donnees_quebec.csv)

### Packages R

[tidyverse](../packages.llms.md#tidyverse) [nycflights23](../packages.llms.md#nycflights23) [dplyr](../packages.llms.md#dplyr) [readr](../packages.llms.md#readr) [ggplot2](../packages.llms.md#ggplot2)
