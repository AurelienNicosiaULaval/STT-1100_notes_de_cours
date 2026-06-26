# Module 6 - Learning plan

STT-1100 Introduction to Data Science

# Module objectives

At the end of this module, you should be able to:

- Collaborate effectively on data science projects using `GitHub`.
- Ensure the reproducibility of analyzes with `Quarto`.
- Merge and manage multiple datasets.
- Explain the data life cycle and the principles of `DataOps`.

# Readings

In this module, we’ll explore the basic concepts of collaboration and reproducibility in GitHub, as well as using Quarto to create dynamic reports. Here is some initial reading to prepare you:

- [GitHub Docs – Hello World](https://docs.github.com/en/get-started/quickstart/hello-world) First complete project: repository, branch, pull request then merge.
- [GitHub Docs – About pull requests](https://docs.github.com/en/pull-requests) Learn everything about code review, comments and conflict resolution.
- [Quarto Docs – Inline Code](https://quarto.org/docs/computations/inline-code.html) Insert R code directly into text to dynamically display values.
- [What is DataOps? (DataKitchen)](https://datakitchen.io/what-is-dataops/) DataOps fundamentals: automation, quality, and collaboration.
- [R for Data Science (2nd ed.) – Chapter 26: Joins](https://r4ds.hadley.nz/joins.html) Learn to combine data from different sources with `dplyr`.

# Adventure

[Adventure 6](../module_06/aventure.llms.md)

# Challenge — Cross-review of logbooks

> Each team must **share their logbook** with another team and provide **constructive feedback**. This step simulates the peer review process and reinforces critical communication skills.

## Steps to take

1.  **Assignment of pairs**: the teacher will publish a table listing for each team the logbook to be examined.

2.  **Sharing the document**:

    - The repository manager adds the recipient team as a read/write *Collaborator* on GitHub.
    - The URL of the HTML logbook is communicated.

3.  **Peer Review**:

    - Each member of the review team opens an *Issue* in the review team repository and submits at least **one detailed comment** relating to:

      1.  **Clarity** of content (structure, titles, readability)
      2.  **Rigour** of the methodology (description of roles, reproducibility of the code)
      3.  **Relevance** of reflections (data life cycle, lessons learned)

    - Comments must contain:

      - A positive aspect statement (“what is successful”)
      - A specific suggestion for improvement (“what could be clarified”)

4.  **Acknowledgement of receipt & review**:

    - The receiving team responds to each *Issue* and, if deemed necessary, updates its logbook.

## Deliverables

| Team | Deliverable | Where to drop it off |
|----|----|----|
| **Reviewing team** | ≥ 3 *Issues* (one per member) containing full feedback | GitHub repository of the reviewed team |
| **Revised team** | Updated logbook (if necessary modifications) + responses to *Issues* | Same GitHub repository |

## Scale (20pts)

| Criterion                                                   | Pts |
|-------------------------------------------------------------|-----|
| Quality of comments (clarity, constructiveness, examples)   | 10  |
| Relevance of suggestions to reproducibility & collaboration | 5   |
| Follow-up and responses from the revised team               | 5   |

------------------------------------------------------------------------

> **Tip**: focus on actionable feedback (e.g. proposing a more descriptive title, adding an additional graphic, specifying a YAML parameter) rather than generic comments.

# Consolidation exercises

> **General objective – Master the different `dplyr` joins (`inner_join()`, `left_join()`, `right_join()`, `full_join()`, `semi_join()`, `anti_join()`) on various datasets.**

------------------------------------------------------------------------

## 1. Penguins & Islands

*Datasets:* `palmerpenguins::penguins` and `palmerpenguins::penguins_raw` (package **palmerpenguins**). Add to each penguin the latitude (`lat`) and longitude (`long`) of its island by matching the variable `island`.

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

## 2. Gapminder × ISO-3 Code

*Datasets:* `gapminder::gapminder` (package **gapminder**) and `countrycode::codelist` (package **countrycode**). Retrieves the ISO‑3 code (`iso3c`) and FAO region for each country in `gapminder`. *Hint:* key = `country`.

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

## 3. Star Wars – Species & Classifications

*Dataset:* `dplyr::starwars` (package **dplyr**). Creates a `species_class` tibble listing some species and their **classification** (`mammal`, `reptilian`, etc.). Do a **`left_join()`** to add the `classification` column and calculate the average size (`height`) by classification.

> **TIP:**
>
> ``` r
> library(dplyr)
>
> species_class <- tibble::tribble(
>   ~species, ~classification,
>   “Human”, “mammal”,
>   "Droid", "artificial",
>   "Gungan", "amphibian",
>   "Wookiee", "mammal"
> )
>
> starwars_cls <- starwars |>
>   left_join(species_class, by = "species") |>
>   group_by(classification) |>
>   summarise(mean_height = mean(height, na.rm = TRUE))
> ```

------------------------------------------------------------------------

## 4. Baseball – Canadian players

*Datasets:* `Lahman::People`, `Lahman::Batting` (package **Lahman**).

1.  Obtain the list of players born in *Canada* (`birthCountry`).
2.  Calculate their batting average (`H/AB`) by merging People \<-\> Batting on `playerID`.

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

## 5. First names & First letter

*Dataset:* `babynames::babynames` (package **babynames**). Creates an `alphabet` tibble with the first letter (`initial`) and its category (“A‑M”, “N‑Z”). Adds the category to `babynames`, then counts births by category in 2010.

> **TIP:**
>
> ``` r
> library(dplyr)
> library(babynames)
>
> alphabet <- tibble::tibble(
>   initial = LETTERS,
>   group = if_else(initial <= "M", "A-M", "N-Z")
> )
>
> babynames_2010 <- babynames |>
>   filter(year == 2010) |>
>   mutate(initial = substr(name, 1, 1)) |>
>   inner_join(alphabet, by = "initial") |>
>   group_by(group) |>
>   summarize(total = sum(n))
> ```

------------------------------------------------------------------------

## 6. Canadian Weather – Stations & Observations

*Datasets:* `weathercan::stations_meta()` and `weathercan::weather_dl()` (package **weathercan**). Download daily data for Québec‑Jean‑Lesage (station \#7025250) for 2024 and attach it to station metadata to add `province` and `elevation`.

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
>                    start="2024-01-01", end="2024-12-31",
>                    interval = "day")
>
> qc24_full <- qc24 |>
>   left_join(meta, by = "station_id")
> ```

------------------------------------------------------------------------

## 7. Pizza Ratings

*Datasets:* `fivethirtyeight::pizza` and `fivethirtyeight::pizza_places` (package **fivethirtyeight**). Associate each rating (`pizza`) with its restaurant (`pizza_places`) via `place_id` and find the average rating (`rating`) by **state**.

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

## 8. UN – Votes & Resolutions

*Datasets:* `unvotes::un_votes`, `unvotes::un_roll_calls` (package **unvotes**). Links each vote (`un_votes`) to the description of the resolution (`un_roll_calls`) via `rcid`. Lists the five countries that voted “no” most often between 2000 and 2010.

> **TIP:**
>
> ``` r
> library(dplyr)
> library(unvotes)
>
> votes_desc <- one_votes |>
>   inner_join(un_roll_calls, by = "rcid") |>
>   filter(year >= 2000, year <= 2010, vote == "no") |>
>   count(country, sort = TRUE) |>
>   slice_head(n = 5)
> ```

------------------------------------------------------------------------

## 9. Movies & Oscars

*Datasets:* `ggplot2movies::movies` (package **ggplot2movies**) and an `oscars` tibble listing some titles and the year of the Best Picture Oscar. Do a **`full_join()`** then locate the films present in only one of the two sets.

> **TIP:**
>
> ``` r
> library(dplyr)
> library(ggplot2movies)
>
> oscars <- tibble::tribble(
>   ~title, ~oscar_year,
>   "The Hurt Locker", 2010,
>   "Argo", 2013,
>   "Parasite", 2020,
>   “Nomadland”, 2021
> )
>
> movies_oscar <- full_join(
>   select(movies, title, year, rating),
>   Oscars,
>   by = "title",
>   keep = TRUE
> )
>
> only_one_side <- movies_oscar |>
>   filter(is.na(year) | is.na(oscar_year))
> ```

------------------------------------------------------------------------

## 10. **EDA mini-project** — Forest fires

*Datasets:* `fires::fires` and `fires::fire_weather` (package **fires**).

1.  **Joins:** connects `fires` (incidents) and `fire_weather` (weather conditions) via `fid`.
2.  Calculate the average impact of temperature (`temp`) and wind (`wind`) on the burned surface area (`area`).
3.  Visualize `temp` × `area` with a scatterplot and a regression line.

> **TIP:**
>
> ``` r
> library(dplyr)
> library(ggplot2)
> library(fires)
>
> fires_full <- fires |>
>   inner_join(fire_weather, by = "fid")
>
> summary_tbl <- fires_full |>
>   summarize(
>     mean_area = mean(area, na.rm = TRUE),
>     corr_temp = cor(temp, area, use = "complete.obs"),
>     corr_wind = cor(wind, area, use = "complete.obs")
>   )
> ```
