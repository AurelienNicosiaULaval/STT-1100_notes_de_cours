# Exercices de consolidation

# Exercices de consolidation

Pour mettre en pratique les apprentissages de ce module, vous trouverez ci-dessous une série d’exercices extraits du manuel ou adaptés pour STT-1100.

## Exercice 1 — Pourquoi apprendre R ?

En une ou deux phrases, explique pourquoi apprendre R est utile pour une personne qui souhaite travailler avec des données.

> **TIP:**
>
> R est un langage puissant conçu pour la manipulation, l’analyse et la visualisation de données. Il est très utilisé en science des données pour sa richesse en librairies et son intégration avec des outils comme Quarto.

## Exercice 2 — La console vs le script

Dans RStudio, tapez `3 + 4` dans :

1.  la console

2.  un script `.R` que vous exécutez ensuite avec `Ctrl + Enter`

Quelle est la différence entre les deux approches ?

> **TIP:**
>
> La console permet d’exécuter du code immédiatement, mais ne garde pas de trace. Le script permet d’écrire et de sauvegarder le code, ce qui est essentiel pour la reproductibilité.

## Exercice 3 — Structure de script

Créez un fichier `analyse.R` contenant les éléments suivants :

- un en-tête avec votre nom et la date

- un chargement de librairie (`tidyverse`)

- une instruction simple (`mean(c(1, 2, 3, 4))`)

> **TIP:**
>
> ``` r
> # Analyse météo — A. Nicosia
> # Date : 2025-05-19
>
> library(tidyverse)
>
> mean(c(1, 2, 3, 4))
> ```

------------------------------------------------------------------------

## Exercice 4 — Trouver de l’aide

Utilisez l’aide intégrée de R pour comprendre comment utiliser la fonction `mean`. Ensuite, expliquez brièvement à quoi sert l’argument `na.rm`.

> **TIP:**
>
> On peut taper `?mean` ou `help(mean)` dans R pour obtenir la documentation.
>
> L’argument `na.rm` indique s’il faut ignorer les valeurs manquantes (`NA`) dans le calcul de la moyenne (`TRUE` ou `FALSE`).

## Exercice 5 — Réécrire du code avec style

Corrigez le code suivant pour qu’il respecte les bonnes pratiques du style tidyverse :

``` r
x=mean(c(3,NA,5),na.rm=TRUE)
```

> **TIP:**
>
> ``` r
> x <- mean(c(3, NA, 5), na.rm = TRUE)
> ```

------------------------------------------------------------------------

## Exercice 6 — Créer un rapport HTML

Créez un fichier `rapport.qmd` contenant :

- un en-tête YAML avec un titre et un format HTML

- un bloc de code qui affiche la moyenne d’un vecteur

> **TIP:**
>
> ``` markdown
> ---
> title: "Premier rapport"
> format: html
> ---
>
> mean(c(1, 2, 3, 4, 5))
> ```
>
> \`\`\`
