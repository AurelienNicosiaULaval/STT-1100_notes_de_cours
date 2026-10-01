# Prédiction et biais

Module 09

Construire une première prédiction et discuter les biais possibles.

Fil principalRégression, prédiction et biais

DonnéesÉcoles, élèves et données municipales sur l’eau

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

## Préparer le module

### Prérequis

Reprenez l’interprétation d’une association du module 5 et les limites liées aux données manquantes du module 4. Une prédiction reste une aide à décrire un modèle, pas une conclusion causale.

### Parcours minimal

Ajustez le modèle fourni, comparez quelques valeurs observées et prédites, examinez les erreurs et nommez une limite. Ces comparaisons utilisent les données d’ajustement: elles servent au diagnostic, non à garantir une performance sur de nouvelles données.

### Capsule accessible

Préparez un plan de 180 secondes, un visuel lisible et un court transcript ou des sous-titres. La capsule doit pouvoir être comprise sans dépendre uniquement de l’audio.

### Si vous bloquez

Choisissez une seule option du défi, formulez la question en une phrase et construisez un premier résultat visuel avant d’enregistrer la capsule.

## Plan d’apprentissage

Les cartes reprennent les cinq étapes du plan: lectures, aventure, défi, exercices et rétroaction avec ou sans IA. Ouvrez les cartes pour voir l’action attendue et le lien utile. La rétroaction revient sur un élément du travail déjà réalisé; elle ne demande aucune remise supplémentaire.

1 Lectures à faire Préparer prédiction, diagnostics descriptifs et biais algorithmiques. Dans la carte Ouvrir la carteRéduire

### Lectures

Pour vous préparer, consultez les ressources suivantes :

- [Introduction to Modern Statistics - Chapitre 7 : Linear regression with a single predictor](https://openintrostat.github.io/ims/model-slr)

- [Introduction to Modern Statistics - Chapitre 8 : Linear regression with multiple predictors](https://openintrostat.github.io/ims/model-mlr)

- [Introduction to Modern Statistics - Chapitre 25 : Inference for linear regression with multiple predictors](https://openintrostat.github.io/ims/inf-model-mlr#sec-inf-mult-reg-soft)

- [Documentation R - `lm()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/lm.html)

- [Documentation R - `predict.lm()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/predict.lm.html)

- [Gouvernement du Canada - Guide sur la prise de décisions automatisée](https://www.canada.ca/en/government/system/digital-government/digital-government-innovations/responsible-use-ai/guide-scope-directive-automated-decision-making.html)

- [NIST SP 1270 - Towards a Standard for Identifying and Managing Bias in Artificial Intelligence](https://www.nist.gov/publications/towards-standard-identifying-and-managing-bias-artificial-intelligence)

#### Aide-mémoires Posit

- [Data transformation with dplyr :: Cheatsheet](https://rstudio.github.io/cheatsheets/data-transformation.pdf)
  Préparer les tableaux avant d'ajuster et d'interpréter le modèle.

- [Data visualization with ggplot2 :: Cheat Sheet](https://rstudio.github.io/cheatsheets/data-visualization.pdf)
  Visualiser les diagnostics descriptifs, les prédictions et les erreurs.

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

Pourquoi Les exercices sont indépendants de l'aventure et du défi. Ils consolident la prédiction, les erreurs de modèle et les biais de couverture avec deux extraits réels de la Stratégie québécoise d'économie d'eau potable.

Refaites au moins un passage sans regarder la solution immédiatement.

5 Rétroaction Faire relire un extrait du travail, puis décider quoi améliorer soi-même. [Démarche et exemples](../ia.llms.md#feedback-cycle) Ouvrir la carteRéduire

### Rétroaction: une prédiction dont on connaît les limites

Après une première tentative, choisissez un point à améliorer sur la régression, les prédictions et les biais. Utilisez la [démarche de rétroaction](../ia.llms.md#feedback-cycle) avec ou sans IA; cette routine n'ajoute pas de remise aux consignes.

Une demande adaptée au module 9

> Je travaille sur la régression, les prédictions et les biais. Voici la consigne, les critères pertinents et la formule du modèle, une sortie R, une prédiction et mon explication de ses limites. Relève un point réussi et au maximum deux améliorations, dont une interprétation de coefficient, une extrapolation ou une conclusion sur les biais à vérifier si les éléments fournis le montrent. Cite le passage concerné, distingue erreur observable et point à vérifier, puis propose un indice et un test. Ne réécris pas mon travail et attends ma correction.

- Vérifier: Vérifiez les unités, les variables et la plage observée. Reproduisez une prédiction et comparez-la aux observations; distinguez performance observée et généralisation à de nouvelles données.
- Revenir sur la correction: présentez le changement et le résultat du test, puis demandez ce qui reste à vérifier.
- Refaire sans aide: Expliquez une prédiction et une limite à un public non spécialiste, puis repérez un cas où le modèle ne devrait pas être utilisé sans vérification supplémentaire.

Sans IA, comparez votre tentative aux critères et aux exemples du cours, puis faites les mêmes vérifications. Gardez une trace courte dans la [fiche de suivi](../ia.llms.md#feedback-trace), si elle vous est utile.

Confidentialité Ne transmettez aucune donnée personnelle, confidentielle ou protégée.

## Données et outils

### Bases de données

[Télécharger le dossier de travail du module (.zip)](../downloads/donnees/stt1100-module-09-fr.zip)

[eleves_fictifs.csv](../donnees.llms.md#dataset-card-eleves-fictifs) [ecoles_primaires_qc.csv](../donnees.llms.md#dataset-card-ecoles-primaires-qc) [Consommation d'eau municipale 2023](data/consommation_eau_municipalites_2023.csv) [Validité des audits de l'eau 2023](data/validite_audits_eau_2023.csv)

### Packages R

[tidyverse](../packages.llms.md#tidyverse) [dplyr](../packages.llms.md#dplyr) [ggplot2](../packages.llms.md#ggplot2) [readr](../packages.llms.md#readr) [tibble](../packages.llms.md#tibble)
