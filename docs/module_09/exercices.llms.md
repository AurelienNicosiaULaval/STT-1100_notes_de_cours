# Exercices de consolidation

# Exercices de consolidation

Ces exercices reprennent la régression linéaire avec le jeu de données `penguins` du package `palmerpenguins`.

``` r
library(palmerpenguins)
library(tidyverse)

df <- penguins |>
  drop_na(body_mass_g, flipper_length_mm, sex, species)
```

## 1. Visualisation

Tracez la relation entre `body_mass_g` et `flipper_length_mm`. Est-ce qu’une relation linéaire semble plausible?

``` r
ggplot(df, aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(alpha = 0.7) +
  geom_smooth(method = "lm", se = FALSE) +
  theme_minimal()
```

## 2. Régression simple

Ajustez un modèle qui prédit `body_mass_g` à partir de `flipper_length_mm`.

``` r
modele_simple <- lm(body_mass_g ~ flipper_length_mm, data = df)
summary(modele_simple)
```

Interprétez la pente dans vos mots.

## 3. Régression multiple

Ajustez maintenant un modèle qui ajoute `sex`.

``` r
modele_multiple <- lm(body_mass_g ~ flipper_length_mm + sex, data = df)
summary(modele_multiple)
```

Questions :

- Quelle modalité de `sex` sert de référence?
- Comment interprétez-vous le coefficient de `sexmale`?
- La relation entre longueur de nageoire et masse change-t-elle beaucoup?

## 4. Prédiction ciblée

Prédisez la masse corporelle d’un manchot mâle avec une nageoire de 200 mm.

``` r
nouveau_manchot <- tibble(
  flipper_length_mm = 200,
  sex = "male"
)

predict(modele_multiple, newdata = nouveau_manchot)
```

## 5. Réflexion critique

La variable `species` pourrait-elle améliorer le modèle? Quelle précaution devez-vous prendre si elle est fortement liée à la longueur de nageoire?
