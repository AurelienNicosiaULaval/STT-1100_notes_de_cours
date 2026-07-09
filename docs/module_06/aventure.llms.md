# Aventure 6 - Collaboration et reproductibilité dans GitHub

STT-1100 - Introduction à la science des données

## Mise en contexte

Vous êtes une équipe de scientifiques de données travaillant avec Dr Sofia Martinez au Port Authority Data Lab. Votre mandat est de produire un **rapport collaboratif et reproductible** sur les retards de vols au départ de JFK en 2023.

Cette aventure change volontairement de niveau. Dans les modules précédents, vous avez surtout travaillé individuellement. Ici, le produit important n’est pas seulement le graphique final. C’est aussi la trace de collaboration : branches, commits, pull requests, résolution de conflits, rendu HTML et décisions documentées.

Le rapport sera produit avec **Quarto**, versionné dans **GitHub** et basé sur les tables du package **`nycflights23`** : `flights`, `airlines` et `weather`.

Carte de visite

Votre rôle Équipe de scientifiques de données

Interlocutrice Dr Sofia Martinez

Organisation et contexte Port Authority Data Lab

Mission Produire un rapport collaboratif et reproductible sur les retards à JFK

Données `nycflights23::flights`, `airlines` et `weather`

Livrable Rapport collaboratif, rendu HTML, README et traces GitHub

## Dépôt de départ

Clonez le dépôt GitHub du module 6 depuis l’organisation du cours : `STT-1100/aventure-6`.

Le dépôt de départ contient un squelette de rapport. Votre équipe doit le compléter, le rendre en HTML et pousser la version finale sur GitHub.

Le dépôt final doit contenir :

- `rapport.qmd` : le rapport collaboratif reproductible;
- `rapport.html` : la version rendue du rapport;
- `README.md` : une courte description du projet, des rôles et de la procédure de rendu;
- tout fichier supplémentaire réellement nécessaire.

Ne conservez pas de fichiers inutiles comme `Untitled.R`, `rapport_final_final.qmd` ou des copies temporaires.

## Partie 1 - Collaboration avec GitHub

### Formation des équipes et rôles

Travaillez en **équipes de 3 à 4 personnes**. Chaque membre prend un rôle principal. Les rôles servent à structurer le travail, mais toute l’équipe reste responsable du résultat final.

| Rôle | Responsabilités techniques | Lien avec le cycle de vie des données | Contribution minimale |
|----|----|----|----|
| **Responsable du dépôt** | Structure le dépôt, crée les branches, gère les pull requests et les fusions | Versionnage, traçabilité, partage | Met à jour le `README.md`, coordonne les branches et fusionne dans `main` |
| **Analyste des données** | Prépare les données et les jointures | Préparation et transformation | Crée le tableau `vols_jfk` en joignant `flights`, `airlines` et `weather` |
| **Chargé·e de la reproductibilité** | Vérifie le rendu, les packages, les chunks et le texte dynamique | Documentation et reproductibilité | Ajoute une phrase avec au moins trois morceaux de code en ligne |
| **Visualiseur·se** | Produit les graphiques et améliore leur lisibilité | Communication des résultats | Ajoute au moins deux visualisations interprétables |

### Séquence de travail recommandée

1.  **Responsable du dépôt** : clone le dépôt, ouvre le projet dans RStudio, vérifie que `rapport.qmd` se rend, puis crée une branche par rôle.

2.  **Chargé·e de la reproductibilité** : travaille dans sa branche, organise les sections du rapport, vérifie le YAML et ajoute une section “Rôles de l’équipe”.

3.  **Analyste des données** : travaille dans sa branche, ajoute le chunk `setup`, prépare les jointures et crée le tableau `vols_jfk`.

4.  **Visualiseur·se** : travaille dans sa branche, ajoute les graphiques et les titres nécessaires.

5.  Chaque membre pousse sa branche et ouvre une **pull request**.

6.  Le responsable du dépôt fusionne les pull requests une par une. Si un conflit survient, l’équipe le résout ensemble et documente brièvement ce qui s’est passé.

## Partie 2 - Analyse reproductible avec données fusionnées

### Préparation attendue

Le rapport doit charger explicitement les packages nécessaires.

``` r
library(tidyverse)
library(nycflights23)
```

Créez ensuite un tableau fusionné pour les vols de JFK.

``` r
vols_jfk <- flights |>
  filter(origin == "JFK") |>
  left_join(airlines, by = "carrier") |>
  left_join(
    weather,
    by = c("origin", "year", "month", "day", "hour")
  )
```

Cette jointure ajoute le nom complet du transporteur et les conditions météo associées à l’aéroport, au jour et à l’heure du vol.

Avant d’interpréter les résultats, vérifiez la taille du tableau et les valeurs manquantes importantes.

``` r
vols_jfk |>
  summarise(
    n_vols = n(),
    n_transporteurs = n_distinct(carrier),
    dep_delay_manquant = sum(is.na(dep_delay)),
    wind_gust_manquant = sum(is.na(wind_gust))
  )
```

### Questions d’analyse

Votre rapport doit répondre aux trois questions suivantes.

1.  Quels transporteurs ont les retards moyens au départ les plus élevés à JFK?
2.  Les conditions météo disponibles, par exemple `wind_gust`, `visib` ou `precip`, semblent-elles associées aux retards?
3.  Quelles limites faut-il mentionner avant de transformer ces constats en recommandations opérationnelles?

Pour les questions 1 et 2, incluez :

- une courte phrase qui précise ce que vous comparez;
- au moins un résumé numérique;
- au moins une visualisation;
- une interprétation prudente.

Pour la question 3, incluez :

- au moins deux limites concrètes de l’analyse;
- une explication de ce qui peut être décrit avec ces données et de ce qui ne peut pas être conclu;
- une conclusion prudente avant toute recommandation opérationnelle.

### Exemples de points de départ

Retard moyen par transporteur :

``` r
retards_transporteurs <- vols_jfk |>
  group_by(name) |>
  summarise(
    n_vols = n(),
    retard_moyen = mean(dep_delay, na.rm = TRUE),
    .groups = "drop"
  ) |>
  filter(n_vols >= 500) |>
  arrange(desc(retard_moyen))
```

Visualisation possible :

``` r
retards_transporteurs |>
  slice_max(retard_moyen, n = 8) |>
  ggplot(aes(x = reorder(name, retard_moyen), y = retard_moyen)) +
  geom_col(fill = "steelblue") +
  coord_flip() +
  labs(
    title = "Transporteurs avec les retards moyens les plus élevés à JFK",
    x = "Transporteur",
    y = "Retard moyen au départ (minutes)"
  )
```

Relation météo et retards :

``` r
vols_jfk |>
  filter(!is.na(wind_gust), !is.na(dep_delay)) |>
  slice_sample(n = 5000) |>
  ggplot(aes(x = wind_gust, y = dep_delay)) +
  geom_point(alpha = 0.2) +
  geom_smooth(method = "lm", se = FALSE, color = "firebrick") +
  labs(
    title = "Rafales de vent et retards au départ",
    x = "Rafales de vent",
    y = "Retard au départ (minutes)"
  )
```

Exemple de phrase reproductible avec du code en ligne :

``` markdown
Le tableau fusionné contient `r nrow(vols_jfk)` vols au départ de JFK, couvre `r n_distinct(vols_jfk$carrier)` transporteurs et présente un retard moyen de `r round(mean(vols_jfk$dep_delay, na.rm = TRUE), 1)` minutes.
```

## Partie 3 - Journal de collaboration

Ajoutez une section “Journal de collaboration” dans `rapport.qmd`.

Chaque membre doit y écrire un court paragraphe indiquant :

- son rôle dans l’équipe;
- sa contribution principale;
- une difficulté rencontrée avec GitHub, Quarto ou les données;
- la manière dont cette difficulté a été résolue;
- ce qu’il ou elle retient sur la collaboration reproductible.

Le responsable du dépôt doit initialiser cette section et prévoir un sous-titre pour chaque membre.

## Partie 4 - Cycle de vie des données

Ajoutez une section expliquant comment votre projet illustre les étapes suivantes :

1.  collecte;
2.  transformation;
3.  analyse;
4.  communication;
5.  partage, réutilisation et versionnage.

Trace portfolio

La trace de collaboration compte autant que le graphique final.

- une branche ou une pull request liée à votre rôle;
- la table jointe utilisée dans le rapport;
- deux visualisations ou éléments reproductibles ajoutés au rapport;
- une entrée de journal décrivant une décision, une difficulté ou un conflit GitHub.

## Vérification finale

Avant la remise, vérifiez que :

- `rapport.qmd` se rend en HTML sans erreur;
- le rapport contient au moins deux visualisations;
- chaque membre a fait au moins deux commits significatifs;
- les pull requests ont été fusionnées dans `main`;
- le `README.md` explique le rôle de chaque membre et la procédure de rendu;
- les conclusions restent descriptives et prudentes;
- le dépôt GitHub contient `rapport.qmd`, `rapport.html` et les fichiers nécessaires.

Bonne collaboration!
