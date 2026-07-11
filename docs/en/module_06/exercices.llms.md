# Module 6 - Exercises

STT-1100 Introduction to Data Science

## Consolidation Exercises

These exercises are independent from the adventure and challenge. They consolidate the technical moves from Module 6: joining tables, checking keys, finding unmatched rows, understanding cardinalities and writing constructive reviews.

> **NOTE:**
>
> The four tables come from the [official Données Québec API](https://www.donneesquebec.ca/recherche/api/3/action/package_search). The extract contains 142 organizations, 312 datasets, 3,143 resources and 2,101 dataset-tag associations. To prevent one organization from dominating the exercises, the script retains at most eight datasets among the 1,000 most recently modified for each organization. The result includes ministries and cities from several regions, including Laval, Lévis, Longueuil, Montréal, Québec City, Rimouski, Rouyn-Noranda, Saguenay, Sherbrooke and Trois-Rivières. The script `scripts/build_module06_real_data.R` rebuilds the extract.

``` r
library(tidyverse)
```

## Block A - Understand Join Keys

### Exercise 1 - Import Organizations and Datasets

Import `organisations_donnees_quebec.csv` and `jeux_donnees_quebec.csv`, then inspect their dimensions and keys. The official French field names are retained.

> **NOTE:**
>
> ``` r
> organizations <- read_csv(
>   "data/organisations_donnees_quebec.csv",
>   show_col_types = FALSE
> )
>
> datasets <- read_csv(
>   "data/jeux_donnees_quebec.csv",
>   show_col_types = FALSE
> )
>
> glimpse(organizations)
> ```
>
>     Rows: 142
>     Columns: 5
>     $ organisation_id   <chr> "02ac2745-f6ac-432b-aebd-27037cbaa0fb", "b0631ca4-c8…
>     $ organisation_nom  <chr> "AdMare", "Agence de mobilité durable", "Assemblée n…
>     $ organisation_slug <chr> "admare", "agence-de-mobilite-durable", "assemblee-n…
>     $ nb_jeux_catalogue <dbl> 1, 0, 5, 5, 1, 1, 2, 6, 2, 0, 1, 2, 0, 6, 1, 3, 6, 7…
>     $ etat              <chr> "active", "active", "active", "active", "active", "a…
>
> ``` r
> glimpse(datasets)
> ```
>
>     Rows: 312
>     Columns: 8
>     $ jeu_id            <chr> "00ec17f8-c7f1-414c-9860-a12bd0c91824", "b10a6f01-32…
>     $ titre             <chr> "Écocentres et points de dépôt municipaux", "Rampes …
>     $ organisation_id   <chr> "0000b004-5e60-4585-b5b1-c0942d829fa5", "00fde186-c7…
>     $ licence           <chr> "Attribution (CC-BY 4.0)", "Attribution (CC-BY 4.0)"…
>     $ date_creation     <date> 2023-08-30, 2026-04-01, 2026-04-02, 2026-04-02, 202…
>     $ date_modification <date> 2026-02-09, 2026-04-02, 2026-04-02, 2026-04-02, 202…
>     $ nb_ressources     <dbl> 3, 1, 1, 1, 2, 2, 2, 1, 1, 1, 4, 4, 4, 4, 4, 8, 8, 3…
>     $ nb_etiquettes     <dbl> 6, 12, 6, 5, 3, 10, 5, 6, 6, 3, 4, 4, 33, 11, 4, 3, …
>
> ``` r
> tibble(
>   table = c("organizations", "datasets"),
>   rows = c(nrow(organizations), nrow(datasets)),
>   distinct_keys = c(
>     n_distinct(organizations$organisation_id),
>     n_distinct(datasets$jeu_id)
>   )
> )
> ```
>
>     # A tibble: 2 × 3
>       table          rows distinct_keys
>       <chr>         <int>         <int>
>     1 organizations   142           142
>     2 datasets        312           312

### Exercise 2 - Add the Organization Name

Use `left_join()` to add each organization’s name and total catalogue dataset count to each dataset in the extract.

> **NOTE:**
>
> ``` r
> datasets_detail <- datasets |>
>   left_join(organizations, by = "organisation_id")
>
> datasets_detail |>
>   select(
>     jeu_id,
>     titre,
>     organisation_nom,
>     licence,
>     nb_ressources,
>     nb_jeux_catalogue
>   ) |>
>   slice_head(n = 10)
> ```
>
>     # A tibble: 10 × 6
>        jeu_id         titre organisation_nom licence nb_ressources nb_jeux_catalogue
>        <chr>          <chr> <chr>            <chr>           <dbl>             <dbl>
>      1 00ec17f8-c7f1… Écoc… RECYC-QUÉBEC     Attrib…             3                 1
>      2 b10a6f01-320c… Ramp… Ville de Shawin… Attrib…             1                31
>      3 668b7750-b71a… Dist… Ville de Shawin… Attrib…             1                31
>      4 32f75a4d-552f… Bâti… Ville de Shawin… Attrib…             1                31
>      5 08123b30-f795… Parc… Ville de Shawin… Attrib…             2                31
>      6 6813f7dd-8f31… Parc… Ville de Shawin… Attrib…             2                31
>      7 8e09581e-6963… Sent… Ville de Shawin… Attrib…             2                31
>      8 c6138a86-5777… Sent… Ville de Shawin… Attrib…             1                31
>      9 3f137d4d-b156… Sent… Ville de Shawin… Attrib…             1                31
>     10 83596ebd-5845… Art_… AdMare           Attrib…             1                 1

### Exercise 3 - Find Datasets Without a Known Organization

Use `anti_join()` to check whether any dataset has an organization key absent from the organization table.

> **NOTE:**
>
> ``` r
> datasets |>
>   anti_join(organizations, by = "organisation_id")
> ```
>
>     # A tibble: 0 × 8
>     # ℹ 8 variables: jeu_id <chr>, titre <chr>, organisation_id <chr>,
>     #   licence <chr>, date_creation <date>, date_modification <date>,
>     #   nb_ressources <dbl>, nb_etiquettes <dbl>
>
> Returning zero rows is useful evidence: every foreign key in this extract has a match.

### Exercise 4 - Identify Represented Organizations

Use `semi_join()` to retain only organizations with at least one dataset in the balanced extract.

> **NOTE:**
>
> ``` r
> represented_organizations <- organizations |>
>   semi_join(datasets, by = "organisation_id") |>
>   arrange(organisation_nom)
>
> represented_organizations
> ```
>
>     # A tibble: 78 × 5
>        organisation_id    organisation_nom organisation_slug nb_jeux_catalogue etat
>        <chr>              <chr>            <chr>                         <dbl> <chr>
>      1 02ac2745-f6ac-432… AdMare           admare                            1 acti…
>      2 e6ecd29a-c198-48b… Assemblée natio… assemblee-nation…                 5 acti…
>      3 5f1f16de-5dea-4fd… Association des… l-association-de…                 5 acti…
>      4 8d4ad35d-9d0b-4a4… Autorité des ma… autorite-des-mar…                 1 acti…
>      5 737e8d6f-a3bd-4f4… Autorité des ma… amp                               1 acti…
>      6 193c8a13-04c9-46d… Bibliothèque et… banq                              6 acti…
>      7 15f2f4fc-9d79-433… Bixi Montréal    bixi                              2 acti…
>      8 8284d83e-1b0f-4bd… Cinémathèque qu… cinematheque-que…                 6 acti…
>      9 d6c64296-b68e-47a… Commission de p… cptaq                             3 acti…
>     10 5d511b3d-dad9-4f1… Commission de t… commission-de-to…                 6 acti…
>     # ℹ 68 more rows

## Block B - One-to-Many Relationships

### Exercise 5 - Summarize Datasets by Organization

Calculate the number of datasets retained in the extract and the total catalogue count for each represented organization.

> **NOTE:**
>
> ``` r
> organization_summary <- datasets_detail |>
>   group_by(organisation_id, organisation_nom, nb_jeux_catalogue) |>
>   summarise(
>     extract_datasets = n(),
>     extract_resources = sum(nb_ressources),
>     .groups = "drop"
>   ) |>
>   arrange(desc(nb_jeux_catalogue))
>
> organization_summary
> ```
>
>     # A tibble: 78 × 5
>        organisation_id           organisation_nom nb_jeux_catalogue extract_datasets
>        <chr>                     <chr>                        <dbl>            <int>
>      1 6e1f26e1-da99-4de4-a1db-… Ville de Montré…               389                8
>      2 4e77c64b-22f6-469e-ad07-… Ville de Laval                 130                8
>      3 b65dd6f6-8f31-402e-a8e1-… Ministère de l’…               126                8
>      4 95c1ba5b-25ec-405d-8647-… Ministère des R…               121                8
>      5 23e2ed49-fd2c-4114-858e-… Ville de Gatine…                52                2
>      6 c1ec9cbd-c536-49f1-900e-… Ville de Repent…                39                8
>      7 89ffd393-6e8c-4055-a172-… Ville de Trois-…                38                8
>      8 06690e08-a712-4ee3-8cff-… Ville de Québec                 37                8
>      9 0941b44f-88b2-4b11-93fa-… Ministère de la…                34                8
>     10 00fde186-c76f-499e-9dfc-… Ville de Shawin…                31                8
>     # ℹ 68 more rows
>     # ℹ 1 more variable: extract_resources <dbl>

### Exercise 6 - Visualize the Largest Organizations

Produce a graph of the ten organizations with the most datasets in the complete catalogue.

> **NOTE:**
>
> ``` r
> organizations |>
>   slice_max(nb_jeux_catalogue, n = 10, with_ties = FALSE) |>
>   ggplot(
>     aes(
>       x = fct_reorder(organisation_nom, nb_jeux_catalogue),
>       y = nb_jeux_catalogue
>     )
>   ) +
>   geom_col(fill = "#2c7fb8") +
>   coord_flip() +
>   labs(
>     title = "Organizations with the most Données Québec datasets",
>     x = NULL,
>     y = "Number of catalogue datasets"
>   )
> ```
>
> ![](exercices_files/figure-html/unnamed-chunk-6-1.png)

### Exercise 7 - Join Resources to Datasets

Import `ressources_donnees_quebec.csv`, add the dataset title to each resource and count formats.

> **NOTE:**
>
> ``` r
> resources <- read_csv(
>   "data/ressources_donnees_quebec.csv",
>   show_col_types = FALSE
> )
>
> resources_detail <- resources |>
>   left_join(
>     datasets |> select(jeu_id, titre, organisation_id),
>     by = "jeu_id",
>     relationship = "many-to-one"
>   )
>
> resources_detail |>
>   count(format, sort = TRUE) |>
>   slice_head(n = 15)
> ```
>
>     # A tibble: 15 × 2
>        format      n
>        <chr>   <int>
>      1 CSV      1405
>      2 XLSX      368
>      3 json      275
>      4 GeoJSON   169
>      5 PDF       142
>      6 SHP       136
>      7 JSON      124
>      8 HTML       82
>      9 XML        60
>     10 KML        56
>     11 RINEX      49
>     12 FGDB       41
>     13 WMS        41
>     14 GPKG       30
>     15 xml        25

### Exercise 8 - Check Dataset-Resource Matches

Find datasets without resources and resources without a known dataset.

> **NOTE:**
>
> ``` r
> datasets_without_resource <- datasets |>
>   anti_join(resources, by = "jeu_id")
>
> resources_without_dataset <- resources |>
>   anti_join(datasets, by = "jeu_id")
>
> datasets_without_resource
> ```
>
>     # A tibble: 0 × 8
>     # ℹ 8 variables: jeu_id <chr>, titre <chr>, organisation_id <chr>,
>     #   licence <chr>, date_creation <date>, date_modification <date>,
>     #   nb_ressources <dbl>, nb_etiquettes <dbl>
>
> ``` r
> resources_without_dataset
> ```
>
>     # A tibble: 0 × 7
>     # ℹ 7 variables: ressource_id <chr>, jeu_id <chr>, ressource_nom <chr>,
>     #   format <chr>, type_ressource <chr>, taille_octets <dbl>,
>     #   date_modification <date>

## Block C - Many-to-Many Relationships and Review

### Exercise 9 - Add Tags

Import `etiquettes_donnees_quebec.csv`, then add the dataset title and organization to each dataset-tag association.

> **NOTE:**
>
> ``` r
> tags <- read_csv(
>   "data/etiquettes_donnees_quebec.csv",
>   show_col_types = FALSE
> )
>
> tags_detail <- tags |>
>   left_join(
>     datasets_detail |> select(jeu_id, titre, organisation_nom),
>     by = "jeu_id",
>     relationship = "many-to-one"
>   )
>
> tags_detail |>
>   slice_head(n = 10)
> ```
>
>     # A tibble: 10 × 4
>        jeu_id                               etiquette         titre organisation_nom
>        <chr>                                <chr>             <chr> <chr>
>      1 00ec17f8-c7f1-414c-9860-a12bd0c91824 Collecte des mat… Écoc… RECYC-QUÉBEC
>      2 00ec17f8-c7f1-414c-9860-a12bd0c91824 GMR               Écoc… RECYC-QUÉBEC
>      3 00ec17f8-c7f1-414c-9860-a12bd0c91824 Municipal         Écoc… RECYC-QUÉBEC
>      4 00ec17f8-c7f1-414c-9860-a12bd0c91824 Point de dépôt    Écoc… RECYC-QUÉBEC
>      5 00ec17f8-c7f1-414c-9860-a12bd0c91824 Recyclage         Écoc… RECYC-QUÉBEC
>      6 00ec17f8-c7f1-414c-9860-a12bd0c91824 Écocentre         Écoc… RECYC-QUÉBEC
>      7 b10a6f01-320c-4d56-b545-1ee5b70fdaeb Acces a l eau     Ramp… Ville de Shawin…
>      8 b10a6f01-320c-4d56-b545-1ee5b70fdaeb Bateau            Ramp… Ville de Shawin…
>      9 b10a6f01-320c-4d56-b545-1ee5b70fdaeb Canot             Ramp… Ville de Shawin…
>     10 b10a6f01-320c-4d56-b545-1ee5b70fdaeb Descente          Ramp… Ville de Shawin…

### Exercise 10 - Summarize Tags

Find the fifteen tags associated with the largest number of distinct datasets.

> **NOTE:**
>
> ``` r
> tag_summary <- tags_detail |>
>   summarise(
>     dataset_count = n_distinct(jeu_id),
>     .by = etiquette
>   ) |>
>   arrange(desc(dataset_count)) |>
>   slice_head(n = 15)
>
> tag_summary
> ```
>
>     # A tibble: 15 × 2
>        etiquette           dataset_count
>        <chr>                       <int>
>      1 HackQC19                       16
>      2 Transport                      15
>      3 HackQC20                       14
>      4 Municipal                      12
>      5 Culture                        12
>      6 Sherbrooke                      9
>      7 Urbanisme                       9
>      8 Donnee ouverte                  8
>      9 Eau                             8
>     10 Ville de shawinigan             8
>     11 Hydrographie                    8
>     12 Route                           8
>     13 Environnement                   8
>     14 Art contemporain                8
>     15 Prestation                      8

### Exercise 11 - Observe Row Multiplication

Join resources and then tags to datasets. Compare row counts before and after and explain why the second join is many-to-many.

> **NOTE:**
>
> ``` r
> datasets_resources <- datasets |>
>   left_join(
>     resources,
>     by = "jeu_id",
>     relationship = "one-to-many"
>   )
>
> flattened_catalogue <- datasets_resources |>
>   left_join(
>     tags,
>     by = "jeu_id",
>     relationship = "many-to-many"
>   )
>
> tibble(
>   table = c("datasets", "datasets_resources", "flattened_catalogue"),
>   rows = c(
>     nrow(datasets),
>     nrow(datasets_resources),
>     nrow(flattened_catalogue)
>   )
> )
> ```
>
>     # A tibble: 3 × 2
>       table                rows
>       <chr>               <int>
>     1 datasets              312
>     2 datasets_resources   3143
>     3 flattened_catalogue 20395
>
> A dataset may have several resources and several tags. Resource-tag combinations therefore multiply rows without creating new datasets.

### Exercise 12 - Write a Useful Issue

Find a resource with a missing format, then draft an issue with three sections: finding, suggestion and justification.

> **NOTE:**
>
> ``` markdown
> ## Finding
>
> The resource record does not specify a format in the catalogue metadata.
>
> ## Suggestion
>
> Populate the format field with a normalized value matching the published file or service.
>
> ## Why this is useful
>
> The format helps users select tools and filter resources before downloading them.
> ```

## Case Studies

### Case Study 1 - Relational Audit of Données Québec

Use the organization, dataset, resource and tag tables.

Complete the following tasks:

1.  check the uniqueness of the three primary keys;
2.  join datasets to organizations;
3.  identify unmatched foreign keys;
4.  find datasets without resources and without tags;
5.  produce a summary by organization;
6.  write a cautious conclusion about relational integrity.

> **NOTE:**
>
> ``` r
> key_check <- tibble(
>   table = c("organizations", "datasets", "resources"),
>   rows = c(nrow(organizations), nrow(datasets), nrow(resources)),
>   distinct_keys = c(
>     n_distinct(organizations$organisation_id),
>     n_distinct(datasets$jeu_id),
>     n_distinct(resources$ressource_id)
>   )
> )
>
> datasets_organizations <- datasets |>
>   left_join(organizations, by = "organisation_id")
>
> datasets_without_organization <- datasets |>
>   anti_join(organizations, by = "organisation_id")
>
> resources_without_dataset <- resources |>
>   anti_join(datasets, by = "jeu_id")
>
> datasets_without_resource <- datasets |>
>   anti_join(resources, by = "jeu_id")
>
> datasets_without_tag <- datasets |>
>   anti_join(tags, by = "jeu_id")
>
> audit_summary <- datasets_organizations |>
>   group_by(organisation_nom) |>
>   summarise(
>     dataset_count = n(),
>     resource_count = sum(nb_ressources),
>     datasets_without_tag = sum(nb_etiquettes == 0),
>     .groups = "drop"
>   ) |>
>   arrange(desc(resource_count))
>
> key_check
> ```
>
>     # A tibble: 3 × 3
>       table          rows distinct_keys
>       <chr>         <int>         <int>
>     1 organizations   142           142
>     2 datasets        312           312
>     3 resources      3143          3143
>
> ``` r
> datasets_without_organization
> ```
>
>     # A tibble: 0 × 8
>     # ℹ 8 variables: jeu_id <chr>, titre <chr>, organisation_id <chr>,
>     #   licence <chr>, date_creation <date>, date_modification <date>,
>     #   nb_ressources <dbl>, nb_etiquettes <dbl>
>
> ``` r
> resources_without_dataset
> ```
>
>     # A tibble: 0 × 7
>     # ℹ 7 variables: ressource_id <chr>, jeu_id <chr>, ressource_nom <chr>,
>     #   format <chr>, type_ressource <chr>, taille_octets <dbl>,
>     #   date_modification <date>
>
> ``` r
> datasets_without_resource
> ```
>
>     # A tibble: 0 × 8
>     # ℹ 8 variables: jeu_id <chr>, titre <chr>, organisation_id <chr>,
>     #   licence <chr>, date_creation <date>, date_modification <date>,
>     #   nb_ressources <dbl>, nb_etiquettes <dbl>
>
> ``` r
> datasets_without_tag
> ```
>
>     # A tibble: 14 × 8
>        jeu_id          titre organisation_id licence date_creation date_modification
>        <chr>           <chr> <chr>           <chr>   <date>        <date>
>      1 5c88fe6f-0e8e-… Regi… 1021b38a-91ff-… Attrib… 2026-05-15    2026-07-11
>      2 2222f024-e94d-… Regi… 1021b38a-91ff-… Attrib… 2022-06-14    2026-07-11
>      3 14d93d62-16bf-… Regi… 737e8d6f-a3bd-… Attrib… 2015-05-01    2026-07-08
>      4 21686a8e-2713-… Agen… 836fde8a-a7ee-… Attrib… 2015-09-22    2025-11-20
>      5 755b45d6-7aee-… List… cebe524d-f2f6-… Attrib… 2021-01-29    2026-07-11
>      6 126c4b33-55c2-… List… cebe524d-f2f6-… Attrib… 2021-01-29    2026-07-01
>      7 579125c6-561b-… Tron… f62d2ba9-89e5-… Attrib… 2025-09-30    2025-11-17
>      8 2642706c-14a6-… Unit… f62d2ba9-89e5-… Attrib… 2025-09-30    2025-09-30
>      9 19b0d9a9-11d5-… Dist… f62d2ba9-89e5-… Attrib… 2025-09-30    2025-09-30
>     10 d4357015-d0d9-… Adre… f62d2ba9-89e5-… Attrib… 2025-09-30    2025-09-30
>     11 c4179790-79a3-… Dist… f62d2ba9-89e5-… Attrib… 2025-09-30    2025-09-30
>     12 52e35caf-ee9d-… Gran… f62d2ba9-89e5-… Attrib… 2025-09-30    2025-09-30
>     13 0c8a89da-47f2-… Zona… f62d2ba9-89e5-… Attrib… 2025-09-30    2025-09-30
>     14 7185f1a1-3d97-… Born… f62d2ba9-89e5-… Attrib… 2025-09-30    2025-09-30
>     # ℹ 2 more variables: nb_ressources <dbl>, nb_etiquettes <dbl>
>
> ``` r
> audit_summary
> ```
>
>     # A tibble: 78 × 4
>        organisation_nom            dataset_count resource_count datasets_without_tag
>        <chr>                               <int>          <dbl>                <int>
>      1 Secrétariat du Conseil du …             5            611                    0
>      2 Ministère des Affaires mun…             7            561                    0
>      3 Ministère de l'Emploi et d…             8            304                    0
>      4 Ministère de l’Immigration…             4            127                    0
>      5 Ministère de la Cybersécur…             5            122                    0
>      6 Ministère de la Justice                 1             90                    0
>      7 Ville de Lévis                          8             71                    0
>      8 Ministère des Ressources n…             8             70                    0
>      9 Ministère des Transports e…             8             69                    0
>     10 Ministère de l'Éducation e…             4             61                    0
>     # ℹ 68 more rows
>
> A cautious conclusion may note the absence of orphan keys in the supplied extract. It must also state that the extract is balanced by organization and represents neither the full catalogue nor its real distribution.

### Case Study 2 - Review Resource Metadata

Use the same tables to conduct a constructive review of resource documentation.

Complete the following tasks:

1.  join resources to datasets and organizations;
2.  identify missing formats;
3.  calculate the share of resources without a declared size;
4.  summarize formats by organization;
5.  identify datasets without tags;
6.  draft a precise issue for an observed problem.

> **NOTE:**
>
> ``` r
> catalogue_resources <- resources |>
>   left_join(
>     datasets |> select(jeu_id, titre, organisation_id),
>     by = "jeu_id",
>     relationship = "many-to-one"
>   ) |>
>   left_join(
>     organizations |> select(organisation_id, organisation_nom),
>     by = "organisation_id",
>     relationship = "many-to-one"
>   )
>
> missing_formats <- catalogue_resources |>
>   filter(is.na(format) | str_squish(format) == "")
>
> missing_size_share <- catalogue_resources |>
>   summarise(
>     resource_count = n(),
>     resources_without_size = sum(is.na(taille_octets)),
>     share_without_size = mean(is.na(taille_octets))
>   )
>
> formats_by_organization <- catalogue_resources |>
>   count(organisation_nom, format, sort = TRUE)
>
> datasets_without_tag <- datasets |>
>   anti_join(tags, by = "jeu_id")
>
> missing_formats
> ```
>
>     # A tibble: 4 × 10
>       ressource_id          jeu_id ressource_nom format type_ressource taille_octets
>       <chr>                 <chr>  <chr>         <chr>  <chr>                  <dbl>
>     1 a64f32b8-ab9f-4d8e-8… 221d1… Chantiers - … <NA>   cartes                    NA
>     2 4a88ae0f-746e-40fb-a… 67d85… Ta            <NA>   <NA>                  754713
>     3 c9b80bfb-1f80-432f-9… e9d80… Sensibilisat… <NA>   <NA>                      NA
>     4 20f76d05-96e5-4aa6-8… 142ff… Visualisation <NA>   cartes                    NA
>     # ℹ 4 more variables: date_modification <date>, titre <chr>,
>     #   organisation_id <chr>, organisation_nom <chr>
>
> ``` r
> missing_size_share
> ```
>
>     # A tibble: 1 × 3
>       resource_count resources_without_size share_without_size
>                <int>                  <int>              <dbl>
>     1           3143                    889              0.283
>
> ``` r
> formats_by_organization
> ```
>
>     # A tibble: 283 × 3
>        organisation_nom                                                 format     n
>        <chr>                                                            <chr>  <int>
>      1 Ministère des Affaires municipales et de l'Habitation            CSV      290
>      2 Ministère de l'Emploi et de la Solidarité sociale                CSV      282
>      3 Secrétariat du Conseil du trésor                                 json     275
>      4 Ministère des Affaires municipales et de l'Habitation            XLSX     200
>      5 Ministère de l’Immigration, de la Francisation et de l’Intégrat… CSV      119
>      6 Secrétariat du Conseil du trésor                                 CSV      101
>      7 Ministère de la Justice                                          CSV       90
>      8 Secrétariat du Conseil du trésor                                 JSON      87
>      9 Secrétariat du Conseil du trésor                                 XLSX      78
>     10 Ministère de la Cybersécurité et du Numérique                    CSV       63
>     # ℹ 273 more rows
>
> ``` r
> datasets_without_tag
> ```
>
>     # A tibble: 14 × 8
>        jeu_id          titre organisation_id licence date_creation date_modification
>        <chr>           <chr> <chr>           <chr>   <date>        <date>
>      1 5c88fe6f-0e8e-… Regi… 1021b38a-91ff-… Attrib… 2026-05-15    2026-07-11
>      2 2222f024-e94d-… Regi… 1021b38a-91ff-… Attrib… 2022-06-14    2026-07-11
>      3 14d93d62-16bf-… Regi… 737e8d6f-a3bd-… Attrib… 2015-05-01    2026-07-08
>      4 21686a8e-2713-… Agen… 836fde8a-a7ee-… Attrib… 2015-09-22    2025-11-20
>      5 755b45d6-7aee-… List… cebe524d-f2f6-… Attrib… 2021-01-29    2026-07-11
>      6 126c4b33-55c2-… List… cebe524d-f2f6-… Attrib… 2021-01-29    2026-07-01
>      7 579125c6-561b-… Tron… f62d2ba9-89e5-… Attrib… 2025-09-30    2025-11-17
>      8 2642706c-14a6-… Unit… f62d2ba9-89e5-… Attrib… 2025-09-30    2025-09-30
>      9 19b0d9a9-11d5-… Dist… f62d2ba9-89e5-… Attrib… 2025-09-30    2025-09-30
>     10 d4357015-d0d9-… Adre… f62d2ba9-89e5-… Attrib… 2025-09-30    2025-09-30
>     11 c4179790-79a3-… Dist… f62d2ba9-89e5-… Attrib… 2025-09-30    2025-09-30
>     12 52e35caf-ee9d-… Gran… f62d2ba9-89e5-… Attrib… 2025-09-30    2025-09-30
>     13 0c8a89da-47f2-… Zona… f62d2ba9-89e5-… Attrib… 2025-09-30    2025-09-30
>     14 7185f1a1-3d97-… Born… f62d2ba9-89e5-… Attrib… 2025-09-30    2025-09-30
>     # ℹ 2 more variables: nb_ressources <dbl>, nb_etiquettes <dbl>
>
> A useful issue identifies the resource, describes the missing field and proposes a verifiable correction. A missing size is not automatically an error, especially for a service or interactive map resource.
