# Module 3 - Plan d’apprentissage

STT-1100 Introduction à la science des données

# Objectifs du module

À la fin de ce module, vous devriez être capable de

- Manipuler des chaînes de caractères avec `stringr`.
- Reconnaitre des motifs avec des expressions régulières.
- Utiliser les expressions régulières pour sélectionner, manipuler et modifier des chaînes de caractères.
- Calculer et interpréter des statistiques descriptives pour des variables catégoriques (tableaux de fréquences, proportions, incluant par groupes, tableau croisé).
- Produire et interpréter des visualisations de variables catégoriques avec `ggplot2` (diagramme à bandes, en bâtons empilés, en bâtons empilés standardisé, en bâtons empilés groupés, en mosaïque, en secteurs et en gaufre).

# Lectures initiales

## Lectures à faire avant l’aventure

Dans ce module, nous allons explorer les variables **catégoriques** et la **visualisation adaptée** à ce type de données. Deux lectures sont proposées pour vous préparer :

- [**R for Data Science – Strings**](https://r4ds.hadley.nz/strings.html)
  Ce chapitre vous introduit à la manipulation des chaînes de caractères avec le package `stringr`.
  \> **Note** : Bien que ce chapitre soit plus largement utilisé au module 4, certaines fonctions utiles comme `str_detect()` ou `str_to_lower()` peuvent déjà vous aider pour nettoyer ou préparer des variables catégoriques.

- [**Introduction to Modern Statistics – Chapitre 6 : Explore categorical data**](https://openintro-ims.netlify.app/explore-categorical)
  Ce chapitre de **IMS** présente les concepts statistiques associés aux données catégoriques. On y parle notamment de tableaux de fréquence, de proportions et des façons de représenter visuellement ce type de variables.

Prenez le temps de parcourir ces deux ressources. Elles vous seront utiles pour comprendre comment traiter les **données qualitatives**, tant du point de vue **statistique** que **pratique**.

# Aventure

[Aventure 3](../module_03/aventure.llms.md)

# Défi

Au terme de ce module, vous endosserez le rôle de journaliste de données pour *Le Courrier Gourmand*.

[Défi du module 3](../module_03/defi.llms.md)

Votre mission consiste à nettoyer le jeu `listecondamnation`, à extraire des faits marquants sur les infractions alimentaires, puis à rédiger un article Quarto reproductible.

Vous devrez remettre :

- `template_article.qmd` complété ;

- `template_article.html` rendu ;

- un dépôt GitHub avec plusieurs commits clairs.

Votre article doit contenir au moins deux chiffres narratifs et deux visuels, dont un graphique de catégories. La carte des amendes est une activité optionnelle.

# Exercices de consolidation

``` r
# Charger les librairies nécessaires
library(tidyverse)
library(stringr)
```

------------------------------------------------------------------------

### Exercice 1 – Identifier les variables catégoriques

Voici un petit jeu de données :

``` r
data <- tibble::tibble(
  sexe = c("Homme", "Femme", "Femme", "Homme", "Homme"),
  age = c(25, 32, 29, 40, 23),
  région = c("Est", "Ouest", "Est", "Nord", "Sud")
)
```

> Parmi les trois variables ci-dessus, lesquelles sont catégorielles ?

> **NOTE:**
>
> Les variables `sexe` et `région` sont **catégorielles**. `age` est **numérique**.

------------------------------------------------------------------------

### Exercice 2 – Tableau de fréquence

Crée un tableau de fréquence pour la variable `sexe`.

> **TIP:**
>
> Utilise `count()` du package `dplyr`.

> **NOTE:**
>
> ``` r
> data %>% count(sexe)
> ```
>
>     # A tibble: 2 × 2
>       sexe      n
>       <chr> <int>
>     1 Femme     2
>     2 Homme     3

------------------------------------------------------------------------

### Exercice 3 – Proportions

Calcule les pourcentages pour chaque modalité de la variable `région`.

> **TIP:**
>
> Ajoute une colonne avec `mutate(n / sum(n))`.

> **NOTE:**
>
> ``` r
> data %>% count(région) %>% mutate(pourcentage = n / sum(n) * 100)
> ```
>
>     # A tibble: 4 × 3
>       région     n pourcentage
>       <chr>  <int>       <dbl>
>     1 Est        2          40
>     2 Nord       1          20
>     3 Ouest      1          20
>     4 Sud        1          20

------------------------------------------------------------------------

### Exercice 4 – Barplot d’une variable catégorielle

Fais un barplot représentant la variable `région`.

> **TIP:**
>
> Utilise `geom_bar()` avec `aes(x = région)`.

> **NOTE:**
>
> ``` r
> ggplot(data, aes(x = région)) + geom_bar()
> ```
>
> ![Diagramme à barres du nombre d'observations par région.](plan_apprentissage_files/figure-html/unnamed-chunk-5-1.png)

------------------------------------------------------------------------

### Exercice 5 – Comparaison de deux variables catégorielles

Ajoute une couleur par `sexe` dans le graphique précédent.

> **NOTE:**
>
> ``` r
> ggplot(data, aes(x = région, fill = sexe)) + geom_bar(position = "dodge")
> ```
>
> ![Diagramme à barres groupées comparant les régions selon le sexe.](plan_apprentissage_files/figure-html/unnamed-chunk-6-1.png)

------------------------------------------------------------------------

### Exercice 6 – Nettoyer une variable catégorielle

Voici une variable catégorielle incohérente :

``` r
reponses <- c("Oui", "oui", "Non", "non", "OUI", "NON")
```

Nettoie cette variable pour que toutes les réponses soient en minuscules **et sans doublons**.

> **NOTE:**
>
> ``` r
> unique(str_to_lower(reponses))
> ```
>
>     [1] "oui" "non"

------------------------------------------------------------------------

### Exercice 7 – Tableau croisé

Voici un autre jeu de données :

``` r
data2 <- tibble(
  fumeur = c("Oui", "Non", "Non", "Oui", "Oui", "Non", "Non"),
  sport = c("Oui", "Oui", "Non", "Non", "Oui", "Non", "Non")
)
```

Crée un tableau croisé (contingence) entre les deux variables.

> **NOTE:**
>
> ``` r
> data2 %>% count(fumeur, sport) %>% pivot_wider(names_from = sport, values_from = n, values_fill = 0)
> ```
>
>     # A tibble: 2 × 3
>       fumeur   Non   Oui
>       <chr>  <int> <int>
>     1 Non        3     1
>     2 Oui        1     2

------------------------------------------------------------------------

### Exercice 8 – Pour aller plus loin : Mosaic plot

Utilise le package `ggplot2` (ou `ggmosaic` si disponible) pour représenter visuellement la relation entre `fumeur` et `sport`.

> **NOTE:**
>
> ``` r
> # En regroupant en barres groupées pour une approximation
> ggplot(data2, aes(x = fumeur, fill = sport)) +
>   geom_bar(position = "fill") +
>   ylab("Proportion")
> ```
>
> ![Diagramme à barres empilées à 100 % comparant sport et statut de fumeur.](plan_apprentissage_files/figure-html/unnamed-chunk-11-1.png)

------------------------------------------------------------------------

## Problèmes

### Exercice 9 – Palmer Penguins

On utilise le jeu de données `penguins` du package `palmerpenguins`.

- Variable catégorielle : `species`, `island`, `sex`
- Variable numérique : `flipper_length_mm`, `body_mass_g`

Questions : 1. Crée un tableau de fréquence pour `species` 2. Visualise la distribution des espèces par île 3. Compare les sexes pour chaque espèce

> **NOTE:**
>
> ``` r
> library(palmerpenguins)
> ```
>
>
>     Attaching package: 'palmerpenguins'
>
>     The following objects are masked from 'package:datasets':
>
>         penguins, penguins_raw
>
> ``` r
> penguins %>% count(species)
> ```
>
>     # A tibble: 3 × 2
>       species       n
>       <fct>     <int>
>     1 Adelie      152
>     2 Chinstrap    68
>     3 Gentoo      124
>
> ``` r
> ggplot(penguins, aes(x = island, fill = species)) + geom_bar(position = "dodge")
> ```
>
> ![Diagramme à barres groupées montrant les espèces de manchots par île.](plan_apprentissage_files/figure-html/unnamed-chunk-12-1.png)
>
> ``` r
> ggplot(penguins, aes(x = species, fill = sex)) + geom_bar(position = "fill")
> ```
>
> ![Diagramme à barres empilées à 100 % comparant le sexe par espèce de manchot.](plan_apprentissage_files/figure-html/unnamed-chunk-12-2.png)

------------------------------------------------------------------------

### Exercice 10 – Données Titanic

Utilise `titanic::titanic_train`

Variables catégoriques : `Sex`, `Embarked`, `Survived`

Questions : 1. Tableau croisé entre `Sex` et `Survived` 2. Proportion de survie par port d’embarquement (`Embarked`) 3. Représentation graphique croisée `Sex` × `Embarked` × `Survived`

> **NOTE:**
>
> ``` r
> library(titanic)
> titanic_train <- titanic::titanic_train
>
> titanic_train %>% count(Sex, Survived)
> ```
>
>          Sex Survived   n
>     1 female        0  81
>     2 female        1 233
>     3   male        0 468
>     4   male        1 109
>
> ``` r
> titanic_train %>% count(Embarked, Survived) %>%
>   group_by(Embarked) %>% mutate(p = n / sum(n))
> ```
>
>     # A tibble: 7 × 4
>     # Groups:   Embarked [4]
>       Embarked Survived     n     p
>       <chr>       <int> <int> <dbl>
>     1 ""              1     2 1
>     2 "C"             0    75 0.446
>     3 "C"             1    93 0.554
>     4 "Q"             0    47 0.610
>     5 "Q"             1    30 0.390
>     6 "S"             0   427 0.663
>     7 "S"             1   217 0.337
>
> ``` r
> ggplot(titanic_train, aes(x = Embarked, fill = factor(Survived))) +
>   geom_bar(position = "fill") +
>   facet_wrap(~Sex)
> ```
>
> ![Diagramme à barres empilées à 100 % de la survie Titanic par port d'embarquement, avec facettes selon le sexe.](plan_apprentissage_files/figure-html/unnamed-chunk-13-1.png)
