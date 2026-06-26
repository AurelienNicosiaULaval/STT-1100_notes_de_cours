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

### Exercice 2 – Nettoyage des valeurs manquantes (Data import, ex. 4)

Le fichier contient la chaîne `"missing"` pour indiquer une absence dans `vehicle_type`.
Ré-importez le fichier en la convertissant en `NA`.

> **NOTE:**
>
> ``` r
> policies <- read_csv("policies.csv", na = "missing")
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

### Exercice 5 – Lire une feuille Excel précise (Import spreadsheets, ex. 3)

Le classeur `quotes_2024.xlsx` possède une feuille « Q3 » où les libellés commencent à la 2ᵉ ligne.
Importez-la et vérifiez les types.

> **NOTE:**
>
> ``` r
> library(readxl)
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
>
> lst   <- read_json("coverage.json")
> limit <- lst$collision$limit
>
> tbl <- tibble(row = lst) %>%
>   unnest_wider(row)
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
> read_csv("policies.csv") %>% clean_names() %>% slice_max(claim_amount, n = 5, by = vehicle_type)
> ```
