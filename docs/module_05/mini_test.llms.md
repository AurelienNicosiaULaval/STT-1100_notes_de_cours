# Mini-test formatif - Lectures du module 5

STT-1100 Introduction à la science des données

# Mini-test formatif

Ce mini-test sert à vérifier les lectures du module 5. Il n’est pas noté. Répondez d’abord sans ouvrir les réponses, puis utilisez les explications pour repérer ce qui doit être relu.

## Question 1

Vrai ou faux: une analyse exploratoire des données sert seulement à produire des graphiques jolis.

> **TIP:**
>
> Faux. L’EDA sert à comprendre la structure des données, repérer des patrons, détecter des valeurs inhabituelles et formuler des questions plus précises.

## Question 2

Quelle fonction de `lubridate` permet de créer une date à partir d’une année, d’un mois et d’un jour?

1.  `make_date()`
2.  `geom_point()`
3.  `pivot_longer()`
4.  `cor()`

> **TIP:**
>
> Réponse: a. `make_date(year, month, day)` crée une variable de date à partir de trois composantes numériques.

## Question 3

Vrai ou faux: une corrélation élevée prouve qu’une variable cause l’autre.

> **TIP:**
>
> Faux. Une corrélation mesure une association linéaire. Elle ne prouve pas une relation de cause à effet.

## Question 4

Quelle visualisation est généralement utile pour étudier la relation entre deux variables numériques?

1.  Un nuage de points
2.  Un diagramme circulaire
3.  Un tableau de noms de colonnes
4.  Une carte de visite

> **TIP:**
>
> Réponse: a. Un nuage de points permet d’observer la forme générale d’une relation entre deux variables numériques.

## Question 5

Vrai ou faux: avant de comparer des moyennes par groupe, il est utile d’afficher le nombre d’observations par groupe.

> **TIP:**
>
> Vrai. Une moyenne calculée sur très peu d’observations peut être instable. Le nombre d’observations aide à interpréter la comparaison.

## Question 6

Quelle option de `cor()` permet de calculer une corrélation en utilisant seulement les lignes complètes?

1.  `use = "complete.obs"`
2.  `na.rm = TRUE`
3.  `group_by = TRUE`
4.  `collapse = TRUE`

> **TIP:**
>
> Réponse: a. `cor(use = "complete.obs")` utilise les observations complètes pour les variables sélectionnées.

## Question 7

Vrai ou faux: une valeur manquante peut changer l’interprétation d’un résumé numérique.

> **TIP:**
>
> Vrai. Les valeurs manquantes peuvent modifier le nombre d’observations utilisées et parfois masquer un problème de collecte ou de définition.

## Question 8

Quelle fonction permet d’extraire le jour de la semaine à partir d’une date?

1.  `wday()`
2.  `count()`
3.  `arrange()`
4.  `labs()`

> **TIP:**
>
> Réponse: a. `wday()` extrait le jour de la semaine. Avec `label = TRUE`, la sortie est plus lisible.

## Question 9

Vrai ou faux: une droite de tendance ajoutée à un nuage de points résume toute la structure possible d’une relation.

> **TIP:**
>
> Faux. Une droite de tendance résume une tendance linéaire moyenne. Elle peut cacher des groupes, des courbes ou des valeurs extrêmes.

## Question 10

Quelle affirmation est la plus prudente?

1.  Les ateliers du soir causent une plus forte participation.
2.  Dans ce fichier, les ateliers du soir ont une participation moyenne plus élevée.
3.  Les ateliers du matin sont inutiles.
4.  Les données prouvent que la température n’a aucun effet.

> **TIP:**
>
> Réponse: b. Cette formulation décrit ce qui est observé dans le fichier sans conclure à une cause.

## Question 11

Vrai ou faux: un graphique doit avoir des axes et un titre compréhensibles.

> **TIP:**
>
> Vrai. Un graphique sans titre ou axes clairs est difficile à interpréter et à réviser.

## Question 12

Pourquoi est-il utile de séparer les exercices du défi?

1.  Pour pratiquer les mêmes compétences sans donner directement la solution du défi
2.  Pour éviter les lectures
3.  Pour remplacer l’aventure
4.  Pour supprimer les visualisations

> **TIP:**
>
> Réponse: a. Les exercices consolident les compétences dans d’autres contextes. Le défi reste la suite directe de l’aventure.
