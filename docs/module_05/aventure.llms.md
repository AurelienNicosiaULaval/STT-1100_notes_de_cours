# Aventure 5 - Explorer et comprendre les relations entre les données

STT-1100 Introduction à la science des données

## Mise en situation - Aventure 5

Tu enfiles les chaussures (et le badge sécurisé !) d’un·e **statisticien·ne des opérations aéroportuaires** fraîchement recruté·e par la **Port Authority Data Lab (PADL)**, l’équipe d’analytique du **Port Authority of New York & New Jersey**.
Ta mission : aider l’aéroport **JFK** (et, à terme, **EWR** et **LGA**) à fluidifier les départs et à réduire le **temps perdu au sol**.

- **Ta coéquipière** : **Dr Sofia Martínez**, data-scientist senior reconnue pour ses visualisations interactives percutantes. Sofia pose les bonnes questions, valide tes hypothèses et t’ouvre l’accès aux ressources internes.
- **Le jeu de données** : **Alex Chen**, data engineer au PADL, t’a préparé un fichier **`flights_merged_2023.rds`** qui regroupe en une seule table exhaustive les vols 2023, la météo à l’heure de départ, les infos avion, les noms complets des compagnies et la géolocalisation des aéroports d’origine et de destination.
- **Contexte concret** : le Board des opérations veut savoir *quand* et *pourquoi* les retards explosent, comment la météo influe sur les connexions, et quelles compagnies devraient revoir leur plan de vol. Tes livrables (rapports Quarto + visualisations) orienteront les décisions budgétaires pour l’été 2026.

> **Brief de Sofia**
> 1. Quels créneaux horaires affichent systématiquement les retards les plus élevés ?
> 2. Les variables météo disponibles sont-elles associées aux retards, et jusqu’où peut-on interpréter cette association ?
> 3. Les avions plus âgés (\> 20 ans) sont-ils davantage sujets aux annulations ?
>
> À toi de jouer !

Carte de visite

Votre rôle Statisticien·ne des opérations aéroportuaires

Interlocuteurs Dr Sofia Martínez et Alex Chen

Organisation et contexte Port Authority Data Lab, avec un mandat centré sur JFK

Mission Analyser les retards, la météo et la flotte pour éclairer les opérations

Données `flights_merged_2023.rds`

Livrable Rapport Quarto HTML avec visualisations et interprétations

## Objectifs de l’aventure

- Utiliser les fonctions de `lubridate` pour manipuler et enrichir les données temporelles.
- Réaliser une analyse exploratoire des données (EDA) pour mieux comprendre leur structure et identifier des patterns intéressants.
- Visualiser les relations entre variables à l’aide de `ggplot2`.
- Interpréter des résultats statistiques simples, comme la corrélation.
- Répondre à des questions concrètes en lien avec des enjeux réels (retards, météo, flotte d’avions).

> **NOTE:**
>
> - Vous manipulez explicitement des dates et heures avec `lubridate`.
> - Vous analysez des relations entre variables plutôt que des distributions isolées.
> - Vous utilisez la corrélation comme mesure d’association, sans conclure trop vite à une causalité.
> - Vous tenez compte de la taille des groupes avant de comparer des moyennes ou des proportions.

## Comment réussir cette aventure ?

Voici quelques conseils de Sofia pour bien réussir ta mission :

- Commence par **explorer les données** et comprendre leur structure. Tu peux utiliser `glimpse()`, `summary()`, ou même un tableau interactif.
- Utilise les fonctions de `lubridate` pour créer des colonnes temporelles utiles (jour, mois, heure, etc.).
- Pour chaque question, **structure ton analyse** :
  - explique ce que tu cherches à tester ;
  - montre ton code ;
  - interprète le résultat.
- Privilégie des visualisations claires et bien annotées. N’oublie pas d’ajouter des titres, axes, etc.
- Commente ton code au besoin. Imagine que tu travailles en équipe avec Sofia !

Et surtout… **pose-toi des questions** ! L’important, c’est de développer ton raisonnement analytique.

## GitHub et rendu

Comme pour les aventures précédentes :

- **Clonez** le dépôt GitHub du module 5 depuis l’organisation du cours. Vous pouvez utiliser la cheat sheet du cours si vous avez un trou de mémoire.

- Travaillez dans RStudio et **faites des commits régulièrement** pour documenter votre avancement.

- Votre dépôt doit contenir :

  - un fichier **`rapport.qmd`** bien structuré contenant :

    - votre code R ;

    - des visualisations commentées ;

    - des interprétations claires pour chaque analyse demandée ;

    - des encadrés `callout` (type `.tip`, `.warning`, etc.) pour faire ressortir vos conclusions ;

  - un fichier **`rapport.html`** généré à partir du `.qmd` (vous pouvez utiliser le bouton “Render” dans RStudio) ;

  - le jeu de données **`flights_merged_2023.rds`** ;

  - tous les autres fichiers réellement nécessaires à la reproduction de votre travail.

- Le dépôt doit rester **propre et bien organisé** :

  - ne conservez pas les fichiers inutiles ;
  - évitez les noms de fichiers comme `Untitled1.Rmd` ou `copie rapport final.qmd` ;
  - commentez vos commits avec des messages clairs et descriptifs.

> **Rappel** : Le `.qmd` est votre document principal. Il doit permettre à n’importe quel·le membre de l’équipe (ou à Sofia !) de comprendre ce que vous avez fait et pourquoi.

## Comprendre et manipuler les dates avec `lubridate`

Avant de plonger dans les analyses de retard et de performance, Sofia souhaite s’assurer que tu maîtrises bien la gestion des **dates et heures** en R. Le package `lubridate` est un outil incontournable pour cela.

Commence ton document par charger les packages et les données. Tous les exemples qui suivent supposent que l’objet `flights` existe.

``` r
library(tidyverse)
library(lubridate)

flights <- readRDS("flights_merged_2023.rds")

glimpse(flights)
```

Avant toute interprétation, vérifie aussi l’ampleur du tableau et les valeurs manquantes dans les variables qui seront utilisées.

``` r
flights %>%
  summarise(
    n_vols = n(),
    n_colonnes = ncol(flights),
    dep_delay_manquant = sum(is.na(dep_delay)),
    dep_time_manquant = sum(is.na(dep_time)),
    plane_year_manquant = sum(is.na(plane_year))
  )
```

### Fonctionnalités essentielles

Voici les principales fonctions que tu utiliseras :

| Fonction | Utilité |
|----|----|
| `make_date()` | Crée une variable de type `Date` à partir de `year`, `month`, `day` |
| `make_datetime()` | Crée un objet temporel complet (`POSIXct`) avec `hour` |
| `wday()` | Donne le jour de la semaine |
| `month()` | Donne le mois |
| `hour()` | Extrait l’heure |
| `ymd()` | Transforme une chaîne comme `"2023-01-01"` en `Date` |
| `floor_date()` | Tronque une date à la journée, semaine, mois, etc. |

``` r
# Exemple de création de date et datetime
flights <- flights %>%
  mutate(
    date = make_date(year, month, day),
    datetime = make_datetime(year, month, day, hour)
  )
```

### Exercice 1 - Quelle est la structure de la date ?

**Sofia te demande** : *Crée une variable `date` à partir des colonnes `year`, `month` et `day`, puis utilise `class()` pour vérifier le type de cette nouvelle variable.*

> **TIP:**
>
> **Réponse de Sofia**
> Tu peux utiliser :
>
> ``` r
> flights <- flights %>% mutate(date = make_date(year, month, day))
> class(flights$date)
> ```
>
> Le type attendu est `"Date"`. Tu peux désormais manipuler cette variable avec toutes les fonctions temporelles !

### Exercice 2 - Jour de la semaine

**Sofia te demande** : *Ajoute une colonne `jour_semaine` qui donne le jour de la semaine (lundi, mardi, etc.) pour chaque vol. Affiche les 7 premiers résultats.*

> **TIP:**
>
> **Réponse de Sofia**
> Voici une façon de faire :
>
> ``` r
> flights <- flights %>%
>   mutate(jour_semaine = wday(date, label = TRUE, abbr = FALSE))
>
> head(flights$jour_semaine, 7)
> ```
>
> Cela utilise `label = TRUE` pour obtenir le nom complet (et non un chiffre).

### Exercice 3 - Créneau horaire

**Sofia te demande** : *Crée une variable `moment_journee` qui classe les vols en “nuit”, “matin”, “après-midi” ou “soir” selon l’heure prévue de départ.*

> **TIP:**
>
> **Réponse de Sofia**
> Voici une suggestion :
>
> ``` r
> flights <- flights %>%
>   mutate(moment_journee = case_when(
>     hour < 6  ~ "nuit",
>     hour < 12 ~ "matin",
>     hour < 18 ~ "après-midi",
>     TRUE      ~ "soir"
>   ))
> ```
>
> Tu peux ensuite explorer les retards selon ces créneaux temporels.

### Exercice 4 - Est-ce un week-end ?

**Sofia te demande** : *Ajoute une variable logique `weekend` qui vaut `TRUE` si le vol a lieu un samedi ou un dimanche.*

> **TIP:**
>
> **Réponse de Sofia**
> Utilise :
>
> ``` r
> flights <- flights %>%
>   mutate(weekend = jour_semaine %in% c("samedi", "dimanche"))
> ```
>
> N’oublie pas que `jour_semaine` est une variable factor avec labels.

## Explorer et comprendre les relations entre les données

Maintenant que tu es à l’aise avec les dates et les heures, Sofia souhaite t’introduire à une étape clé de tout projet en science des données : **l’analyse exploratoire des données**, souvent abrégée en **EDA** (*Exploratory Data Analysis*).

L’objectif est simple : **comprendre la structure des données, repérer des patterns, des anomalies, ou des corrélations intéressantes entre les variables**.

### Outils à ta disposition

Tu peux t’appuyer sur :

- **Statistiques descriptives** : `summary()`, `mean()`, `median()`, `sd()`, `n_distinct()`, etc.
- **Visualisation** avec `ggplot2` :
  - `geom_histogram()` ou `geom_density()` pour les distributions
  - `geom_point()` pour visualiser des relations entre deux variables numériques
  - `geom_boxplot()` pour comparer une variable numérique selon une variable catégorique
  - `geom_bar()` pour des variables catégoriques
- **Tableaux croisés** avec `count()`, `group_by()` + `summarise()`
- **Corrélations** avec `cor()` ou `ggcorrplot::ggcorrplot()` pour une matrice graphique

Sofia te propose maintenant d’examiner des **questions concrètes** liées à la performance des vols et aux retards. Tu devras analyser les données pour proposer une interprétation claire.

------------------------------------------------------------------------

### Analyse 1 - À quelle heure faut-il éviter de partir ?

> **NOTE:**
>
> **Contexte** : Le gestionnaire des opérations de JFK a observé que les retards semblent plus fréquents à certaines heures de la journée. Il souhaite valider s’il existe des **créneaux critiques** à éviter pour les départs.

**Sofia te demande** : *Fais une analyse pour identifier les heures de la journée où les retards au départ (`dep_delay`) sont les plus élevés en moyenne. Visualise cette relation avec un graphique clair.*

> **TIP:**
>
> **Réponse de Sofia**
> Tu peux regrouper les vols par heure et calculer la moyenne des retards :
>
> ``` r
> flights %>%
>   group_by(hour) %>%
>   summarise(
>     n_vols = n(),
>     moyenne_retard = mean(dep_delay, na.rm = TRUE),
>     .groups = "drop"
>   ) %>%
>   ggplot(aes(x = hour, y = moyenne_retard)) +
>   geom_col(fill = "steelblue") +
>   labs(title = "Retard moyen au départ selon l'heure",
>        x = "Heure prévue de départ",
>        y = "Retard moyen (minutes)")
> ```
>
> Attention : ne te laisse pas piéger par les heures tardives avec peu de vols. Utilise la colonne `n_vols` pour repérer les groupes trop petits.

### Analyse 2 - La météo est-elle vraiment liée aux retards ?

> **NOTE:**
>
> **Contexte** : Certains gestionnaires accusent systématiquement la météo pour les retards. Sofia te propose d’examiner cette idée à l’aide des données météo jointes aux vols. Ton objectif est de mesurer des **associations**, sans conclure trop vite à une cause directe.

**Sofia te demande** : *Choisis une ou deux variables météo (ex : `wind_gust`, `visib`, `precip`) et examine leur relation avec les retards (`dep_delay`).*

Avant de plonger dans les visualisations, un petit détour par un concept clé : la **corrélation**.

#### Qu’est-ce que la corrélation ?

La corrélation mesure la **force et la direction d’une relation linéaire** entre deux variables numériques. Sa valeur est comprise entre :

- **-1** : corrélation parfaitement **négative** (quand l’une augmente, l’autre diminue),
- **0** : **aucune relation linéaire** détectée,
- **+1** : corrélation parfaitement **positive** (les deux variables augmentent ensemble).

Par exemple, si les rafales de vent (`wind_gust`) augmentent et que les retards aussi, on devrait observer une **corrélation positive**.

------------------------------------------------------------------------

#### Étape 1 - Calculer la corrélation

``` r
flights %>%
  select(dep_delay, wind_gust, visib, precip) %>%
  cor(use = "complete.obs") %>%
  round(2)
```

Ce tableau te donne un aperçu rapide de la force de la relation entre les retards (`dep_delay`) et certaines variables météo.

Une corrélation proche de 0 ne veut pas dire que la météo ne joue jamais de rôle. Elle indique seulement qu’il n’y a pas de relation linéaire forte dans ce résumé global.

#### Étape 2 - Visualiser une relation

Un graphique de dispersion permet de **voir** la tendance entre deux variables. Tu peux par exemple tester :

``` r
flights %>%
  filter(!is.na(wind_gust), !is.na(dep_delay)) %>%
  slice_sample(n = 5000) %>%
  ggplot(aes(x = wind_gust, y = dep_delay)) +
  geom_point(alpha = 0.2) +
  geom_smooth(method = "lm", color = "red") +
  labs(title = "Relation entre les rafales de vent et le retard au départ",
       x = "Rafales de vent (mph)",
       y = "Retard au départ (min)")
```

Le nuage de points te montre la tendance globale, et la ligne rouge correspond à une **régression linéaire** (c’est à dire la “meilleure” droite qui représente le lien linéaire entre les deux variables) qui estime cette relation.

> **TIP:**
>
> **Réponse de Sofia**
> Tu peux aussi tester avec d’autres variables comme `visib` (visibilité) ou `precip` (précipitations), et observer si les retards sont plus élevés lorsque la météo est mauvaise.
>
> Attention :
>
> - Les corrélations ne prouvent pas de lien de **causalité** !
>
> - Certains retards météo sont **indirects** (ex: en provenance d’un autre aéroport).
>
> - Une analyse plus avancée devrait contrôler d’autres variables comme l’heure, l’aéroport, la compagnie et la saison.

### Analyse 3 - Les vieux avions sont-ils moins fiables ?

> **NOTE:**
>
> **Contexte** : L’équipe maintenance s’interroge : les avions les plus âgés sont-ils plus souvent en retard ou annulés ? L’information sur l’année de fabrication est disponible dans `plane_year`.

**Sofia te demande** : *Analyse la relation entre l’âge de l’avion et les retards ou annulations (`is.na(dep_time)`).*

> **TIP:**
>
> **Réponse de Sofia**
> Tu peux créer une variable `age_avion` :
>
> ``` r
> flights <- flights %>%
>   mutate(age_avion = 2023 - plane_year)
> ```
>
> Puis comparer par tranche d’âge. Les tranches évitent de surinterpréter des âges où il y a très peu d’avions.
>
> ``` r
> flights %>%
>   filter(!is.na(age_avion)) %>%
>   mutate(tranche_age = cut(
>     age_avion,
>     breaks = c(-Inf, 5, 10, 15, 20, Inf),
>     labels = c("0-5", "6-10", "11-15", "16-20", "21+")
>   )) %>%
>   group_by(tranche_age) %>%
>   summarise(
>     n_vols = n(),
>     p_annulation = mean(is.na(dep_time)),
>     retard_moyen = mean(dep_delay, na.rm = TRUE),
>     .groups = "drop"
>   ) %>%
>   ggplot(aes(x = tranche_age, y = retard_moyen)) +
>   geom_col(fill = "steelblue") +
>   labs(title = "Retard moyen selon l'âge de l'avion",
>        x = "Âge de l'avion (années)", y = "Retard moyen (minutes)")
> ```
>
> Tu peux refaire le même graphique avec `p_annulation`. N’oublie pas de regarder `n_vols` avant de comparer les tranches.

Trace portfolio

Gardez les traces qui montrent votre raisonnement sur les relations entre variables.

- une variable temporelle créée avec `lubridate`;
- un graphique de relation entre deux variables;
- une corrélation ou un résumé comparatif interprété prudemment;
- une phrase qui distingue association, causalité et taille de l’échantillon.
