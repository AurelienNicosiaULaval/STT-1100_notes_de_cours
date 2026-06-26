# Les catégories sous toutes leurs formes

Module 03

Comprendre, recoder et visualiser des variables catégorielles.

Fil principalCatégories, chaînes et graphiques

DonnéesManchots, Titanic et catégories

DéfiRecodage documenté et graphique interprété

## Produit fini du module

Produit final

### Une variable catégorielle prête pour l’analyse

Le module produit un recodage documenté, une vérification des modalités et un graphique qui respecte la nature des catégories.

**catégories**

modalités vérifiées

recodage justifié

graphique interprété

modalités vérifiées recodage justifié graphique interprété

## Objectifs du module

À la fin de ce module, vous devriez être capable de

- Manipuler des chaînes de caractères avec `stringr`.
- Reconnaitre des motifs avec des expressions régulières.
- Utiliser les expressions régulières pour sélectionner, manipuler et modifier des chaînes de caractères.
- Calculer et interpréter des statistiques descriptives pour des variables catégoriques (tableaux de fréquences, proportions, incluant par groupes, tableau croisé).
- Produire et interpréter des visualisations de variables catégoriques avec `ggplot2` (diagramme à bandes, en bâtons empilés, en bâtons empilés standardisé, en bâtons empilés groupés, en mosaïque, en secteurs et en gaufre).

## Plan d’apprentissage

Les cartes reprennent les quatre blocs du plan: lectures, aventure, défi, exercices. Ouvrez les cartes pour voir l’action attendue et le lien utile.

1 Lectures à faire Revoir catégories, facteurs et représentations adaptées. Dans la carte Ouvrir la carteRéduire

### Lectures initiales

#### Lectures à faire avant l’aventure

Dans ce module, nous allons explorer les variables **catégoriques** et la **visualisation adaptée** à ce type de données. Deux lectures sont proposées pour vous préparer :

- [**R for Data Science – Strings**](https://r4ds.hadley.nz/strings.html)
  Ce chapitre vous introduit à la manipulation des chaînes de caractères avec le package `stringr`.
  \> **Note** : Bien que ce chapitre soit plus largement utilisé au module 4, certaines fonctions utiles comme `str_detect()` ou `str_to_lower()` peuvent déjà vous aider pour nettoyer ou préparer des variables catégoriques.

- [**Introduction to Modern Statistics – Chapitre 6 : Explore categorical data**](https://openintro-ims.netlify.app/explore-categorical)
  Ce chapitre de **IMS** présente les concepts statistiques associés aux données catégoriques. On y parle notamment de tableaux de fréquence, de proportions et des façons de représenter visuellement ce type de variables.

Prenez le temps de parcourir ces deux ressources. Elles vous seront utiles pour comprendre comment traiter les **données qualitatives**, tant du point de vue **statistique** que **pratique**.

2 Aventure Recoder des modalités et comparer des groupes sans les déformer. [Aventure](aventure.llms.md) Ouvrir la carteRéduire

Objectif Passer de la lecture à la pratique guidée.

Ressource [Page Aventure](aventure.llms.md)

Action Suivre les consignes, exécuter le code et garder les sorties importantes.

Résultat Un premier objet de travail que vous pouvez expliquer.

Arrêtez-vous après chaque résultat important et formulez ce qu’il montre.

3 Défi Documenter un recodage et défendre le choix du graphique. Dans la carte Ouvrir la carteRéduire

### Défi

Au terme de ce module, **vous endosserez le rôle de journaliste de données** pour *Le Courrier Gourmand*.
Votre mission :

1.  **Explorer et nettoyer** le jeu `listecondamnation` (infractions alimentaires au Québec).
2.  **Extraire des faits marquants** (top infractions, montants d’amendes, comparaison Montréal / hors-Montréal).
3.  **Illustrer vos analyses** par au moins **deux visuels** (un graphique de catégories + la carte des amendes).
4.  **Rédiger un article Quarto (HTML)** clair et accrocheur : chapeau -\> contexte -\> méthodologie -\> résultats -\> recommandations.
5.  **Citer deux chiffres narratifs** et **intégrer une courte citation d’Alexandre** pour humaniser la conclusion.

> **À remettre** : le fichier `.qmd` et le HTML généré, livrés via votre dépôt GitHub avant la date limite.

#### Grille d’évaluation

Votre article sera évalué selon les critères suivants. Assurez-vous de bien respecter le canevas fourni et les consignes données.

| Critère | Excellent (3) | Satisfaisant (2) | À améliorer (1) | Commentaire |
|----|----|----|----|----|
| \*\* Chapeau introductif\*\* | Accroche percutante, angle clair, chiffres clés bien choisis | Présent mais peu engageant ou peu clair | Absent ou très vague |  |
| \*\* Contexte & présentation des données\*\* | Source bien identifiée, pertinence expliquée, limites évoquées | Contexte partiel ou explication sommaire | Source absente ou non justifiée |  |
| \*\* Méthodologie (section sans code)\*\* | Démarche bien résumée, claire et logique | Présente mais confuse ou trop technique | Absente ou très floue |  |
| \*\* Résultat clé \#1 (graphique + interprétation)\*\* | Visuel clair, bonne interprétation, apport analytique évident | Visuel ou commentaire peu approfondi | Visuel ou analyse absente |  |
| \*\* Résultat clé \#2 (graphique + interprétation)\*\* | Visuel pertinent, insight bien formulé | Visuel correct mais analyse faible | Résultat peu exploité ou manquant |  |
| \*\* Résultat clé \#3 (graphique + interprétation)\*\* | Résultat original ou complémentaire, bien expliqué | Présent mais peu développé | Manquant ou superficiel |  |
| \*\* Discussion (section 4)\*\* | Réflexion critique, mise en perspective des résultats | Discussion partielle ou descriptive | Discussion absente ou sans valeur ajoutée |  |
| \*\* Conclusion & recommandations\*\* | Messages d’action clairs, utiles, bien formulés | Messages présents mais peu convaincants | Peu clairs ou hors sujet |  |
| \*\* Chiffres narratifs + citation d’Alexandre\*\* | Deux chiffres bien choisis + citation bien intégrée | Un des éléments présent seulement | Aucun ou mal intégré |  |
| \*\* Qualité du rendu (Quarto + dépôt GitHub)\*\* | `.qmd` fonctionnel, HTML lisible, dépôt propre et complet | Quelques problèmes techniques ou dépôt désorganisé | Exécution impossible ou rendu partiel/absent |  |

------------------------------------------------------------------------

**Total sur 30 points** : `XX / 30`

> *N’oubliez pas de relire la checklist en fin de template avant de publier votre article.*

4 Exercices Stabiliser tableaux de fréquences, facteurs et regroupements. [Exercices](exercices.llms.md) Ouvrir la carteRéduire

Ressource [Page Exercices](exercices.llms.md)

Pourquoi Les exercices sont gardés dans une page autonome parce qu'ils prennent plus de place.

Refaites au moins un passage sans regarder la solution immédiatement.

## Données et outils

### Bases de données

[palmerpenguins::penguins_raw](../donnees.llms.md#dataset-card-penguins-raw) [titanic::titanic_train](../donnees.llms.md#dataset-card-titanic-train)

### Packages R

[tidyverse](../packages.llms.md#tidyverse) [stringr](../packages.llms.md#stringr) [palmerpenguins](../packages.llms.md#palmerpenguins) [titanic](../packages.llms.md#titanic) [ulavalssd](../packages.llms.md#ulavalssd) [ggplot2](../packages.llms.md#ggplot2) [tidygeocoder](../packages.llms.md#tidygeocoder) [viridis](../packages.llms.md#viridis) [scales](../packages.llms.md#scales)

## Révision et prolongement

### Finir le module avec l’IA du cours

Avant de passer au module suivant, utilisez l’IA du cours comme partenaire de révision: demandez-lui de questionner votre raisonnement, de repérer les lignes de code fragiles et de proposer une amélioration réaliste du défi.

- Expliquez le produit fini en trois phrases.
- Collez un extrait de code ou de sortie et demandez un diagnostic.
- Demandez une variante plus ambitieuse, puis choisissez ce qui reste raisonnable.
