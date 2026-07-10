# Consolidation exercises

These exercises are independent from the adventure and challenge. They consolidate the technical moves of module 4: importing files, checking types, cleaning values, manipulating factors, reading JSON and documenting cleaning decisions.

> **NOTE:**
>
> The case studies use an aggregated table on [last-resort financial assistance](https://www.donneesquebec.ca/recherche/dataset/aide-financiere-de-dernier-recours-afdr-clientele-et-prestations) published by Québec’s Ministère de l’Emploi et de la Solidarité sociale and the [Sherbrooke sports and recreation facilities](https://www.donneesquebec.ca/recherche/dataset/b6498f3436974ecbb8fa636a7d9c0b2f_0) inventory. Both sources are released under the CC BY 4.0 licence. The local files are reproducible snapshots prepared by `scripts/build_module04_real_data.R`.

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

## Block A - Import and inspect

### Exercise 1 - Read a CSV with controlled types

Import `policies.csv`, forcing `policy_id` to text and `premium_amount` to numeric.

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

### Exercise 2 - Check dimensions and names

Check the number of rows, number of columns and variable names in `policies`.

> **NOTE:**
>
> ``` r
> tibble(
>   rows = nrow(policies),
>   columns = ncol(policies)
> )
> ```
>
>     # A tibble: 1 × 2
>        rows columns
>       <int>   <int>
>     1    15       9
>
> ``` r
> names(policies)
> ```
>
>     [1] "policy_id"      "premium_amount" "vehicle_type"   "vehicle_use"
>     [5] "q1_claims"      "q2_claims"      "q3_claims"      "q4_claims"
>     [9] "claim_amount"

### Exercise 3 - Clean column names

Create a small table with inconvenient column names, then clean them with `clean_names()`.

> **NOTE:**
>
> ``` r
> raw_table <- tibble(
>   "Program Name" = c("Statistics", "Computer Science"),
>   "Requested Amount ($)" = c(2500, 1800)
> )
>
> clean_table <- raw_table |>
>   clean_names()
>
> names(clean_table)
> ```
>
>     [1] "program_name"     "requested_amount"

### Exercise 4 - Move from wide to long format

In `policies`, columns `q1_claims` to `q4_claims` represent quarterly claims. Transform them into two columns: `quarter` and `claims`.

> **NOTE:**
>
> ``` r
> policies_long <- policies |>
>   pivot_longer(
>     cols = q1_claims:q4_claims,
>     names_to = "quarter",
>     values_to = "claims"
>   )
>
> policies_long |>
>   select(policy_id, quarter, claims) |>
>   slice_head(n = 8)
> ```
>
>     # A tibble: 8 × 3
>       policy_id quarter   claims
>       <chr>     <chr>      <dbl>
>     1 P001      q1_claims      2
>     2 P001      q2_claims      1
>     3 P001      q3_claims      0
>     4 P001      q4_claims      1
>     5 P002      q1_claims      0
>     6 P002      q2_claims      1
>     7 P002      q3_claims      2
>     8 P002      q4_claims      0

## Block B - Clean values and categories

### Exercise 5 - Return to wide format

Starting from `policies_long`, return to wide format.

> **NOTE:**
>
> ``` r
> policies_wide <- policies_long |>
>   pivot_wider(
>     names_from = quarter,
>     values_from = claims
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

### Exercise 6 - Recode similar categories

The `vehicle_use` variable contains variants such as `"Pleasure"`, `"pleasure"` and `"Com.mute"`. Clean it to keep only `"Pleasure"` and `"Commute"`.

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

### Exercise 7 - Parse an amount

Transform the following text amounts into numbers.

``` r
amounts <- tibble(
  amount = c("1 234.56", "950.00", "-999", "2 500.25")
)
```

> **NOTE:**
>
> ``` r
> amounts |>
>   mutate(
>     amount_num = parse_number(
>       amount,
>       locale = locale(decimal_mark = ".", grouping_mark = " ")
>     ),
>     amount_num = na_if(amount_num, -999)
>   )
> ```
>
>     # A tibble: 4 × 2
>       amount   amount_num
>       <chr>         <dbl>
>     1 1 234.56      1235.
>     2 950.00         950
>     3 -999            NA
>     4 2 500.25      2500.

### Exercise 8 - Detect invalid FSA codes

An FSA code should contain three characters. In the following table, identify invalid rows.

``` r
fsa_codes <- tibble(
  id = c("A", "B", "C", "D"),
  fsa_code = c("G1V", "H2X", "G1V1234", NA)
)
```

> **NOTE:**
>
> ``` r
> fsa_codes |>
>   mutate(fsa_invalid = is.na(fsa_code) | nchar(fsa_code) != 3) |>
>   filter(fsa_invalid)
> ```
>
>     # A tibble: 2 × 3
>       id    fsa_code fsa_invalid
>       <chr> <chr>    <lgl>
>     1 C     G1V1234  TRUE
>     2 D     <NA>     TRUE

## Block C - Document cleaning

### Exercise 9 - Create a log structure

Create a list `cleaning_log` with categories `VM`, `VA`, `FT`, `RC` and `TY`.

> **NOTE:**
>
> ``` r
> cleaning_log <- list(
>   VM = list(),
>   VA = list(),
>   FT = list(),
>   RC = list(),
>   TY = list()
> )
>
> str(cleaning_log)
> ```
>
>     List of 5
>      $ VM: list()
>      $ VA: list()
>      $ FT: list()
>      $ RC: list()
>      $ TY: list()

### Exercise 10 - Add a correction entry

Add an entry indicating that `-999` was replaced by `NA` in an amount variable.

> **NOTE:**
>
> ``` r
> cleaning_log$VM <- append(cleaning_log$VM, list(
>   list(
>     id = "exercise-7",
>     variables = "amount",
>     probleme = "Missing value coded as -999",
>     action = "Replace with NA",
>     justification = "The value -999 is not a real amount"
>   )
> ))
>
> cleaning_log$VM
> ```
>
>     [[1]]
>     [[1]]$id
>     [1] "exercise-7"
>
>     [[1]]$variables
>     [1] "amount"
>
>     [[1]]$probleme
>     [1] "Missing value coded as -999"
>
>     [[1]]$action
>     [1] "Replace with NA"
>
>     [[1]]$justification
>     [1] "The value -999 is not a real amount"

### Exercise 11 - Flag without correcting

Add an entry indicating that an invalid FSA code was flagged, but not corrected automatically.

> **NOTE:**
>
> ``` r
> cleaning_log$FT <- append(cleaning_log$FT, list(
>   list(
>     id = "C",
>     variables = "fsa_code",
>     probleme = "Invalid FSA code length",
>     action = "Flag without automatic correction",
>     justification = "The correct code cannot be inferred defensibly"
>   )
> ))
>
> cleaning_log$FT
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
>     [1] "Invalid FSA code length"
>
>     [[1]]$action
>     [1] "Flag without automatic correction"
>
>     [[1]]$justification
>     [1] "The correct code cannot be inferred defensibly"

### Exercise 12 - Save a log to a temporary file

Save `cleaning_log` to a temporary file, then check that the file exists.

> **NOTE:**
>
> ``` r
> temp_path <- tempfile(fileext = ".Rdata")
> save(cleaning_log, file = temp_path)
> file.exists(temp_path)
> ```
>
>     [1] TRUE

## Block D - Excel, JSON and validation rules

### Exercise 13 - Read a specific Excel sheet

The file `resources/quotes_2024.xlsx` contains a sheet named `Q3`. Import it while skipping the first row.

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

### Exercise 14 - Read a simple JSON file

Read `coverage.json`, then retrieve the collision coverage limit.

> **NOTE:**
>
> ``` r
> coverage <- read_json("coverage.json")
>
> coverage$coverage$collision$limit
> ```
>
>     [1] 10000

### Exercise 15 - Rectangle a JSON object

Transform the `coverage` section of the JSON file into a table.

> **NOTE:**
>
> ``` r
> coverage_tbl <- tibble(
>   coverage_type = names(coverage$coverage),
>   details = coverage$coverage
> ) |>
>   unnest_wider(details)
>
> coverage_tbl
> ```
>
>     # A tibble: 2 × 3
>       coverage_type  limit deductible
>       <chr>          <int>      <int>
>     1 collision      10000        500
>     2 liability     100000         NA

### Exercise 16 - Read official source metadata

The file `data/metadonnees_installations_sherbrooke.json` comes from the City of Sherbrooke REST service. Read it, then display the field names and the coordinate system used for the extent.

> **NOTE:**
>
> ``` r
> metadata <- fromJSON(
>   "data/metadonnees_installations_sherbrooke.json"
> )
>
> metadata$fields |>
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
> metadata$extent$spatialReference$latestWkid
> ```
>
>     [1] 3857

## Case studies

### Case study 1 - Last-resort financial assistance in Québec

The file `data/afdr_clientele_prestations_2022_12.csv` contains 43 aggregated rows published by Québec’s Ministère de l’Emploi et de la Solidarité sociale for December 2022. Each row describes a client characteristic or a region. It contains no individual records.

Complete the following tasks:

1.  import every column as text;
2.  clean the column names;
3.  convert the numeric columns to the correct type;
4.  convert `caracteristique` to a factor;
5.  check that all numbers are non-negative;
6.  check that `nb_prestataires` equals the sum of adults and children;
7.  produce a table of regions ranked by total benefits paid;
8.  document at least two decisions in a cleaning log.

> **NOTE:**
>
> ``` r
> afdr_raw <- read_csv(
>   "data/afdr_clientele_prestations_2022_12.csv",
>   col_types = cols(.default = col_character())
> ) |>
>   clean_names()
>
> afdr <- afdr_raw |>
>   mutate(
>     across(nb_menages:prest_base_heberges, parse_double),
>     caracteristique = as_factor(caracteristique),
>     valeur = str_squish(valeur),
>     negative_value = if_any(
>       nb_menages:prest_base_heberges,
>       ~ .x < 0
>     ),
>     inconsistent_total = nb_prestataires != nb_adultes + nb_enfants
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
>     n_negative_values = sum(negative_value),
>     n_inconsistent_totals = sum(inconsistent_total)
>   )
> ```
>
>     # A tibble: 1 × 2
>       n_negative_values n_inconsistent_totals
>                   <int>                 <int>
>     1                 0                     0
>
> ``` r
> afdr_regions <- afdr |>
>   filter(caracteristique == "Région") |>
>   select(valeur, nb_prestataires, prestation_totale_versee) |>
>   arrange(desc(prestation_totale_versee))
>
> afdr_regions
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
> afdr_log <- list(TY = list(), RC = list(), VA = list())
>
> afdr_log$TY <- append(afdr_log$TY, list(
>   list(
>     id = "afdr-file-2022-12",
>     variables = "nb_menages:prest_base_heberges",
>     probleme = "Columns deliberately imported as text",
>     action = "Controlled conversion with parse_double()",
>     justification = "Calculations require numeric columns"
>   )
> ))
>
> afdr_log$VA <- append(afdr_log$VA, list(
>   list(
>     id = "afdr-file-2022-12",
>     variables = "nb_prestataires",
>     probleme = "Total consistency must be checked",
>     action = "Compare with nb_adultes + nb_enfants",
>     justification = "The relationship can be tested without altering the source"
>   )
> ))
>
> afdr_log
> ```
>
>     $TY
>     $TY[[1]]
>     $TY[[1]]$id
>     [1] "afdr-file-2022-12"
>
>     $TY[[1]]$variables
>     [1] "nb_menages:prest_base_heberges"
>
>     $TY[[1]]$probleme
>     [1] "Columns deliberately imported as text"
>
>     $TY[[1]]$action
>     [1] "Controlled conversion with parse_double()"
>
>     $TY[[1]]$justification
>     [1] "Calculations require numeric columns"
>
>
>
>     $RC
>     list()
>
>     $VA
>     $VA[[1]]
>     $VA[[1]]$id
>     [1] "afdr-file-2022-12"
>
>     $VA[[1]]$variables
>     [1] "nb_prestataires"
>
>     $VA[[1]]$probleme
>     [1] "Total consistency must be checked"
>
>     $VA[[1]]$action
>     [1] "Compare with nb_adultes + nb_enfants"
>
>     $VA[[1]]$justification
>     [1] "The relationship can be tested without altering the source"

### Case study 2 - Sherbrooke sports and recreation facilities

The file `data/installations_sportives_sherbrooke.csv` contains the municipal inventory published by the City of Sherbrooke. The file `data/metadonnees_installations_sherbrooke.json` is the official description of the corresponding ArcGIS service. A missing value in `nom`, `detail` or `surface` is not automatically an error.

Complete the following tasks:

1.  import the CSV and JSON files;
2.  clean column names and extra whitespace;
3.  convert `eclairage` to a factor;
4.  check that the official JSON fields are present in the CSV;
5.  use the JSON extent to identify out-of-range coordinates;
6.  create a summary table by facility type;
7.  flag missing names without inventing them;
8.  document at least two decisions.

> **NOTE:**
>
> ``` r
> metadata <- fromJSON(
>   "data/metadonnees_installations_sherbrooke.json"
> )
>
> facilities_raw <- read_csv(
>   "data/installations_sportives_sherbrooke.csv",
>   show_col_types = FALSE
> )
>
> expected_fields <- str_to_lower(metadata$fields$name)
> missing_fields <- setdiff(
>   expected_fields,
>   names(clean_names(facilities_raw))
> )
>
> facilities <- facilities_raw |>
>   clean_names() |>
>   mutate(
>     across(c(type, detail, nom, surface, eclairage), str_squish),
>     eclairage = factor(eclairage, levels = c("Non", "Oui")),
>     missing_name = is.na(nom),
>     outside_extent = x < metadata$extent$xmin |
>       x > metadata$extent$xmax |
>       y < metadata$extent$ymin |
>       y > metadata$extent$ymax
>   )
>
> missing_fields
> ```
>
>     character(0)
>
> ``` r
> facilities |>
>   summarise(
>     n_outside_extent = sum(outside_extent, na.rm = TRUE),
>     n_missing_names = sum(missing_name)
>   )
> ```
>
>     # A tibble: 1 × 2
>       n_outside_extent n_missing_names
>                  <int>           <int>
>     1                0             720
>
> ``` r
> type_summary <- facilities |>
>   group_by(type) |>
>   summarise(
>     n_facilities = n(),
>     n_missing_names = sum(missing_name),
>     illuminated_share = mean(eclairage == "Oui", na.rm = TRUE),
>     .groups = "drop"
>   ) |>
>   arrange(desc(n_facilities))
>
> type_summary
> ```
>
>     # A tibble: 24 × 4
>        type                           n_facilities n_missing_names illuminated_share
>        <chr>                                 <int>           <int>             <dbl>
>      1 Jeu modulaire                           238             238           NaN
>      2 Soccer                                  106               0             0.439
>      3 Surface, anneau ou étang glacé           70              70           NaN
>      4 Basketball                               54              54             0.696
>      5 Tennis                                   52              52             1
>      6 Patinoire à bandes mobiles               48              48           NaN
>      7 Baseball                                 36              36             0.556
>      8 Pétanque                                 32              32           NaN
>      9 Jeu de galets                            30              30           NaN
>     10 Volleyball                               26              26             0.333
>     # ℹ 14 more rows
>
> ``` r
> facilities_log <- list(VM = list(), FT = list(), RC = list())
>
> facilities_log$FT <- append(facilities_log$FT, list(
>   list(
>     id = facilities$objectid[facilities$missing_name],
>     variables = "nom",
>     probleme = "Name missing from the source",
>     action = "Flag without automatic correction",
>     justification = "A name cannot be inferred from the other fields"
>   )
> ))
>
> facilities_log$RC <- append(facilities_log$RC, list(
>   list(
>     id = "sherbrooke-facilities-file",
>     variables = "eclairage",
>     probleme = "Categorical variable imported as text",
>     action = "Convert to a Non/Oui factor",
>     justification = "Observed levels are explicit and preserved"
>   )
> ))
>
> facilities_log
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
>     [1] "Name missing from the source"
>
>     $FT[[1]]$action
>     [1] "Flag without automatic correction"
>
>     $FT[[1]]$justification
>     [1] "A name cannot be inferred from the other fields"
>
>
>
>     $RC
>     $RC[[1]]
>     $RC[[1]]$id
>     [1] "sherbrooke-facilities-file"
>
>     $RC[[1]]$variables
>     [1] "eclairage"
>
>     $RC[[1]]$probleme
>     [1] "Categorical variable imported as text"
>
>     $RC[[1]]$action
>     [1] "Convert to a Non/Oui factor"
>
>     $RC[[1]]$justification
>     [1] "Observed levels are explicit and preserved"
