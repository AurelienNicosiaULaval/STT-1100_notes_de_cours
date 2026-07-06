# Prédiction et biais

Module 09

Construire une première prédiction et discuter les biais possibles.

Fil principalRégression, prédiction et biais

DonnéesÉcoles, élèves et jeux fictifs de consolidation

DéfiCapsule vidéo de 180 secondes

## Produit fini du module

Produit final

### Une capsule qui explique une prédiction et ses biais

Le produit fini raconte ce que le modèle apprend, ce qu’il ignore et comment les biais peuvent entrer dans une décision automatisée.

capsule prédiction

modèle simple

limites

biais discutés

modèle simple limites biais discutés

## Objectifs du module

À la fin de ce module, vous devriez être capable de:

- Ajuster et interpréter un modèle de régression linéaire simple.
- Utiliser un modèle de régression linéaire simple pour obtenir des prédictions.
- Ajuster et interpréter un modèle de régression linéaire multiple.
- Reconnaître et discuter des biais potentiels, notamment ceux liés à la discrimination, dans les données ou les modèles.

## Plan d’apprentissage

Les cartes reprennent les quatre blocs du plan: lectures, aventure, défi, exercices. Ouvrez les cartes pour voir l’action attendue et le lien utile.

1 Lectures à faire Préparer prédiction, validation et biais algorithmiques. Dans la carte Ouvrir la carteRéduire

### Lectures

Pour vous préparer, consultez les ressources suivantes :

- [ModernDive - Simple Linear Regression](https://moderndive.com/v2/regression.html)

- [ModernDive - Multiple Regression](https://moderndive.com/v2/multiple-regression.html)

- [ModernDive - Inference for Regression](https://moderndive.com/v2/inference-for-regression.html)

- [Documentation R - `lm()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/lm.html)

- [Documentation R - `predict.lm()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/predict.lm.html)

- [Gouvernement du Canada - Guide sur la prise de décisions automatisée](https://www.canada.ca/en/government/system/digital-government/digital-government-innovations/responsible-use-ai/guide-scope-directive-automated-decision-making.html)

- [NIST SP 1270 - Towards a Standard for Identifying and Managing Bias in Artificial Intelligence](https://www.nist.gov/publications/towards-standard-identifying-and-managing-bias-artificial-intelligence)

Après les lectures, vérifiez les idées clés avec le [mini-test formatif du module 9](mini_test.llms.md).

2 Aventure Construire un modèle simple et lire ses erreurs. [Aventure](aventure.llms.md) Ouvrir la carteRéduire

Objectif Passer de la lecture à la pratique guidée.

Ressource [Page Aventure](aventure.llms.md)

Action Suivre les consignes, exécuter le code et garder les sorties importantes.

Résultat Un premier objet de travail que vous pouvez expliquer.

Arrêtez-vous après chaque résultat important et formulez ce qu’il montre.

3 Défi Expliquer en capsule ce que le modèle apprend et rate. [Défi](defi.llms.md) Ouvrir la carteRéduire

### Défi - Capsule vidéo

Vous devez réaliser une capsule vidéo de 180 secondes maximum dans laquelle vous présentez :

- soit un modèle prédictif construit dans la Mission 1 ;
- soit une analyse critique d’un biais détecté dans la Mission 2.

La capsule doit inclure :

- une introduction claire ;

- une méthodologie brève ;

- des résultats visuels (graphiques, tableaux) ;

- une conclusion avec au moins une recommandation.

La consigne complète est disponible dans la page [Défi 9](defi.llms.md). Le dépôt de départ est `STT-1100/aventure-9`.

4 Exercices Reprendre variables, prédictions et limites du modèle. [Exercices](exercices.llms.md) Ouvrir la carteRéduire

Ressource [Page Exercices](exercices.llms.md)

Pourquoi Les exercices sont indépendants de l'aventure et du défi. Ils consolident la prédiction, les erreurs de modèle et la discussion des biais avec deux jeux de données fictifs.

Refaites au moins un passage sans regarder la solution immédiatement.

## Données et outils

### Bases de données

[eleves_fictifs.csv](../donnees.llms.md#dataset-card-eleves-fictifs) [ecoles_primaires_qc.csv](../donnees.llms.md#dataset-card-ecoles-primaires-qc) [logements_energie_fictif.csv](../donnees.llms.md#dataset-card-module09-logements-energie) [subventions_culture_fictif.csv](../donnees.llms.md#dataset-card-module09-subventions-culture)

### Packages R

[tidyverse](../packages.llms.md#tidyverse) [dplyr](../packages.llms.md#dplyr) [ggplot2](../packages.llms.md#ggplot2) [readr](../packages.llms.md#readr) [tibble](../packages.llms.md#tibble)

## Révision et prolongement

### Finir le module avec l’IA du cours

Ouvrez [la page IA](../ia.llms.md) ou [GPT STT-1100](https://chatgpt.com/g/g-682d165f32e881918633affa3fe9dfd6-gpt-stt-1100), puis demandez une rétroaction ciblée:

*Voici mon travail pour ce module. Questionne mon raisonnement, repère une ligne de code fragile, vérifie si mon interprétation répond à la consigne, puis propose une seule amélioration réaliste que je peux faire moi-même.*

- Expliquez le produit fini en trois phrases.
- Collez un extrait de code ou de sortie et demandez un diagnostic.
- Demandez une variante plus ambitieuse, puis choisissez ce qui reste raisonnable.
