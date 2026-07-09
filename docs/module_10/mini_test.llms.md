# Mini-test formatif - Lectures du module 10

STT-1100 Introduction à la science des données

## Mini-test formatif

Ce mini-test sert à vérifier les lectures du module 10. Il n’est pas noté. Répondez d’abord sans ouvrir les réponses, puis utilisez les explications pour repérer ce qui doit être relu.

### Question 1

Dans le cadre de `tidytext`, que signifie transformer un texte en format tidy?

1.  Obtenir une ligne par token ou unité textuelle pertinente
2.  Transformer chaque commentaire en image
3.  Supprimer toutes les lignes du tableau
4.  Remplacer le texte par une moyenne numérique

> **TIP:**
>
> Réponse: a. Le format tidy text place généralement une unité textuelle, par exemple un mot, sur chaque ligne.

### Question 2

Quelle fonction sert à découper une colonne de texte en tokens avec `tidytext`?

1.  `unnest_tokens()`
2.  `bind_tf_idf()`
3.  `geom_col()`
4.  `select()`

> **TIP:**
>
> Réponse: a. `unnest_tokens()` transforme une colonne de texte en tokens, souvent des mots.

### Question 3

Vrai ou faux: les stopwords sont des mots très fréquents qui peuvent masquer les mots plus informatifs.

> **TIP:**
>
> Vrai. Des mots comme “de”, “le” ou “et” peuvent être retirés quand ils n’aident pas à comprendre le contenu.

### Question 4

Pourquoi construire un lexique de sentiment maison en français dans ce module?

1.  Pour comprendre le principe de l’analyse de sentiment en explicitant les limites du lexique
2.  Pour éviter toute interprétation
3.  Pour prouver que chaque commentaire est positif ou négatif
4.  Pour remplacer les données numériques

> **TIP:**
>
> Réponse: a. Le lexique maison est pédagogique. Il aide à comprendre le principe, mais il reste imparfait et doit être interprété avec prudence.

### Question 5

Vrai ou faux: un score de sentiment calculé avec un petit lexique maison doit être présenté comme une mesure exacte du ressenti étudiant.

> **TIP:**
>
> Faux. Le score dépend du lexique, du nettoyage et du contexte. Il sert d’indicateur exploratoire, pas de vérité définitive.

### Question 6

Que mesure TF-IDF dans une analyse de texte?

1.  Les mots fréquents dans un groupe et relativement rares dans les autres groupes
2.  Le nombre de graphiques dans un rapport
3.  La moyenne des variables numériques
4.  La taille du fichier CSV

> **TIP:**
>
> Réponse: a. TF-IDF fait ressortir les mots distinctifs d’un document ou d’un groupe, par exemple une semaine.

### Question 7

Quelle fonction de `tidytext` ajoute les colonnes `tf`, `idf` et `tf_idf` à un tableau de comptes?

1.  `bind_tf_idf()`
2.  `unnest_tokens()`
3.  `pivot_wider()`
4.  `arrange()`

> **TIP:**
>
> Réponse: a. `bind_tf_idf()` calcule et ajoute les valeurs TF, IDF et TF-IDF.

### Question 8

Vrai ou faux: un mot avec un TF-IDF élevé est nécessairement le mot le plus fréquent dans tout le corpus.

> **TIP:**
>
> Faux. Un mot peut avoir un TF-IDF élevé parce qu’il est distinctif d’un groupe, même s’il n’est pas le mot le plus fréquent du corpus complet.

### Question 9

Dans un tableau de bord, pourquoi ajouter au moins un filtre interactif?

1.  Pour permettre à l’utilisateur d’explorer un sous-ensemble pertinent des données
2.  Pour cacher les résultats difficiles
3.  Pour remplacer toute analyse
4.  Pour rendre le code impossible à relire

> **TIP:**
>
> Réponse: a. Un filtre utile permet d’explorer les données par période, groupe ou thème sans multiplier les graphiques fixes.

### Question 10

Vrai ou faux: avant de partager un tableau de bord basé sur des commentaires, il faut vérifier qu’aucune personne n’est identifiable.

> **TIP:**
>
> Vrai. Les commentaires libres peuvent contenir des renseignements identifiants. La confidentialité doit être vérifiée avant tout partage.

### Question 11

Quelle affirmation décrit bien une bonne conclusion de tableau de bord?

1.  Elle résume les tendances visibles, nomme les limites et propose une action réaliste
2.  Elle répète tous les tableaux sans interprétation
3.  Elle affirme que le modèle explique tout
4.  Elle ignore les données manquantes

> **TIP:**
>
> Réponse: a. Une conclusion utile reste concise, interprète sans surpromettre et indique ce qui pourrait être amélioré.

### Question 12

Vrai ou faux: `flexdashboard` peut présenter plusieurs visualisations reliées dans une page de tableau de bord, et `shiny` peut ajouter de l’interactivité.

> **TIP:**
>
> Vrai. `flexdashboard` structure le tableau de bord; `shiny` peut rendre certains éléments réactifs aux choix de l’utilisateur.
