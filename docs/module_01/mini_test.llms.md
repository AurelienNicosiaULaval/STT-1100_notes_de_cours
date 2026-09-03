# Autodiagnostic - Module 1

STT-1100 Introduction à la science des données

Cet autodiagnostic non noté vérifie les notions du module 1. Il produit une correction détaillée, un résultat global, un bilan par compétence et un plan de révision ciblé.

> **NOTE:**
>
> - Première tentative: sans documentation, sans exécuter le code et sans aide extérieure, afin d’obtenir un portrait honnête.
> - Après le bilan: consultez les ressources proposées, refaites les exercices ciblés, puis reprenez le diagnostic.
> - Usage: ce diagnostic n’est pas noté et ne sert ni à attribuer une note ni à décider de l’admission au cours.
> - Confidentialité: aucune réponse n’est transmise à l’enseignant. La progression et l’historique sont conservés uniquement dans ce navigateur.

Les seuils sont des repères pédagogiques propres à STT-1100. Ils n’ont pas fait l’objet d’une validation psychométrique. Une réponse exacte peut aussi résulter du hasard; les exercices pratiques demeurent donc essentiels.

## Question 1

Vrai ou faux: écrire du code seulement dans la console est suffisant pour produire une analyse reproductible.

> **TIP:**
>
> Faux. La console est utile pour tester, mais un script ou un document Quarto garde une trace du code.

## Question 2

Dans un document Quarto, quelle partie sert à indiquer le titre et le format de sortie?

1.  Le bloc YAML au début du fichier
2.  La console R
3.  Le panneau Environment
4.  Le nom du dossier

> **TIP:**
>
> Réponse: a. Le bloc YAML au début du fichier peut indiquer le titre, l’auteur, la date et le format de sortie.

## Question 3

Vrai ou faux: si un rapport utilise `MeteoQuebec`, le document `.qmd` devrait contenir `library(UlavalSSD)`.

> **TIP:**
>
> Vrai. Le rapport doit pouvoir être rendu après un redémarrage de R. Le chargement du package doit donc être dans le document.

## Question 4

Que fait l’argument `na.rm = TRUE` dans une fonction comme `mean()`?

1.  Il transforme les valeurs manquantes en zéro
2.  Il retire les valeurs manquantes avant le calcul
3.  Il arrondit le résultat
4.  Il affiche seulement les valeurs manquantes

> **TIP:**
>
> Réponse: b. `na.rm = TRUE` retire les valeurs manquantes avant le calcul.

## Question 5

Vrai ou faux: un nom d’objet comme `temperature_moyenne` est préférable à `temp moyenne` dans du code R.

> **TIP:**
>
> Vrai. Les noms sans espaces sont plus faciles à utiliser. Le style tidyverse recommande des noms explicites, en minuscules, avec des traits de soulignement.

## Question 6

Quelle fonction de `dplyr` sert principalement à garder des lignes selon une condition?

1.  `select()`
2.  `filter()`
3.  `library()`
4.  `mean()`

> **TIP:**
>
> Réponse: b. `filter()` garde les lignes qui respectent une ou plusieurs conditions.

## Question 7

Quelle fonction de `dplyr` sert principalement à choisir des colonnes?

1.  `select()`
2.  `filter()`
3.  `summary()`
4.  `install.packages()`

> **TIP:**
>
> Réponse: a. `select()` choisit des colonnes.

## Question 8

Vrai ou faux: rendre un document Quarto après avoir redémarré R est une bonne façon de vérifier la reproductibilité.

> **TIP:**
>
> Vrai. Si le document se rend après un redémarrage, cela indique que les packages, les données et les objets nécessaires sont créés dans le document lui-même.
