# Autodiagnostic - Module 6

STT-1100 Introduction à la science des données

Cet autodiagnostic non noté vérifie les notions du module 6. Il produit une correction détaillée, un résultat global, un bilan par compétence et un plan de révision ciblé.

> **NOTE:**
>
> - Première tentative: sans documentation, sans exécuter le code et sans aide extérieure, afin d’obtenir un portrait honnête.
> - Après le bilan: consultez les ressources proposées, refaites les exercices ciblés, puis reprenez le diagnostic.
> - Usage: ce diagnostic n’est pas noté et ne sert ni à attribuer une note ni à décider de l’admission au cours.
> - Confidentialité: aucune réponse n’est transmise à l’enseignant. La progression et l’historique sont conservés uniquement dans ce navigateur.

Les seuils sont des repères pédagogiques propres à STT-1100. Ils n’ont pas fait l’objet d’une validation psychométrique. Une réponse exacte peut aussi résulter du hasard; les exercices pratiques demeurent donc essentiels.

## Question 1

Vrai ou faux: une issue GitHub utile doit décrire un problème observable ou une suggestion précise.

> **TIP:**
>
> Vrai. Une issue utile indique ce qui est observé, où le trouver et pourquoi une action serait utile.

## Question 2

Quelle jointure conserve toutes les lignes de la table de gauche?

1.  `left_join()`
2.  `inner_join()`
3.  `anti_join()`
4.  `semi_join()`

> **TIP:**
>
> Réponse: a. `left_join()` garde toutes les lignes de la table de gauche et ajoute les colonnes correspondantes de la table de droite.

## Question 3

Vrai ou faux: `inner_join()` conserve les lignes sans correspondance dans l’une ou l’autre table.

> **TIP:**
>
> Faux. `inner_join()` conserve seulement les lignes qui ont une correspondance dans les deux tables.

## Question 4

Quelle fonction est utile pour trouver les lignes de `x` qui n’ont pas de correspondance dans `y`?

1.  `anti_join(x, y)`
2.  `summarise(x, y)`
3.  `arrange(x, y)`
4.  `geom_col(x, y)`

> **TIP:**
>
> Réponse: a. `anti_join(x, y)` sert souvent à diagnostiquer des clés manquantes ou mal codées.

## Question 5

Vrai ou faux: une pull request sert seulement à téléverser un fichier HTML final.

> **TIP:**
>
> Faux. Une pull request sert à proposer, discuter, réviser et fusionner des changements.

## Question 6

Dans un rapport Quarto, à quoi sert le code inline?

1.  Insérer un résultat calculé directement dans une phrase
2.  Créer une branche GitHub
3.  Supprimer les valeurs manquantes
4.  Fusionner deux pull requests

> **TIP:**
>
> Réponse: a. Le code inline permet d’insérer dans le texte un nombre ou un résultat calculé par R.

## Question 7

Vrai ou faux: si un rapport HTML existe, il est automatiquement reproductible.

> **TIP:**
>
> Faux. Il faut aussi vérifier le fichier source, les packages, les données, les chemins et la capacité à rendre le document.

## Question 8

Quelle information est la plus utile dans une issue de revue?

1.  Une section ou une ligne précise du rapport
2.  Une opinion générale sans exemple
3.  Un commentaire comme “à améliorer” sans détail
4.  Une demande de tout refaire

> **TIP:**
>
> Réponse: a. Une référence précise aide l’équipe à comprendre et corriger le problème.

## Question 9

Vrai ou faux: un conflit de fusion signifie nécessairement que le travail est perdu.

> **TIP:**
>
> Faux. Un conflit indique que Git ne peut pas choisir automatiquement entre deux changements. L’équipe doit résoudre le conflit et documenter la décision.

## Question 10

Quelle jointure est utile pour garder seulement les lignes de `x` qui ont une correspondance dans `y`, sans ajouter les colonnes de `y`?

1.  `semi_join()`
2.  `full_join()`
3.  `right_join()`
4.  `mutate()`

> **TIP:**
>
> Réponse: a. `semi_join()` filtre `x` selon l’existence d’une correspondance dans `y`.

## Question 11

Vrai ou faux: dans une jointure, il faut comprendre les clés utilisées avant d’interpréter les résultats.

> **TIP:**
>
> Vrai. Une mauvaise clé peut dupliquer des lignes, perdre des observations ou joindre des informations incorrectes.

## Question 12

Quelle formulation est la plus constructive?

1.  “Votre rapport est mauvais.”
2.  “Le graphique 2 serait plus clair avec une unité sur l’axe y, car on ne sait pas si le retard est en minutes.”
3.  “Je n’aime pas ce graphique.”
4.  “Tout est confus.”

> **TIP:**
>
> Réponse: b. La remarque est précise, localisée et actionnable.
