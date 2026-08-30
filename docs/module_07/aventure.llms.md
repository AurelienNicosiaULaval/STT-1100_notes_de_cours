# Aventure 7 - Visualisation, éthique et sécurisation des données

STT-1100 - Introduction à la science des données

## Mise en contexte

Vous êtes une équipe mandatée par un comité d’éthique en science des données. Une organisation vous remet un rapport interne volontairement problématique sur des tests COVID-19 simulés. Le rapport contient des visualisations, des interprétations rapides et des renseignements personnels identifiables.

Votre mandat n’est pas seulement de refaire un graphique. Vous devez montrer qu’une analyse peut être techniquement reproductible, visuellement honnête et responsable envers les personnes représentées dans les données.

Carte de visite

Votre rôle Équipe mandatée en science des données responsable

Interlocuteur Comité d’éthique en science des données

Organisation et contexte Organisation fictive qui soumet un rapport interne problématique

Mission Auditer le rapport, préparer les données et corriger la communication visuelle

Données `covid_module7_douteux.csv`

Livrable Rapport éthique, fichier anonymisé et visualisations corrigées

## Dépôt de départ

Clonez le dépôt GitHub du module 7 depuis l’organisation du cours : `STT-1100/aventure-7`.

Le dépôt contient :

- `Rapport_COVID_Douteux.html` : rapport problématique à examiner;
- `Rapport_COVID_Douteux.qmd` : source Quarto du rapport problématique;
- `covid_module7_douteux.csv` : données simulées contenant volontairement des problèmes de qualité, de confidentialité et de ré-identification;
- `rapport_ethique.qmd` : squelette de rapport à compléter.

Le dépôt final doit contenir :

- `rapport_ethique.qmd` : votre rapport critique reproductible;
- `rapport_ethique.html` : la version rendue du rapport;
- `covid_module7_anonymise.csv` : une version anonymisée et mieux préparée des données;
- `README.md` : une courte description du projet et de la procédure de rendu;
- tout fichier supplémentaire réellement nécessaire.

## Partie 1 - Audit du rapport problématique

Lisez d’abord `Rapport_COVID_Douteux.html`, puis consultez `Rapport_COVID_Douteux.qmd` pour comprendre comment le rapport a été produit.

Repérez des problèmes dans au moins quatre dimensions :

- **visualisation** : axes tronqués, couleurs anxiogènes, échelles difficiles à lire, cartes trop précises, doubles axes trompeurs;
- **statistique** : interprétations causales non justifiées, petits effectifs, absence d’incertitude, sélection de période;
- **données** : valeurs incohérentes, dates dans plusieurs formats, résultats de tests codés de plusieurs façons, âges impossibles;
- **confidentialité** : noms, courriels, téléphones, dates de naissance, coordonnées, notes libres;
- **communication** : recommandations trop fortes, conflit d’intérêts non discuté, absence de limites.

Pour chaque problème retenu, indiquez :

1.  l’endroit où il apparaît;
2.  pourquoi c’est problématique;
3.  ce que vous changeriez.

## Partie 2 - Préparation responsable des données

À partir de `covid_module7_douteux.csv`, préparez une version mieux adaptée à une communication publique ou pédagogique.

Votre préparation doit au minimum :

- retirer les identifiants directs comme le nom, le courriel, le téléphone et la date de naissance;
- éviter de publier des coordonnées individuelles précises;
- créer une variable de résultat de test standardisée;
- transformer les dates de test dans un format analysable;
- regrouper ou traiter les valeurs d’âge impossibles ou trop précises;
- documenter les choix faits.

Exemple de point de départ :

``` r
library(tidyverse)
library(lubridate)

covid_brut <- readr::read_csv("covid_module7_douteux.csv", show_col_types = FALSE)

covid_prepare <- covid_brut |>
  mutate(
    date_test_parsee = suppressWarnings(lubridate::parse_date_time(
      date_test,
      orders = c("Y-m-d", "d/m/Y", "m-d-Y", "Y/m/d", "d-m-Y", "m/d/Y", "y/m/d", "d/m/y", "m/d/y")
    )),
    date_test_parsee = as.Date(date_test_parsee),
    resultat_standard = case_when(
      result %in% c("Positive", "Pos", "+") ~ "positif",
      result %in% c("Negative", "neg", "-") ~ "negatif",
      TRUE ~ NA_character_
    ),
    age_valide = if_else(age >= 0 & age <= 110, age, NA_real_),
    age_groupe = cut(
      age_valide,
      breaks = c(0, 18, 40, 60, 80, Inf),
      labels = c("0-17", "18-39", "40-59", "60-79", "80+"),
      right = FALSE
    )
  )
```

Cette étape n’a pas pour but d’effacer toute information utile. Elle vise à réduire les risques tout en gardant une analyse compréhensible.

## Partie 3 - Visualisations corrigées

Produisez au moins deux visualisations corrigées.

Chaque visualisation doit :

- utiliser une unité claire;
- éviter les axes tronqués non justifiés;
- montrer les effectifs lorsque les proportions sont comparées;
- éviter de publier des identifiants personnels;
- être accompagnée d’une interprétation prudente.

Une visualisation possible consiste à montrer le taux de positivité par arrondissement avec les effectifs.

``` r
positivite_arrondissement <- covid_prepare |>
  filter(!is.na(resultat_standard), !is.na(borough)) |>
  group_by(borough) |>
  summarise(
    n_tests = n(),
    n_positifs = sum(resultat_standard == "positif"),
    taux_positivite = n_positifs / n_tests,
    .groups = "drop"
  ) |>
  arrange(desc(taux_positivite))

positivite_arrondissement |>
  ggplot(aes(x = reorder(borough, taux_positivite), y = taux_positivite)) +
  geom_col(fill = "steelblue") +
  coord_flip() +
  scale_y_continuous(labels = scales::percent_format(accuracy = 1), limits = c(0, 1)) +
  labs(
    title = "Taux de positivité par arrondissement dans les données simulées",
    subtitle = "Les effectifs doivent être consultés avant toute interprétation",
    x = "Arrondissement",
    y = "Taux de positivité"
  )
```

## Partie 4 - Note éthique

Ajoutez une section “Note éthique” dans `rapport_ethique.qmd`.

Votre note doit répondre aux questions suivantes :

- Quelles informations ne devraient pas être publiées telles quelles?
- Quels risques de ré-identification demeurent même après retrait des noms?
- Quelles limites empêchent de formuler des recommandations fortes?
- Comment présenteriez-vous ces résultats à un public non spécialiste sans créer de panique ou de stigmatisation?

## Partie 5 - Conclusion personnelle

Chaque membre de l’équipe ajoute une courte conclusion personnelle d’environ cinq lignes.

Cette conclusion doit expliquer :

- un problème qu’il ou elle n’aurait peut-être pas remarqué avant ce module;
- une décision de visualisation ou d’anonymisation qu’il ou elle juge importante;
- une règle personnelle à retenir pour de futurs projets de science des données.

Travail réalisé

À la fin de l’aventure, vérifiez que votre travail comprend les éléments suivants. Il ne s’agit pas d’un portfolio séparé.

- une liste structurée des problèmes repérés dans le rapport douteux;
- le fichier anonymisé produit;
- deux visualisations corrigées;
- une note éthique expliquant les limites et les décisions de confidentialité.

## Vérification finale

Avant la remise, vérifiez que :

- `rapport_ethique.qmd` se rend en HTML sans erreur;
- le rapport contient au moins deux visualisations corrigées;
- `covid_module7_anonymise.csv` ne contient pas de nom, courriel, téléphone, date de naissance ou coordonnées individuelles précises;
- les limites de l’analyse sont clairement écrites;
- les recommandations restent descriptives et prudentes;
- le `README.md` explique comment rendre le rapport;
- le dépôt GitHub contient seulement les fichiers nécessaires.

Bonne analyse.
