# Mini-test formatif - Lectures du module 3

STT-1100 Introduction à la science des données

# Mini-test formatif

Ce mini-test sert à vérifier les lectures du module 3. Il n’est pas noté. Répondez d’abord sans ouvrir les réponses, puis utilisez les explications pour repérer ce qui doit être relu avant l’aventure et le défi.

## Question 1

Vrai ou faux: une variable catégorique contient des modalités ou des groupes, même si ces modalités sont stockées comme du texte dans R.

> **TIP:**
>
> Vrai. Une variable catégorique peut être stockée comme `character` ou comme `factor`. Ce qui compte, c’est que ses valeurs représentent des catégories.

## Question 2

Quelle fonction de `stringr` permet de détecter si une chaîne contient un motif?

1.  `str_detect()`
2.  `str_squish()`
3.  `str_replace()`
4.  `fct_lump()`

> **TIP:**
>
> Réponse: a. `str_detect()` retourne `TRUE` ou `FALSE` selon la présence du motif.

## Question 3

Vrai ou faux: `str_squish()` retire les espaces au début et à la fin, puis réduit les espaces multiples à un seul espace.

> **TIP:**
>
> Vrai. Cette fonction est utile pour harmoniser des champs textuels avant de créer des catégories.

## Question 4

Quelle fonction permet d’extraire un code postal canadien d’une adresse quand on fournit une expression régulière adaptée?

1.  `str_extract()`
2.  `summarise()`
3.  `geom_bar()`
4.  `count()`

> **TIP:**
>
> Réponse: a. `str_extract()` extrait la partie d’une chaîne qui correspond au motif.

## Question 5

Pourquoi convertir une colonne comme `Amende` en variable numérique avant de calculer une moyenne?

1.  Parce que les graphiques exigent toujours des facteurs
2.  Parce qu’une moyenne ne se calcule pas correctement sur une chaîne de caractères
3.  Parce que `ggplot2` ne peut pas lire de texte
4.  Parce qu’un commit GitHub est obligatoire

> **TIP:**
>
> Réponse: b. Si les montants sont stockés comme texte, il faut d’abord créer une variable numérique reproductible.

## Question 6

Quelle fonction de `dplyr` est la plus directe pour obtenir un tableau de fréquences?

1.  `count()`
2.  `mutate()`
3.  `pull()`
4.  `slice()`

> **TIP:**
>
> Réponse: a. `count(variable)` compte le nombre d’observations dans chaque modalité.

## Question 7

Vrai ou faux: un diagramme à barres empilées standardisé avec `position = "fill"` montre des proportions plutôt que des nombres absolus.

> **TIP:**
>
> Vrai. La hauteur totale de chaque barre vaut 1, ce qui permet de comparer la composition des groupes.

## Question 8

Quel outil est utile pour regrouper des catégories rares dans une modalité “Autre”?

1.  `forcats::fct_lump()`
2.  `readxl::read_excel()`
3.  `base::mean()`
4.  `ggplot2::theme_void()`

> **TIP:**
>
> Réponse: a. `fct_lump()` regroupe des modalités peu fréquentes, ce qui peut rendre un tableau ou un graphique plus lisible.

## Question 9

Vrai ou faux: un graphique de catégories devrait généralement être ordonné selon une variable utile plutôt que laissé dans un ordre alphabétique arbitraire.

> **TIP:**
>
> Vrai. Un ordre par fréquence ou par valeur moyenne aide souvent le lecteur à comprendre le message du graphique.

## Question 10

Dans le défi, pourquoi faut-il garder le jeu `listecondamnation` original intact?

1.  Pour que le nettoyage soit documenté dans le code et reproductible
2.  Parce que `UlavalSSD` interdit les graphiques
3.  Parce que les catégories ne peuvent pas être modifiées
4.  Parce que GitHub ne conserve pas les fichiers HTML

> **TIP:**
>
> Réponse: a. Le rapport doit pouvoir être rendu à nouveau après un redémarrage de R, avec les mêmes choix de nettoyage.

## Question 11

Vrai ou faux: si un graphique utilise des proportions, le texte doit préciser qu’il ne montre pas les nombres absolus.

> **TIP:**
>
> Vrai. Les proportions sont utiles, mais elles peuvent masquer la taille réelle des groupes.

## Question 12

Quelle phrase correspond le mieux à un bon chiffre narratif dans un article de données?

1.  “La variable est intéressante.”
2.  “Le graphique est beau.”
3.  “Environ la moitié des constats du fichier sont associés à des codes postaux montréalais, selon le critère utilisé.”
4.  “Le code fonctionne.”

> **TIP:**
>
> Réponse: c. Un chiffre narratif combine un résultat calculé, un contexte et une formulation compréhensible.
