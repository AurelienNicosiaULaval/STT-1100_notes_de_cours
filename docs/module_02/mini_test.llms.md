# Mini-test formatif - Lectures du module 2

STT-1100 Introduction à la science des données

# Mini-test formatif

Ce mini-test sert à vérifier les lectures du module 2. Il n’est pas noté. Répondez d’abord sans ouvrir les réponses, puis utilisez les explications pour repérer ce qui doit être relu avant l’aventure et le défi.

## Question 1

Vrai ou faux: un commit enregistre une étape localement, tandis qu’un push envoie cette étape vers GitHub.

> **TIP:**
>
> Vrai. Un commit garde une trace dans le dépôt local. Le push synchronise ensuite les commits locaux avec le dépôt GitHub.

## Question 2

Quelle fonction sert à importer un fichier Excel dans R?

1.  `read_csv()`
2.  `read_excel()`
3.  `glimpse()`
4.  `geom_histogram()`

> **TIP:**
>
> Réponse: b. `read_excel()` provient du package `readxl` et permet d’importer des fichiers Excel comme `.xls` ou `.xlsx`.

## Question 3

Vrai ou faux: un rapport Quarto reproductible devrait importer les données dans un bloc de code, même si on a d’abord testé l’importation avec l’interface de RStudio.

> **TIP:**
>
> Vrai. Le rapport doit pouvoir être rendu après un redémarrage de R, sans dépendre d’objets déjà présents dans l’environnement.

## Question 4

À quoi sert principalement `glimpse()`?

1.  Produire un graphique
2.  Afficher un aperçu compact des variables et de leurs types
3.  Sauvegarder un fichier HTML
4.  Envoyer un commit vers GitHub

> **TIP:**
>
> Réponse: b. `glimpse()` donne une vue rapide de la structure d’un tableau: noms de variables, types et premières valeurs.

## Question 5

Quelle fonction de `dplyr` sert à garder seulement certaines colonnes?

1.  `select()`
2.  `filter()`
3.  `mutate()`
4.  `group_by()`

> **TIP:**
>
> Réponse: a. `select()` choisit des colonnes. Pour garder des lignes selon une condition, on utilise plutôt `filter()`.

## Question 6

Quelle fonction de `dplyr` sert à créer une nouvelle variable?

1.  `summarise()`
2.  `mutate()`
3.  `arrange()`
4.  `facet_wrap()`

> **TIP:**
>
> Réponse: b. `mutate()` ajoute ou modifie des colonnes dans un tableau.

## Question 7

Vous voulez calculer la moyenne et l’écart-type de la masse corporelle par espèce. Quelle combinaison est la plus appropriée?

1.  `group_by(species)` puis `summarise()`
2.  `filter(species)` puis `ggplot()`
3.  `select(body_mass_g)` puis `read_excel()`
4.  `mutate(species)` puis `commit()`

> **TIP:**
>
> Réponse: a. `group_by(species)` définit les groupes, puis `summarise()` calcule les statistiques pour chaque groupe.

## Question 8

Vrai ou faux: la moyenne est toujours plus robuste que la médiane aux valeurs extrêmes.

> **TIP:**
>
> Faux. La médiane est généralement moins influencée par des valeurs extrêmes que la moyenne.

## Question 9

Quel graphique convient le mieux pour observer la distribution d’une seule variable numérique?

1.  Un histogramme
2.  Une carte
3.  Un diagramme circulaire
4.  Un tableau GitHub

> **TIP:**
>
> Réponse: a. Un histogramme montre comment les valeurs d’une variable numérique se répartissent.

## Question 10

Quel graphique convient bien pour comparer une variable numérique entre plusieurs groupes?

1.  Une boîte à moustaches
2.  Une capture d’écran de l’environnement
3.  Un message de commit
4.  Une liste de packages

> **TIP:**
>
> Réponse: a. Une boîte à moustaches permet de comparer la médiane, la dispersion et les valeurs potentiellement extrêmes entre groupes.

## Question 11

Quel graphique convient bien pour étudier la relation entre deux variables numériques?

1.  Un nuage de points
2.  Un tableau de noms de fichiers
3.  Une légende seule
4.  Une commande `push`

> **TIP:**
>
> Réponse: a. Un nuage de points permet d’examiner la relation entre deux variables numériques.

## Question 12

Vrai ou faux: modifier directement le fichier Excel brut est une bonne pratique si le rapport final contient seulement les graphiques corrigés.

> **TIP:**
>
> Faux. Il vaut mieux garder le fichier brut intact et documenter les corrections dans le code R pour que l’analyse reste reproductible.
