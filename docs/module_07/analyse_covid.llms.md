# Analyse initiale des cas de COVID-19

## Contexte des données

Le jeu de données présenté dans cette analyse simule des informations collectées durant l’année 2022 sur des cas de COVID-19 parmi des personnes âgées vivant dans trois régions du Québec : Montréal, Québec et l’Outaouais. Chaque ligne représente un individu identifié par son prénom, nom, âge, région, date d’observation et le nombre de cas confirmés associés à lui. Les données incluent aussi une date d’observation.

         region age cas_confirmes       date
    1    Québec  78           111 2022-08-03
    2    Québec  66            92 2022-03-20
    3 Outaouais  68            74 2022-01-30
    4  Montréal  94           144 2022-12-05
    5    Québec  85           133 2022-05-02
    6    Québec  75            93 2022-07-21

## Visualisation proposée par l’équipe de recherche

``` r
cas_par_region <- covid_problematique %>%
  group_by(region) %>%
  summarise(cas_totaux = sum(cas_confirmes), .groups = "drop")

ggplot(cas_par_region, aes(x = region, y = cas_totaux, fill = region)) +
  geom_bar(stat = "identity") +
  scale_y_continuous(breaks = seq(0, max(cas_par_region$cas_totaux), by = 10)) +
  scale_fill_manual(values = c("Montréal" = "red", "Québec" = "orange", "Outaouais" = "purple")) +
  theme_minimal() +
  theme(legend.position = "none")
```

![](analyse_covid_files/figure-html/unnamed-chunk-2-1.png)

## Interprétation des résultats

Le graphique ci-dessus **montre clairement que la région de Montréal est la plus touchée**, avec un nombre de cas beaucoup plus élevé que les autres régions. Les données sont **tirées de nos rapports internes** collectés au courant de l’année 2012. Aucun ajustement par population n’a été fait, mais cela n’est pas jugé nécessaire.

# Analyse descriptives

## Tableau de cas notables

Dans cette section, nous cherchons à identifier les individus ayant généré le plus grand nombre de cas confirmés.

Le tableau suivant montre les 5 personnes ayant les plus hauts totaux individuels de cas confirmés selon notre base de données :

``` r
# Extraction des 5 personnes avec le plus grand nombre de cas confirmés
covid_problematique %>%
  arrange(desc(cas_confirmes)) %>%
  select(personne, region, cas_confirmes, date) %>%
  head(5)
```

                  personne    region cas_confirmes       date
    1  Luc Dupont , 66 ans  Montréal           147 2022-09-29
    2 Chloé Morin , 67 ans Outaouais           146 2022-08-30
    3 Chloé Gagné , 84 ans    Québec           145 2022-02-11
    4  Luc Dupont , 90 ans    Québec           145 2022-08-28
    5 Chloé Morin , 94 ans  Montréal           144 2022-12-05

## Analyse exploratoire complémentaire

``` r
covid_problematique %>%
  mutate(risque = if_else(age > 85 & cas_confirmes > 100, "Élevé", "Modéré")) %>%
  group_by(risque) %>%
  summarise(
    moyenne_age = mean(age),
    moyenne_cas = mean(cas_confirmes),
    .groups = "drop"
  )
```

    # A tibble: 2 × 3
      risque moyenne_age moyenne_cas
      <chr>        <dbl>       <dbl>
    1 Modéré        76.3        105.
    2 Élevé         91.8        132

``` r
covid_problematique %>%
  ggplot(aes(x = age, y = cas_confirmes)) +
  geom_point(color = "darkred") +
  geom_smooth(method = "lm", se = FALSE, linetype = "dashed") +
  labs(title = "Plus on est âgé, plus on contracte la COVID")
```

    `geom_smooth()` using formula = 'y ~ x'

![](analyse_covid_files/figure-html/unnamed-chunk-4-1.png)

## Recommandations immédiates

- Les autorités devraient concentrer leurs efforts sur **Montréal**, qui semble en crise.
- Les personnes âgées de plus de 85 ans devraient être priorisées (voir tableau).
- La région de Québec semble peu affectée : les ressources pourraient être redistribuées.

## Note méthodologique

Les données ont été regroupées rapidement sans normalisation par population. Aucune marge d’erreur, d’intervalle de confiance ou vérification des sources n’a été fournie. Les données couvrent des périodes variables sans harmonisation.

------------------------------------------------------------------------

**Remarque pédagogique** : Ce document contient volontairement de nombreuses erreurs de visualisation, d’éthique et d’analyse. Il est utilisé comme point de départ pour votre mission critique.

Le fichier `donnees_covid_module7.csv` est celui que vous devez utiliser pour produire une version corrigée du graphique.
