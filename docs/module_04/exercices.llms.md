# Exercices de consolidation

Ces exercices sont indépendants de l’aventure et du défi. Ils servent à consolider les gestes techniques du module 4: importer des fichiers, vérifier les types, nettoyer des valeurs, manipuler des facteurs, lire un JSON et documenter des décisions de nettoyage.

``` r
library(readr)
library(dplyr)
library(tidyr)
library(stringr)
library(forcats)
library(tibble)
library(readxl)
library(jsonlite)
library(janitor)
```

## Bloc A - Importer et inspecter

### Exercice 1 - Lire un CSV avec types contrôlés

Importez `policies.csv` en forçant `policy_id` en texte et `premium_amount` en nombre.

> **NOTE:**
>
> ``` r
> policies <- read_csv(
>   "policies.csv",
>   col_types = cols(
>     policy_id = col_character(),
>     premium_amount = col_double(),
>     .default = col_guess()
>   )
> )
>
> glimpse(policies)
> ```
>
>     Rows: 15
>     Columns: 9
>     $ policy_id      <chr> "P001", "P002", "P003", "P004", "P005", "P006", "P007",…
>     $ premium_amount <dbl> 750.50, 820.00, 640.25, 910.80, 500.75, 1020.00, 780.20…
>     $ vehicle_type   <chr> "car", "truck", "truck", "car", "car", "truck", "car", …
>     $ vehicle_use    <chr> "Pleasure", "pleasure", "Commute", "Com.mute", "Pleasur…
>     $ q1_claims      <dbl> 2, 0, 1, 3, 0, 2, 1, 0, 3, 1, 0, 1, 2, 0, 1
>     $ q2_claims      <dbl> 1, 1, 0, 2, 0, 1, 1, 0, 2, 1, 1, 0, 1, 0, 2
>     $ q3_claims      <dbl> 0, 2, 1, 1, 0, 0, 2, 1, 0, 1, 0, 1, 2, 1, 0
>     $ q4_claims      <dbl> 1, 0, 0, 2, 1, 1, 0, 1, 2, 0, 1, 0, 1, 1, 2
>     $ claim_amount   <dbl> 1200, 0, 300, 2500, 0, 1800, 450, 0, 2200, 700, 0, 900,…

### Exercice 2 - Vérifier les dimensions et les noms

Vérifiez le nombre de lignes, le nombre de colonnes et les noms de variables de `policies`.

> **NOTE:**
>
> ``` r
> tibble(
>   lignes = nrow(policies),
>   colonnes = ncol(policies)
> )
> ```
>
>     # A tibble: 1 × 2
>       lignes colonnes
>        <int>    <int>
>     1     15        9
>
> ``` r
> names(policies)
> ```
>
>     [1] "policy_id"      "premium_amount" "vehicle_type"   "vehicle_use"
>     [5] "q1_claims"      "q2_claims"      "q3_claims"      "q4_claims"
>     [9] "claim_amount"

### Exercice 3 - Nettoyer des noms de colonnes

Créez un petit tableau avec des noms de colonnes peu pratiques, puis nettoyez-les avec `clean_names()`.

> **NOTE:**
>
> ``` r
> tableau_brut <- tibble(
>   "Nom du programme" = c("Statistique", "Informatique"),
>   "Montant demandé ($)" = c(2500, 1800)
> )
>
> tableau_propre <- tableau_brut |>
>   clean_names()
>
> names(tableau_propre)
> ```
>
>     [1] "nom_du_programme" "montant_demande"

### Exercice 4 - Passer du format large au format long

Dans `policies`, les colonnes `q1_claims` à `q4_claims` représentent des réclamations trimestrielles. Transformez-les en deux colonnes: `trimestre` et `reclamations`.

> **NOTE:**
>
> ``` r
> policies_long <- policies |>
>   pivot_longer(
>     cols = q1_claims:q4_claims,
>     names_to = "trimestre",
>     values_to = "reclamations"
>   )
>
> policies_long |>
>   select(policy_id, trimestre, reclamations) |>
>   slice_head(n = 8)
> ```
>
>     # A tibble: 8 × 3
>       policy_id trimestre reclamations
>       <chr>     <chr>            <dbl>
>     1 P001      q1_claims            2
>     2 P001      q2_claims            1
>     3 P001      q3_claims            0
>     4 P001      q4_claims            1
>     5 P002      q1_claims            0
>     6 P002      q2_claims            1
>     7 P002      q3_claims            2
>     8 P002      q4_claims            0

## Bloc B - Nettoyer valeurs et catégories

### Exercice 5 - Revenir au format large

À partir de `policies_long`, revenez au format large.

> **NOTE:**
>
> ``` r
> policies_wide <- policies_long |>
>   pivot_wider(
>     names_from = trimestre,
>     values_from = reclamations
>   )
>
> glimpse(policies_wide)
> ```
>
>     Rows: 15
>     Columns: 9
>     $ policy_id      <chr> "P001", "P002", "P003", "P004", "P005", "P006", "P007",…
>     $ premium_amount <dbl> 750.50, 820.00, 640.25, 910.80, 500.75, 1020.00, 780.20…
>     $ vehicle_type   <chr> "car", "truck", "truck", "car", "car", "truck", "car", …
>     $ vehicle_use    <chr> "Pleasure", "pleasure", "Commute", "Com.mute", "Pleasur…
>     $ claim_amount   <dbl> 1200, 0, 300, 2500, 0, 1800, 450, 0, 2200, 700, 0, 900,…
>     $ q1_claims      <dbl> 2, 0, 1, 3, 0, 2, 1, 0, 3, 1, 0, 1, 2, 0, 1
>     $ q2_claims      <dbl> 1, 1, 0, 2, 0, 1, 1, 0, 2, 1, 1, 0, 1, 0, 2
>     $ q3_claims      <dbl> 0, 2, 1, 1, 0, 0, 2, 1, 0, 1, 0, 1, 2, 1, 0
>     $ q4_claims      <dbl> 1, 0, 0, 2, 1, 1, 0, 1, 2, 0, 1, 0, 1, 1, 2

### Exercice 6 - Recoder des catégories proches

La variable `vehicle_use` contient des variantes comme `"Pleasure"`, `"pleasure"` et `"Com.mute"`. Nettoyez-la pour obtenir seulement `"Pleasure"` et `"Commute"`.

> **NOTE:**
>
> ``` r
> policies_use_clean <- policies |>
>   mutate(
>     vehicle_use = str_squish(vehicle_use),
>     vehicle_use = fct_collapse(
>       as_factor(vehicle_use),
>       Pleasure = c("Pleasure", "pleasure"),
>       Commute = c("Commute", "Com.mute")
>     )
>   )
>
> policies_use_clean |>
>   count(vehicle_use)
> ```
>
>     # A tibble: 2 × 2
>       vehicle_use     n
>       <fct>       <int>
>     1 Pleasure        7
>     2 Commute         8

### Exercice 7 - Parser un montant avec une virgule décimale

Transformez les montants textuels suivants en nombres.

``` r
montants <- tibble(
  montant = c("1 234,56", "950,00", "-999", "2 500,25")
)
```

> **NOTE:**
>
> ``` r
> montants |>
>   mutate(
>     montant_num = parse_number(
>       montant,
>       locale = locale(decimal_mark = ",", grouping_mark = " ")
>     ),
>     montant_num = na_if(montant_num, -999)
>   )
> ```
>
>     # A tibble: 4 × 2
>       montant  montant_num
>       <chr>          <dbl>
>     1 1 234,56       1235.
>     2 950,00          950
>     3 -999             NA
>     4 2 500,25       2500.

### Exercice 8 - Détecter des codes FSA invalides

Un code FSA devrait contenir trois caractères. Dans le tableau suivant, repérez les lignes invalides.

``` r
codes_fsa <- tibble(
  id = c("A", "B", "C", "D"),
  fsa_code = c("G1V", "H2X", "G1V1234", NA)
)
```

> **NOTE:**
>
> ``` r
> codes_fsa |>
>   mutate(fsa_invalide = is.na(fsa_code) | nchar(fsa_code) != 3) |>
>   filter(fsa_invalide)
> ```
>
>     # A tibble: 2 × 3
>       id    fsa_code fsa_invalide
>       <chr> <chr>    <lgl>
>     1 C     G1V1234  TRUE
>     2 D     <NA>     TRUE

## Bloc C - Documenter un nettoyage

### Exercice 9 - Créer une structure de journal

Créez une liste `journal_nettoyage` avec les catégories `VM`, `VA`, `FT`, `RC` et `TY`.

> **NOTE:**
>
> ``` r
> journal_nettoyage <- list(
>   VM = list(),
>   VA = list(),
>   FT = list(),
>   RC = list(),
>   TY = list()
> )
>
> str(journal_nettoyage)
> ```
>
>     List of 5
>      $ VM: list()
>      $ VA: list()
>      $ FT: list()
>      $ RC: list()
>      $ TY: list()

### Exercice 10 - Ajouter une entrée de correction

Ajoutez une entrée indiquant que la valeur `-999` a été remplacée par `NA` dans une variable de montant.

> **NOTE:**
>
> ``` r
> journal_nettoyage$VM <- append(journal_nettoyage$VM, list(
>   list(
>     id = "exercice-7",
>     variables = "montant",
>     probleme = "Valeur manquante codée par -999",
>     action = "Remplacement par NA",
>     justification = "La valeur -999 ne représente pas un montant réel"
>   )
> ))
>
> journal_nettoyage$VM
> ```
>
>     [[1]]
>     [[1]]$id
>     [1] "exercice-7"
>
>     [[1]]$variables
>     [1] "montant"
>
>     [[1]]$probleme
>     [1] "Valeur manquante codée par -999"
>
>     [[1]]$action
>     [1] "Remplacement par NA"
>
>     [[1]]$justification
>     [1] "La valeur -999 ne représente pas un montant réel"

### Exercice 11 - Signaler sans corriger

Ajoutez une entrée indiquant qu’un code FSA invalide a été signalé, mais non corrigé automatiquement.

> **NOTE:**
>
> ``` r
> journal_nettoyage$FT <- append(journal_nettoyage$FT, list(
>   list(
>     id = "C",
>     variables = "fsa_code",
>     probleme = "Code FSA de longueur invalide",
>     action = "Signalement sans correction automatique",
>     justification = "Le bon code ne peut pas être déduit de manière défendable"
>   )
> ))
>
> journal_nettoyage$FT
> ```
>
>     [[1]]
>     [[1]]$id
>     [1] "C"
>
>     [[1]]$variables
>     [1] "fsa_code"
>
>     [[1]]$probleme
>     [1] "Code FSA de longueur invalide"
>
>     [[1]]$action
>     [1] "Signalement sans correction automatique"
>
>     [[1]]$justification
>     [1] "Le bon code ne peut pas être déduit de manière défendable"

### Exercice 12 - Sauvegarder un journal dans un fichier temporaire

Sauvegardez `journal_nettoyage` dans un fichier temporaire, puis vérifiez que le fichier existe.

> **NOTE:**
>
> ``` r
> chemin_temp <- tempfile(fileext = ".Rdata")
> save(journal_nettoyage, file = chemin_temp)
> file.exists(chemin_temp)
> ```
>
>     [1] TRUE

## Bloc D - Excel, JSON et règles de validation

### Exercice 13 - Lire une feuille Excel précise

Le fichier `resources/quotes_2024.xlsx` contient une feuille `Q3`. Importez-la en sautant la première ligne.

> **NOTE:**
>
> ``` r
> quotes_q3 <- read_excel(
>   "resources/quotes_2024.xlsx",
>   sheet = "Q3",
>   skip = 1
> )
>
> glimpse(quotes_q3)
> ```
>
>     Rows: 4
>     Columns: 3
>     $ policy_id    <chr> "P005", "P008", "P012", "P015"
>     $ quote_date   <chr> "2024-04-15", "2024-05-03", "2024-06-20", "2024-07-01"
>     $ quote_amount <dbl> 525.40, 610.00, 845.75, 720.30

### Exercice 14 - Lire un JSON simple

Lisez `coverage.json`, puis récupérez la limite de couverture collision.

> **NOTE:**
>
> ``` r
> coverage <- read_json("coverage.json")
>
> coverage$coverage$collision$limit
> ```
>
>     [1] 10000

### Exercice 15 - Rectangulariser un JSON

Transformez la section `coverage` du JSON en tableau.

> **NOTE:**
>
> ``` r
> coverage_tbl <- tibble(
>   couverture = names(coverage$coverage),
>   details = coverage$coverage
> ) |>
>   unnest_wider(details)
>
> coverage_tbl
> ```
>
>     # A tibble: 2 × 3
>       couverture  limit deductible
>       <chr>       <int>      <int>
>     1 collision   10000        500
>     2 liability  100000         NA

### Exercice 16 - Utiliser une règle de validation

Le fichier `data/regles_equipements_fictif.json` indique les années d’installation plausibles. Lisez ce fichier et affichez les bornes acceptées.

> **NOTE:**
>
> ``` r
> regles <- fromJSON("data/regles_equipements_fictif.json")
>
> tibble(
>   annee_min = regles$annee_installation$min,
>   annee_max = regles$annee_installation$max
> )
> ```
>
>     # A tibble: 1 × 2
>       annee_min annee_max
>           <int>     <int>
>     1      1990      2026

## Études de cas

### Étude de cas 1 - Demandes de bourses fictives

Le fichier `data/demandes_bourses_fictif.csv` contient de fausses demandes de bourses étudiantes. Il ne représente aucun système réel.

Réalisez les tâches suivantes:

1.  importez le fichier;
2.  nettoyez les noms de colonnes;
3.  transformez `montant_demande` en nombre;
4.  remplacez `revenu_annuel = -999` par `NA`;
5.  harmonisez les noms de programme;
6.  repérez les codes FSA invalides;
7.  créez au moins deux entrées dans un journal de nettoyage.

> **NOTE:**
>
> ``` r
> bourses <- read_csv(
>   "data/demandes_bourses_fictif.csv",
>   show_col_types = FALSE
> ) |>
>   clean_names() |>
>   mutate(
>     montant_demande_num = parse_number(
>       montant_demande,
>       locale = locale(decimal_mark = ",", grouping_mark = " ")
>     ),
>     revenu_annuel = na_if(revenu_annuel, -999),
>     programme_propre = str_to_lower(str_squish(programme)),
>     programme_propre = case_when(
>       str_detect(programme_propre, "donnees|données|sc\\.") ~ "science des donnees",
>       str_detect(programme_propre, "math") ~ "mathematiques",
>       TRUE ~ programme_propre
>     ),
>     statut_propre = str_to_lower(str_squish(statut)),
>     fsa_invalide = is.na(fsa_code) | nchar(fsa_code) != 3
>   )
>
> bourses |>
>   count(programme_propre, statut_propre)
> ```
>
>     # A tibble: 10 × 3
>        programme_propre    statut_propre     n
>        <chr>               <chr>         <int>
>      1 informatique        complete          2
>      2 informatique        incomplete        1
>      3 mathematiques       complete          3
>      4 mathematiques       incomplete        1
>      5 science des donnees complete          3
>      6 science des donnees en attente        1
>      7 science des donnees incomplete        1
>      8 statistique         complete          2
>      9 statistique         en attente        1
>     10 statistique         refusee           1
>
> ``` r
> bourses |>
>   filter(fsa_invalide) |>
>   select(dossier_id, fsa_code)
> ```
>
>     # A tibble: 1 × 2
>       dossier_id fsa_code
>       <chr>      <chr>
>     1 B-010      G1V1234
>
> ``` r
> journal_bourses <- list(VM = list(), FT = list(), RC = list(), VA = list())
>
> journal_bourses$VM <- append(journal_bourses$VM, list(
>   list(
>     id = "B-004",
>     variables = "revenu_annuel",
>     probleme = "Valeur manquante codée par -999",
>     action = "Remplacement par NA",
>     justification = "La valeur -999 ne représente pas un revenu annuel"
>   )
> ))
>
> journal_bourses$FT <- append(journal_bourses$FT, list(
>   list(
>     id = "B-010",
>     variables = "fsa_code",
>     probleme = "Code FSA de longueur invalide",
>     action = "Signalement sans correction automatique",
>     justification = "Le bon code ne peut pas être déduit du fichier"
>   )
> ))
>
> journal_bourses
> ```
>
>     $VM
>     $VM[[1]]
>     $VM[[1]]$id
>     [1] "B-004"
>
>     $VM[[1]]$variables
>     [1] "revenu_annuel"
>
>     $VM[[1]]$probleme
>     [1] "Valeur manquante codée par -999"
>
>     $VM[[1]]$action
>     [1] "Remplacement par NA"
>
>     $VM[[1]]$justification
>     [1] "La valeur -999 ne représente pas un revenu annuel"
>
>
>
>     $FT
>     $FT[[1]]
>     $FT[[1]]$id
>     [1] "B-010"
>
>     $FT[[1]]$variables
>     [1] "fsa_code"
>
>     $FT[[1]]$probleme
>     [1] "Code FSA de longueur invalide"
>
>     $FT[[1]]$action
>     [1] "Signalement sans correction automatique"
>
>     $FT[[1]]$justification
>     [1] "Le bon code ne peut pas être déduit du fichier"
>
>
>
>     $RC
>     list()
>
>     $VA
>     list()

### Étude de cas 2 - Équipements municipaux fictifs

Le fichier `data/equipements_municipaux_fictif.csv` contient de faux enregistrements d’équipements municipaux. Le fichier `data/regles_equipements_fictif.json` contient quelques règles de validation.

Réalisez les tâches suivantes:

1.  importez le CSV et le JSON;
2.  nettoyez `type_equipement` et `statut`;
3.  transformez `cout_entretien` en nombre;
4.  utilisez le JSON pour repérer les années impossibles;
5.  repérez les statuts non attendus, s’il y en a;
6.  créez un tableau de synthèse par ville;
7.  documentez au moins deux décisions.

> **NOTE:**
>
> ``` r
> regles <- fromJSON("data/regles_equipements_fictif.json")
>
> equipements <- read_csv(
>   "data/equipements_municipaux_fictif.csv",
>   show_col_types = FALSE
> ) |>
>   clean_names() |>
>   mutate(
>     type_equipement = str_to_lower(str_squish(type_equipement)),
>     type_equipement = case_when(
>       str_detect(type_equipement, "abri") ~ "abri bus",
>       str_detect(type_equipement, "module") ~ "module de jeux",
>       TRUE ~ type_equipement
>     ),
>     statut = str_to_lower(str_squish(statut)),
>     cout_entretien_num = parse_number(
>       cout_entretien,
>       locale = locale(decimal_mark = ",", grouping_mark = " ")
>     ),
>     cout_entretien_num = na_if(
>       cout_entretien_num,
>       regles$cout_entretien$valeur_manquante_codee
>     ),
>     annee_invalide = annee_installation < regles$annee_installation$min |
>       annee_installation > regles$annee_installation$max,
>     statut_invalide = !statut %in% regles$statuts_acceptes,
>     mois_invalide = !mois_inspection %in% regles$mois_inspection_attendus
>   )
>
> equipements |>
>   filter(annee_invalide | statut_invalide | mois_invalide) |>
>   select(equipement_id, annee_installation, statut, mois_inspection)
> ```
>
>     # A tibble: 2 × 4
>       equipement_id annee_installation statut mois_inspection
>       <chr>                      <dbl> <chr>  <chr>
>     1 EQ-004                      1890 actif  avril
>     2 EQ-006                      2028 actif  juin
>
> ``` r
> synthese_ville <- equipements |>
>   group_by(ville) |>
>   summarise(
>     n_equipements = n(),
>     cout_median = median(cout_entretien_num, na.rm = TRUE),
>     n_annees_invalides = sum(annee_invalide),
>     .groups = "drop"
>   )
>
> synthese_ville
> ```
>
>     # A tibble: 5 × 4
>       ville          n_equipements cout_median n_annees_invalides
>       <chr>                  <int>       <dbl>              <int>
>     1 Gatineau                   3       1280                   0
>     2 Levis                      3       1100                   0
>     3 Quebec                     5       1250                   1
>     4 Sherbrooke                 3       1500                   1
>     5 Trois-Rivieres             2        598.                  0
>
> ``` r
> journal_equipements <- list(VM = list(), VA = list(), RC = list())
>
> journal_equipements$VA <- append(journal_equipements$VA, list(
>   list(
>     id = equipements$equipement_id[equipements$annee_invalide],
>     variables = "annee_installation",
>     probleme = "Année d'installation hors des bornes définies dans le JSON",
>     action = "Signalement sans correction automatique",
>     justification = "La bonne année ne peut pas être déduite du fichier"
>   )
> ))
>
> journal_equipements$VM <- append(journal_equipements$VM, list(
>   list(
>     id = "EQ-010",
>     variables = "cout_entretien",
>     probleme = "Valeur manquante codée par -999",
>     action = "Remplacement par NA",
>     justification = "La règle JSON indique que -999 code une valeur manquante"
>   )
> ))
>
> journal_equipements
> ```
>
>     $VM
>     $VM[[1]]
>     $VM[[1]]$id
>     [1] "EQ-010"
>
>     $VM[[1]]$variables
>     [1] "cout_entretien"
>
>     $VM[[1]]$probleme
>     [1] "Valeur manquante codée par -999"
>
>     $VM[[1]]$action
>     [1] "Remplacement par NA"
>
>     $VM[[1]]$justification
>     [1] "La règle JSON indique que -999 code une valeur manquante"
>
>
>
>     $VA
>     $VA[[1]]
>     $VA[[1]]$id
>     [1] "EQ-004" "EQ-006"
>
>     $VA[[1]]$variables
>     [1] "annee_installation"
>
>     $VA[[1]]$probleme
>     [1] "Année d'installation hors des bornes définies dans le JSON"
>
>     $VA[[1]]$action
>     [1] "Signalement sans correction automatique"
>
>     $VA[[1]]$justification
>     [1] "La bonne année ne peut pas être déduite du fichier"
>
>
>
>     $RC
>     list()
