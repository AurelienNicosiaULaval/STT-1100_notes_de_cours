# Autodiagnostic - Module 9

STT-1100 Introduction à la science des données

Cet autodiagnostic non noté vérifie les notions du module 9. Il produit une correction détaillée, un résultat global, un bilan par compétence et un plan de révision ciblé.

> **NOTE:**
>
> - Première tentative: sans documentation, sans exécuter le code et sans aide extérieure, afin d’obtenir un portrait honnête.
> - Après le bilan: consultez les ressources proposées, refaites les exercices ciblés, puis reprenez le diagnostic.
> - Usage: ce diagnostic n’est pas noté et ne sert ni à attribuer une note ni à décider de l’admission au cours.
> - Confidentialité: aucune réponse n’est transmise à l’enseignant. La progression et l’historique sont conservés uniquement dans ce navigateur.

Les seuils sont des repères pédagogiques propres à STT-1100. Ils n’ont pas fait l’objet d’une validation psychométrique. Une réponse exacte peut aussi résulter du hasard; les exercices pratiques demeurent donc essentiels.

## Question 1

Dans une régression linéaire simple, que représente la pente associée à la variable explicative?

1.  La variation moyenne prédite de la variable réponse lorsque la variable explicative augmente d’une unité
2.  La valeur maximale observée dans les données
3.  Le nombre d’observations dans le tableau
4.  La proportion de valeurs manquantes

> **TIP:**
>
> Réponse: a. La pente décrit la variation moyenne prédite de la réponse pour une augmentation d’une unité de la variable explicative.

## Question 2

Vrai ou faux: un coefficient de régression prouve automatiquement une relation causale.

> **TIP:**
>
> Faux. Un modèle de régression décrit une association conditionnelle dans les données. Une interprétation causale demande un plan d’étude et des hypothèses supplémentaires.

## Question 3

Quelle fonction R ajuste un modèle linéaire?

1.  `lm()`
2.  `geom_point()`
3.  `read_csv()`
4.  `pivot_longer()`

> **TIP:**
>
> Réponse: a. `lm()` ajuste des modèles linéaires dans R.

## Question 4

Quelle fonction permet d’obtenir des prédictions à partir d’un modèle ajusté avec `lm()`?

1.  `predict()`
2.  `filter()`
3.  `count()`
4.  `arrange()`

> **TIP:**
>
> Réponse: a. `predict()` applique le modèle à de nouvelles observations lorsque les variables nécessaires sont fournies.

## Question 5

Dans les exercices du module, on définit l’erreur par `valeur_observee - valeur_predite`. Que signifie une erreur positive?

1.  La valeur observée est plus grande que la valeur prédite
2.  La valeur prédite est plus grande que la valeur observée
3.  La ligne contient toujours une valeur manquante
4.  Le modèle est nécessairement invalide

> **TIP:**
>
> Réponse: a. Une erreur positive indique que le modèle a prédit une valeur plus petite que la valeur observée.

## Question 6

Vrai ou faux: une prédiction faite très loin de la plage observée dans les données doit être interprétée avec prudence.

> **TIP:**
>
> Vrai. C’est une extrapolation. Le modèle peut devenir fragile lorsque les nouvelles valeurs ne ressemblent pas aux valeurs utilisées pour l’ajuster.

## Question 7

Dans une régression linéaire multiple, comment interprète-t-on généralement le coefficient d’une variable explicative?

1.  Comme une variation moyenne prédite en gardant les autres variables du modèle constantes
2.  Comme une preuve que cette variable cause la réponse
3.  Comme le pourcentage de données manquantes dans cette variable
4.  Comme la moyenne brute de la variable réponse

> **TIP:**
>
> Réponse: a. L’interprétation usuelle est conditionnelle aux autres variables incluses dans le modèle.

## Question 8

Vrai ou faux: si une nouvelle observation n’a pas toutes les variables requises par le modèle, `predict()` peut toujours produire automatiquement une bonne prédiction.

> **TIP:**
>
> Faux. Les variables attendues doivent être disponibles et compatibles avec celles utilisées pour ajuster le modèle.

## Question 9

Vrai ou faux: une différence brute de taux entre deux groupes prouve à elle seule une discrimination.

> **TIP:**
>
> Faux. Une différence brute peut signaler une question à examiner, mais elle ne suffit pas à établir une discrimination sans contexte, variables pertinentes et analyse prudente.

## Question 10

Quelle approche est la plus prudente pour explorer un biais descriptif?

1.  Comparer les résultats par groupe, puis examiner aussi les variables de contexte disponibles
2.  Conclure seulement à partir de la première proportion calculée
3.  Supprimer les groupes qui ne confirment pas l’hypothèse
4.  Remplacer les données par des impressions personnelles

> **TIP:**
>
> Réponse: a. Une comparaison par groupe est un point de départ, mais l’interprétation doit tenir compte du contexte et des variables disponibles.

## Question 11

Vrai ou faux: une variable de substitution peut porter indirectement de l’information liée à un groupe sensible ou contextuel.

> **TIP:**
>
> Vrai. Par exemple, une variable géographique peut parfois refléter indirectement des différences socioéconomiques ou démographiques.

## Question 12

Quelle phrase convient le mieux dans une conclusion responsable?

1.  Les résultats suggèrent une piste à vérifier, avec des limites liées aux variables disponibles et à la taille des groupes.
2.  Le modèle prouve définitivement la cause du phénomène.
3.  Aucune limite n’est nécessaire si le graphique est clair.
4.  Les données manquantes peuvent être ignorées dans tous les cas.

> **TIP:**
>
> Réponse: a. Une conclusion responsable précise les limites, évite de surinterpréter et distingue association, prédiction et causalité.
