# Défi 5 - Explorer les retards de vols

STT-1100 Introduction à la science des données

## Mission

Vous travaillez avec Dr Sofia Martínez au Port Authority Data Lab. Votre mission est de produire un court rapport exploratoire sur les retards des vols au départ de New York en 2023.

Le but n’est pas de prouver une cause unique. Le but est de montrer que vous savez préparer des variables temporelles, visualiser des relations, calculer des associations simples et interpréter les résultats avec prudence.

## Données de départ

Le fichier principal est `flights_merged_2023.rds`. Il contient 435 352 vols et 50 variables.

Commencez votre fichier `rapport.qmd` avec un bloc de préparation semblable à celui-ci.

``` r
library(tidyverse)
library(lubridate)

flights <- readRDS("flights_merged_2023.rds")

flights <- flights |>
  mutate(
    date = make_date(year, month, day),
    jour_semaine = wday(date, label = TRUE, abbr = FALSE),
    moment_journee = case_when(
      hour < 6 ~ "nuit",
      hour < 12 ~ "matin",
      hour < 18 ~ "après-midi",
      TRUE ~ "soir"
    ),
    age_avion = 2023 - plane_year
  )
```

## Questions à traiter

Votre rapport doit répondre aux trois questions suivantes.

1.  Quels créneaux horaires semblent associés aux plus grands retards au départ ?
2.  Les variables météo disponibles, par exemple `wind_gust`, `visib` ou `precip`, sont-elles associées aux retards ?
3.  Les avions plus âgés sont-ils plus souvent en retard ou annulés ?

Pour chaque question, vous devez inclure :

- une courte phrase qui précise ce que vous cherchez à comparer;
- au moins un tableau ou résumé numérique;
- au moins une visualisation;
- une interprétation concise;
- une phrase de prudence sur les limites de l’analyse.

## Points de vigilance

- Les retards annulés ont souvent `dep_time` et `dep_delay` manquants. Utilisez `is.na(dep_time)` pour mesurer les annulations.
- Les heures tardives peuvent contenir peu de vols. Affichez toujours le nombre de vols par groupe.
- Une corrélation ne prouve pas une relation de causalité.
- Les variables météo peuvent être manquantes. Indiquez brièvement comment vous les traitez.
- Les années de fabrication manquantes doivent être exclues ou signalées avant l’analyse de l’âge des avions.

## Livrables

Votre dépôt GitHub doit contenir les fichiers suivants :

- `rapport.qmd` : votre rapport reproductible;
- `rapport.html` : la version rendue du rapport;
- `flights_merged_2023.rds` : le fichier de données fourni;
- tout fichier supplémentaire réellement nécessaire à votre analyse.

Votre fichier `.qmd` doit pouvoir être rendu en HTML sans erreur.

## Structure suggérée

Vous pouvez utiliser cette structure.

``` markdown
# Introduction

# Préparation des données

# Question 1 : créneaux horaires

# Question 2 : météo et retards

# Question 3 : âge des avions

# Conclusion
```

## Grille d’évaluation

| Critère | Excellent | Satisfaisant | À améliorer |
|----|----|----|----|
| Préparation temporelle | Les variables de date, jour et créneau sont correctes et expliquées | Les variables principales sont créées | Les variables temporelles sont absentes ou incorrectes |
| Analyse des heures | Les retards sont comparés avec les tailles de groupes et un graphique clair | L’analyse répond à la question, mais les tailles de groupes sont peu discutées | L’analyse est vague ou non reliée à la question |
| Analyse météo | Les associations sont quantifiées, visualisées et interprétées avec prudence | Une relation météo est explorée, mais l’interprétation reste limitée | La météo est présentée comme une cause sans justification |
| Analyse des avions | L’âge et les annulations sont traités avec les valeurs manquantes | L’âge est analysé, mais les limites sont peu discutées | Les variables d’âge ou d’annulation sont mal utilisées |
| Communication | Le rapport est clair, reproductible et bien structuré | Le rapport est compréhensible, mais pourrait être mieux organisé | Le rapport est difficile à suivre ou ne rend pas correctement |

## Checklist avant remise

- Le fichier `rapport.qmd` se rend en HTML.
- Les packages nécessaires sont chargés explicitement.
- Les données sont lues avec `readRDS("flights_merged_2023.rds")`.
- Chaque graphique a un titre et des axes compréhensibles.
- Les conclusions restent descriptives et prudentes.
- Le dépôt GitHub contient les fichiers attendus.
