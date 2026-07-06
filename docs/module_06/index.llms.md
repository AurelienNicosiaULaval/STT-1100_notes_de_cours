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

## Plan d’apprentissage

Les cartes reprennent les quatre blocs du plan: lectures, aventure, défi, exercices. L’aventure et le défi forment le fil narratif du module. Les exercices sont indépendants et servent à consolider les jointures, la reproductibilité et la revue constructive sur d’autres données.

1 Lectures à faire Préparer collaboration GitHub, pull requests, issues et jointures. [Plan](plan_apprentissage.llms.md) Ouvrir la carteRéduire

Objectif Comprendre le vocabulaire avant le travail d'équipe.

Ressource [Plan d'apprentissage](plan_apprentissage.llms.md)

Vérification Après les lectures, faites le [mini-test formatif](mini_test.llms.md).

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

4 Exercices Pratiquer les jointures et les diagnostics sur des données fictives. [Exercices](exercices.llms.md) Ouvrir la carteRéduire

Objectif Consolider les jointures, les diagnostics de clés et les revues GitHub.

Ressource [Page Exercices](exercices.llms.md)

Portée Ces exercices ne sont pas la suite du défi. Ils utilisent des données fictives de contributions, d'issues, de fichiers attendus et de portail de données.

## Données et outils

### Bases de données

[nycflights23::flights](../donnees.llms.md#dataset-card-nycflights23-flights) [nycflights23::airlines](../donnees.llms.md#dataset-card-nycflights23-airlines) [nycflights23::weather](../donnees.llms.md#dataset-card-nycflights23-weather) [membres_equipe_fictif.csv](../donnees.llms.md#dataset-card-module06-members) [contributions_git_fictif.csv](../donnees.llms.md#dataset-card-module06-contributions) [issues_revue_fictif.csv](../donnees.llms.md#dataset-card-module06-issues) [portail_donnees_fictif.csv](../donnees.llms.md#dataset-card-module06-data-portal)

### Packages R

[tidyverse](../packages.llms.md#tidyverse) [nycflights23](../packages.llms.md#nycflights23) [dplyr](../packages.llms.md#dplyr) [readr](../packages.llms.md#readr) [ggplot2](../packages.llms.md#ggplot2)

## Révision et prolongement

### Finir le module avec l’IA du cours

Relisez une issue que vous avez écrite, puis ouvrez [la page IA](../ia.llms.md) ou [GPT STT-1100](https://chatgpt.com/g/g-682d165f32e881918633affa3fe9dfd6-gpt-stt-1100) et demandez une rétroaction ciblée:

*Voici une issue de revue que j'ai écrite. Est-elle assez précise pour qu'une équipe agisse? Repère une formulation vague, une information manquante et une amélioration que je peux faire moi-même.*
