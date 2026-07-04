# Exercices de consolidation

# Exercices de consolidation

Ces exercices sont indépendants de l’aventure et du défi. Ils servent à consolider la régression linéaire, la prédiction et la discussion prudente des biais à partir de données fictives différentes de celles utilisées dans l’activité principale.

Avant de commencer, relisez au besoin les ressources du module: les chapitres 7 et 8 de *Introduction to Modern Statistics*, la documentation de `lm()`, la documentation de `predict.lm()` et le mini-test formatif du module.

``` r
library(tidyverse)
```

## Bloc A - Explorer une relation linéaire

### Exercice 1 - Importer les données

Importez le fichier `logements_energie_fictif.csv`. Chaque ligne représente un logement fictif de la région de Québec.

``` r
logements <- read_csv("data/logements_energie_fictif.csv", show_col_types = FALSE)

glimpse(logements)
```

    Rows: 32
    Columns: 8
    $ logement_id            <chr> "L001", "L002", "L003", "L004", "L005", "L006",…
    $ quartier               <chr> "Montcalm", "Limoilou", "Sainte-Foy", "Vanier",…
    $ superficie_m2          <dbl> 62, 74, 91, 58, 113, 105, 130, 46, 124, 88, 67,…
    $ annee_construction     <dbl> 1988, 1975, 2006, 1968, 1992, 1980, 2012, 1948,…
    $ nb_occupants           <dbl> 1, 2, 3, 2, 4, 3, 4, 1, 5, 3, 2, 2, 1, 4, 3, 2,…
    $ type_chauffage         <chr> "Electricite", "Electricite", "Electricite", "M…
    $ revenu_median_quartier <dbl> 64000, 52000, 71000, 47000, 59000, 56000, 82000…
    $ consommation_kwh       <dbl> 11800, 14300, 16150, 15600, 20550, 18800, 21400…

> **TIP:**
>
> Le tableau contient 32 logements fictifs. La variable `consommation_kwh` sera utilisée comme variable réponse dans les premiers exercices.

### Exercice 2 - Visualiser la relation principale

Tracez la relation entre la superficie du logement et la consommation annuelle d’électricité. Ajoutez une droite de régression.

``` r
ggplot(logements, aes(x = superficie_m2, y = consommation_kwh)) +
  geom_point(alpha = 0.75, size = 2) +
  geom_smooth(method = "lm", formula = y ~ x, se = FALSE) +
  labs(
    x = "Superficie du logement (m2)",
    y = "Consommation annuelle (kWh)",
    title = "Consommation annuelle selon la superficie"
  ) +
  theme_minimal()
```

![](exercices_files/figure-html/unnamed-chunk-2-1.png)

> **TIP:**
>
> La relation semble positive: les logements plus grands tendent à avoir une consommation annuelle plus élevée. Ce graphique ne prouve pas que la superficie cause toute la consommation, mais il suggère une association utile pour un premier modèle.

### Exercice 3 - Ajuster une régression simple

Ajustez un modèle qui prédit la consommation annuelle à partir de la superficie.

``` r
modele_simple <- lm(consommation_kwh ~ superficie_m2, data = logements)

summary(modele_simple)
```


    Call:
    lm(formula = consommation_kwh ~ superficie_m2, data = logements)

    Residuals:
        Min      1Q  Median      3Q     Max
    -2979.7  -977.5  -129.1  1105.0  3303.2

    Coefficients:
                  Estimate Std. Error t value Pr(>|t|)
    (Intercept)   7113.129    910.209   7.815 1.01e-08 ***
    superficie_m2  110.884      9.743  11.381 2.07e-12 ***
    ---
    Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

    Residual standard error: 1549 on 30 degrees of freedom
    Multiple R-squared:  0.8119,    Adjusted R-squared:  0.8057
    F-statistic: 129.5 on 1 and 30 DF,  p-value: 2.071e-12

Interprétez la pente dans vos mots.

> **TIP:**
>
> La pente estime la variation moyenne prédite de la consommation annuelle lorsque la superficie augmente d’un mètre carré. L’interprétation doit rester descriptive, car d’autres variables comme le nombre d’occupants, l’âge du bâtiment et le type de chauffage peuvent aussi jouer un rôle.

## Bloc B - Prédire et diagnostiquer

### Exercice 4 - Ajuster une régression multiple

Ajustez maintenant un modèle qui ajoute le nombre d’occupants et l’année de construction.

``` r
modele_multiple <- lm(
  consommation_kwh ~ superficie_m2 + nb_occupants + annee_construction,
  data = logements
)

summary(modele_multiple)
```


    Call:
    lm(formula = consommation_kwh ~ superficie_m2 + nb_occupants +
        annee_construction, data = logements)

    Residuals:
        Min      1Q  Median      3Q     Max
    -1717.9  -375.9  -127.5   291.4  1656.4

    Coefficients:
                        Estimate Std. Error t value Pr(>|t|)
    (Intercept)        101766.34   24023.19   4.236 0.000222 ***
    superficie_m2          91.23      15.85   5.756 3.53e-06 ***
    nb_occupants         1416.11     237.05   5.974 1.96e-06 ***
    annee_construction    -48.75      12.52  -3.893 0.000559 ***
    ---
    Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

    Residual standard error: 785.4 on 28 degrees of freedom
    Multiple R-squared:  0.9549,    Adjusted R-squared:  0.9501
    F-statistic: 197.5 on 3 and 28 DF,  p-value: < 2.2e-16

Comparez l’interprétation du coefficient de `superficie_m2` avec celle obtenue dans le modèle simple.

> **TIP:**
>
> Dans le modèle multiple, le coefficient de `superficie_m2` s’interprète en gardant fixes `nb_occupants` et `annee_construction`. Il ne répond donc pas exactement à la même question que le modèle simple.

### Exercice 5 - Produire des prédictions

Créez deux nouveaux logements fictifs, puis utilisez le modèle multiple pour prédire leur consommation annuelle.

``` r
nouveaux_logements <- tibble(
  superficie_m2 = c(70, 120),
  nb_occupants = c(2, 4),
  annee_construction = c(1990, 2015)
)

predictions_logements <- nouveaux_logements |>
  mutate(consommation_predite = predict(modele_multiple, newdata = nouveaux_logements))

predictions_logements
```

    # A tibble: 2 × 4
      superficie_m2 nb_occupants annee_construction consommation_predite
              <dbl>        <dbl>              <dbl>                <dbl>
    1            70            2               1990               13966.
    2           120            4               2015               20141.

> **TIP:**
>
> Les prédictions sont des valeurs attendues selon le modèle. Elles ne remplacent pas une mesure réelle et elles deviennent plus fragiles si le nouveau logement ressemble peu aux logements utilisés pour ajuster le modèle.

### Exercice 6 - Comparer les valeurs observées et prédites

Ajoutez les prédictions du modèle multiple au tableau initial, puis calculez l’erreur `observe - predit`.

``` r
diagnostic_modele <- logements |>
  mutate(
    consommation_predite = predict(modele_multiple, newdata = logements),
    erreur_kwh = consommation_kwh - consommation_predite,
    erreur_absolue_kwh = abs(erreur_kwh)
  )

diagnostic_modele |>
  arrange(desc(erreur_absolue_kwh)) |>
  select(
    logement_id,
    quartier,
    consommation_kwh,
    consommation_predite,
    erreur_kwh,
    erreur_absolue_kwh
  ) |>
  slice_head(n = 6)
```

    # A tibble: 6 × 6
      logement_id quartier   consommation_kwh consommation_predite erreur_kwh
      <chr>       <chr>                 <dbl>                <dbl>      <dbl>
    1 L028        Saint-Roch            10800               12518.     -1718.
    2 L004        Vanier                15600               13944.      1656.
    3 L015        Vanier                18400               16929.      1471.
    4 L026        Limoilou              16100               14655.      1445.
    5 L019        Sillery               21950               20731.      1219.
    6 L008        Saint-Roch            11250               12408.     -1158.
    # ℹ 1 more variable: erreur_absolue_kwh <dbl>

Calculez ensuite une erreur quadratique moyenne.

``` r
rmse_kwh <- sqrt(mean(diagnostic_modele$erreur_kwh^2))

rmse_kwh
```

    [1] 734.6654

> **TIP:**
>
> Les lignes avec les plus grandes erreurs absolues méritent une inspection. Elles peuvent révéler des logements atypiques, des variables importantes absentes du modèle ou simplement de la variabilité naturelle.

### Exercice 7 - Visualiser les erreurs

Tracez les erreurs en fonction des valeurs prédites. Le graphique devrait aider à voir si les erreurs restent centrées autour de zéro.

``` r
ggplot(diagnostic_modele, aes(x = consommation_predite, y = erreur_kwh)) +
  geom_hline(yintercept = 0, linetype = "dashed") +
  geom_point(alpha = 0.75, size = 2) +
  labs(
    x = "Consommation prédite (kWh)",
    y = "Erreur: observé - prédit (kWh)",
    title = "Diagnostic visuel des erreurs"
  ) +
  theme_minimal()
```

![](exercices_files/figure-html/unnamed-chunk-8-1.png)

> **TIP:**
>
> Un bon réflexe est de chercher des motifs: erreurs qui augmentent avec les prédictions, groupes séparés ou points très isolés. Un tel motif ne condamne pas automatiquement le modèle, mais il signale une limite à discuter.

## Bloc C - Examiner un biais descriptif

### Exercice 8 - Importer un second jeu de données

Importez le fichier `subventions_culture_fictif.csv`. Chaque ligne représente une demande fictive de subvention culturelle.

``` r
subventions <- read_csv("data/subventions_culture_fictif.csv", show_col_types = FALSE)

glimpse(subventions)
```

    Rows: 36
    Columns: 8
    $ dossier_id       <chr> "S001", "S002", "S003", "S004", "S005", "S006", "S007…
    $ region           <chr> "Capitale-Nationale", "Capitale-Nationale", "Bas-Sain…
    $ discipline       <chr> "Theatre", "Musique", "Arts visuels", "Danse", "Theat…
    $ taille_organisme <chr> "Grand", "Petit", "Petit", "Grand", "Moyen", "Petit",…
    $ premiere_demande <chr> "Non", "Oui", "Oui", "Non", "Non", "Oui", "Oui", "Non…
    $ budget_demande   <dbl> 82000, 24000, 18000, 91000, 45000, 22000, 31000, 7600…
    $ score_comite     <dbl> 86, 72, 68, 88, 74, 64, 70, 82, 66, 78, 71, 69, 90, 6…
    $ decision         <chr> "Acceptee", "Acceptee", "Refusee", "Acceptee", "Accep…

> **TIP:**
>
> Ce jeu de données est fictif. Il sert à pratiquer une lecture descriptive des écarts entre groupes sans conclure trop vite à une cause ou à une discrimination.

### Exercice 9 - Comparer les taux par région

Calculez le taux d’acceptation par région, puis produisez un graphique.

``` r
taux_acceptation_region <- subventions |>
  group_by(region) |>
  summarise(
    demandes = n(),
    taux_acceptation = mean(decision == "Acceptee"),
    .groups = "drop"
  ) |>
  arrange(taux_acceptation)

taux_acceptation_region
```

    # A tibble: 7 × 3
      region                  demandes taux_acceptation
      <chr>                      <int>            <dbl>
    1 Cote-Nord                      5            0.2
    2 Chaudiere-Appalaches           4            0.25
    3 Bas-Saint-Laurent              5            0.4
    4 Outaouais                      5            0.4
    5 Saguenay-Lac-Saint-Jean        5            0.6
    6 Capitale-Nationale             6            0.833
    7 Montreal                       6            1

``` r
ggplot(taux_acceptation_region, aes(x = taux_acceptation, y = reorder(region, taux_acceptation))) +
  geom_col() +
  labs(
    x = "Taux d'acceptation",
    y = NULL,
    title = "Taux d'acceptation par région"
  ) +
  theme_minimal()
```

![](exercices_files/figure-html/unnamed-chunk-11-1.png)

> **TIP:**
>
> Les taux bruts peuvent attirer l’attention sur des écarts, mais les groupes ont peu d’observations. Il faut donc éviter une conclusion définitive.

### Exercice 10 - Ajouter des variables de contexte

Comparez aussi les décisions selon la taille de l’organisme et selon le fait qu’il s’agisse d’une première demande.

``` r
taux_acceptation_taille <- subventions |>
  group_by(taille_organisme) |>
  summarise(
    demandes = n(),
    taux_acceptation = mean(decision == "Acceptee"),
    score_moyen = mean(score_comite),
    .groups = "drop"
  )

taux_acceptation_taille
```

    # A tibble: 3 × 4
      taille_organisme demandes taux_acceptation score_moyen
      <chr>               <int>            <dbl>       <dbl>
    1 Grand                   8            1            85.1
    2 Moyen                  13            0.615        72.6
    3 Petit                  15            0.267        67.1

``` r
taux_acceptation_premiere <- subventions |>
  group_by(premiere_demande) |>
  summarise(
    demandes = n(),
    taux_acceptation = mean(decision == "Acceptee"),
    budget_median = median(budget_demande),
    score_moyen = mean(score_comite),
    .groups = "drop"
  )

taux_acceptation_premiere
```

    # A tibble: 2 × 5
      premiere_demande demandes taux_acceptation budget_median score_moyen
      <chr>               <int>            <dbl>         <dbl>       <dbl>
    1 Non                    18            0.944         48500        78.7
    2 Oui                    18            0.167         27000        67.6

> **TIP:**
>
> Une différence par région peut être liée à d’autres variables disponibles, par exemple la taille de l’organisme, le score du comité ou le statut de première demande. Cela ne règle pas la question du biais, mais cela rend l’analyse plus honnête.

### Exercice 11 - Formuler une conclusion prudente

À partir des tableaux précédents, écrivez trois phrases:

1.  une phrase qui décrit un écart observé;
2.  une phrase qui mentionne une limite des données;
3.  une phrase qui propose une vérification supplémentaire.

> **TIP:**
>
> Exemple possible: les taux d’acceptation varient entre les régions dans ce fichier fictif. Toutefois, chaque région contient peu de demandes et les taux bruts ne tiennent pas compte de toutes les caractéristiques des dossiers. Une prochaine étape serait de vérifier si les écarts persistent à score comparable, discipline comparable et taille d’organisme comparable.

## Étude de cas 1 - Prévoir une consommation résidentielle

Un petit organisme municipal veut prévoir la consommation annuelle de nouveaux logements afin de planifier un programme d’accompagnement énergétique.

Votre mandat:

1.  choisir un modèle entre `modele_simple` et `modele_multiple`;
2.  prédire la consommation pour trois logements fictifs;
3.  écrire trois limites à communiquer avant d’utiliser les prédictions.

``` r
logements_a_evaluer <- tibble(
  superficie_m2 = c(65, 95, 145),
  nb_occupants = c(1, 3, 5),
  annee_construction = c(1972, 2001, 2018)
)

logements_a_evaluer |>
  mutate(consommation_predite = predict(modele_multiple, newdata = logements_a_evaluer))
```

    # A tibble: 3 × 4
      superficie_m2 nb_occupants annee_construction consommation_predite
              <dbl>        <dbl>              <dbl>                <dbl>
    1            65            1               1972               12971.
    2            95            3               2001               17126.
    3           145            5               2018               23691.

> **TIP:**
>
> Le modèle multiple est préférable ici parce qu’il utilise plus d’information pertinente. Les limites à communiquer peuvent inclure: les données sont fictives et petites; le modèle ne contient pas l’isolation, les habitudes de chauffage ni les appareils; les prédictions doivent rester dans la plage de logements semblables à ceux observés.

## Étude de cas 2 - Auditer une procédure de subvention

Un comité souhaite savoir si ses décisions de subvention présentent des écarts préoccupants entre groupes.

Votre mandat:

1.  choisir deux variables de comparaison;
2.  calculer des taux d’acceptation et des scores moyens;
3.  rédiger un court paragraphe qui distingue signal descriptif, limite et prochaine analyse.

``` r
resume_audit <- subventions |>
  group_by(region, taille_organisme) |>
  summarise(
    demandes = n(),
    taux_acceptation = mean(decision == "Acceptee"),
    score_moyen = mean(score_comite),
    budget_median = median(budget_demande),
    .groups = "drop"
  ) |>
  arrange(region, taille_organisme)

resume_audit
```

    # A tibble: 16 × 6
       region   taille_organisme demandes taux_acceptation score_moyen budget_median
       <chr>    <chr>               <int>            <dbl>       <dbl>         <dbl>
     1 Bas-Sai… Moyen                   1            1            77           39000
     2 Bas-Sai… Petit                   4            0.25         66.5         18500
     3 Capital… Grand                   2            1            84.5         80500
     4 Capital… Moyen                   2            1            75.5         43000
     5 Capital… Petit                   2            0.5          71           27000
     6 Chaudie… Moyen                   2            0.5          71.5         38000
     7 Chaudie… Petit                   2            0            64           23000
     8 Cote-No… Moyen                   2            0.5          69.5         37500
     9 Cote-No… Petit                   3            0            65.3         17000
    10 Montreal Grand                   5            1            86.2         88000
    11 Montreal Moyen                   1            1            74           38000
    12 Outaoua… Moyen                   3            0.333        71.3         37000
    13 Outaoua… Petit                   2            0.5          69           23000
    14 Saguena… Grand                   1            1            81           70000
    15 Saguena… Moyen                   2            0.5          73           37500
    16 Saguena… Petit                   2            0.5          68.5         25500

> **TIP:**
>
> Un paragraphe prudent pourrait dire que les taux d’acceptation diffèrent selon certaines combinaisons de région et de taille d’organisme dans les données fictives. Cependant, plusieurs cellules contiennent peu de demandes, ce qui rend les comparaisons instables. Avant de parler de biais ou de discrimination, il faudrait examiner des dossiers comparables, documenter les critères de décision et vérifier si certaines variables agissent comme variables de substitution.
