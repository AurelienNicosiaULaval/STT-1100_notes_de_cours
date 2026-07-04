# Mini-test formatif - Lectures du module 4

STT-1100 Introduction à la science des données

# Mini-test formatif

Ce mini-test sert à vérifier les lectures du module 4. Il n’est pas noté. Répondez d’abord sans ouvrir les réponses, puis utilisez les explications pour repérer ce qui doit être relu.

## Question 1

Vrai ou faux: si un fichier est séparé par des points-virgules, `read_csv()` est toujours le meilleur choix.

> **TIP:**
>
> Faux. `read_csv()` suppose une séparation par virgules. Pour un fichier séparé par des points-virgules, utilisez `read_delim(delim = ";")` ou `read_csv2()` selon le contexte.

## Question 2

Quelle fonction permet de transformer des noms de colonnes en noms plus faciles à utiliser dans R?

1.  `janitor::clean_names()`
2.  `ggplot2::labs()`
3.  `readxl::excel_sheets()`
4.  `forcats::fct_lump()`

> **TIP:**
>
> Réponse: a. `clean_names()` convertit les noms en une forme plus régulière, souvent en `snake_case`.

## Question 3

Vrai ou faux: un identifiant comme `"0012"` devrait souvent rester en texte, même s’il contient seulement des chiffres.

> **TIP:**
>
> Vrai. Un identifiant est une étiquette, pas une quantité. Le garder en texte évite de perdre des zéros au début.

## Question 4

Quelle fonction est utile pour déclarer qu’une valeur spéciale, par exemple `-999`, représente une valeur manquante?

1.  `na_if()`
2.  `count()`
3.  `pivot_wider()`
4.  `geom_point()`

> **TIP:**
>
> Réponse: a. `na_if(x, -999)` remplace les valeurs égales à `-999` par `NA`.

## Question 5

Quelle fonction permet de transformer des colonnes `q1`, `q2`, `q3`, `q4` en deux colonnes `trimestre` et `valeur`?

1.  `pivot_longer()`
2.  `pivot_wider()`
3.  `arrange()`
4.  `read_json()`

> **TIP:**
>
> Réponse: a. `pivot_longer()` met plusieurs colonnes dans un format long.

## Question 6

Vrai ou faux: une correction de données devrait être documentée seulement si elle modifie plus de 100 lignes.

> **TIP:**
>
> Faux. Toute correction importante pour l’interprétation doit être documentée, même si elle ne touche qu’une seule ligne.

## Question 7

Quelle fonction de `forcats` est utile pour regrouper plusieurs modalités similaires sous un même nom?

1.  `fct_collapse()`
2.  `read_excel()`
3.  `glimpse()`
4.  `parse_number()`

> **TIP:**
>
> Réponse: a. `fct_collapse()` permet de fusionner plusieurs niveaux d’un facteur.

## Question 8

Vrai ou faux: un fichier JSON peut contenir des structures imbriquées qui ne ressemblent pas immédiatement à un tableau rectangulaire.

> **TIP:**
>
> Vrai. Un JSON peut contenir des listes dans des listes. Il faut parfois le transformer pour obtenir une table.

## Question 9

Quelle fonction permet de lire une feuille précise d’un fichier Excel?

1.  `readxl::read_excel(sheet = ...)`
2.  `readr::write_csv()`
3.  `dplyr::filter()`
4.  `stringr::str_squish()`

> **TIP:**
>
> Réponse: a. L’argument `sheet` permet de choisir la feuille à importer.

## Question 10

Vrai ou faux: une anomalie peut être signalée sans être corrigée si aucune correction défendable n’est possible.

> **TIP:**
>
> Vrai. Dans un nettoyage rigoureux, il vaut parfois mieux signaler une anomalie que deviner une correction.

## Question 11

Quel champ n’appartient pas à la structure minimale d’une entrée de journal de nettoyage proposée dans le module?

1.  `id`
2.  `variables`
3.  `probleme`
4.  `couleur_du_graphique`

> **TIP:**
>
> Réponse: d. Le journal doit au minimum documenter l’identifiant, les variables touchées, le problème, l’action et la justification.

## Question 12

Pourquoi est-il utile de sauvegarder le fichier propre avec `write_csv()` à la fin d’un nettoyage?

1.  Pour produire un artefact reproductible à partir du code
2.  Pour cacher les corrections
3.  Pour éviter de charger les packages
4.  Pour remplacer le rapport Quarto

> **TIP:**
>
> Réponse: a. Le fichier propre devient un résultat reproductible du script ou du rapport.
