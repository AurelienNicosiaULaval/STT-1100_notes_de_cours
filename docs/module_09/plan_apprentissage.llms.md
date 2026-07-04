# Module 9 - Plan d’apprentissage

STT-1100 Introduction à la science des données

# Objectifs du module

À la fin de ce module, vous devriez être capable de :

- ajuster et interpréter un modèle de régression linéaire;
- utiliser `predict()` pour obtenir des prédictions;
- comparer des valeurs observées et prédites;
- repérer des limites liées aux données manquantes;
- discuter prudemment des biais descriptifs dans des données ou des modèles.

# Lectures

Pour vous préparer, consultez les ressources suivantes :

- [Introduction to Modern Statistics - Chapitre 7 : Linear regression with a single predictor](https://openintro-ims.netlify.app/model-slr)
- [Introduction to Modern Statistics - Chapitre 8 : Linear regression with multiple predictors](https://openintro-ims.netlify.app/model-mlr)
- [Introduction to Modern Statistics - Chapitre 25 : Inference for linear regression with multiple predictors](https://openintro-ims.netlify.app/inf-model-mlr#sec-inf-mult-reg-soft)
- [Documentation R - `lm()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/lm.html)
- [Documentation R - `predict.lm()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/predict.lm.html)
- [Gouvernement du Canada - Guide sur la prise de décisions automatisée](https://www.canada.ca/en/government/system/digital-government/digital-government-innovations/responsible-use-ai/guide-scope-directive-automated-decision-making.html)
- [NIST SP 1270 - Towards a Standard for Identifying and Managing Bias in Artificial Intelligence](https://www.nist.gov/publications/towards-standard-identifying-and-managing-bias-artificial-intelligence)

Après les lectures, faites le [mini-test formatif du module 9](../module_09/mini_test.llms.md).

# Aventure

Vous incarnez une personne scientifique de données au ministère de l’Éducation du Québec. Votre mandat est double : construire un modèle prédictif à partir de données d’écoles primaires, puis explorer un jeu de données fictif pour y détecter un biais descriptif.

Lien vers l’aventure : [Aventure 9 - Prédiction et biais algorithmiques](../module_09/aventure.llms.md)

# Défi - Capsule vidéo

Vous devez réaliser une capsule vidéo de 180 secondes maximum. Vous choisirez soit le modèle prédictif de la Mission 1, soit l’analyse de biais de la Mission 2.

Consigne complète : [Défi 9 - Capsule vidéo](../module_09/defi.llms.md)

Dépôt de départ : `STT-1100/aventure-9`

# Exercices de consolidation

Les exercices sont indépendants de l’aventure et du défi. Ils utilisent deux jeux de données fictifs propres au module:

1.  `logements_energie_fictif.csv` pour ajuster une régression linéaire, produire des prédictions et examiner les erreurs;
2.  `subventions_culture_fictif.csv` pour comparer des taux d’acceptation et discuter les biais descriptifs avec prudence.

La série se termine par deux études de cas: une prévision de consommation résidentielle et un audit descriptif de demandes de subvention.

Lien vers les exercices: [Exercices de consolidation](../module_09/exercices.llms.md)
