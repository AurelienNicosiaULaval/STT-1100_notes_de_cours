# Visualisation, éthique et sécurisation des données

Module 07

Relier visualisation, responsabilité et protection des données.

Fil principalVisualisation responsable et confidentialité

DonnéesDonnées COVID et cas éthiques

DéfiVisualisations commentées et note éthique

## Produit fini du module

Produit final

### Des visualisations responsables accompagnées d’une note éthique

Le résultat attendu montre des données sensibles avec retenue et explicite les choix de protection, de lecture et de communication.

**visualisations éthiques**

message clair

risques notés

données protégées

message clair risques notés données protégées

## Objectifs du module

À la fin de ce module, vous devriez être capable de:

- Identifier des problèmes éthiques dans des visualisations.
- Anonymiser correctement des données.
- Appliquer les bonnes pratiques de visualisation pour représenter les données de manière claire et honnête.
- Identifier et éviter les biais de présentation des données.
- Comprendre les enjeux éthiques et de confidentialité liés à la science des données.
- Mettre en place des mesures de protection et de sécurisation des données sensibles.
- Expliquer les principes CRAP.
- Expliquer les principes FAIR.

## Plan d’apprentissage

Les cartes reprennent les quatre blocs du plan: lectures, aventure, défi, exercices. L’aventure et le défi forment le fil narratif du module. Les exercices sont autonomes et servent à consolider les mêmes réflexes dans d’autres contextes.

1 Lectures à faire Préparer visualisations responsables, confidentialité et éthique. Dans la carte Ouvrir la carteRéduire

### Lectures

Pour vous préparer, consultez les ressources suivantes :

- [R for Data Science - Communication](https://r4ds.hadley.nz/communication.html)
- [Fundamentals of Data Visualization - Directory of visualizations](https://clauswilke.com/dataviz/directory-of-visualizations.html)
- [Royal Statistical Society - Best Practices for Data Visualisation](https://royal-statistical-society.github.io/datavisguide/RSS-data-vis-guide.pdf)
- [Gouvernement du Québec - Anonymisation](https://www.quebec.ca/gouvernement/travailler-gouvernement/normes-gouvernance-pratiques-internes/protection-des-renseignements-personnels/anonymisation)
- [CNIL - L'anonymisation de données personnelles](https://www.cnil.fr/fr/technologies/lanonymisation-de-donnees-personnelles)
- [Wilkinson et al. (2016) - FAIR Guiding Principles](https://www.nature.com/articles/sdata201618)

#### Aide-mémoire Posit

- [Data visualization with ggplot2 :: Cheat Sheet](https://rstudio.github.io/cheatsheets/data-visualization.pdf)
  Référence rapide pour reconstruire des visualisations lisibles et défendables.

Vérification Après les lectures, faites le [mini-test formatif](mini_test.llms.md).

2 Aventure Transformer des données sensibles en messages visuels prudents. [Aventure](aventure.llms.md) Ouvrir la carteRéduire

Objectif Passer de la lecture à la pratique guidée.

Ressource [Page Aventure](aventure.llms.md)

Action Suivre les consignes, exécuter le code et garder les sorties importantes.

Résultat Un premier objet de travail que vous pouvez expliquer.

Arrêtez-vous après chaque résultat important et formulez ce qu’il montre.

3 Défi Analyser des visualisations avec une note éthique argumentée. [Défi](defi.llms.md) Ouvrir la carteRéduire

### Défi - Analyse éthique et visualisations responsables

Vous transformerez l'audit de l'aventure en note éthique reproductible :

- identifier des problèmes précis dans le rapport initial;
- produire une version anonymisée des données;
- créer deux visualisations corrigées et défendables;
- formuler les limites et les risques résiduels.

[Consulter le défi 7](defi.llms.md)

4 Exercices Pratiquer graphiques responsables, anonymisation et notes éthiques. [Exercices](exercices.llms.md) Ouvrir la carteRéduire

Ressource [Page Exercices](exercices.llms.md)

Pourquoi Les exercices utilisent des données fictives différentes de l'aventure afin de consolider les principes sans répéter le défi.

Avant d'ouvrir une solution, formulez le risque éthique ou visuel que vous cherchez à réduire.

## Données et outils

### Bases de données

[covid_module7_douteux.csv](../donnees.llms.md#dataset-card-covid-module-07) [signalements_municipaux_fictif.csv](../donnees.llms.md#dataset-card-module07-signalements) [population_quartiers_fictif.csv](../donnees.llms.md#dataset-card-module07-population) [sondage_etudiant_fictif.csv](../donnees.llms.md#dataset-card-module07-sondage)

### Packages R

[tidyverse](../packages.llms.md#tidyverse) [ggplot2](../packages.llms.md#ggplot2) [dplyr](../packages.llms.md#dplyr) [readr](../packages.llms.md#readr) [lubridate](../packages.llms.md#lubridate) [scales](../packages.llms.md#scales)

## Révision et prolongement

### Finir le module avec l’IA du cours

Ouvrez [la page IA](../ia.llms.md) ou [GPT STT-1100](https://chatgpt.com/g/g-682d165f32e881918633affa3fe9dfd6-gpt-stt-1100), puis demandez une rétroaction ciblée:

*Voici mon travail pour ce module. Questionne mon raisonnement, repère une ligne de code fragile, vérifie si mon interprétation répond à la consigne, puis propose une seule amélioration réaliste que je peux faire moi-même.*

- Expliquez le produit fini en trois phrases.
- Collez un extrait de code ou de sortie et demandez un diagnostic.
- Demandez une variante plus ambitieuse, puis choisissez ce qui reste raisonnable.
