# Exercices de consolidation

# Exercices de consolidation

> **Objectif général – Maîtriser les différentes jointures `dplyr` (`inner_join()`, `left_join()`, `right_join()`, `full_join()`, `semi_join()`, `anti_join()`) sur des jeux de données variés.**

------------------------------------------------------------------------

## 1. Penguins & Islands

*Jeux de données :* `palmerpenguins::penguins` et `palmerpenguins::penguins_raw` (package **palmerpenguins**). Ajoute à chaque manchot la latitude (`lat`) et la longitude (`long`) de son île en faisant correspondre la variable `island`.

> **TIP:**
>
> ``` r
> library(dplyr)
> library(palmerpenguins)
>
> islands <- penguins_raw |>
>   distinct(island, lat = latitude, long = longitude)
>
> penguins_loc <- penguins |>
>   left_join(islands, by = "island")
> ```

------------------------------------------------------------------------

## 2. Gapminder × Code ISO-3

*Jeux de données :* `gapminder::gapminder` (package **gapminder**) et `countrycode::codelist` (package **countrycode**). Récupère le code ISO‑3 (`iso3c`) et la région de la FAO pour chaque pays dans `gapminder`. *Indice :* clé = `country`.

> **TIP:**
>
> ``` r
> library(dplyr)
> library(gapminder)
> library(countrycode)
>
> gap_iso <- gapminder |>
>   inner_join(
>     select(countrycode::codelist, country = country.name.en, iso3c, region_fao),
>     by = "country"
>   )
> ```

------------------------------------------------------------------------

## 3. Star Wars – Espèces & Classifications

*Jeu de données :* `dplyr::starwars` (package **dplyr**). Crée un tibble `species_class` listant quelques espèces et leur **classification** (`mammal`, `reptilian`, etc.). Fais une **`left_join()`** pour ajouter la colonne `classification` et calcule la taille moyenne (`height`) par classification.

> **TIP:**
>
> ``` r
> library(dplyr)
>
> species_class <- tibble::tribble(
>   ~species, ~classification,
>   "Human",  "mammal",
>   "Droid",  "artificial",
>   "Gungan", "amphibian",
>   "Wookiee","mammal"
> )
>
> starwars_cls <- starwars |>
>   left_join(species_class, by = "species") |>
>   group_by(classification) |>
>   summarise(mean_height = mean(height, na.rm = TRUE))
> ```

------------------------------------------------------------------------

## 4. Baseball – Joueurs canadiens

*Jeux de données :* `Lahman::People`, `Lahman::Batting` (package **Lahman**).

1.  Obtiens la liste des joueurs nés au *Canada* (`birthCountry`).
2.  Calcule leur moyenne au bâton (`H/AB`) en fusionnant People \<-\> Batting sur `playerID`.

> **TIP:**
>
> ``` r
> library(dplyr)
> library(Lahman)
>
> can_players <- People |>
>   filter(birthCountry == "Canada") |>
>   select(playerID, nameFirst, nameLast)
>
> can_stats <- can_players |>
>   inner_join(select(Batting, playerID, H, AB), by = "playerID") |>
>   group_by(playerID, nameFirst, nameLast) |>
>   summarise(avg = sum(H, na.rm = TRUE) / sum(AB, na.rm = TRUE),
>             .groups = "drop")
> ```

------------------------------------------------------------------------

## 5. Prénoms & Première lettre

*Jeu de données :* `babynames::babynames` (package **babynames**). Crée un tibble `alphabet` comportant la première lettre (`initial`) et sa catégorie (« A‑M », « N‑Z »). Ajoute la catégorie à `babynames`, puis compte les naissances par catégorie en 2010.

> **TIP:**
>
> ``` r
> library(dplyr)
> library(babynames)
>
> alphabet <- tibble::tibble(
>   initial = LETTERS,
>   group   = if_else(initial <= "M", "A-M", "N-Z")
> )
>
> babynames_2010 <- babynames |>
>   filter(year == 2010) |>
>   mutate(initial = substr(name, 1, 1)) |>
>   inner_join(alphabet, by = "initial") |>
>   group_by(group) |>
>   summarise(total = sum(n))
> ```

------------------------------------------------------------------------

## 6. Météo canadienne – Stations & Observations

*Jeux de données :* `weathercan::stations_meta()` et `weathercan::weather_dl()` (package **weathercan**). Télécharge les données quotidiennes de Québec‑Jean‑Lesage (station \#7025250) pour 2024 et joins‑les aux métadonnées de station pour ajouter `province` et `elevation`.

> **TIP:**
>
> ``` r
> library(weathercan)
> library(dplyr)
>
> meta <- stations_meta() |>
>   filter(station_id == 7025250) |>
>   select(station_id, province, elev = elevation)
>
> qc24 <- weather_dl(station_ids = 7025250,
>                    start = "2024-01-01", end = "2024-12-31",
>                    interval = "day")
>
> qc24_full <- qc24 |>
>   left_join(meta, by = "station_id")
> ```

------------------------------------------------------------------------

## 7. Pizza Ratings

*Jeux de données :* `fivethirtyeight::pizza` et `fivethirtyeight::pizza_places` (package **fivethirtyeight**). Associe chaque évaluation (`pizza`) à son restaurant (`pizza_places`) via `place_id` et trouve la note moyenne (`rating`) par **state**.

> **TIP:**
>
> ``` r
> library(dplyr)
> library(fivethirtyeight)
>
> pizza_avg_state <- pizza |>
>   inner_join(pizza_places, by = "place_id") |>
>   group_by(state) |>
>   summarise(mean_rating = mean(rating, na.rm = TRUE))
> ```

------------------------------------------------------------------------

## 8. ONU – Votes & Résolutions

*Jeux de données :* `unvotes::un_votes`, `unvotes::un_roll_calls` (package **unvotes**). Relie chaque vote (`un_votes`) à la description de la résolution (`un_roll_calls`) via `rcid`. Énumère les cinq pays ayant voté le plus souvent « no » entre 2000 et 2010.

> **TIP:**
>
> ``` r
> library(dplyr)
> library(unvotes)
>
> votes_desc <- un_votes |>
>   inner_join(un_roll_calls, by = "rcid") |>
>   filter(year >= 2000, year <= 2010, vote == "no") |>
>   count(country, sort = TRUE) |>
>   slice_head(n = 5)
> ```

------------------------------------------------------------------------

## 9. Films & Oscars

*Jeux de données :* `ggplot2movies::movies` (package **ggplot2movies**) et un tibble `oscars` listant quelques titres et l’année de l’Oscar du meilleur film. Fais une **`full_join()`** puis repère les films présents dans un seul des deux ensembles.

> **TIP:**
>
> ``` r
> library(dplyr)
> library(ggplot2movies)
>
> oscars <- tibble::tribble(
>   ~title,            ~oscar_year,
>   "The Hurt Locker", 2010,
>   "Argo",            2013,
>   "Parasite",        2020,
>   "Nomadland",       2021
> )
>
> movies_oscar <- full_join(
>   select(movies, title, year, rating),
>   oscars,
>   by = "title",
>   keep = TRUE
> )
>
> only_one_side <- movies_oscar |>
>   filter(is.na(year) | is.na(oscar_year))
> ```

------------------------------------------------------------------------

## 10. **Mini-projet EDA** - Vols à JFK

*Jeux de données :* `nycflights23::flights`, `nycflights23::airlines` et `nycflights23::weather` (package **nycflights23**).

1.  **Jointures :** relie `flights`, `airlines` et `weather`.
2.  Filtre uniquement les vols au départ de JFK.
3.  Calcule le retard moyen au départ par transporteur.
4.  Visualise la relation entre les rafales de vent (`wind_gust`) et les retards au départ (`dep_delay`).

> **TIP:**
>
> ``` r
> library(dplyr)
> library(ggplot2)
> library(nycflights23)
>
> vols_jfk <- flights |>
>   filter(origin == "JFK") |>
>   left_join(airlines, by = "carrier") |>
>   left_join(
>     weather,
>     by = c("origin", "year", "month", "day", "hour")
>   )
>
> resume_transporteurs <- vols_jfk |>
>   group_by(name) |>
>   summarise(
>     n_vols = n(),
>     retard_moyen = mean(dep_delay, na.rm = TRUE),
>     .groups = "drop"
>   )
>
> vols_jfk |>
>   filter(!is.na(wind_gust), !is.na(dep_delay)) |>
>   slice_sample(n = 5000) |>
>   ggplot(aes(x = wind_gust, y = dep_delay)) +
>   geom_point(alpha = 0.2) +
>   geom_smooth(method = "lm", se = FALSE) +
>   labs(
>     title = "Rafales de vent et retards au départ à JFK",
>     x = "Rafales de vent",
>     y = "Retard au départ (minutes)"
>   )
> ```
