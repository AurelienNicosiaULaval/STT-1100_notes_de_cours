# Exercices de consolidation

# Exercices de consolidation

Voici un exercice intégrateur basé sur le jeu de données `penguins` du package `palmerpenguins`. Il combine modélisation, interprétation et réflexion critique.

## Étude de la masse corporelle des manchots

Vous travaillez pour une ONG environnementale qui souhaite mieux comprendre les facteurs influençant la masse corporelle des manchots en Antarctique. Vous disposez du jeu de données `penguins`, nettoyé à l’aide de la fonction `drop_na()` pour éviter les valeurs manquantes.

``` r
library(palmerpenguins)
library(tidyverse)

df <- penguins %>%
  drop_na()
```

### 1. Visualisation et hypothèse

Tracez la relation entre `body_mass_g` et `flipper_length_mm`. Est-ce qu’une relation linéaire vous semble plausible ?

Solution

Utilisez `ggplot(df, aes(x = flipper_length_mm, y = body_mass_g)) + geom_point() + geom_smooth(method = "lm")`. La relation est clairement linéaire.

### 2. Régression simple

Ajustez un modèle `body_mass_g ~ flipper_length_mm`. Interprétez la pente.

Solution

Chaque mm supplémentaire de longueur de nageoire est associé à une augmentation moyenne de X grammes de masse corporelle (voir valeur exacte dans le modèle).

### 3. Régression multiple

Ajustez maintenant `body_mass_g ~ flipper_length_mm + sex`. Quelle est la variable de référence ? Quelles différences observez-vous ?

Solution

R utilise la première modalité alphabétique comme référence (ici probablement “female”). Le coefficient de `sexmale` représente la différence moyenne de masse entre mâles et femelles, à longueur égale.

### 4. Prédictions ciblées

Prédisez la masse corporelle pour un manchot avec 200 mm de longueur de nageoire, mâle.

Solution

Créer une table `newdata <- tibble(flipper_length_mm = 200, sex = "male")` puis faire `predict(model, newdata)`.

### 5. Réflexion critique

La variable `species` est-elle pertinente à inclure ? Quelle précaution devez-vous prendre si vous l’ajoutez ?

Solution

Oui, `species` est très corrélée avec la masse. Il faut faire attention à la multicolinéarité si elle est fortement liée aux autres prédicteurs.

Bonne exploration !
