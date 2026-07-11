# Exercices de consolidation

Ces exercices sont indépendants de l’aventure et du défi. Ils consolident la régression linéaire, la prédiction et l’analyse prudente des biais de couverture avec des données municipales québécoises réelles.

Les deux fichiers proviennent du jeu [Stratégie québécoise d’économie d’eau potable 2019-2025](https://www.donneesquebec.ca/recherche/dataset/sqeep-2019-2025) du ministère des Affaires municipales et de l’Habitation. Les données ont été déclarées par les municipalités participantes et approuvées par le Ministère. Elles sont diffusées sous licence CC BY 4.0.

``` r
library(tidyverse)

moyenne_si_disponible <- function(x) {
  if (all(is.na(x))) NA_real_ else mean(x, na.rm = TRUE)
}
```

## Bloc A - Explorer une relation linéaire

### Exercice 1 - Importer les données

Importez `consommation_eau_municipalites_2023.csv`. Chaque ligne représente une municipalité québécoise dont les variables nécessaires sont disponibles et dont la population desservie atteint au moins 500 personnes.

``` r
eau <- read_csv(
  "data/consommation_eau_municipalites_2023.csv",
  show_col_types = FALSE
)

glimpse(eau)
```

    Rows: 496
    Columns: 10
    $ code_municipalite                   <chr> "88055", "88022", "85020", "87085"…
    $ municipalite                        <chr> "Amos", "Barraute", "Béarn", "Dupu…
    $ type_municipalite                   <chr> "Ville", "Municipalité", "Municipa…
    $ region                              <chr> "Abitibi-Témiscamingue", "Abitibi-…
    $ consommation_residentielle_l_pers_j <dbl> 243, 184, 192, 158, 216, 154, 172,…
    $ population_desservie                <dbl> 11771, 1414, 689, 618, 7130, 543, …
    $ population_desservie_milliers       <dbl> 11.771, 1.414, 0.689, 0.618, 7.130…
    $ residences_desservies               <dbl> 5740, 594, 325, 266, 3565, 269, 22…
    $ personnes_par_residence             <dbl> 2.050635, 2.380000, 2.120000, 2.32…
    $ eau_distribuee_l_pers_j             <dbl> 414, 307, 580, 301, 396, 208, 1047…

> **TIP:**
>
> Le tableau contient 496 municipalités réparties dans les 17 régions administratives. La variable `eau_distribuee_l_pers_j` sera la réponse. Le filtre de disponibilité rend le modèle possible, mais il limite la population à laquelle les résultats peuvent être généralisés.

### Exercice 2 - Visualiser la relation principale

Tracez la quantité d’eau distribuée selon la consommation résidentielle. Ajoutez une droite de régression.

``` r
ggplot(
  eau,
  aes(
    x = consommation_residentielle_l_pers_j,
    y = eau_distribuee_l_pers_j
  )
) +
  geom_point(alpha = 0.55, size = 1.8) +
  geom_smooth(method = "lm", formula = y ~ x, se = FALSE) +
  labs(
    x = "Consommation résidentielle (L/personne/jour)",
    y = "Eau distribuée (L/personne/jour)",
    title = "Quantité d'eau distribuée et consommation résidentielle"
  ) +
  theme_minimal()
```

![](exercices_files/figure-html/unnamed-chunk-2-1.png)

> **TIP:**
>
> La relation est positive, mais la dispersion demeure importante. La consommation résidentielle ne représente qu’une partie de l’eau distribuée et le graphique ne démontre pas une relation causale.

### Exercice 3 - Ajuster une régression simple

Ajustez un modèle qui prédit la quantité d’eau distribuée à partir de la consommation résidentielle.

``` r
modele_simple <- lm(
  eau_distribuee_l_pers_j ~ consommation_residentielle_l_pers_j,
  data = eau
)

summary(modele_simple)
```


    Call:
    lm(formula = eau_distribuee_l_pers_j ~ consommation_residentielle_l_pers_j,
        data = eau)

    Residuals:
        Min      1Q  Median      3Q     Max
    -334.06 -115.95  -60.74   56.45 1892.37

    Coefficients:
                                        Estimate Std. Error t value Pr(>|t|)
    (Intercept)                          89.4507    28.2324   3.168  0.00163 **
    consommation_residentielle_l_pers_j   1.5015     0.1192  12.601  < 2e-16 ***
    ---
    Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

    Residual standard error: 207.5 on 494 degrees of freedom
    Multiple R-squared:  0.2432,    Adjusted R-squared:  0.2417
    F-statistic: 158.8 on 1 and 494 DF,  p-value: < 2.2e-16

Interprétez la pente dans vos mots.

> **TIP:**
>
> La pente estime la variation moyenne prédite de l’eau distribuée lorsque la consommation résidentielle augmente d’un litre par personne et par jour. Elle décrit une association dans les municipalités retenues, sans prouver que cette hausse cause à elle seule la variation observée.

## Bloc B - Prédire et diagnostiquer

### Exercice 4 - Ajuster une régression multiple

Ajoutez la population desservie, exprimée en milliers de personnes, et le nombre moyen de personnes par résidence.

``` r
modele_multiple <- lm(
  eau_distribuee_l_pers_j ~
    consommation_residentielle_l_pers_j +
    population_desservie_milliers +
    personnes_par_residence,
  data = eau
)

summary(modele_multiple)
```


    Call:
    lm(formula = eau_distribuee_l_pers_j ~ consommation_residentielle_l_pers_j +
        population_desservie_milliers + personnes_par_residence,
        data = eau)

    Residuals:
        Min      1Q  Median      3Q     Max
    -331.66 -116.76  -59.09   55.66 1893.47

    Coefficients:
                                         Estimate Std. Error t value Pr(>|t|)
    (Intercept)                         129.23156   50.76174   2.546   0.0112 *
    consommation_residentielle_l_pers_j   1.47677    0.12206  12.098   <2e-16 ***
    population_desservie_milliers         0.01469    0.09986   0.147   0.8831
    personnes_par_residence             -15.39861   16.30254  -0.945   0.3454
    ---
    Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

    Residual standard error: 207.7 on 492 degrees of freedom
    Multiple R-squared:  0.2446,    Adjusted R-squared:   0.24
    F-statistic: 53.11 on 3 and 492 DF,  p-value: < 2.2e-16

Comparez l’interprétation du coefficient de `consommation_residentielle_l_pers_j` avec celle du modèle simple.

> **TIP:**
>
> Dans le modèle multiple, le coefficient est interprété à population desservie et nombre de personnes par résidence constants. Il ne répond donc pas exactement à la même question que la pente du modèle simple.

### Exercice 5 - Produire des prédictions

Construisez deux scénarios situés dans la plage des données, puis prédisez la quantité d’eau distribuée.

``` r
scenarios_eau <- tibble(
  consommation_residentielle_l_pers_j = c(180, 240),
  population_desservie_milliers = c(5, 45),
  personnes_par_residence = c(2.1, 2.4)
)

predictions_eau <- scenarios_eau |>
  mutate(
    eau_distribuee_predite = predict(
      modele_multiple,
      newdata = scenarios_eau
    )
  )

predictions_eau
```

    # A tibble: 2 × 4
      consommation_residentielle_l_p…¹ population_desservie…² personnes_par_reside…³
                                 <dbl>                  <dbl>                  <dbl>
    1                              180                      5                    2.1
    2                              240                     45                    2.4
    # ℹ abbreviated names: ¹​consommation_residentielle_l_pers_j,
    #   ²​population_desservie_milliers, ³​personnes_par_residence
    # ℹ 1 more variable: eau_distribuee_predite <dbl>

> **TIP:**
>
> Ces valeurs sont des scénarios pédagogiques, pas des municipalités observées. Les prédictions sont des valeurs attendues selon le modèle et deviennent plus fragiles loin de la plage des données d’ajustement.

### Exercice 6 - Comparer les valeurs observées et prédites

Calculez les erreurs du modèle multiple et repérez les six plus grandes erreurs absolues.

``` r
diagnostic_modele <- eau |>
  mutate(
    eau_distribuee_predite = predict(modele_multiple, newdata = eau),
    erreur_l_pers_j = eau_distribuee_l_pers_j - eau_distribuee_predite,
    erreur_absolue = abs(erreur_l_pers_j)
  )

diagnostic_modele |>
  arrange(desc(erreur_absolue)) |>
  select(
    code_municipalite,
    municipalite,
    region,
    eau_distribuee_l_pers_j,
    eau_distribuee_predite,
    erreur_l_pers_j
  ) |>
  slice_head(n = 6)
```

    # A tibble: 6 × 6
      code_municipalite municipalite                   region eau_distribuee_l_per…¹
      <chr>             <chr>                          <chr>                   <dbl>
    1 99020             Chapais                        Nord-…                   2671
    2 54017             Saint-Damase (16)              Monté…                   1792
    3 03025             Murdochville                   Gaspé…                   1823
    4 49075             Notre-Dame-Du-Bon-Conseil (Vl) Centr…                   1352
    5 55037             Rougemont                      Monté…                   1294
    6 66112             Baie-D'urfé                    Montr…                   1417
    # ℹ abbreviated name: ¹​eau_distribuee_l_pers_j
    # ℹ 2 more variables: eau_distribuee_predite <dbl>, erreur_l_pers_j <dbl>

Calculez ensuite l’erreur quadratique moyenne.

``` r
rmse_eau <- sqrt(mean(diagnostic_modele$erreur_l_pers_j^2))

rmse_eau
```

    [1] 206.8512

> **TIP:**
>
> Une grande erreur peut signaler une municipalité atypique, une variable importante absente ou une mesure incertaine. Elle ne constitue pas automatiquement une erreur dans les données.

### Exercice 7 - Visualiser les erreurs

``` r
ggplot(
  diagnostic_modele,
  aes(x = eau_distribuee_predite, y = erreur_l_pers_j)
) +
  geom_hline(yintercept = 0, linetype = "dashed") +
  geom_point(alpha = 0.55, size = 1.8) +
  labs(
    x = "Eau distribuée prédite (L/personne/jour)",
    y = "Erreur: observé moins prédit",
    title = "Diagnostic visuel des erreurs"
  ) +
  theme_minimal()
```

![](exercices_files/figure-html/unnamed-chunk-8-1.png)

> **TIP:**
>
> Cherchez des motifs, des groupes séparés et des points isolés. Une dispersion qui augmente avec les prédictions signale notamment que l’incertitude n’est peut-être pas constante.

## Bloc C - Examiner un biais de couverture

### Exercice 8 - Importer les résultats de validité

Importez `validite_audits_eau_2023.csv`. Le fichier contient les 1 104 municipalités du tableau source, y compris celles pour lesquelles l’indice de validité n’est pas disponible.

``` r
validite <- read_csv(
  "data/validite_audits_eau_2023.csv",
  show_col_types = FALSE
)

glimpse(validite)
```

    Rows: 1,104
    Columns: 7
    $ code_municipalite                         <chr> "88055", "87050", "87100", "…
    $ municipalite                              <chr> "Amos", "Authier", "Authier-…
    $ type_municipalite                         <chr> "Ville", "Municipalité", "Mu…
    $ region                                    <chr> "Abitibi-Témiscamingue", "Ab…
    $ indice_validite_pct                       <dbl> 59, NA, NA, 57, NA, NA, NA, …
    $ branchements_non_residentiels_comptes_pct <dbl> 0.08867925, NA, NA, 0.000000…
    $ validite_disponible                       <lgl> TRUE, FALSE, FALSE, TRUE, FA…

> **TIP:**
>
> Une valeur manquante ne signifie pas que l’audit est invalide. Elle indique que l’indice n’est pas disponible dans cette ressource. Confondre absence et échec produirait une conclusion incorrecte.

### Exercice 9 - Comparer la disponibilité par région

Calculez la proportion de municipalités pour lesquelles l’indice est disponible, puis produisez un graphique.

``` r
disponibilite_region <- validite |>
  group_by(region) |>
  summarise(
    municipalites = n(),
    indices_disponibles = sum(validite_disponible),
    taux_disponibilite = mean(validite_disponible),
    .groups = "drop"
  ) |>
  arrange(taux_disponibilite)

disponibilite_region
```

    # A tibble: 17 × 4
       region                   municipalites indices_disponibles taux_disponibilite
       <chr>                            <int>               <int>              <dbl>
     1 Outaouais                           67                  20              0.299
     2 Abitibi-Témiscamingue               63                  26              0.413
     3 Gaspésie–Îles-de-la-Mad…            44                  20              0.455
     4 Estrie                             117                  57              0.487
     5 Bas-Saint-Laurent                  113                  60              0.531
     6 Centre-du-Québec                    78                  47              0.603
     7 Chaudière-Appalaches               136                  82              0.603
     8 Côte-Nord                           33                  21              0.636
     9 Montérégie                         148                  97              0.655
    10 Laurentides                         76                  52              0.684
    11 Mauricie                            42                  31              0.738
    12 Montréal                            16                  12              0.75
    13 Capitale-Nationale                  59                  47              0.797
    14 Nord-du-Québec                       5                   4              0.8
    15 Lanaudière                          57                  47              0.825
    16 Saguenay–Lac-Saint-Jean             49                  45              0.918
    17 Laval                                1                   1              1

``` r
ggplot(
  disponibilite_region,
  aes(x = taux_disponibilite, y = reorder(region, taux_disponibilite))
) +
  geom_col() +
  labs(
    x = "Proportion avec indice disponible",
    y = NULL,
    title = "Couverture de l'indice de validité par région"
  ) +
  theme_minimal()
```

![](exercices_files/figure-html/unnamed-chunk-11-1.png)

> **TIP:**
>
> Les écarts de couverture sont descriptifs. Ils peuvent refléter la participation, la disponibilité des mesures, la taille des réseaux ou d’autres mécanismes non observés.

### Exercice 10 - Ajouter le type de municipalité

Parmi les municipalités dont l’indice est disponible, comparez sa moyenne selon le type de municipalité.

``` r
validite_type <- validite |>
  filter(validite_disponible) |>
  group_by(type_municipalite) |>
  summarise(
    municipalites = n(),
    indice_moyen = mean(indice_validite_pct),
    branchements_comptes_median = median(
      branchements_non_residentiels_comptes_pct,
      na.rm = TRUE
    ),
    .groups = "drop"
  ) |>
  arrange(indice_moyen)

validite_type
```

    # A tibble: 6 × 4
      type_municipalite municipalites indice_moyen branchements_comptes_median
      <chr>                     <int>        <dbl>                       <dbl>
    1 Canton                       12         56.3                       0.957
    2 Village                      23         58.3                       0.935
    3 Cantons unis                  2         59                         0.5
    4 Municipalité                362         59.6                       0.990
    5 Paroisse                     66         59.9                       0.993
    6 Ville                       204         60.1                       0.942

> **TIP:**
>
> Cette comparaison porte uniquement sur les municipalités avec un indice publié. Si la disponibilité n’est pas aléatoire, les moyennes observées peuvent ne pas représenter toutes les municipalités du même type.

### Exercice 11 - Formuler une conclusion prudente

Rédigez trois phrases qui distinguent un écart observé, une limite de couverture et une vérification supplémentaire.

> **TIP:**
>
> Exemple possible: la proportion de municipalités avec un indice disponible varie entre les régions en 2023. Ces écarts ne démontrent pas une différence de qualité de gestion, car l’absence d’un indice peut dépendre de la participation et de la disponibilité des mesures. Une prochaine étape serait de documenter le mécanisme de non-réponse et de comparer les municipalités de taille et de type semblables.

## Étude de cas 1 - Prévoir une quantité d’eau distribuée

Un organisme municipal veut utiliser les données 2023 pour préparer des scénarios de consommation.

Votre mandat:

1.  choisir entre `modele_simple` et `modele_multiple`;
2.  produire trois scénarios situés dans la plage observée;
3.  communiquer trois limites avant d’utiliser les prédictions.

``` r
scenarios_programme <- tibble(
  consommation_residentielle_l_pers_j = c(160, 210, 275),
  population_desservie_milliers = c(2, 18, 90),
  personnes_par_residence = c(2.0, 2.3, 2.5)
)

scenarios_programme |>
  mutate(
    eau_distribuee_predite = predict(
      modele_multiple,
      newdata = scenarios_programme
    )
  )
```

    # A tibble: 3 × 4
      consommation_residentielle_l_p…¹ population_desservie…² personnes_par_reside…³
                                 <dbl>                  <dbl>                  <dbl>
    1                              160                      2                    2
    2                              210                     18                    2.3
    3                              275                     90                    2.5
    # ℹ abbreviated names: ¹​consommation_residentielle_l_pers_j,
    #   ²​population_desservie_milliers, ³​personnes_par_residence
    # ℹ 1 more variable: eau_distribuee_predite <dbl>

> **TIP:**
>
> Les limites incluent la sélection des cas complets, les variables absentes du modèle, les valeurs extrêmes et l’impossibilité de donner une interprétation causale aux coefficients.

## Étude de cas 2 - Auditer la couverture des audits

Un comité veut savoir si son portrait de la validité des données couvre uniformément les municipalités québécoises.

``` r
resume_audit <- validite |>
  group_by(region, type_municipalite) |>
  summarise(
    municipalites = n(),
    taux_disponibilite = mean(validite_disponible),
    indice_moyen_si_disponible = moyenne_si_disponible(indice_validite_pct),
    .groups = "drop"
  ) |>
  arrange(region, type_municipalite)

resume_audit
```

    # A tibble: 68 × 5
       region                type_municipalite municipalites taux_disponibilite
       <chr>                 <chr>                     <int>              <dbl>
     1 Abitibi-Témiscamingue Canton                        6              0.5
     2 Abitibi-Témiscamingue Cantons unis                  1              1
     3 Abitibi-Témiscamingue Municipalité                 40              0.275
     4 Abitibi-Témiscamingue Paroisse                      5              0.2
     5 Abitibi-Témiscamingue Ville                        11              0.909
     6 Bas-Saint-Laurent     Municipalité                 61              0.590
     7 Bas-Saint-Laurent     Paroisse                     36              0.333
     8 Bas-Saint-Laurent     Village                       2              1
     9 Bas-Saint-Laurent     Ville                        14              0.714
    10 Capitale-Nationale    Cantons unis                  1              1
    # ℹ 58 more rows
    # ℹ 1 more variable: indice_moyen_si_disponible <dbl>

> **TIP:**
>
> Le tableau permet de repérer des groupes moins couverts, mais pas d’attribuer une cause aux écarts. Avant de comparer la qualité des audits, il faut distinguer l’indice observé de sa disponibilité et examiner les mécanismes de participation et de mesure.
