# Défi 7 - Note éthique et visualisations responsables

STT-1100 Introduction à la science des données

## Mission

Dans l’aventure 7, vous avez audité un rapport problématique et préparé une version plus responsable des données. Le défi consiste à transformer ce travail en une note courte, claire et réutilisable.

Votre objectif est de convaincre une personne lectrice que vos visualisations améliorées sont plus honnêtes que la version initiale, et que vos choix de protection des données réduisent réellement les risques.

## Travail attendu

Ce défi est individuel. À partir du dépôt du module 7 qui vous a été attribué, produisez une version finale de `rapport_ethique.qmd`.

Le rapport doit contenir :

- une section “Problèmes repérés” avec au moins cinq problèmes précis;
- une section “Données anonymisées” qui décrit les colonnes retirées, regroupées ou transformées;
- une section “Visualisations responsables” avec au moins deux visualisations corrigées;
- une section “Limites” qui explique ce que les données ne permettent pas de conclure;
- une courte conclusion personnelle.

## Fichier anonymisé

Votre dépôt doit aussi contenir un fichier `covid_module7_anonymise.csv`.

Ce fichier ne doit pas contenir :

- noms;
- courriels;
- numéros de téléphone;
- dates de naissance;
- coordonnées individuelles précises;
- notes libres permettant d’identifier une personne.

Avant l’export, examinez aussi les identifiants persistants et les combinaisons de quasi-identifiants comme le code postal, l’établissement, l’unité, le lit, l’âge et la date. Justifiez les colonnes conservées et discutez les risques résiduels.

Si vous conservez des variables sensibles comme l’âge, le sexe, l’occupation ou certaines conditions médicales, expliquez pourquoi elles sont nécessaires et comment vous réduisez le risque de ré-identification.

## Visualisations

Pour une visualisation temporelle, examinez les dates ambiguës, la période et les effectifs avant de calculer les taux. Expliquez les exclusions et les limites.

Chaque visualisation doit :

- utiliser une échelle honnête;
- éviter les couleurs qui suggèrent un jugement non justifié;
- afficher ou mentionner les effectifs;
- porter un titre descriptif;
- être accompagnée d’une interprétation prudente.

Une bonne réponse ne cherche pas à produire les graphiques les plus spectaculaires. Elle cherche à produire des graphiques que l’on peut défendre.

## Livrables

Votre dépôt GitHub doit contenir :

- `rapport_ethique.qmd`;
- `rapport_ethique.html`;
- `covid_module7_anonymise.csv`;
- `README.md`;
- les fichiers de départ si vous les avez conservés pour documenter votre démarche.

## Grille d’évaluation

| Critère | Excellent | Satisfaisant | À améliorer |
|----|----|----|----|
| Audit critique | Les problèmes sont précis, variés et appuyés sur des éléments observables | Les problèmes sont pertinents, mais parfois généraux | Les problèmes sont vagues ou incomplets |
| Anonymisation | Les identifiants directs sont retirés et les risques résiduels sont discutés | Les identifiants directs sont retirés, mais la discussion reste limitée | Des informations identifiantes demeurent |
| Visualisation | Les graphiques sont clairs, honnêtes, lisibles et interprétés avec prudence | Les graphiques sont compréhensibles, mais certaines décisions restent peu justifiées | Les graphiques reproduisent des biais de la version initiale ou une seule visualisation est fournie |
| Reproductibilité | Le rapport se rend sans erreur et le README explique la procédure | Le rapport se rend, mais la procédure est peu documentée | Le rapport ne se rend pas ou les fichiers nécessaires manquent |

## Checklist avant remise

- `rapport_ethique.qmd` se rend sans erreur.
- `rapport_ethique.html` est présent.
- `covid_module7_anonymise.csv` ne contient pas d’identifiants directs.
- Le rapport contient au moins deux visualisations corrigées.
- Les limites sont explicitement formulées.
- Les conclusions restent descriptives et prudentes.
