# Exercices de consolidation

# Exercices de consolidation

Pour mettre en pratique les apprentissages de ce module, vous trouverez ci‑dessous **13 exercices** couvrant l’ensemble des notions du module 2 (`ggplot2`, `dplyr`, EDA, données tidy, bonnes pratiques de style et statistique descriptive façon *IMS*).
Nous utiliserons principalement le jeu de données **`mpg`** prevenant de la library `ggplot2` (performances de voitures commercialisées aux États‑Unis, 1999‑2008). Lorsque d’autres jeux de données sont utilisés, ils sont précisés dans l’énoncé.

### Jeu de données `mpg` – Description des variables

| Variable | Type | Description (français) |
|----|----|----|
| `manufacturer` | facteur | Constructeur automobile (ex. *toyota*, *audi*). |
| `model` | facteur | Modèle spécifique du véhicule (ex. *corolla*, *a4*). |
| `displ` | numérique | Cylindrée du moteur en litres (L). |
| `year` | entier | Année du modèle (1999 ou 2008). |
| `cyl` | entier | Nombre de cylindres du moteur. |
| `trans` | facteur | Type de transmission : automatique (`auto`) ou manuelle (`manual`) ; suffixe = nombre de rapports. |
| `drv` | facteur | Type de transmission finale : traction avant (`f`), propulsion (`r`) ou intégrale (`4`). |
| `cty` | numérique | Consommation **ville** en miles par gallon (MPG). |
| `hwy` | numérique | Consommation **autoroute** en miles par gallon (MPG). |
| `fl` | facteur | Type de carburant : *c* (CNG), *d* (diesel), *e* (éthanol), *p* (premium), *r* (régulier). |
| `class` | facteur | Catégorie de véhicule : *compact*, *suv*, *minivan*, etc. |

> Source : base *Fuel Economy* de l’EPA, incluse dans **ggplot2** et documentée avec `?mpg`.

------------------------------------------------------------------------

## Exercice 1 — Premier graphique *(visualisation rapide)*

*Contexte :* vous découvrez la relation entre cylindrée (`displ`) et consommation sur autoroute (`hwy`) dans **`mpg`**. Tracez un nuage de points.

> **TIP:**
>
> ``` r
> library(tidyverse)
>
> mpg %>%
>   ggplot(aes(displ, hwy)) +
>   geom_point() +
>   labs(
>     title = "Consommation autoroute vs cylindrée",
>     x = "Cylindrée (L)",
>     y = "MPG autoroute"
>   )
> ```

------------------------------------------------------------------------

## Exercice 2 — Ajout de couleur et thème *(esthétique)*

*Contexte :* améliorer la lisibilité du graphique précédent en distinguant les points par **catégorie de véhicule** (`class`) et en appliquant un thème minimaliste.

> **TIP:**
>
> ``` r
> mpg %>%
>   ggplot(aes(displ, hwy, colour = class)) +
>   geom_point(alpha = 0.8, size = 2) +
>   theme_minimal() +
>   labs(
>     title  = "Consommation selon la catégorie",
>     colour = "Catégorie"
>   )
> ```

------------------------------------------------------------------------

## Exercice 3 — Filtrer avec `dplyr` *(extraction ciblée)*

*Contexte :* la responsable marketing de **Toyota** souhaite connaître la dispersion de ses modèles. Sélectionnez uniquement les voitures *Toyota* et affichez `model`, `displ`, `hwy`.

> **TIP:**
>
> ``` r
> toyota <- mpg %>%
>   filter(manufacturer == "toyota") %>%
>   select(model, displ, hwy)
>
> toyota
> ```

------------------------------------------------------------------------

## Exercice 4 — Variable dérivée et résumé *(statistiques descriptives)*

*Contexte :* on définit une mesure d’**efficacité globale** `efficiency = hwy / cty`. Calculez, par catégorie (`class`), la moyenne et l’écart‑type de cette nouvelle variable.

> **TIP:**
>
> ``` r
> mpg %>%
>   mutate(efficiency = hwy / cty) %>%
>   group_by(class) %>%
>   summarise(
>     eff_mean = mean(efficiency, na.rm = TRUE),
>     eff_sd   = sd(efficiency,  na.rm = TRUE)
>   )
> ```

------------------------------------------------------------------------

## Exercice 5 — Histogramme et densité *(distribution)*

*Contexte :* la répartition de la cylindrée vous intrigue. Tracez l’histogramme de `displ` (largeur de classe 0,5 L) et superposez la densité.

> **TIP:**
>
> ``` r
> mpg %>%
>   ggplot(aes(displ)) +
>   geom_histogram(binwidth = 0.5, fill = "steelblue", colour = "white") +
>   geom_density(aes(y = ..count.. * 0.5), linewidth = 1) +
>   labs(x = "Cylindrée (L)")
> ```

------------------------------------------------------------------------

## Exercice 6 — Valeur extrême *(repérage d’outliers)*

*Contexte :* un magazine veut savoir quel modèle possède la **meilleure consommation autoroute**. Trouvez‑le et affichez `manufacturer`, `model`, `year`, `hwy`.

> **TIP:**
>
> ``` r
> mpg %>%
>   filter(hwy == max(hwy)) %>%
>   select(manufacturer, model, year, hwy)
> ```

------------------------------------------------------------------------

## Exercice 7 — Bonnes pratiques \#1 *(style tidyverse)*

*Contexte :* vous recevez un script bâclé. Réécrivez‑le pour qu’il respecte le guide de style tidyverse.

- Tout d’abord executer le code pour voir ce que ca donne. \> C’est l’ancienne facon de faire un graphique avec `base R`.

- Reproduisez le graphique avec `ggplot2` en respectant les bonnes pratiques de style.

``` r
plot(mpg$displ,mpg$hwy,col=as.factor(mpg$drv));title("plot")
```

> **TIP:**
>
> ``` r
> mpg %>%
>   ggplot(aes(displ, hwy, colour = drv)) +
>   geom_point() +
>   labs(
>     title  = "Consommation autoroute vs cylindrée",
>     x      = "Cylindrée (L)",
>     y      = "MPG autoroute",
>     colour = "Transmission"
>   )
> ```

------------------------------------------------------------------------

## Exercice 8 — Bonnes pratiques \#2 *(structure de script)*

*Contexte :* créez un fichier `analyse_mpg.R` avec :

- un en‑tête clair (auteur, date) ;

- chargement de `tidyverse` ;

- un pipeline qui calcule la moyenne de `hwy` par `class` et l’enregistre dans `mean_hwy`.

> **TIP:**
>
> ``` r
> # analyse_mpg.R – A. Nicosia
> # Date : 2025‑05‑20
>
> library(tidyverse)
>
> mean_hwy <- mpg %>%
>   group_by(class) %>%
>   summarise(mean_hwy = mean(hwy, na.rm = TRUE))
> ```

------------------------------------------------------------------------

## Exercice 9 — Données « tidy » *(pivot_longer)*

*Contexte :* vous passez des ventes annuelles d’un format large à long pour faciliter les visualisations.

``` r
sales <- tibble(
  brand = c("A", "B"),
  sales_2023 = c(120, 95),
  sales_2024 = c(150, 110)
)
```

> **TIP:**
>
> ``` r
> sales_long <- sales %>%
>   pivot_longer(
>     cols = starts_with("sales_"),
>     names_to = "year",
>     names_prefix = "sales_",
>     values_to = "units"
>   )
>
> sales_long
> ```

------------------------------------------------------------------------

## Exercice 10 — Sommaire numérique *(cinq‑nombre)*

*Contexte :* résumé statistique rapide du MPG en ville (`cty`).

> **TIP:**
>
> ``` r
> fivenum(mpg$cty)
> # ou
> summary(mpg$cty)
> ```

------------------------------------------------------------------------

## Exercice 11 — Boxplot par catégorie *(comparaison de groupes)*

*Contexte :* visualiser la distribution de `hwy` par `class`, classes triées par médiane décroissante.

> **TIP:**
>
> ``` r
> mpg %>%
>   ggplot(aes(reorder(class, hwy, median, na.rm = TRUE), hwy)) +
>   geom_boxplot(fill = "orange") +
>   coord_flip() +
>   labs(
>     x = "Catégorie (triée)",
>     y = "MPG autoroute"
>   )
> ```

------------------------------------------------------------------------

## Exercice 12 — Facettes *(distribution par transmission)*

*Contexte :* comparer les distributions de cylindrée (`displ`) selon le type de transmission (`drv`).

> **TIP:**
>
> ``` r
> mpg %>%
>   ggplot(aes(displ)) +
>   geom_histogram(binwidth = 0.5, fill = "darkseagreen") +
>   facet_wrap(~ drv, nrow = 1) +
>   labs(x = "Cylindrée (L)")
> ```

------------------------------------------------------------------------

## Exercice 13 — Analyse statistique complète *(inspiration IMS)*

*Contexte :* comme dans le chapitre 5 d’*Introduction to Modern Statistics*, vous devez explorer en profondeur la variable **`hwy`**.

1.  Calculez la moyenne, l’écart‑type, la médiane, l’IQR et le nombre d’observations.
2.  Créez un histogramme de `hwy` avec la densité superposée.
3.  Ajoutez un boxplot (horizontal) sous l’histogramme.
4.  Interprétez : distribution symétrique ou asymétrique ? valeurs extrêmes ? que peut‑on conclure sur l’efficacité énergétique des voitures ?

> **TIP:**
>
> ``` r
> # 1. Statistiques
> mpg %>%
>   summarise(
>     n        = n(),
>     mean_hwy = mean(hwy),
>     sd_hwy   = sd(hwy),
>     median_hwy = median(hwy),
>     IQR_hwy    = IQR(hwy)
>   )
>
> # 2‑3. Histogramme + boxplot
> library(patchwork)  # pour l’assemblage (facultatif)
>
> p1 <- mpg %>%
>   ggplot(aes(hwy)) +
>   geom_histogram(binwidth = 2, fill = "steelblue", colour = "white") +
>   geom_density(aes(y = ..count.. * 2), linewidth = 1) +
>   labs(title = "Distribution de MPG autoroute")
>
> p2 <- mpg %>%
>   ggplot(aes(y = hwy)) +
>   geom_boxplot(fill = "orange", width = 0.4) +
>   theme_void()
>
> p1 / p2  # patchwork empile les deux graphiques
> ```
>
> *Interprétation :* la distribution est légèrement asymétrique à droite ; quelques véhicules très efficaces (\> 40 MPG) apparaissent comme valeurs extrêmes. Globalement, la médiane autour de 24 MPG indique qu’une majorité de voitures reste modérément efficace.
