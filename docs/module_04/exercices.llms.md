# Exercices de consolidation

# Exercices de consolidation

### Exercice 1 – Lecture contrôlée d’un CSV (Data import, § readr)

Importez `policies.csv` en :

- forçant `policy_id` en **character** ;

- laissant `premium_amount` en **double**

puis affichez la structure de l’objet.

> **NOTE:**
>
> ``` r
> library(readr)
> library(dplyr)
>
> policies <- read_csv(
>   "policies.csv",
>   col_types = cols(
>     policy_id      = col_character(),
>     premium_amount = col_double()
>   )
> )
> glimpse(policies)
> ```

### Exercice 2 – Recodage de valeurs catégorielles

La variable `vehicle_use` contient les valeurs `"Pleasure"`, `"pleasure"`, `"Commute"` et `"Com.mute"`.
Recoder cette variable pour obtenir seulement les niveaux `"Pleasure"` et `"Commute"`.

> **NOTE:**
>
> ``` r
> library(readr)
> library(dplyr)
> library(forcats)
>
> policies <- read_csv("policies.csv", show_col_types = FALSE) %>%
>   mutate(
>     vehicle_use = fct_collapse(
>       as.factor(vehicle_use),
>       Pleasure = c("Pleasure", "pleasure"),
>       Commute = c("Commute", "Com.mute")
>     )
>   )
>
> table(policies$vehicle_use)
> ```

### Exercice 3 – Passage long \<-\> large (Data tidy, § pivot)

Les colonnes `q1_claims:q4_claims` représentent le nombre de réclamations par trimestre.

1.  Mettez-les en *long* (`quarter`, `claims`).

2.  Revenez ensuite en *wide*.

> **NOTE:**
>
> ``` r
> library(tidyr)
> library(dplyr)
>
> pol_long <- policies %>%
>   pivot_longer(
>     cols = q1_claims:q4_claims,
>     names_to  = "quarter",
>     values_to = "claims"
>   )
>
> pol_wide <- pol_long %>%
>   pivot_wider(names_from = quarter, values_from = claims)
> ```

### Exercice 4 – Importation contrôlée du fichier principal

Importez `dataset_pratique.csv`, nettoyez les noms de colonnes et vérifiez que le tableau contient 23 colonnes.

> **NOTE:**
>
> ``` r
> library(readr)
> library(dplyr)
> library(janitor)
>
> base <- read_delim(
>   "dataset_pratique.csv",
>   delim = ";",
>   trim_ws = TRUE,
>   show_col_types = FALSE
> ) %>%
>   clean_names()
>
> ncol(base)
> glimpse(base)
> ```

### Exercice 5 – Lire une feuille Excel précise (Import spreadsheets, ex. 3)

Le classeur `quotes_2024.xlsx` possède une feuille « Q3 » où les libellés commencent à la 2ᵉ ligne.
Importez-la et vérifiez les types.

> **NOTE:**
>
> ``` r
> library(readxl)
> library(dplyr)
>
> q3 <- read_excel(
>   "resources/quotes_2024.xlsx",
>   sheet = "Q3",
>   skip  = 1   # on saute la première ligne
> )
> glimpse(q3)
> ```

### Exercice 6 – Parse de nombres avec locale (Data import, ex. 5)

La colonne `euro_premium` contient « 1 234,56 » (virgule décimale, espace 000).
Parsez-la correctement en `double`.

> **NOTE:**
>
> ``` r
> library(readr)
>
> parse_number("1 234,56", locale = locale(decimal_mark = ",", grouping_mark = " "))
> ```

### Exercice 7 – Rectangling d’une liste JSON (Lists, ex. 1-2)

Vous disposez d’une liste `lst <- jsonlite::read_json("coverage.json")`.

1.  Récupérez `lst$collision$limit`.

2.  Transformez `lst` en tibble rectangulaire.

> **NOTE:**
>
> ``` r
> library(jsonlite)
> library(tidyr)
> library(dplyr)
> library(tibble)
>
> lst   <- read_json("coverage.json")
> limit <- lst$coverage$collision$limit
>
> tbl <- tibble(
>   couverture = names(lst$coverage),
>   details = lst$coverage
> ) %>%
>   unnest_wider(details)
>
> limit
> tbl
> ```

### Exercice 8 – Pipeline express (Synthèse)

En trois lignes :

1.  importez `policies.csv` ;

2.  nettoyez les noms (`janitor::clean_names`) ;

3.  renvoyez les **5** plus grosses `claim_amount` par `vehicle_type`.

> **NOTE:**
>
> ``` r
> library(readr); library(dplyr); library(janitor)
>
> read_csv("policies.csv", show_col_types = FALSE) %>%
>   clean_names() %>%
>   group_by(vehicle_type) %>%
>   slice_max(claim_amount, n = 5, with_ties = FALSE)
> ```
