# Consolidation Exercises

These exercises are independent from the adventure and the challenge. They consolidate text analysis, TF-IDF, simple sentiment scores and dashboard preparation using fictitious datasets that differ from the STT-1100 feedback.

Before starting, review the module resources if needed: *Text Mining with R*, the `unnest_tokens()` documentation, the `bind_tf_idf()` documentation, the `flexdashboard` documentation, the introduction to `shiny` and the module formative mini-test.

``` r
library(tidyverse)
library(tidytext)
library(stringr)
library(stopwords)
library(forcats)
```

## Block A - Turn comments into tokens

### Exercise 1 - Import library comments

Import the file `fictitious_library_comments.csv`. Each row represents a fictitious comment left after using a municipal library service.

``` r
library_comments <- read_csv(
  "data/fictitious_library_comments.csv",
  show_col_types = FALSE
)

glimpse(library_comments)
```

    Rows: 24
    Columns: 8
    $ comment_id   <chr> "B001", "B002", "B003", "B004", "B005", "B006", "B007", "…
    $ month        <dbl> 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, …
    $ district     <chr> "Sainte-Foy", "Limoilou", "Charlesbourg", "Beauport", "Sa…
    $ service      <chr> "Desk", "Reservation", "Workshop", "Desk", "Loan", "Works…
    $ comment      <chr> "Accueil tres clair et rapide, le personnel m'a bien orie…
    $ satisfaction <dbl> 5, 3, 5, 3, 5, 2, 5, 4, 5, 2, 5, 2, 5, 3, 5, 1, 5, 3, 5, …
    $ clarity      <dbl> 5, 2, 4, 4, 5, 2, 5, 4, 5, 3, 5, 2, 5, 3, 5, 1, 5, 4, 5, …
    $ wait_time    <dbl> 4, 3, 4, 2, 5, 3, 5, 3, 4, 1, 4, 2, 5, 3, 5, 1, 4, 2, 5, …

> **TIP:**
>
> The table contains free text and three numerical variables: `satisfaction`, `clarity` and `wait_time`. These variables make it possible to compare text content with structured ratings.

### Exercise 2 - Check the structure

Calculate the number of comments by month and by service.

``` r
library_comments |>
  count(month, service) |>
  arrange(month, service)
```

    # A tibble: 22 × 3
       month service         n
       <dbl> <chr>       <int>
     1     1 Desk            2
     2     1 Reservation     1
     3     1 Workshop        1
     4     2 Desk            1
     5     2 Loan            1
     6     2 Reservation     1
     7     2 Workshop        1
     8     3 Desk            1
     9     3 Loan            1
    10     3 Reservation     1
    # ℹ 12 more rows

> **TIP:**
>
> This check identifies the groups available before making comparisons. In a real dashboard, a very small group should be interpreted carefully.

### Exercise 3 - Tokenize and remove stopwords

Transform the comments into words, remove French stopwords, then keep only alphabetical tokens.

``` r
stop_fr <- stopwords("fr", source = "snowball")

library_tokens <- library_comments |>
  unnest_tokens(word, comment) |>
  filter(
    !word %in% stop_fr,
    str_detect(word, "^[a-z]+$")
  )

library_tokens |>
  count(word, sort = TRUE) |>
  slice_head(n = 12)
```

    # A tibble: 12 × 2
       word            n
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
> The result gives one row per retained word. The remaining frequent words provide a first view, but they do not replace contextual reading of the comments.

### Exercise 4 - Compare words by service

Calculate the most frequent words by service.

``` r
words_by_service <- library_tokens |>
  count(service, word, sort = TRUE) |>
  group_by(service) |>
  slice_max(n, n = 5, with_ties = FALSE) |>
  ungroup()

words_by_service
```

    # A tibble: 20 × 3
       service     word            n
       <chr>       <chr>       <int>
     1 Desk        attente         2
     2 Desk        longue          2
     3 Desk        personnel       2
     4 Desk        reponse         2
     5 Desk        service         2
     6 Loan        borne           2
     7 Loan        fonctionne      2
     8 Loan        a               1
     9 Loan        aucune          1
    10 Loan        automatique     1
    11 Reservation reservation     4
    12 Reservation rappel          2
    13 Reservation a               1
    14 Reservation abandonne       1
    15 Reservation agreable        1
    16 Workshop    activite        2
    17 Workshop    atelier         2
    18 Workshop    trop            2
    19 Workshop    a               1
    20 Workshop    aime            1

``` r
ggplot(words_by_service, aes(x = n, y = fct_reorder(word, n))) +
  geom_col() +
  facet_wrap(vars(service), scales = "free_y") +
  labs(
    x = "Number of occurrences",
    y = NULL,
    title = "Frequent words by service"
  ) +
  theme_minimal()
```

![](exercices_files/figure-html/unnamed-chunk-5-1.png)

> **TIP:**
>
> Faceting makes service comparison quick. If a word seems important, return to the original comments to check its context.

## Block B - Build a simple sentiment score

### Exercise 5 - Create a custom lexicon

Create a small sentiment lexicon. It does not cover all vocabulary: it is used to understand the mechanics.

``` r
sentiment_lexicon <- tibble(
  word = c(
    "clair", "rapide", "pratique", "motivant", "agreable", "utile",
    "chaleureux", "stimulante", "efficace", "difficile", "confus",
    "depasse", "panne", "frustrante", "lent", "decevante", "floues"
  ),
  sentiment = c(
    rep("positive", 9),
    rep("negative", 8)
  ),
  score = if_else(sentiment == "positive", 1, -1)
)

sentiment_lexicon
```

    # A tibble: 17 × 3
       word       sentiment score
       <chr>      <chr>     <dbl>
     1 clair      positive      1
     2 rapide     positive      1
     3 pratique   positive      1
     4 motivant   positive      1
     5 agreable   positive      1
     6 utile      positive      1
     7 chaleureux positive      1
     8 stimulante positive      1
     9 efficace   positive      1
    10 difficile  negative     -1
    11 confus     negative     -1
    12 depasse    negative     -1
    13 panne      negative     -1
    14 frustrante negative     -1
    15 lent       negative     -1
    16 decevante  negative     -1
    17 floues     negative     -1

> **TIP:**
>
> The lexicon is deliberately small. A sentiment score based on an incomplete lexicon should be presented as an exploratory index.

### Exercise 6 - Calculate a score by comment

Join the tokens to the lexicon, then calculate a score by comment.

``` r
comment_scores <- library_tokens |>
  inner_join(sentiment_lexicon, by = "word") |>
  group_by(comment_id, month, district, service) |>
  summarise(
    sentiment_score = sum(score),
    recognized_words = n(),
    .groups = "drop"
  ) |>
  right_join(
    library_comments,
    by = c("comment_id", "month", "district", "service")
  ) |>
  mutate(
    sentiment_score = replace_na(sentiment_score, 0),
    recognized_words = replace_na(recognized_words, 0)
  )

comment_scores |>
  select(comment_id, month, service, satisfaction, sentiment_score, recognized_words) |>
  slice_head(n = 10)
```

    # A tibble: 10 × 6
       comment_id month service     satisfaction sentiment_score recognized_words
       <chr>      <dbl> <chr>              <dbl>           <dbl>            <int>
     1 B001           1 Desk                   5               2                2
     2 B002           1 Reservation            3               0                2
     3 B003           1 Workshop               5               1                1
     4 B004           1 Desk                   3               1                1
     5 B005           2 Loan                   5               1                1
     6 B006           2 Workshop               2              -1                1
     7 B007           2 Reservation            5               2                2
     8 B010           3 Loan                   2              -2                2
     9 B011           3 Desk                   5               1                1
    10 B014           4 Workshop               3               1                1

> **TIP:**
>
> Comments where `recognized_words` equals 0 contain no word from the lexicon. Their score of 0 does not mean the comment is strongly neutral.

### Exercise 7 - Summarize sentiment by month

Calculate the average sentiment score by month, then compare it with average satisfaction.

``` r
monthly_sentiment <- comment_scores |>
  group_by(month) |>
  summarise(
    mean_score = mean(sentiment_score),
    mean_satisfaction = mean(satisfaction),
    mean_clarity = mean(clarity),
    comments = n(),
    .groups = "drop"
  )

monthly_sentiment
```

    # A tibble: 6 × 5
      month mean_score mean_satisfaction mean_clarity comments
      <dbl>      <dbl>             <dbl>        <dbl>    <int>
    1     1       1                 4            3.75        4
    2     2       0.5               4            4           4
    3     3      -0.25              3.5          3.75        4
    4     4       0                 3.5          3.5         4
    5     5       0.5               4            4.25        4
    6     6       0                 3.75         3.5         4

``` r
ggplot(monthly_sentiment, aes(x = month, y = mean_score)) +
  geom_hline(yintercept = 0, linetype = "dashed") +
  geom_col(fill = "steelblue") +
  labs(
    x = "Month",
    y = "Average sentiment score",
    title = "Average sentiment score by month"
  ) +
  theme_minimal()
```

![](exercices_files/figure-html/unnamed-chunk-9-1.png)

> **TIP:**
>
> The chart is useful for spotting time variation. It is not enough to explain why sentiment changes.

## Block C - Identify distinctive words

### Exercise 8 - Calculate TF-IDF by service

Use `bind_tf_idf()` to identify distinctive words for each service.

``` r
tfidf_service <- library_tokens |>
  count(service, word) |>
  bind_tf_idf(word, service, n) |>
  arrange(desc(tf_idf))

tfidf_service |>
  group_by(service) |>
  slice_max(tf_idf, n = 5, with_ties = FALSE) |>
  ungroup()
```

    # A tibble: 20 × 6
       service     word            n     tf   idf tf_idf
       <chr>       <chr>       <int>  <dbl> <dbl>  <dbl>
     1 Desk        attente         2 0.0426  1.39 0.0590
     2 Desk        longue          2 0.0426  1.39 0.0590
     3 Desk        personnel       2 0.0426  1.39 0.0590
     4 Desk        reponse         2 0.0426  1.39 0.0590
     5 Desk        service         2 0.0426  1.39 0.0590
     6 Loan        borne           2 0.0870  1.39 0.121
     7 Loan        fonctionne      2 0.0870  1.39 0.121
     8 Loan        aucune          1 0.0435  1.39 0.0603
     9 Loan        contraste       1 0.0435  1.39 0.0603
    10 Loan        difficulte      1 0.0435  1.39 0.0603
    11 Reservation reservation     4 0.111   1.39 0.154
    12 Reservation rappel          2 0.0556  1.39 0.0770
    13 Reservation abandonne       1 0.0278  1.39 0.0385
    14 Reservation agreable        1 0.0278  1.39 0.0385
    15 Reservation annulee         1 0.0278  1.39 0.0385
    16 Workshop    activite        2 0.0606  1.39 0.0840
    17 Workshop    atelier         2 0.0606  1.39 0.0840
    18 Workshop    trop            2 0.0606  1.39 0.0840
    19 Workshop    aime            1 0.0303  1.39 0.0420
    20 Workshop    appris          1 0.0303  1.39 0.0420

> **TIP:**
>
> A distinctive word is not only frequent: it is relatively more associated with one service than with the others.

### Exercise 9 - Visualize distinctive words

Produce a chart of the most distinctive words by service.

``` r
tfidf_top <- tfidf_service |>
  group_by(service) |>
  slice_max(tf_idf, n = 4, with_ties = FALSE) |>
  ungroup() |>
  mutate(word = fct_reorder(word, tf_idf))

ggplot(tfidf_top, aes(x = tf_idf, y = word)) +
  geom_col(fill = "darkorange") +
  facet_wrap(vars(service), scales = "free_y") +
  labs(
    x = "TF-IDF",
    y = NULL,
    title = "Distinctive words by service"
  ) +
  theme_minimal()
```

![](exercices_files/figure-html/unnamed-chunk-11-1.png)

> **TIP:**
>
> This chart helps formulate reading hypotheses. Before acting, return to the texts and check whether the word has the expected meaning.

## Block D - Prepare dashboard output

### Exercise 10 - Build a summary table

Prepare an aggregated table that could feed a dashboard card or chart.

``` r
dashboard_summary <- comment_scores |>
  group_by(month, service) |>
  summarise(
    comments = n(),
    mean_sentiment_score = mean(sentiment_score),
    mean_satisfaction = mean(satisfaction),
    mean_clarity = mean(clarity),
    mean_wait_time = mean(wait_time),
    .groups = "drop"
  )

dashboard_summary
```

    # A tibble: 22 × 7
       month service    comments mean_sentiment_score mean_satisfaction mean_clarity
       <dbl> <chr>         <int>                <dbl>             <dbl>        <dbl>
     1     1 Desk              2                  1.5                 4          4.5
     2     1 Reservati…        1                  0                   3          2
     3     1 Workshop          1                  1                   5          4
     4     2 Desk              1                  0                   4          4
     5     2 Loan              1                  1                   5          5
     6     2 Reservati…        1                  2                   5          5
     7     2 Workshop          1                 -1                   2          2
     8     3 Desk              1                  1                   5          5
     9     3 Loan              1                 -2                   2          3
    10     3 Reservati…        1                  0                   2          2
    # ℹ 12 more rows
    # ℹ 1 more variable: mean_wait_time <dbl>

> **TIP:**
>
> A good dashboard often separates the steps: clean data, create aggregated indicators, then visualize those indicators.

### Exercise 11 - Simulate a filter

Without using `shiny`, simulate the result of a filter by choosing a service.

``` r
selected_service <- "Reservation"

dashboard_summary |>
  filter(service == selected_service)
```

    # A tibble: 6 × 7
      month service     comments mean_sentiment_score mean_satisfaction mean_clarity
      <dbl> <chr>          <int>                <dbl>             <dbl>        <dbl>
    1     1 Reservation        1                    0                 3            2
    2     2 Reservation        1                    2                 5            5
    3     3 Reservation        1                    0                 2            2
    4     4 Reservation        1                   -1                 1            1
    5     5 Reservation        1                    2                 5            5
    6     6 Reservation        1                    1                 5            5
    # ℹ 1 more variable: mean_wait_time <dbl>

> **TIP:**
>
> In a `shiny` application, `selected_service` could come from a dropdown menu. The analytical idea remains the same: filter, then recalculate or display.

## Case Study 1 - Library comments

The management team of a library network wants to know which services deserve priority attention.

Your task:

1.  choose two indicators among `mean_sentiment_score`, `mean_satisfaction`, `mean_clarity` and `mean_wait_time`;
2.  identify a service to improve;
3.  write a careful recommendation that names one limitation.

``` r
service_priorities <- dashboard_summary |>
  group_by(service) |>
  summarise(
    mean_sentiment_score = mean(mean_sentiment_score),
    mean_satisfaction = mean(mean_satisfaction),
    mean_clarity = mean(mean_clarity),
    mean_wait_time = mean(mean_wait_time),
    comments = sum(comments),
    .groups = "drop"
  ) |>
  arrange(mean_satisfaction, mean_sentiment_score)

service_priorities
```

    # A tibble: 4 × 6
      service     mean_sentiment_score mean_satisfaction mean_clarity mean_wait_time
      <chr>                      <dbl>             <dbl>        <dbl>          <dbl>
    1 Reservation                0.667              3.5          3.33           3.5
    2 Loan                      -0.25               3.75         4              3.75
    3 Desk                       0.25               3.92         4.08           3.25
    4 Workshop                   0.333              4.17         4              3.67
    # ℹ 1 more variable: comments <int>

> **TIP:**
>
> A careful recommendation could focus on the reservation service if its scores are lower. The main limitation is that the data are fictitious and contain few comments, so the result should be confirmed with more data and qualitative reading.

## Case Study 2 - Cultural workshops

Import the file `fictitious_culture_workshops.csv`, then prepare a mini summary for a public-workshop dashboard.

Your task:

1.  tokenize the comments;
2.  calculate distinctive words by activity type;
3.  compare `participation`, `accessibility` and `recommendation`;
4.  propose two visual elements for a dashboard.

``` r
workshops <- read_csv("data/fictitious_culture_workshops.csv", show_col_types = FALSE)

workshop_tokens <- workshops |>
  unnest_tokens(word, comment) |>
  filter(
    !word %in% stop_fr,
    str_detect(word, "^[a-z]+$")
  )

workshop_tfidf <- workshop_tokens |>
  count(activity_type, word) |>
  bind_tf_idf(word, activity_type, n) |>
  group_by(activity_type) |>
  slice_max(tf_idf, n = 4, with_ties = FALSE) |>
  ungroup()

workshop_tfidf
```

    # A tibble: 16 × 6
       activity_type word               n     tf   idf tf_idf
       <chr>         <chr>          <int>  <dbl> <dbl>  <dbl>
     1 Music         etait              4 0.133  0.693 0.0924
     2 Music         accueillant        1 0.0333 1.39  0.0462
     3 Music         agreable           1 0.0333 1.39  0.0462
     4 Music         appris             1 0.0333 1.39  0.0462
     5 Photo         exemples           2 0.0645 1.39  0.0894
     6 Photo         accompagnement     1 0.0323 1.39  0.0447
     7 Photo         bon                1 0.0323 1.39  0.0447
     8 Photo         cadrer             1 0.0323 1.39  0.0447
     9 Theatre       exercices          2 0.0606 1.39  0.0840
    10 Theatre       peu                2 0.0606 1.39  0.0840
    11 Theatre       accessibles        1 0.0303 1.39  0.0420
    12 Theatre       accueil            1 0.0303 1.39  0.0420
    13 Writing       activite           2 0.0667 1.39  0.0924
    14 Writing       atelier            2 0.0667 1.39  0.0924
    15 Writing       assez              1 0.0333 1.39  0.0462
    16 Writing       bien               1 0.0333 1.39  0.0462

``` r
workshop_summary <- workshops |>
  group_by(activity_type) |>
  summarise(
    responses = n(),
    mean_participation = mean(participation),
    mean_accessibility = mean(accessibility),
    mean_recommendation = mean(recommendation),
    .groups = "drop"
  ) |>
  arrange(mean_recommendation)

workshop_summary
```

    # A tibble: 4 × 5
      activity_type responses mean_participation mean_accessibility
      <chr>             <int>              <dbl>              <dbl>
    1 Theatre               6               3.33               3.33
    2 Music                 6               3.83               3.17
    3 Photo                 6               3.83               4.17
    4 Writing               6               4                  4.17
    # ℹ 1 more variable: mean_recommendation <dbl>

> **TIP:**
>
> Two useful visuals would be: a TF-IDF chart by activity type and a chart of numerical averages by activity type. These charts should be accompanied by a short note about the limits of small group sizes.
