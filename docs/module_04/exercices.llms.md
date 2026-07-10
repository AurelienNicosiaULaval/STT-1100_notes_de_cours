# Exercices de consolidation

Ces exercices sont indépendants de l’aventure et du défi. Ils servent à consolider les gestes techniques du module 4: importer des fichiers, vérifier les types, nettoyer des valeurs, manipuler des facteurs, lire un JSON et documenter des décisions de nettoyage.

> **NOTE:**
>
> Les études de cas utilisent un tableau agrégé de l’[aide financière de dernier recours](https://www.donneesquebec.ca/recherche/dataset/aide-financiere-de-dernier-recours-afdr-clientele-et-prestations) publié par le ministère de l’Emploi et de la Solidarité sociale, ainsi que l’inventaire des [installations sportives et récréatives de Sherbrooke](https://www.donneesquebec.ca/recherche/dataset/b6498f3436974ecbb8fa636a7d9c0b2f_0). Les deux sources sont diffusées sous licence CC BY 4.0. Les fichiers locaux sont des instantanés reproductibles préparés par `scripts/build_module04_real_data.R`.

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

### Exercice 16 - Lire les métadonnées d’une source officielle

Le fichier `data/metadonnees_installations_sherbrooke.json` provient du service REST de la Ville de Sherbrooke. Lisez-le, puis affichez le nom des champs et le système de coordonnées de l’étendue.

> **NOTE:**
>
> ``` r
> metadonnees <- fromJSON(
>   "data/metadonnees_installations_sherbrooke.json"
> )
>
> metadonnees$fields |>
>   select(name, type, alias)
> ```
>
>            name                type     alias
>     1      TYPE esriFieldTypeString      TYPE
>     2    DETAIL esriFieldTypeString    DETAIL
>     3       NOM esriFieldTypeString       NOM
>     4   SURFACE esriFieldTypeString   SURFACE
>     5 ECLAIRAGE esriFieldTypeString ECLAIRAGE
>     6  OBJECTID    esriFieldTypeOID  OBJECTID
>
> ``` r
> metadonnees$extent$spatialReference$latestWkid
> ```
>
>     [1] 3857

## Études de cas

### Étude de cas 1 - Aide financière de dernier recours au Québec

Le fichier `data/afdr_clientele_prestations_2022_12.csv` contient 43 lignes agrégées publiées par le ministère de l’Emploi et de la Solidarité sociale pour décembre 2022. Chaque ligne décrit une caractéristique de la clientèle ou une région. Il ne contient aucun dossier individuel.

Réalisez les tâches suivantes:

1.  importez toutes les colonnes comme du texte;
2.  nettoyez les noms de colonnes;
3.  transformez les colonnes numériques dans le bon type;
4.  convertissez `caracteristique` en facteur;
5.  vérifiez que les nombres sont non négatifs;
6.  vérifiez que `nb_prestataires` est égal à la somme des adultes et des enfants;
7.  produisez un tableau des régions classées selon la prestation totale versée;
8.  documentez au moins deux décisions dans un journal de nettoyage.

> **NOTE:**
>
> ``` r
> afdr_brut <- read_csv(
>   "data/afdr_clientele_prestations_2022_12.csv",
>   col_types = cols(.default = col_character())
> ) |>
>   clean_names()
>
> afdr <- afdr_brut |>
>   mutate(
>     across(nb_menages:prest_base_heberges, parse_double),
>     caracteristique = as_factor(caracteristique),
>     valeur = str_squish(valeur),
>     valeur_negative = if_any(
>       nb_menages:prest_base_heberges,
>       ~ .x < 0
>     ),
>     total_incoherent = nb_prestataires != nb_adultes + nb_enfants
>   )
>
> afdr |>
>   count(caracteristique)
> ```
>
>     # A tibble: 5 × 2
>       caracteristique            n
>       <fct>                  <int>
>     1 Programme                  2
>     2 Situation familiale        5
>     3 Type de résidence          6
>     4 Région                    20
>     5 Clientèle supplémentée    10
>
> ``` r
> afdr |>
>   summarise(
>     n_valeurs_negatives = sum(valeur_negative),
>     n_totaux_incoherents = sum(total_incoherent)
>   )
> ```
>
>     # A tibble: 1 × 2
>       n_valeurs_negatives n_totaux_incoherents
>                     <int>                <int>
>     1                   0                    0
>
> ``` r
> regions_afdr <- afdr |>
>   filter(caracteristique == "Région") |>
>   select(valeur, nb_prestataires, prestation_totale_versee) |>
>   arrange(desc(prestation_totale_versee))
>
> regions_afdr
> ```
>
>     # A tibble: 20 × 3
>        valeur                                nb_prestataires prestation_totale_ver…¹
>        <chr>                                           <dbl>                   <dbl>
>      1 06 - Montréal                                  121238               82106940.
>      2 16 - Montérégie                                 36472               29344504.
>      3 03 - Capitale-Nationale                         17608               15091893.
>      4 05 - Estrie                                     18121               14684517.
>      5 15 - Laurentides                                16769               13716058.
>      6 14 - Lanaudière                                 14136               11171460.
>      7 07 - Outaouais                                  14994               11056460.
>      8 04 - Mauricie                                   12918               10415208.
>      9 13 - Laval                                      10472                8299737.
>     10 12 - Chaudière-Appalaches                        9157                7871306.
>     11 02 - Saguenay-Lac-Saint-Jean                     8780                7607960.
>     12 17 - Centre-du-Québec                            9077                7235431.
>     13 Directions centrales                             6677                6787207.
>     14 01 - Bas-Saint-Laurent                           6457                5752814.
>     15 08 - Abitibi-Témiscamingue                       4253                3507588.
>     16 11 - Gaspésie-Îles-de-la-Madeleine               3619                3232252.
>     17 98 - Direction provinciale à distance            3941                2231494.
>     18 09 - Côte-Nord                                   2229                1849352.
>     19 10 - Nord-du-Québec                              1305                 847872.
>     20 10 - Nord-du-Québec                                 1                    626
>     # ℹ abbreviated name: ¹​prestation_totale_versee
>
> ``` r
> journal_afdr <- list(TY = list(), RC = list(), VA = list())
>
> journal_afdr$TY <- append(journal_afdr$TY, list(
>   list(
>     id = "fichier-afdr-2022-12",
>     variables = "nb_menages:prest_base_heberges",
>     probleme = "Colonnes importées volontairement comme texte",
>     action = "Conversion contrôlée avec parse_double()",
>     justification = "Les calculs exigent des colonnes numériques"
>   )
> ))
>
> journal_afdr$VA <- append(journal_afdr$VA, list(
>   list(
>     id = "fichier-afdr-2022-12",
>     variables = "nb_prestataires",
>     probleme = "Cohérence du total à vérifier",
>     action = "Comparaison avec nb_adultes + nb_enfants",
>     justification = "La relation peut être testée sans modifier la source"
>   )
> ))
>
> journal_afdr
> ```
>
>     $TY
>     $TY[[1]]
>     $TY[[1]]$id
>     [1] "fichier-afdr-2022-12"
>
>     $TY[[1]]$variables
>     [1] "nb_menages:prest_base_heberges"
>
>     $TY[[1]]$probleme
>     [1] "Colonnes importées volontairement comme texte"
>
>     $TY[[1]]$action
>     [1] "Conversion contrôlée avec parse_double()"
>
>     $TY[[1]]$justification
>     [1] "Les calculs exigent des colonnes numériques"
>
>
>
>     $RC
>     list()
>
>     $VA
>     $VA[[1]]
>     $VA[[1]]$id
>     [1] "fichier-afdr-2022-12"
>
>     $VA[[1]]$variables
>     [1] "nb_prestataires"
>
>     $VA[[1]]$probleme
>     [1] "Cohérence du total à vérifier"
>
>     $VA[[1]]$action
>     [1] "Comparaison avec nb_adultes + nb_enfants"
>
>     $VA[[1]]$justification
>     [1] "La relation peut être testée sans modifier la source"

### Étude de cas 2 - Installations sportives et récréatives de Sherbrooke

Le fichier `data/installations_sportives_sherbrooke.csv` contient l’inventaire municipal diffusé par la Ville de Sherbrooke. Le fichier `data/metadonnees_installations_sherbrooke.json` est la description officielle du service ArcGIS correspondant. Une valeur manquante dans `nom`, `detail` ou `surface` n’est pas automatiquement une erreur.

Réalisez les tâches suivantes:

1.  importez le CSV et le JSON;
2.  nettoyez les noms de colonnes et les espaces superflus;
3.  convertissez `eclairage` en facteur;
4.  vérifiez que les champs officiels du JSON sont présents dans le CSV;
5.  utilisez l’étendue du JSON pour repérer les coordonnées hors limites;
6.  créez un tableau de synthèse par type d’installation;
7.  signalez les noms manquants sans les inventer;
8.  documentez au moins deux décisions.

> **NOTE:**
>
> ``` r
> metadonnees <- fromJSON(
>   "data/metadonnees_installations_sherbrooke.json"
> )
>
> installations_brutes <- read_csv(
>   "data/installations_sportives_sherbrooke.csv",
>   show_col_types = FALSE
> )
>
> champs_attendus <- str_to_lower(metadonnees$fields$name)
> champs_manquants <- setdiff(
>   champs_attendus,
>   names(clean_names(installations_brutes))
> )
>
> installations <- installations_brutes |>
>   clean_names() |>
>   mutate(
>     across(c(type, detail, nom, surface, eclairage), str_squish),
>     eclairage = factor(eclairage, levels = c("Non", "Oui")),
>     nom_manquant = is.na(nom),
>     hors_etendue = x < metadonnees$extent$xmin |
>       x > metadonnees$extent$xmax |
>       y < metadonnees$extent$ymin |
>       y > metadonnees$extent$ymax
>   )
>
> champs_manquants
> ```
>
>     character(0)
>
> ``` r
> installations |>
>   summarise(
>     n_hors_etendue = sum(hors_etendue, na.rm = TRUE),
>     n_noms_manquants = sum(nom_manquant)
>   )
> ```
>
>     # A tibble: 1 × 2
>       n_hors_etendue n_noms_manquants
>                <int>            <int>
>     1              0              720
>
> ``` r
> synthese_type <- installations |>
>   group_by(type) |>
>   summarise(
>     n_installations = n(),
>     n_noms_manquants = sum(nom_manquant),
>     part_eclairee = mean(eclairage == "Oui", na.rm = TRUE),
>     .groups = "drop"
>   ) |>
>   arrange(desc(n_installations))
>
> synthese_type
> ```
>
>     # A tibble: 24 × 4
>        type                           n_installations n_noms_manquants part_eclairee
>        <chr>                                    <int>            <int>         <dbl>
>      1 Jeu modulaire                              238              238       NaN
>      2 Soccer                                     106                0         0.439
>      3 Surface, anneau ou étang glacé              70               70       NaN
>      4 Basketball                                  54               54         0.696
>      5 Tennis                                      52               52         1
>      6 Patinoire à bandes mobiles                  48               48       NaN
>      7 Baseball                                    36               36         0.556
>      8 Pétanque                                    32               32       NaN
>      9 Jeu de galets                               30               30       NaN
>     10 Volleyball                                  26               26         0.333
>     # ℹ 14 more rows
>
> ``` r
> journal_installations <- list(VM = list(), FT = list(), RC = list())
>
> journal_installations$FT <- append(journal_installations$FT, list(
>   list(
>     id = installations$objectid[installations$nom_manquant],
>     variables = "nom",
>     probleme = "Nom absent dans la source",
>     action = "Signalement sans correction automatique",
>     justification = "Un nom ne peut pas être déduit des autres champs"
>   )
> ))
>
> journal_installations$RC <- append(journal_installations$RC, list(
>   list(
>     id = "fichier-installations-sherbrooke",
>     variables = "eclairage",
>     probleme = "Variable catégorielle importée comme texte",
>     action = "Conversion en facteur Non/Oui",
>     justification = "Les modalités observées sont explicites et conservées"
>   )
> ))
>
> journal_installations
> ```
>
>     $VM
>     list()
>
>     $FT
>     $FT[[1]]
>     $FT[[1]]$id
>       [1]   1   2   5   7   8  13  14  15  16  17  18  19  20  23  24  26  27  28
>      [19]  29  30  31  33  34  35  39  42  43  44  45  46  47  48  49  50  51  52
>      [37]  53  54  55  56  57  58  59  60  61  62  63  64  65  66  67  68  69  70
>      [55]  71  72  73  74  75  76  77  79  80  82  83  84  86  87  89  90  92  97
>      [73]  98  99 126 128 129 131 132 133 134 135 136 137 138 139 140 141 142 143
>      [91] 144 145 146 147 148 149 150 151 152 153 154 155 156 157 158 159 160 161
>     [109] 162 163 164 165 166 167 168 169 170 171 172 173 174 175 176 177 178 179
>     [127] 180 181 182 183 184 185 186 187 188 189 190 191 192 193 194 195 196 197
>     [145] 198 199 200 201 202 203 204 205 206 207 208 209 210 211 212 213 214 215
>     [163] 216 217 218 219 220 221 222 223 224 225 226 227 228 229 230 231 232 233
>     [181] 234 235 236 237 238 239 240 241 242 243 244 245 246 247 248 249 250 251
>     [199] 252 253 254 255 256 257 258 259 260 261 262 263 264 265 266 267 268 269
>     [217] 270 271 272 273 274 275 276 277 278 279 280 281 282 283 284 285 286 287
>     [235] 288 289 290 291 292 293 294 295 296 297 298 299 300 301 302 303 304 305
>     [253] 306 307 308 309 310 311 312 313 314 315 316 317 318 319 320 321 322 323
>     [271] 324 325 326 327 328 329 330 331 332 333 334 335 336 337 338 339 340 341
>     [289] 342 343 344 345 346 347 348 349 350 351 352 353 354 355 356 357 358 359
>     [307] 360 361 362 363 364 365 366 367 368 369 370 371 372 373 374 375 376 377
>     [325] 378 379 380 381 382 383 384 385 386 387 388 389 390 391 392 393 394 395
>     [343] 396 397 398 399 400 401 402 403 404 405 406 407 408 409 410 411 412 413
>     [361] 426 427 430 432 433 438 439 440 441 442 443 444 445 448 449 451 452 453
>     [379] 454 455 456 458 459 460 464 467 468 469 470 471 472 473 474 475 476 477
>     [397] 478 479 480 481 482 483 484 485 486 487 488 489 490 491 492 493 494 495
>     [415] 496 497 498 499 500 501 502 504 505 507 508 509 511 512 514 515 517 522
>     [433] 523 524 551 553 554 556 557 558 559 560 561 562 563 564 565 566 567 568
>     [451] 569 570 571 572 573 574 575 576 577 578 579 580 581 582 583 584 585 586
>     [469] 587 588 589 590 591 592 593 594 595 596 597 598 599 600 601 602 603 604
>     [487] 605 606 607 608 609 610 611 612 613 614 615 616 617 618 619 620 621 622
>     [505] 623 624 625 626 627 628 629 630 631 632 633 634 635 636 637 638 639 640
>     [523] 641 642 643 644 645 646 647 648 649 650 651 652 653 654 655 656 657 658
>     [541] 659 660 661 662 663 664 665 666 667 668 669 670 671 672 673 674 675 676
>     [559] 677 678 679 680 681 682 683 684 685 686 687 688 689 690 691 692 693 694
>     [577] 695 696 697 698 699 700 701 702 703 704 705 706 707 708 709 710 711 712
>     [595] 713 714 715 716 717 718 719 720 721 722 723 724 725 726 727 728 729 730
>     [613] 731 732 733 734 735 736 737 738 739 740 741 742 743 744 745 746 747 748
>     [631] 749 750 751 752 753 754 755 756 757 758 759 760 761 762 763 764 765 766
>     [649] 767 768 769 770 771 772 773 774 775 776 777 778 779 780 781 782 783 784
>     [667] 785 786 787 788 789 790 791 792 793 794 795 796 797 798 799 800 801 802
>     [685] 803 804 805 806 807 808 809 810 811 812 813 814 815 816 817 818 819 820
>     [703] 821 822 823 824 825 826 827 828 829 830 831 832 833 834 835 836 837 838
>
>     $FT[[1]]$variables
>     [1] "nom"
>
>     $FT[[1]]$probleme
>     [1] "Nom absent dans la source"
>
>     $FT[[1]]$action
>     [1] "Signalement sans correction automatique"
>
>     $FT[[1]]$justification
>     [1] "Un nom ne peut pas être déduit des autres champs"
>
>
>
>     $RC
>     $RC[[1]]
>     $RC[[1]]$id
>     [1] "fichier-installations-sherbrooke"
>
>     $RC[[1]]$variables
>     [1] "eclairage"
>
>     $RC[[1]]$probleme
>     [1] "Variable catégorielle importée comme texte"
>
>     $RC[[1]]$action
>     [1] "Conversion en facteur Non/Oui"
>
>     $RC[[1]]$justification
>     [1] "Les modalités observées sont explicites et conservées"
