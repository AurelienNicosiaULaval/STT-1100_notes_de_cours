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

## Préparer le module

### Prérequis

Reprenez un graphique du module 5 et une décision de nettoyage du module 4. Ce module demande de relier une sortie technique à ses conséquences pour les personnes représentées.

### Parcours minimal

Repérez un problème de graphique, un risque de réidentification et une limite de l’analyse, puis proposez une correction vérifiable. Une note éthique courte et précise est préférable à une promesse générale.

### CRAP et FAIR en pratique

Utilisez CRAP pour examiner contraste, répétition, alignement et proximité dans une visualisation. Utilisez FAIR pour demander si les données et leur documentation peuvent être trouvées, comprises et réutilisées de façon responsable.

### Lectures et aide

Commencez par les ressources indispensables indiquées dans le plan, puis gardez les lectures d’approfondissement pour la révision. En cas de doute, ne publiez pas une information potentiellement identifiante.

## Plan d’apprentissage

Les cartes reprennent les cinq étapes du plan: lectures, aventure, défi, exercices et rétroaction avec ou sans IA. L’aventure et le défi forment le fil narratif du module. Les exercices sont autonomes et servent à consolider les mêmes réflexes dans d’autres contextes. La rétroaction revient sur un élément du travail déjà réalisé; elle ne demande aucune remise supplémentaire.

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

Pourquoi Les exercices utilisent des données réelles agrégées de Sherbrooke, de Statistique Canada et de Données Québec afin de pratiquer une diffusion responsable sans répéter le défi.

Avant d'ouvrir une solution, formulez le risque éthique ou visuel que vous cherchez à réduire.

5 Rétroaction Faire relire un extrait du travail, puis décider quoi améliorer soi-même. [Démarche et exemples](../ia.llms.md#feedback-cycle) Ouvrir la carteRéduire

### Rétroaction: un graphique honnête et des données protégées

Après une première tentative, choisissez un point à améliorer sur la visualisation responsable et les limites de la protection des données. Utilisez la [démarche de rétroaction](../ia.llms.md#feedback-cycle) avec ou sans IA; cette routine n'ajoute pas de remise aux consignes.

Une demande adaptée au module 7

> Je travaille sur la visualisation responsable et les limites de la protection des données. Voici la consigne, les critères pertinents et un graphique et une note éthique fondés sur des données fictives ou dont le partage est autorisé. Relève un point réussi et au maximum deux améliorations, dont un choix visuel trompeur ou une affirmation de confidentialité insuffisamment justifiée si les éléments fournis le montrent. Cite le passage concerné, distingue erreur observable et point à vérifier, puis propose un indice et un test. Ne réécris pas mon travail et attends ma correction.

- Vérifier: Comparez les axes, les échelles et les groupes aux données. Examinez les informations qui pourraient permettre une réidentification; une validation de l'IA ne suffit pas à autoriser leur partage.
- Revenir sur la correction: présentez le changement et le résultat du test, puis demandez ce qui reste à vérifier.
- Refaire sans aide: Expliquez un choix de visualisation et une limite de la protection proposée, sans exposer de données sensibles.

Sans IA, comparez votre tentative aux critères et aux exemples du cours, puis faites les mêmes vérifications. Gardez une trace courte dans la [fiche de suivi](../ia.llms.md#feedback-trace), si elle vous est utile.

Confidentialité Ne transmettez aucune donnée personnelle, confidentielle ou protégée.

## Données et outils

### Bases de données

[Télécharger le dossier de travail du module (.zip)](../downloads/donnees/stt1100-module-07-fr.zip)

[covid_module7_douteux.csv](../donnees.llms.md#dataset-card-covid-module-07) [Incidents agrégés de Sherbrooke](data/incidents_securite_sherbrooke_agreges.csv) [Population de Sherbrooke](data/population_sherbrooke_2022_2024.csv) [Sondage des utilisateurs de Données Québec](data/sondage_utilisateurs_donnees_quebec_2020_2025.csv)

### Packages R

[tidyverse](../packages.llms.md#tidyverse) [ggplot2](../packages.llms.md#ggplot2) [dplyr](../packages.llms.md#dplyr) [readr](../packages.llms.md#readr) [lubridate](../packages.llms.md#lubridate) [scales](../packages.llms.md#scales)
