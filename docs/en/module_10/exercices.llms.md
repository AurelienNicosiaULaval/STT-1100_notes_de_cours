# Consolidation Exercises

> **IMPORTANT:**
>
> [Download the ready-to-open workspace (.zip)](../../downloads/donnees/stt1100-module-10-en.zip)
>
> Unpack the file, then open the `.Rproj` project. The paths used in the exercises will work without moving the data.

These exercises are independent from the adventure and the challenge. They consolidate text analysis, lexical scores, TF-IDF and dashboard preparation using real public Quebec text.

The first file contains a balanced sample of descriptions from the [official Données Québec API](https://www.donneesquebec.ca/page-api/). The second comes from the Ministry of Tourism dataset [Événements - Système d’information touristique Québec](https://www.donneesquebec.ca/recherche/dataset/sit-quebec-evenements). Both sources are distributed under the CC BY 4.0 licence.

## Block A - Turn descriptions into tokens

### Exercise 1 - Import descriptions

Import `quebec_dataset_descriptions.csv`. Each row is a real portal record with its title, description, producer and category.

> **NOTE:**
>
> ``` r
> catalog <- read_csv(
>   "data/quebec_dataset_descriptions.csv",
>   show_col_types = FALSE
> )
>
> glimpse(catalog)
> ```
>
>     Rows: 89
>     Columns: 9
>     $ dataset_id     <chr> "pistes-cyclables-standard", "calendrier-de-collecte-de…
>     $ producer       <chr> "Ville de Gatineau", "Ville de Gatineau", "Ville de Gat…
>     $ category       <chr> "Infrastructures; Transport", "Environnement, ressource…
>     $ title          <chr> "Pistes cyclables", "Calendrier de collecte des matière…
>     $ description    <chr> "Pistes cyclables (standard du hackathon provincial à S…
>     $ resource_count <dbl> 5, 1, 2, 2, 3, 4, 3, 4, 4, 4, 4, 4, 4, 4, 4, 4, 3, 3, 3…
>     $ updated_at     <date> 2025-11-25, 2025-04-24, 2025-04-24, 2025-04-24, 2025-0…
>     $ licence        <chr> "Attribution (CC-BY 4.0)", "Attribution (CC-BY 4.0)", "…
>     $ snapshot_date  <date> 2026-07-11, 2026-07-11, 2026-07-11, 2026-07-11, 2026-0…
>
> The sample contains 89 records from eight cities: Quebec City, Gatineau, Sherbrooke, Trois-Rivières, Saguenay, Laval, Longueuil and Montreal. Montreal accounts for one producer out of eight.

### Exercise 2 - Check the structure

> **NOTE:**
>
> ``` r
> catalog |>
>   group_by(producer) |>
>   summarise(
>     records = n(),
>     categories = n_distinct(category),
>     .groups = "drop"
>   ) |>
>   arrange(desc(records), producer)
> ```
>
>     # A tibble: 8 × 3
>       producer                                  records categories
>       <chr>                                       <int>      <int>
>     1 Ville de Laval                                 12          6
>     2 Ville de Longueuil                             12          7
>     3 Ville de Montréal                              12          7
>     4 Ville de Québec                                12          5
>     5 Ville de Saguenay                              12          6
>     6 Ville de Sherbrooke - Données géomatiques      12          5
>     7 Ville de Trois-Rivières                        12          3
>     8 Ville de Gatineau                               5          2
>
> The selection is balanced by producer, but does not represent the full catalog. It favours recently updated records with descriptions of at least 50 characters.

### Exercise 3 - Tokenize and remove stopwords

> **NOTE:**
>
> ``` r
> stop_fr <- stopwords("fr", source = "snowball")
>
> catalog_tokens <- catalog |>
>   unnest_tokens(word, description) |>
>   filter(
>     !word %in% stop_fr,
>     str_detect(word, "^\\p{L}+$")
>   )
>
> catalog_tokens |>
>   count(word, sort = TRUE) |>
>   slice_head(n = 12)
> ```
>
>     # A tibble: 12 × 2
>        word             n
>        <chr>        <int>
>      1 ville           53
>      2 territoire      34
>      3 cartographie    26
>      4 données         23
>      5 ensemble        16
>      6 travaux         16
>      7 type            16
>      8 identifiant     15
>      9 longueuil       13
>     10 rivières        13
>     11 zone            13
>     12 québec          12
>
> Each row now represents a retained word. Frequencies offer a first view, but a description should be reread in context before interpretation.

### Exercise 4 - Compare words by producer

> **NOTE:**
>
> ``` r
> words_by_producer <- catalog_tokens |>
>   count(producer, word, sort = TRUE) |>
>   group_by(producer) |>
>   slice_max(n, n = 5, with_ties = FALSE) |>
>   ungroup()
>
> words_by_producer
> ```
>
>     # A tibble: 40 × 3
>        producer          word             n
>        <chr>             <chr>        <int>
>      1 Ville de Gatineau courant         10
>      2 Ville de Gatineau zone             8
>      3 Ville de Gatineau correspond       6
>      4 Ville de Gatineau crue             6
>      5 Ville de Gatineau gatineau         6
>      6 Ville de Laval    territoire       9
>      7 Ville de Laval    cartographie     6
>      8 Ville de Laval    lavallois        6
>      9 Ville de Laval    cdu              5
>     10 Ville de Laval    code             5
>     # ℹ 30 more rows
>
> ``` r
> ggplot(
>   words_by_producer,
>   aes(x = n, y = fct_reorder(word, n))
> ) +
>   geom_col() +
>   facet_wrap(vars(producer), scales = "free_y") +
>   labs(
>     x = "Occurrences",
>     y = NULL,
>     title = "Frequent words by producer"
>   ) +
>   theme_minimal()
> ```
>
> ![](exercices_files/figure-html/unnamed-chunk-5-1.png)
>
> A difference may come from published topics, institutional vocabulary or description length. It does not directly measure data quality.

## Block B - Build a simple lexical score

### Exercise 5 - Create a precision lexicon

Concrete terms receive `+1` and very general terms receive `-1`.

> **NOTE:**
>
> ``` r
> precision_lexicon <- tibble(
>   word = c(
>     "localisation", "inventaire", "nombre", "mesure", "date",
>     "horaire", "statistiques", "registre", "liste", "géographique",
>     "quotidien", "annuel", "donnée", "données", "information",
>     "informations", "ensemble", "divers", "autre", "différents"
>   ),
>   class = c(rep("concrete", 12), rep("general", 8)),
>   score = if_else(class == "concrete", 1, -1)
> )
>
> precision_lexicon
> ```
>
>     # A tibble: 20 × 3
>        word         class    score
>        <chr>        <chr>    <dbl>
>      1 localisation concrete     1
>      2 inventaire   concrete     1
>      3 nombre       concrete     1
>      4 mesure       concrete     1
>      5 date         concrete     1
>      6 horaire      concrete     1
>      7 statistiques concrete     1
>      8 registre     concrete     1
>      9 liste        concrete     1
>     10 géographique concrete     1
>     11 quotidien    concrete     1
>     12 annuel       concrete     1
>     13 donnée       general     -1
>     14 données      general     -1
>     15 information  general     -1
>     16 informations general     -1
>     17 ensemble     general     -1
>     18 divers       general     -1
>     19 autre        general     -1
>     20 différents   general     -1
>
> This score is not a validated measure of writing quality. It demonstrates lexicon scoring and must always be paired with human reading.

### Exercise 6 - Calculate a score by record

> **NOTE:**
>
> ``` r
> record_scores <- catalog_tokens |>
>   inner_join(precision_lexicon, by = "word") |>
>   group_by(dataset_id, producer, category) |>
>   summarise(
>     precision_score = sum(score),
>     recognized_words = n(),
>     .groups = "drop"
>   ) |>
>   right_join(
>     catalog,
>     by = c("dataset_id", "producer", "category")
>   ) |>
>   mutate(
>     precision_score = replace_na(precision_score, 0),
>     recognized_words = replace_na(recognized_words, 0),
>     days_since_update = as.integer(snapshot_date - updated_at)
>   )
>
> record_scores |>
>   select(
>     dataset_id,
>     producer,
>     title,
>     precision_score,
>     recognized_words
>   ) |>
>   slice_head(n = 10)
> ```
>
>     # A tibble: 10 × 5
>        dataset_id                    producer title precision_score recognized_words
>        <chr>                         <chr>    <chr>           <dbl>            <int>
>      1 04880bdf6ffa40ababfa900c2ef4… Ville d… Trav…               5                9
>      2 728d843955a744c78dd6cd4b26b8… Ville d… Stat…               1                1
>      3 arrondissements-longueuil     Ville d… Arro…               1                1
>      4 chantiers-routiers            Ville d… Chan…               1                1
>      5 infrastructure-pietonne       Ville d… Infr…              -1                1
>      6 milieux-humides-rci           Ville d… Mili…              -3                3
>      7 offres-d-emploi               Ville d… Offr…              -2                2
>      8 permis-de-construction        Ville d… Perm…              -1                1
>      9 permis-delivres-ville-de-que… Ville d… Perm…              -1                1
>     10 sag-reseau-routier            Ville d… Rése…              -1                1
>
> A zero may mean neutral vocabulary or no match in the small lexicon. `recognized_words` is therefore essential.

### Exercise 7 - Summarize scores by producer

> **NOTE:**
>
> ``` r
> precision_by_producer <- record_scores |>
>   group_by(producer) |>
>   summarise(
>     mean_score = mean(precision_score),
>     mean_recognized_words = mean(recognized_words),
>     mean_resources = mean(resource_count),
>     records = n(),
>     .groups = "drop"
>   )
>
> precision_by_producer
> ```
>
>     # A tibble: 8 × 5
>       producer               mean_score mean_recognized_words mean_resources records
>       <chr>                       <dbl>                 <dbl>          <dbl>   <int>
>     1 Ville de Gatineau          0                      0               2.6        5
>     2 Ville de Laval            -0.167                  0.333           3.83      12
>     3 Ville de Longueuil         0.0833                 0.25            3         12
>     4 Ville de Montréal         -1.17                   3.33            4.75      12
>     5 Ville de Québec           -0.167                  0.167           4.67      12
>     6 Ville de Saguenay         -0.667                  1               4.08      12
>     7 Ville de Sherbrooke -…     0.25                   1.08            6         12
>     8 Ville de Trois-Rivièr…     0                      0               3         12
>
> ``` r
> ggplot(
>   precision_by_producer,
>   aes(x = mean_score, y = reorder(producer, mean_score))
> ) +
>   geom_col(fill = "steelblue") +
>   labs(
>     x = "Mean lexical score",
>     y = NULL,
>     title = "Exploratory lexical score by producer"
>   ) +
>   theme_minimal()
> ```
>
> ![](exercices_files/figure-html/unnamed-chunk-9-1.png)
>
> The chart compares the sample, not overall producer quality. Topic and writing-style differences may explain part of the variation.

## Block C - Identify distinctive words

### Exercise 8 - Calculate TF-IDF by producer

> **NOTE:**
>
> ``` r
> producer_tfidf <- catalog_tokens |>
>   count(producer, word) |>
>   bind_tf_idf(word, producer, n) |>
>   arrange(desc(tf_idf))
>
> producer_tfidf |>
>   group_by(producer) |>
>   slice_max(tf_idf, n = 5, with_ties = FALSE) |>
>   ungroup()
> ```
>
>     # A tibble: 40 × 6
>        producer          word               n     tf   idf tf_idf
>        <chr>             <chr>          <int>  <dbl> <dbl>  <dbl>
>      1 Ville de Gatineau courant           10 0.0452  2.08 0.0941
>      2 Ville de Gatineau correspond         6 0.0271  2.08 0.0565
>      3 Ville de Gatineau crue               6 0.0271  2.08 0.0565
>      4 Ville de Gatineau gatineau           6 0.0271  2.08 0.0565
>      5 Ville de Gatineau grand              6 0.0271  2.08 0.0565
>      6 Ville de Laval    lavallois          6 0.0392  2.08 0.0815
>      7 Ville de Laval    cdu                5 0.0327  2.08 0.0680
>      8 Ville de Laval    zaep               4 0.0261  2.08 0.0544
>      9 Ville de Laval    architecturale     3 0.0196  2.08 0.0408
>     10 Ville de Laval    piia               3 0.0196  2.08 0.0408
>     # ℹ 30 more rows
>
> A distinctive word is relatively more associated with one producer. It is not necessarily positive, negative or important to users.

### Exercise 9 - Visualize distinctive words

> **NOTE:**
>
> ``` r
> tfidf_top <- producer_tfidf |>
>   group_by(producer) |>
>   slice_max(tf_idf, n = 4, with_ties = FALSE) |>
>   ungroup() |>
>   mutate(word = fct_reorder(word, tf_idf))
>
> ggplot(tfidf_top, aes(x = tf_idf, y = word)) +
>   geom_col(fill = "darkorange") +
>   facet_wrap(vars(producer), scales = "free_y") +
>   labs(
>     x = "TF-IDF",
>     y = NULL,
>     title = "Distinctive words in descriptions"
>   ) +
>   theme_minimal()
> ```
>
> ![](exercices_files/figure-html/unnamed-chunk-11-1.png)
>
> Return to the original descriptions to check meaning before writing a conclusion.

## Block D - Prepare dashboard output

### Exercise 10 - Build a summary table

> **NOTE:**
>
> ``` r
> dashboard_summary <- record_scores |>
>   group_by(producer) |>
>   summarise(
>     records = n(),
>     mean_precision_score = mean(precision_score),
>     mean_resources = mean(resource_count),
>     median_days_since_update = median(days_since_update),
>     categories = n_distinct(category),
>     .groups = "drop"
>   )
>
> dashboard_summary
> ```
>
>     # A tibble: 8 × 6
>       producer    records mean_precision_score mean_resources median_days_since_up…¹
>       <chr>         <int>                <dbl>          <dbl>                  <dbl>
>     1 Ville de G…       5               0                2.6                     443
>     2 Ville de L…      12              -0.167            3.83                     92
>     3 Ville de L…      12               0.0833           3                       152
>     4 Ville de M…      12              -1.17             4.75                      0
>     5 Ville de Q…      12              -0.167            4.67                      6
>     6 Ville de S…      12              -0.667            4.08                     69
>     7 Ville de S…      12               0.25             6                        40
>     8 Ville de T…      12               0                3                         5
>     # ℹ abbreviated name: ¹​median_days_since_update
>     # ℹ 1 more variable: categories <int>
>
> This table separates indicator preparation from display. A dashboard could then present cards, charts and source descriptions.

### Exercise 11 - Simulate a filter

> **NOTE:**
>
> ``` r
> selected_producer <- "Ville de Québec"
>
> dashboard_summary |>
>   filter(producer == selected_producer)
> ```
>
>     # A tibble: 1 × 6
>       producer    records mean_precision_score mean_resources median_days_since_up…¹
>       <chr>         <int>                <dbl>          <dbl>                  <dbl>
>     1 Ville de Q…      12               -0.167           4.67                      6
>     # ℹ abbreviated name: ¹​median_days_since_update
>     # ℹ 1 more variable: categories <int>
>
> In a `shiny` app, this value could come from a menu. The analytical operation remains a filter on a prepared table.

## Case Study 1 - Quality of dataset descriptions

A team wants to identify descriptions that deserve editorial review.

> **NOTE:**
>
> ``` r
> records_to_review <- record_scores |>
>   arrange(precision_score, recognized_words) |>
>   select(
>     producer,
>     title,
>     description,
>     precision_score,
>     recognized_words,
>     days_since_update
>   ) |>
>   slice_head(n = 10)
>
> records_to_review
> ```
>
>     # A tibble: 10 × 6
>        producer title description precision_score recognized_words days_since_update
>        <chr>    <chr> <chr>                 <dbl>            <int>             <int>
>      1 Ville d… Inte… "Ensemble …              -4                6                 0
>      2 Ville d… Mili… "Milieux h…              -3                3                39
>      3 Ville d… Offr… "Ensemble …              -2                2                 5
>      4 Ville d… Cale… "Cet ensem…              -2                2                 0
>      5 Ville d… Résu… "Cet ensem…              -2                2                 0
>      6 Ville d… Fréq… "Ensemble …              -2                4                 0
>      7 Ville d… RSQA… "La Ville …              -2                8                 0
>      8 Ville d… Infr… "Ensemble …              -1                1                 6
>      9 Ville d… Perm… "Informati…              -1                1               102
>     10 Ville d… Perm… "Informati…              -1                1                 6
>
> The score may prioritize reading, but should not automatically trigger correction. The lexicon is small, topics differ and a general description may still be accurate and useful.

## Case Study 2 - Quebec tourism events

Import `quebec_tourism_events.csv`. `text` combines public SIT Québec fields to create a short reproducible corpus.

> **NOTE:**
>
> ``` r
> events <- read_csv(
>   "data/quebec_tourism_events.csv",
>   show_col_types = FALSE
> )
>
> event_tokens <- events |>
>   unnest_tokens(word, text) |>
>   filter(
>     !word %in% stop_fr,
>     str_detect(word, "^\\p{L}+$")
>   )
>
> event_tfidf <- event_tokens |>
>   count(event_type, word) |>
>   bind_tf_idf(word, event_type, n) |>
>   group_by(event_type) |>
>   slice_max(tf_idf, n = 4, with_ties = FALSE) |>
>   ungroup()
>
> event_tfidf
> ```
>
>     # A tibble: 40 × 6
>        event_type                        word            n     tf   idf tf_idf
>        <chr>                             <chr>       <int>  <dbl> <dbl>  <dbl>
>      1 Concert, spectacle                soirées         2 0.0435  2.30 0.100
>      2 Concert, spectacle                chanson         2 0.0435  1.61 0.0700
>      3 Concert, spectacle                contes          2 0.0435  1.61 0.0700
>      4 Concert, spectacle                légendes        2 0.0435  1.61 0.0700
>      5 Concours / tournoi                adulte          1 0.0556  2.30 0.128
>      6 Concours / tournoi                deslauriers     1 0.0556  2.30 0.128
>      7 Concours / tournoi                félix           1 0.0556  2.30 0.128
>      8 Concours / tournoi                hallée          1 0.0556  2.30 0.128
>      9 Expérience multimédia / immersive numériques      5 0.0704  1.61 0.113
>     10 Expérience multimédia / immersive immersif        3 0.0423  1.61 0.0680
>     # ℹ 30 more rows
>
> ``` r
> event_summary <- events |>
>   group_by(tourism_region) |>
>   summarise(
>     events = n(),
>     municipalities = n_distinct(municipality),
>     median_duration_days = median(duration_days),
>     proportion_with_website = mean(website_available),
>     .groups = "drop"
>   ) |>
>   arrange(desc(events), tourism_region)
>
> event_summary
> ```
>
>     # A tibble: 20 × 5
>        tourism_region           events municipalities median_duration_days
>        <chr>                     <int>          <int>                <dbl>
>      1 Abitibi-Témiscamingue         8              5                  3
>      2 Bas-Saint-Laurent             8              6                  4
>      3 Cantons-de-l'Est              8              6                  1.5
>      4 Centre-du-Québec              8              4                 16.5
>      5 Charlevoix                    8              5                  3
>      6 Chaudière-Appalaches          8              5                  3
>      7 Côte-Nord (Manicouagan)       8              5                  4.5
>      8 Gaspésie                      8              8                  7
>      9 Lanaudière                    8              7                  3
>     10 Laurentides                   8              8                  2
>     11 Laval                         8              1                  4
>     12 Mauricie                      8              4                 21
>     13 Montréal                      8              1                656
>     14 Montérégie                    8              7                 33
>     15 Outaouais                     8              4                  3
>     16 Québec                        8              3                 19.5
>     17 Saguenay--Lac-Saint-Jean      8              7                  4.5
>     18 Îles-de-la-Madeleine          6              2                  5.5
>     19 Côte-Nord (Duplessis)         5              3                  4
>     20 Baie-James                    4              2                  6.5
>     # ℹ 1 more variable: proportion_with_website <dbl>
>
> Useful visuals include a TF-IDF chart by event type and a regional coverage chart. The sample is balanced to at most eight events per tourism region, so it does not measure the true volume of the entire tourism offering.
