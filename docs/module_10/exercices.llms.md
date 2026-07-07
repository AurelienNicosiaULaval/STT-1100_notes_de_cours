# Exercices de consolidation

Ces exercices sont indépendants de l’aventure et du défi. Ils servent à consolider l’analyse de texte, le TF-IDF, les scores de sentiment simples et la préparation d’un tableau de bord à partir de données fictives différentes des rétroactions STT-1100.

Avant de commencer, relisez au besoin les ressources du module: *Text Mining with R*, la documentation de `unnest_tokens()`, la documentation de `bind_tf_idf()`, la documentation `flexdashboard`, l’introduction à `shiny` et le mini-test formatif du module.

``` r
library(tidyverse)
library(tidytext)
library(stringr)
library(stopwords)
library(forcats)
```

## Bloc A - Transformer des commentaires en tokens

### Exercice 1 - Importer les commentaires de bibliothèque

Importez le fichier `commentaires_bibliotheques_fictif.csv`. Chaque ligne représente un commentaire fictif laissé après l’utilisation d’un service de bibliothèque municipale.

``` r
commentaires_biblio <- read_csv(
  "data/commentaires_bibliotheques_fictif.csv",
  show_col_types = FALSE
)

glimpse(commentaires_biblio)
```

    Rows: 24
    Columns: 8
    $ commentaire_id <chr> "B001", "B002", "B003", "B004", "B005", "B006", "B007",…
    $ mois           <dbl> 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5…
    $ arrondissement <chr> "Sainte-Foy", "Limoilou", "Charlesbourg", "Beauport", "…
    $ service        <chr> "Comptoir", "Reservation", "Atelier", "Comptoir", "Empr…
    $ commentaire    <chr> "Accueil tres clair et rapide, le personnel m'a bien or…
    $ satisfaction   <dbl> 5, 3, 5, 3, 5, 2, 5, 4, 5, 2, 5, 2, 5, 3, 5, 1, 5, 3, 5…
    $ clarte         <dbl> 5, 2, 4, 4, 5, 2, 5, 4, 5, 3, 5, 2, 5, 3, 5, 1, 5, 4, 5…
    $ delai          <dbl> 4, 3, 4, 2, 5, 3, 5, 3, 4, 1, 4, 2, 5, 3, 5, 1, 4, 2, 5…

> **TIP:**
>
> Le tableau contient du texte libre et trois variables numériques: `satisfaction`, `clarte` et `delai`. Ces variables permettent de comparer le contenu textuel avec des évaluations structurées.

### Exercice 2 - Vérifier la structure

Calculez le nombre de commentaires par mois et par service.

``` r
commentaires_biblio |>
  count(mois, service) |>
  arrange(mois, service)
```

    # A tibble: 22 × 3
        mois service         n
       <dbl> <chr>       <int>
     1     1 Atelier         1
     2     1 Comptoir        2
     3     1 Reservation     1
     4     2 Atelier         1
     5     2 Comptoir        1
     6     2 Emprunt         1
     7     2 Reservation     1
     8     3 Atelier         1
     9     3 Comptoir        1
    10     3 Emprunt         1
    # ℹ 12 more rows

> **TIP:**
>
> Cette vérification sert à repérer les groupes disponibles avant de produire des comparaisons. Dans un vrai tableau de bord, un groupe très petit devrait être interprété avec prudence.

### Exercice 3 - Tokeniser et retirer les stopwords

Transformez les commentaires en mots, retirez les stopwords français, puis gardez seulement les tokens alphabétiques.

``` r
stop_fr <- stopwords("fr", source = "snowball")

tokens_biblio <- commentaires_biblio |>
  unnest_tokens(mot, commentaire) |>
  filter(
    !mot %in% stop_fr,
    str_detect(mot, "^[a-z]+$")
  )

tokens_biblio |>
  count(mot, sort = TRUE) |>
  slice_head(n = 12)
```

    # A tibble: 12 × 2
       mot             n
       <chr>       <int>
     1 a               4
     2 reservation     4
     3 clair           3
     4 etait           3
     5 rapide          3
     6 tres            3
     7 activite        2
     8 aide            2
     9 atelier         2
    10 attente         2
    11 automatique     2
    12 avant           2

> **TIP:**
>
> Le résultat donne une ligne par mot conservé. Les mots fréquents restants donnent un premier aperçu, mais ils ne remplacent pas une lecture contextuelle des commentaires.

### Exercice 4 - Comparer les mots par service

Calculez les mots les plus fréquents par service.

``` r
mots_par_service <- tokens_biblio |>
  count(service, mot, sort = TRUE) |>
  group_by(service) |>
  slice_max(n, n = 5, with_ties = FALSE) |>
  ungroup()

mots_par_service
```

    # A tibble: 20 × 3
       service     mot             n
       <chr>       <chr>       <int>
     1 Atelier     activite        2
     2 Atelier     atelier         2
     3 Atelier     trop            2
     4 Atelier     a               1
     5 Atelier     aime            1
     6 Comptoir    attente         2
     7 Comptoir    longue          2
     8 Comptoir    personnel       2
     9 Comptoir    reponse         2
    10 Comptoir    service         2
    11 Emprunt     borne           2
    12 Emprunt     fonctionne      2
    13 Emprunt     a               1
    14 Emprunt     aucune          1
    15 Emprunt     automatique     1
    16 Reservation reservation     4
    17 Reservation rappel          2
    18 Reservation a               1
    19 Reservation abandonne       1
    20 Reservation agreable        1

``` r
ggplot(mots_par_service, aes(x = n, y = fct_reorder(mot, n))) +
  geom_col() +
  facet_wrap(vars(service), scales = "free_y") +
  labs(
    x = "Nombre d'occurrences",
    y = NULL,
    title = "Mots fréquents par service"
  ) +
  theme_minimal()
```

![](exercices_files/figure-html/unnamed-chunk-5-1.png)

> **TIP:**
>
> La facette permet de comparer rapidement les services. Si un mot semble important, il faut revenir aux commentaires originaux pour vérifier son contexte.

## Bloc B - Construire un score de sentiment simple

### Exercice 5 - Créer un lexique maison

Créez un petit lexique de sentiment. Il ne couvre pas tout le vocabulaire: il sert à comprendre la mécanique.

``` r
lexique_sentiment <- tibble(
  mot = c(
    "clair", "rapide", "pratique", "motivant", "agreable", "utile",
    "chaleureux", "stimulante", "efficace", "difficile", "confus",
    "depasse", "panne", "frustrante", "lent", "decevante", "floues"
  ),
  sentiment = c(
    rep("positif", 9),
    rep("negatif", 8)
  ),
  score = if_else(sentiment == "positif", 1, -1)
)

lexique_sentiment
```

    # A tibble: 17 × 3
       mot        sentiment score
       <chr>      <chr>     <dbl>
     1 clair      positif       1
     2 rapide     positif       1
     3 pratique   positif       1
     4 motivant   positif       1
     5 agreable   positif       1
     6 utile      positif       1
     7 chaleureux positif       1
     8 stimulante positif       1
     9 efficace   positif       1
    10 difficile  negatif      -1
    11 confus     negatif      -1
    12 depasse    negatif      -1
    13 panne      negatif      -1
    14 frustrante negatif      -1
    15 lent       negatif      -1
    16 decevante  negatif      -1
    17 floues     negatif      -1

> **TIP:**
>
> Le lexique est volontairement petit. Un score de sentiment basé sur un lexique incomplet doit être présenté comme un indice exploratoire.

### Exercice 6 - Calculer un score par commentaire

Joignez les tokens au lexique, puis calculez un score par commentaire.

``` r
scores_commentaires <- tokens_biblio |>
  inner_join(lexique_sentiment, by = "mot") |>
  group_by(commentaire_id, mois, arrondissement, service) |>
  summarise(
    score_sentiment = sum(score),
    mots_reconnus = n(),
    .groups = "drop"
  ) |>
  right_join(
    commentaires_biblio,
    by = c("commentaire_id", "mois", "arrondissement", "service")
  ) |>
  mutate(
    score_sentiment = replace_na(score_sentiment, 0),
    mots_reconnus = replace_na(mots_reconnus, 0)
  )

scores_commentaires |>
  select(commentaire_id, mois, service, satisfaction, score_sentiment, mots_reconnus) |>
  slice_head(n = 10)
```

    # A tibble: 10 × 6
       commentaire_id  mois service     satisfaction score_sentiment mots_reconnus
       <chr>          <dbl> <chr>              <dbl>           <dbl>         <int>
     1 B001               1 Comptoir               5               2             2
     2 B002               1 Reservation            3               0             2
     3 B003               1 Atelier                5               1             1
     4 B004               1 Comptoir               3               1             1
     5 B005               2 Emprunt                5               1             1
     6 B006               2 Atelier                2              -1             1
     7 B007               2 Reservation            5               2             2
     8 B010               3 Emprunt                2              -2             2
     9 B011               3 Comptoir               5               1             1
    10 B014               4 Atelier                3               1             1

> **TIP:**
>
> Les commentaires dont `mots_reconnus` vaut 0 n’ont aucun mot présent dans le lexique. Leur score de 0 ne veut pas dire que le commentaire est neutre au sens fort.

### Exercice 7 - Résumer le sentiment par mois

Calculez le score moyen de sentiment par mois, puis comparez-le à la satisfaction moyenne.

``` r
sentiment_mensuel <- scores_commentaires |>
  group_by(mois) |>
  summarise(
    score_moyen = mean(score_sentiment),
    satisfaction_moyenne = mean(satisfaction),
    clarte_moyenne = mean(clarte),
    commentaires = n(),
    .groups = "drop"
  )

sentiment_mensuel
```

    # A tibble: 6 × 5
       mois score_moyen satisfaction_moyenne clarte_moyenne commentaires
      <dbl>       <dbl>                <dbl>          <dbl>        <int>
    1     1        1                    4              3.75            4
    2     2        0.5                  4              4               4
    3     3       -0.25                 3.5            3.75            4
    4     4        0                    3.5            3.5             4
    5     5        0.5                  4              4.25            4
    6     6        0                    3.75           3.5             4

``` r
ggplot(sentiment_mensuel, aes(x = mois, y = score_moyen)) +
  geom_hline(yintercept = 0, linetype = "dashed") +
  geom_col(fill = "steelblue") +
  labs(
    x = "Mois",
    y = "Score moyen de sentiment",
    title = "Score de sentiment moyen par mois"
  ) +
  theme_minimal()
```

![](exercices_files/figure-html/unnamed-chunk-9-1.png)

> **TIP:**
>
> Le graphique est utile pour repérer des variations temporelles. Il ne suffit pas à expliquer pourquoi le sentiment change.

## Bloc C - Repérer les mots distinctifs

### Exercice 8 - Calculer le TF-IDF par service

Utilisez `bind_tf_idf()` pour repérer les mots distinctifs de chaque service.

``` r
tfidf_service <- tokens_biblio |>
  count(service, mot) |>
  bind_tf_idf(mot, service, n) |>
  arrange(desc(tf_idf))

tfidf_service |>
  group_by(service) |>
  slice_max(tf_idf, n = 5, with_ties = FALSE) |>
  ungroup()
```

    # A tibble: 20 × 6
       service     mot             n     tf   idf tf_idf
       <chr>       <chr>       <int>  <dbl> <dbl>  <dbl>
     1 Atelier     activite        2 0.0606  1.39 0.0840
     2 Atelier     atelier         2 0.0606  1.39 0.0840
     3 Atelier     trop            2 0.0606  1.39 0.0840
     4 Atelier     aime            1 0.0303  1.39 0.0420
     5 Atelier     appris          1 0.0303  1.39 0.0420
     6 Comptoir    attente         2 0.0426  1.39 0.0590
     7 Comptoir    longue          2 0.0426  1.39 0.0590
     8 Comptoir    personnel       2 0.0426  1.39 0.0590
     9 Comptoir    reponse         2 0.0426  1.39 0.0590
    10 Comptoir    service         2 0.0426  1.39 0.0590
    11 Emprunt     borne           2 0.0870  1.39 0.121
    12 Emprunt     fonctionne      2 0.0870  1.39 0.121
    13 Emprunt     aucune          1 0.0435  1.39 0.0603
    14 Emprunt     contraste       1 0.0435  1.39 0.0603
    15 Emprunt     difficulte      1 0.0435  1.39 0.0603
    16 Reservation reservation     4 0.111   1.39 0.154
    17 Reservation rappel          2 0.0556  1.39 0.0770
    18 Reservation abandonne       1 0.0278  1.39 0.0385
    19 Reservation agreable        1 0.0278  1.39 0.0385
    20 Reservation annulee         1 0.0278  1.39 0.0385

> **TIP:**
>
> Un mot distinctif n’est pas seulement fréquent: il est relativement plus associé à un service qu’aux autres.

### Exercice 9 - Visualiser les mots distinctifs

Produisez un graphique des mots les plus distinctifs par service.

``` r
tfidf_top <- tfidf_service |>
  group_by(service) |>
  slice_max(tf_idf, n = 4, with_ties = FALSE) |>
  ungroup() |>
  mutate(mot = fct_reorder(mot, tf_idf))

ggplot(tfidf_top, aes(x = tf_idf, y = mot)) +
  geom_col(fill = "darkorange") +
  facet_wrap(vars(service), scales = "free_y") +
  labs(
    x = "TF-IDF",
    y = NULL,
    title = "Mots distinctifs par service"
  ) +
  theme_minimal()
```

![](exercices_files/figure-html/unnamed-chunk-11-1.png)

> **TIP:**
>
> Ce graphique aide à formuler des hypothèses de lecture. Avant d’agir, il faut revenir aux textes et vérifier si le mot a le sens attendu.

## Bloc D - Préparer une sortie de tableau de bord

### Exercice 10 - Construire un tableau de synthèse

Préparez un tableau agrégé qui pourrait alimenter une carte ou un graphique de tableau de bord.

``` r
resume_dashboard <- scores_commentaires |>
  group_by(mois, service) |>
  summarise(
    commentaires = n(),
    score_sentiment_moyen = mean(score_sentiment),
    satisfaction_moyenne = mean(satisfaction),
    clarte_moyenne = mean(clarte),
    delai_moyen = mean(delai),
    .groups = "drop"
  )

resume_dashboard
```

    # A tibble: 22 × 7
        mois service     commentaires score_sentiment_moyen satisfaction_moyenne
       <dbl> <chr>              <int>                 <dbl>                <dbl>
     1     1 Atelier                1                   1                      5
     2     1 Comptoir               2                   1.5                    4
     3     1 Reservation            1                   0                      3
     4     2 Atelier                1                  -1                      2
     5     2 Comptoir               1                   0                      4
     6     2 Emprunt                1                   1                      5
     7     2 Reservation            1                   2                      5
     8     3 Atelier                1                   0                      5
     9     3 Comptoir               1                   1                      5
    10     3 Emprunt                1                  -2                      2
    # ℹ 12 more rows
    # ℹ 2 more variables: clarte_moyenne <dbl>, delai_moyen <dbl>

> **TIP:**
>
> Un bon tableau de bord sépare souvent les étapes: nettoyer les données, créer des indicateurs agrégés, puis visualiser ces indicateurs.

### Exercice 11 - Simuler un filtre

Sans utiliser `shiny`, simulez le résultat d’un filtre en choisissant un service.

``` r
service_choisi <- "Reservation"

resume_dashboard |>
  filter(service == service_choisi)
```

    # A tibble: 6 × 7
       mois service     commentaires score_sentiment_moyen satisfaction_moyenne
      <dbl> <chr>              <int>                 <dbl>                <dbl>
    1     1 Reservation            1                     0                    3
    2     2 Reservation            1                     2                    5
    3     3 Reservation            1                     0                    2
    4     4 Reservation            1                    -1                    1
    5     5 Reservation            1                     2                    5
    6     6 Reservation            1                     1                    5
    # ℹ 2 more variables: clarte_moyenne <dbl>, delai_moyen <dbl>

> **TIP:**
>
> Dans une application `shiny`, `service_choisi` pourrait venir d’un menu déroulant. L’idée analytique reste la même: filtrer, puis recalculer ou afficher.

## Étude de cas 1 - Commentaires de bibliothèques

La direction d’un réseau de bibliothèques veut savoir quels services méritent une attention prioritaire.

Votre mandat:

1.  choisir deux indicateurs parmi `score_sentiment_moyen`, `satisfaction_moyenne`, `clarte_moyenne` et `delai_moyen`;
2.  repérer un service à améliorer;
3.  écrire une recommandation prudente en nommant une limite.

``` r
priorites_services <- resume_dashboard |>
  group_by(service) |>
  summarise(
    score_sentiment_moyen = mean(score_sentiment_moyen),
    satisfaction_moyenne = mean(satisfaction_moyenne),
    clarte_moyenne = mean(clarte_moyenne),
    delai_moyen = mean(delai_moyen),
    commentaires = sum(commentaires),
    .groups = "drop"
  ) |>
  arrange(satisfaction_moyenne, score_sentiment_moyen)

priorites_services
```

    # A tibble: 4 × 6
      service  score_sentiment_moyen satisfaction_moyenne clarte_moyenne delai_moyen
      <chr>                    <dbl>                <dbl>          <dbl>       <dbl>
    1 Reserva…                 0.667                 3.5            3.33        3.5
    2 Emprunt                 -0.25                  3.75           4           3.75
    3 Comptoir                 0.25                  3.92           4.08        3.25
    4 Atelier                  0.333                 4.17           4           3.67
    # ℹ 1 more variable: commentaires <int>

> **TIP:**
>
> Une recommandation prudente pourrait cibler le service de réservation si ses scores sont plus faibles. La limite principale est que les données sont fictives et contiennent peu de commentaires; il faut donc confirmer avec plus de données et une lecture qualitative.

## Étude de cas 2 - Ateliers culturels

Importez le fichier `ateliers_culture_fictif.csv`, puis préparez une mini synthèse pour un tableau de bord d’ateliers publics.

Votre mandat:

1.  tokeniser les commentaires;
2.  calculer les mots distinctifs par type d’activité;
3.  comparer `participation`, `accessibilite` et `recommandation`;
4.  proposer deux éléments visuels pour un tableau de bord.

``` r
ateliers <- read_csv("data/ateliers_culture_fictif.csv", show_col_types = FALSE)

tokens_ateliers <- ateliers |>
  unnest_tokens(mot, commentaire) |>
  filter(
    !mot %in% stop_fr,
    str_detect(mot, "^[a-z]+$")
  )

tfidf_ateliers <- tokens_ateliers |>
  count(type_activite, mot) |>
  bind_tf_idf(mot, type_activite, n) |>
  group_by(type_activite) |>
  slice_max(tf_idf, n = 4, with_ties = FALSE) |>
  ungroup()

tfidf_ateliers
```

    # A tibble: 16 × 6
       type_activite mot                n     tf   idf tf_idf
       <chr>         <chr>          <int>  <dbl> <dbl>  <dbl>
     1 Ecriture      activite           2 0.0667 1.39  0.0924
     2 Ecriture      atelier            2 0.0667 1.39  0.0924
     3 Ecriture      assez              1 0.0333 1.39  0.0462
     4 Ecriture      bien               1 0.0333 1.39  0.0462
     5 Musique       etait              4 0.133  0.693 0.0924
     6 Musique       accueillant        1 0.0333 1.39  0.0462
     7 Musique       agreable           1 0.0333 1.39  0.0462
     8 Musique       appris             1 0.0333 1.39  0.0462
     9 Photo         exemples           2 0.0645 1.39  0.0894
    10 Photo         accompagnement     1 0.0323 1.39  0.0447
    11 Photo         bon                1 0.0323 1.39  0.0447
    12 Photo         cadrer             1 0.0323 1.39  0.0447
    13 Theatre       exercices          2 0.0606 1.39  0.0840
    14 Theatre       peu                2 0.0606 1.39  0.0840
    15 Theatre       accessibles        1 0.0303 1.39  0.0420
    16 Theatre       accueil            1 0.0303 1.39  0.0420

``` r
resume_ateliers <- ateliers |>
  group_by(type_activite) |>
  summarise(
    reponses = n(),
    participation_moyenne = mean(participation),
    accessibilite_moyenne = mean(accessibilite),
    recommandation_moyenne = mean(recommandation),
    .groups = "drop"
  ) |>
  arrange(recommandation_moyenne)

resume_ateliers
```

    # A tibble: 4 × 5
      type_activite reponses participation_moyenne accessibilite_moyenne
      <chr>            <int>                 <dbl>                 <dbl>
    1 Theatre              6                  3.33                  3.33
    2 Musique              6                  3.83                  3.17
    3 Photo                6                  3.83                  4.17
    4 Ecriture             6                  4                     4.17
    # ℹ 1 more variable: recommandation_moyenne <dbl>

> **TIP:**
>
> Deux visuels utiles seraient: un graphique TF-IDF par type d’activité et un graphique des moyennes numériques par type d’activité. Il faudrait accompagner ces graphiques d’un court texte expliquant les limites des petits effectifs.
