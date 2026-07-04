# Module 7 - Exercices

STT-1100 Introduction à la science des données

# Exercices de consolidation

Ces exercices sont indépendants de l’aventure et du défi. Ils servent à consolider les gestes du module 7: reconnaître une visualisation trompeuse, reconstruire un graphique défendable, réduire les risques de ré-identification et écrire une note éthique courte.

Les données utilisées ici sont fictives et ne représentent aucune personne, organisation ou municipalité réelle.

``` r
library(tidyverse)
library(scales)
```

# Lectures à revoir

- [R for Data Science - Communication](https://r4ds.hadley.nz/communication.html)
- [Fundamentals of Data Visualization - Directory of visualizations](https://clauswilke.com/dataviz/directory-of-visualizations.html)
- [Royal Statistical Society - Best Practices for Data Visualisation](https://royal-statistical-society.github.io/datavisguide/RSS-data-vis-guide.pdf)
- [Gouvernement du Québec - Anonymisation](https://www.quebec.ca/gouvernement/travailler-gouvernement/normes-gouvernance-pratiques-internes/protection-des-renseignements-personnels/anonymisation)
- [CNIL - L’anonymisation de données personnelles](https://www.cnil.fr/fr/technologies/lanonymisation-de-donnees-personnelles)
- [Wilkinson et al. (2016) - FAIR Guiding Principles](https://www.nature.com/articles/sdata201618)

Après les lectures, faites aussi le [mini-test formatif](../module_07/mini_test.llms.md). Il n’est pas noté.

# Bloc A - Diagnostiquer une visualisation

## Exercice 1 - Comparer deux axes

Importez les signalements municipaux fictifs, puis produisez deux graphiques sur les mêmes données:

- un graphique avec un axe vertical tronqué;
- un graphique avec un axe qui commence à zéro.

Que change la perception visuelle?

> **NOTE:**
>
> ``` r
> signalements <- read_csv(
>   "data/signalements_municipaux_fictif.csv",
>   show_col_types = FALSE
> )
>
> signalements_quartier <- signalements |>
>   group_by(quartier) |>
>   summarise(
>     total_signalements = sum(nb_signalements),
>     .groups = "drop"
>   ) |>
>   arrange(desc(total_signalements))
>
> signalements_quartier
> ```
>
>     # A tibble: 7 × 2
>       quartier         total_signalements
>       <chr>                         <dbl>
>     1 Sainte-Foy                       63
>     2 Saint-Roch                       60
>     3 Limoilou                         57
>     4 Beauport                         40
>     5 Charlesbourg                     19
>     6 La Cite-Limoilou                  5
>     7 Sillery                           3
>
> ``` r
> ggplot(signalements_quartier, aes(x = reorder(quartier, total_signalements), y = total_signalements)) +
>   geom_col(fill = "#B33A3A") +
>   coord_flip(ylim = c(20, max(signalements_quartier$total_signalements) * 1.05)) +
>   labs(
>     title = "Version trompeuse: axe tronqué",
>     x = "Quartier",
>     y = "Nombre de signalements"
>   )
> ```
>
> ![](exercices_files/figure-html/unnamed-chunk-2-1.png)
>
> ``` r
> ggplot(signalements_quartier, aes(x = reorder(quartier, total_signalements), y = total_signalements)) +
>   geom_col(fill = "#3C6E71") +
>   coord_flip() +
>   scale_y_continuous(limits = c(0, NA), expand = expansion(mult = c(0, 0.05))) +
>   labs(
>     title = "Version plus honnête: axe à zéro",
>     x = "Quartier",
>     y = "Nombre de signalements"
>   )
> ```
>
> ![](exercices_files/figure-html/unnamed-chunk-3-1.png)
>
> L’axe tronqué amplifie visuellement les écarts. Pour des barres, la longueur encode la quantité; commencer l’axe au-dessus de zéro peut donc donner une impression de différence plus forte que les données.

## Exercice 2 - Ajouter les effectifs au message

Calculez le nombre total de signalements par type. Produisez un graphique qui permet de comparer les types sans créer d’impression de risque individuel.

> **NOTE:**
>
> ``` r
> signalements_type <- signalements |>
>   group_by(type_signalement) |>
>   summarise(
>     total_signalements = sum(nb_signalements),
>     nb_quartiers = n_distinct(quartier),
>     .groups = "drop"
>   ) |>
>   arrange(desc(total_signalements))
>
> signalements_type
> ```
>
>     # A tibble: 5 × 3
>       type_signalement total_signalements nb_quartiers
>       <chr>                         <dbl>        <int>
>     1 bruit                            85            3
>     2 transport                        71            2
>     3 dechets                          49            2
>     4 logement                         37            4
>     5 securite                          5            1
>
> ``` r
> ggplot(signalements_type, aes(x = reorder(type_signalement, total_signalements), y = total_signalements)) +
>   geom_col(fill = "#4C78A8") +
>   geom_text(aes(label = total_signalements), hjust = -0.15, size = 3.5) +
>   coord_flip() +
>   scale_y_continuous(limits = c(0, max(signalements_type$total_signalements) * 1.15)) +
>   labs(
>     title = "Signalements municipaux fictifs par type",
>     subtitle = "Les nombres sont agrégés; aucune adresse individuelle n'est publiée",
>     x = "Type de signalement",
>     y = "Nombre de signalements"
>   )
> ```
>
> ![](exercices_files/figure-html/unnamed-chunk-5-1.png)
>
> Le graphique publie une information agrégée et lisible. Il évite les adresses ou détails individuels qui pourraient exposer une personne ou un ménage.

## Exercice 3 - Éviter les comparaisons injustes

Joignez les signalements à la population fictive des quartiers. Calculez un taux par 10 000 personnes. Pourquoi ce taux est-il plus défendable qu’une comparaison brute?

> **NOTE:**
>
> ``` r
> population <- read_csv(
>   "data/population_quartiers_fictif.csv",
>   show_col_types = FALSE
> )
>
> taux_quartier <- signalements_quartier |>
>   left_join(population, by = "quartier") |>
>   mutate(
>     taux_par_10000 = total_signalements / population_estimee * 10000
>   ) |>
>   arrange(desc(taux_par_10000))
>
> taux_quartier
> ```
>
>     # A tibble: 7 × 6
>       quartier         total_signalements population_estimee superficie_km2
>       <chr>                         <dbl>              <dbl>          <dbl>
>     1 Saint-Roch                       60              18200            3.1
>     2 Limoilou                         57              31800            8.4
>     3 Sainte-Foy                       63              74200           32.1
>     4 Beauport                         40              80500           74.4
>     5 Charlesbourg                     19              82600           66.3
>     6 Sillery                           3              13700            6.8
>     7 La Cite-Limoilou                  5             108000           22.2
>     # ℹ 2 more variables: indice_vulnerabilite <dbl>, taux_par_10000 <dbl>
>
> ``` r
> ggplot(taux_quartier, aes(x = reorder(quartier, taux_par_10000), y = taux_par_10000)) +
>   geom_col(fill = "#5B8E7D") +
>   coord_flip() +
>   labs(
>     title = "Signalements fictifs par 10 000 personnes",
>     subtitle = "La comparaison tient compte de la taille approximative des quartiers",
>     x = "Quartier",
>     y = "Signalements par 10 000 personnes"
>   )
> ```
>
> ![](exercices_files/figure-html/unnamed-chunk-7-1.png)
>
> Les nombres bruts favorisent les quartiers plus peuplés. Un taux par population rend la comparaison plus pertinente, même s’il ne suffit pas à expliquer les causes.

# Bloc B - Réduire les risques de ré-identification

## Exercice 4 - Repérer les variables sensibles

Importez le sondage étudiant fictif. Classez les variables en trois familles:

- identifiant direct;
- quasi-identifiant ou variable sensible;
- variable publiable après agrégation.

> **NOTE:**
>
> ``` r
> sondage <- read_csv(
>   "data/sondage_etudiant_fictif.csv",
>   show_col_types = FALSE
> )
>
> glimpse(sondage)
> ```
>
>     Rows: 16
>     Columns: 9
>     $ repondant_id             <chr> "E001", "E002", "E003", "E004", "E005", "E006…
>     $ programme                <chr> "Statistique", "Informatique", "Mathematiques…
>     $ niveau                   <dbl> 1, 2, 1, 3, 1, 2, 2, 3, 2, 3, 1, 3, 1, 2, 2, 1
>     $ age                      <dbl> 19, 21, 18, 24, 20, 22, 23, 26, 21, 25, 19, 2…
>     $ genre                    <chr> "F", "M", "F", "Non precise", "F", "M", "F", …
>     $ heures_etude             <dbl> 12, 18, 10, 22, 16, 20, 14, 28, 17, 24, 15, 1…
>     $ score_stress             <dbl> 6, 7, 5, 8, 6, 7, 4, 9, 6, 8, 5, 7, 4, 7, 6, 5
>     $ consentement_publication <chr> "oui", "oui", "oui", "oui", "non", "oui", "ou…
>     $ commentaire_libre        <chr> "Prefere ne pas etre citee.", "Travaille auss…
>
> ``` r
> tibble(
>   variable = names(sondage),
>   diagnostic = c(
>     "identifiant direct",
>     "quasi-identifiant",
>     "quasi-identifiant",
>     "quasi-identifiant",
>     "variable sensible",
>     "variable d'analyse",
>     "variable sensible",
>     "condition d'utilisation",
>     "texte libre risqué"
>   )
> )
> ```
>
>     # A tibble: 9 × 2
>       variable                 diagnostic
>       <chr>                    <chr>
>     1 repondant_id             identifiant direct
>     2 programme                quasi-identifiant
>     3 niveau                   quasi-identifiant
>     4 age                      quasi-identifiant
>     5 genre                    variable sensible
>     6 heures_etude             variable d'analyse
>     7 score_stress             variable sensible
>     8 consentement_publication condition d'utilisation
>     9 commentaire_libre        texte libre risqué
>
> `repondant_id` identifie directement une ligne. Le commentaire libre peut contenir des détails identifiants. Le programme, le niveau, l’âge et le genre peuvent devenir identifiants lorsqu’ils sont combinés.

## Exercice 5 - Préparer une version anonymisée

Créez une version du sondage qui:

- retire l’identifiant direct;
- retire le commentaire libre;
- conserve seulement les personnes ayant consenti à la publication;
- regroupe l’âge en classes;
- conserve des variables utiles pour une analyse agrégée.

> **NOTE:**
>
> ``` r
> sondage_anonyme <- sondage |>
>   filter(consentement_publication == "oui") |>
>   mutate(
>     age_groupe = cut(
>       age,
>       breaks = c(17, 20, 23, 26, Inf),
>       labels = c("18-20", "21-23", "24-26", "27+"),
>       right = TRUE
>     )
>   ) |>
>   select(
>     programme,
>     niveau,
>     age_groupe,
>     genre,
>     heures_etude,
>     score_stress
>   )
>
> sondage_anonyme
> ```
>
>     # A tibble: 15 × 6
>        programme           niveau age_groupe genre       heures_etude score_stress
>        <chr>                <dbl> <fct>      <chr>              <dbl>        <dbl>
>      1 Statistique              1 18-20      F                     12            6
>      2 Informatique             2 21-23      M                     18            7
>      3 Mathematiques            1 18-20      F                     10            5
>      4 Statistique              3 24-26      Non precise           22            8
>      5 Science des donnees      2 21-23      M                     20            7
>      6 Mathematiques            2 21-23      F                     14            4
>      7 Science des donnees      3 24-26      F                     28            9
>      8 Statistique              2 21-23      M                     17            6
>      9 Informatique             3 24-26      M                     24            8
>     10 Science des donnees      1 18-20      F                     15            5
>     11 Mathematiques            3 27+        Non precise           19            7
>     12 Statistique              1 18-20      M                      9            4
>     13 Informatique             2 21-23      F                     21            7
>     14 Science des donnees      2 21-23      M                     18            6
>     15 Mathematiques            1 18-20      F                     13            5
>
> Cette version réduit le risque, mais elle n’élimine pas tout risque de ré-identification. Une combinaison rare, par exemple programme + niveau + genre + âge, peut encore isoler une personne.

## Exercice 6 - Vérifier les petits groupes

Repérez les combinaisons `programme`, `niveau` et `genre` qui contiennent moins de trois personnes. Pourquoi faut-il éviter de publier ces cellules en détail?

> **NOTE:**
>
> ``` r
> petits_groupes <- sondage_anonyme |>
>   count(programme, niveau, genre, name = "n") |>
>   filter(n < 3) |>
>   arrange(n, programme)
>
> petits_groupes
> ```
>
>     # A tibble: 13 × 4
>        programme           niveau genre           n
>        <chr>                <dbl> <chr>       <int>
>      1 Informatique             2 F               1
>      2 Informatique             2 M               1
>      3 Informatique             3 M               1
>      4 Mathematiques            2 F               1
>      5 Mathematiques            3 Non precise     1
>      6 Science des donnees      1 F               1
>      7 Science des donnees      3 F               1
>      8 Statistique              1 F               1
>      9 Statistique              1 M               1
>     10 Statistique              2 M               1
>     11 Statistique              3 Non precise     1
>     12 Mathematiques            1 F               2
>     13 Science des donnees      2 M               2
>
> Les petits groupes augmentent le risque de reconnaître une personne, surtout dans une classe où les étudiant·es se connaissent. Une solution consiste à regrouper des catégories, masquer certaines cellules ou publier seulement des résultats plus agrégés.

## Exercice 7 - Visualiser sans surexposer

Produisez un graphique du score moyen de stress par programme. Affichez aussi les effectifs et ajoutez une phrase d’interprétation prudente.

> **NOTE:**
>
> ``` r
> stress_programme <- sondage_anonyme |>
>   group_by(programme) |>
>   summarise(
>     n = n(),
>     stress_moyen = mean(score_stress),
>     .groups = "drop"
>   ) |>
>   arrange(desc(stress_moyen))
>
> stress_programme
> ```
>
>     # A tibble: 4 × 3
>       programme               n stress_moyen
>       <chr>               <int>        <dbl>
>     1 Informatique            3         7.33
>     2 Science des donnees     4         6.75
>     3 Statistique             4         6
>     4 Mathematiques           4         5.25
>
> ``` r
> ggplot(stress_programme, aes(x = reorder(programme, stress_moyen), y = stress_moyen)) +
>   geom_col(fill = "#6B5B95") +
>   geom_text(aes(label = paste0("n = ", n)), hjust = -0.1, size = 3.5) +
>   coord_flip() +
>   scale_y_continuous(limits = c(0, 10), breaks = 0:10) +
>   labs(
>     title = "Score moyen de stress par programme dans un sondage fictif",
>     subtitle = "Les effectifs sont faibles; ces valeurs ne permettent pas de classer les programmes",
>     x = "Programme",
>     y = "Score moyen de stress"
>   )
> ```
>
> ![](exercices_files/figure-html/unnamed-chunk-12-1.png)
>
> Interprétation prudente: dans ce petit sondage fictif, certains programmes ont un score moyen plus élevé, mais les effectifs sont trop faibles pour conclure que le programme cause le stress.

# Étude de cas 1 - Publication municipale responsable

Une ville fictive veut publier un tableau de signalements mensuels. Elle souhaite être transparente, mais ne veut pas stigmatiser de petits secteurs ou révéler indirectement des situations individuelles.

## Exercice 8 - Construire une version publiable

À partir des signalements municipaux, créez une table qui masque les cellules dont `niveau_detail_public` vaut `"masquer"`. Proposez une variable `nb_public` qui garde le nombre lorsque la publication est acceptable et remplace les autres valeurs par `NA`.

> **NOTE:**
>
> ``` r
> signalements_publics <- signalements |>
>   mutate(
>     nb_public = if_else(niveau_detail_public == "masquer", NA_integer_, nb_signalements),
>     statut_publication = if_else(is.na(nb_public), "masque", "publie")
>   )
>
> signalements_publics |>
>   select(quartier, type_signalement, nb_signalements, nb_public, statut_publication)
> ```
>
>     # A tibble: 12 × 5
>        quartier        type_signalement nb_signalements nb_public statut_publication
>        <chr>           <chr>                      <dbl>     <dbl> <chr>
>      1 Saint-Roch      bruit                         42        42 publie
>      2 Saint-Roch      logement                      18        18 publie
>      3 Limoilou        bruit                         31        31 publie
>      4 Limoilou        dechets                       26        26 publie
>      5 Sainte-Foy      transport                     54        54 publie
>      6 Sainte-Foy      logement                       9         9 publie
>      7 Beauport        dechets                       23        23 publie
>      8 Beauport        transport                     17        17 publie
>      9 Charlesbourg    bruit                         12        12 publie
>     10 Charlesbourg    logement                       7        NA masque
>     11 La Cite-Limoil… securite                       5        NA masque
>     12 Sillery         logement                       3        NA masque

## Exercice 9 - Écrire une note éthique courte

Rédigez trois phrases qui expliquent:

1.  ce qui est publié;
2.  ce qui est masqué;
3.  la limite principale de l’interprétation.

> **NOTE:**
>
> La publication présente des nombres agrégés de signalements par quartier et par type, sans adresse ni coordonnées individuelles. Les cellules associées à de très petits effectifs sont masquées afin de réduire le risque d’identification ou de stigmatisation locale. Ces données décrivent des signalements reçus et ne mesurent ni la gravité réelle des situations ni les causes des différences entre quartiers.

# Étude de cas 2 - Sondage étudiant et communication prudente

Une équipe pédagogique fictive veut présenter les résultats d’un sondage sur la charge de travail. Les données peuvent aider à améliorer le cours, mais les commentaires libres et les petits groupes peuvent rendre certaines personnes reconnaissables.

## Exercice 10 - Préparer un résumé publiable

Créez un tableau par niveau d’étude avec le nombre de réponses, la moyenne d’heures d’étude et la moyenne du score de stress.

> **NOTE:**
>
> ``` r
> resume_niveau <- sondage_anonyme |>
>   group_by(niveau) |>
>   summarise(
>     n = n(),
>     heures_moyennes = mean(heures_etude),
>     stress_moyen = mean(score_stress),
>     .groups = "drop"
>   )
>
> resume_niveau
> ```
>
>     # A tibble: 3 × 4
>       niveau     n heures_moyennes stress_moyen
>        <dbl> <int>           <dbl>        <dbl>
>     1      1     5            11.8         5
>     2      2     6            18           6.17
>     3      3     4            23.2         8

## Exercice 11 - Produire un graphique défendable

Produisez un graphique qui montre la moyenne d’heures d’étude par niveau. Le titre doit éviter de transformer une description en accusation.

> **NOTE:**
>
> ``` r
> ggplot(resume_niveau, aes(x = factor(niveau), y = heures_moyennes)) +
>   geom_col(fill = "#2F4B7C") +
>   geom_text(aes(label = paste0("n = ", n)), vjust = -0.4, size = 3.5) +
>   scale_y_continuous(limits = c(0, max(resume_niveau$heures_moyennes) * 1.25)) +
>   labs(
>     title = "Heures d'étude déclarées dans un sondage fictif",
>     subtitle = "Résumé agrégé par niveau; les réponses individuelles ne sont pas publiées",
>     x = "Niveau d'étude",
>     y = "Heures d'étude par semaine"
>   )
> ```
>
> ![](exercices_files/figure-html/unnamed-chunk-15-1.png)

## Exercice 12 - Décider ce qu’il ne faut pas publier

Nommez deux éléments du fichier initial qui ne devraient pas apparaître dans une publication ouverte. Expliquez pourquoi.

> **NOTE:**
>
> Le champ `repondant_id` ne devrait pas être publié, car il permet de suivre directement une réponse individuelle. Le champ `commentaire_libre` ne devrait pas être publié tel quel, car il peut contenir un nom, une équipe, un employeur, une situation personnelle ou un détail qui rend une personne reconnaissable.
