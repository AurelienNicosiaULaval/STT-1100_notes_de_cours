# Consolidation Exercises

These exercises consolidate the practical moves of module 2: working in a GitHub repository, importing an Excel file, inspecting data, transforming a table with `dplyr`, producing readable charts with `ggplot2` and interpreting descriptive statistics.

They are independent from the adventure and challenge. The penguin file is used here as a training file, not as an extra challenge instruction.

Work in a `.R` file, a `.qmd` file, or both. The answers are collapsed so you can try before comparing.

In several exercises, the penguin Excel file is read with the path `resources/manchots_donnees.xlsx`, because this page belongs to the course site.

# Block A - GitHub, Project and Import

## Exercise 1 - Put the steps in order

You are simulating a short work session in a GitHub repository. Put the following actions in a logical order.

- Edit the logbook.
- Clone the GitHub repository in RStudio.
- Make a commit with a clear message.
- Open the `.Rproj` project.
- Push to GitHub.
- Render the logbook as HTML.

> **TIP:**
>
> One possible order:
>
> 1.  Clone the GitHub repository in RStudio.
> 2.  Open the `.Rproj` project.
> 3.  Edit the logbook.
> 4.  Render the logbook as HTML.
> 5.  Make a commit with a clear message.
> 6.  Push to GitHub.
>
> The important idea is to produce a verifiable step before committing it, then push to GitHub.

## Exercise 2 - Import the Excel File

Import the penguin file into an object named `penguins_mission`.

> **TIP:**
>
> ``` r
> library(readxl)
>
> penguins_mission <- read_excel("resources/manchots_donnees.xlsx")
>
> penguins_mission
> ```

## Exercise 3 - Inspect the Structure

Use three different functions to understand the structure of `penguins_mission`.

Your goal is to identify variable names, types and first rows.

> **TIP:**
>
> ``` r
> library(readxl)
> library(dplyr)
>
> penguins_mission <- read_excel("resources/manchots_donnees.xlsx")
>
> names(penguins_mission)
> glimpse(penguins_mission)
> head(penguins_mission)
> ```

## Exercise 4 - Identify Problematic Values

A quality check flags some observations as strange. Find rows where:

- flipper length is greater than 300 mm;
- body mass is greater than 8000 g;
- bill length is less than 25 mm.

> **TIP:**
>
> ``` r
> library(readxl)
> library(dplyr)
>
> penguins_mission <- read_excel("resources/manchots_donnees.xlsx")
>
> problematic_observations <- penguins_mission |>
>   filter(
>     flipper_length_mm > 300 |
>       body_mass_g > 8000 |
>       bill_length_mm < 25
>   )
>
> problematic_observations
> ```

# Block B - Manipulate Data with `dplyr`

## Exercise 5 - Select Useful Variables

Create a table `penguins_subset` containing only `species`, `island`, `bill_length_mm`, `bill_depth_mm`, `flipper_length_mm` and `body_mass_g`.

> **TIP:**
>
> ``` r
> library(readxl)
> library(dplyr)
>
> penguins_mission <- read_excel("resources/manchots_donnees.xlsx")
>
> penguins_subset <- penguins_mission |>
>   select(
>     species,
>     island,
>     bill_length_mm,
>     bill_depth_mm,
>     flipper_length_mm,
>     body_mass_g
>   )
>
> glimpse(penguins_subset)
> ```

## Exercise 6 - Filter One Species and One Island

Keep only `Adelie` penguins observed on `Biscoe` island. How many rows remain?

> **TIP:**
>
> ``` r
> library(readxl)
> library(dplyr)
>
> penguins_mission <- read_excel("resources/manchots_donnees.xlsx")
>
> adelie_biscoe <- penguins_mission |>
>   filter(species == "Adelie", island == "Biscoe")
>
> nrow(adelie_biscoe)
> ```

## Exercise 7 - Create Two Variables

Add:

- `body_mass_kg`, the body mass in kilograms;
- `bill_ratio`, the ratio between bill length and bill depth.

Then display the first five rows of these new variables.

> **TIP:**
>
> ``` r
> library(readxl)
> library(dplyr)
>
> penguins_mission <- read_excel("resources/manchots_donnees.xlsx")
>
> penguins_variables <- penguins_mission |>
>   mutate(
>     body_mass_kg = body_mass_g / 1000,
>     bill_ratio = bill_length_mm / bill_depth_mm
>   )
>
> penguins_variables |>
>   select(species, body_mass_g, body_mass_kg, bill_length_mm, bill_depth_mm, bill_ratio) |>
>   head(5)
> ```

## Exercise 8 - Summarise by Species

For each species, compute the number of observations, the mean and the standard deviation of `body_mass_g` and `flipper_length_mm`.

> **TIP:**
>
> ``` r
> library(readxl)
> library(dplyr)
>
> penguins_mission <- read_excel("resources/manchots_donnees.xlsx")
>
> species_summary <- penguins_mission |>
>   group_by(species) |>
>   summarise(
>     n = n(),
>     mean_body_mass_g = mean(body_mass_g, na.rm = TRUE),
>     sd_body_mass_g = sd(body_mass_g, na.rm = TRUE),
>     mean_flipper_length_mm = mean(flipper_length_mm, na.rm = TRUE),
>     sd_flipper_length_mm = sd(flipper_length_mm, na.rm = TRUE),
>     .groups = "drop"
>   )
>
> species_summary
> ```

## Exercise 9 - Build a Cleaned Version

Create a table `penguins_clean` that removes the problematic observations identified in Exercise 4, without modifying the original Excel file.

> **TIP:**
>
> ``` r
> library(readxl)
> library(dplyr)
>
> penguins_mission <- read_excel("resources/manchots_donnees.xlsx")
>
> penguins_clean <- penguins_mission |>
>   filter(
>     is.na(flipper_length_mm) | flipper_length_mm <= 300,
>     is.na(body_mass_g) | body_mass_g <= 8000,
>     is.na(bill_length_mm) | bill_length_mm >= 25
>   )
>
> tibble(
>   rows_before = nrow(penguins_mission),
>   rows_after = nrow(penguins_clean),
>   rows_removed = nrow(penguins_mission) - nrow(penguins_clean)
> )
> ```

# Block C - Visualize Numerical Variables

## Exercise 10 - Histogram by Species

Using `penguins_clean`, create a histogram of `bill_length_mm` by species.

> **TIP:**
>
> ``` r
> library(readxl)
> library(dplyr)
> library(ggplot2)
>
> penguins_mission <- read_excel("resources/manchots_donnees.xlsx")
>
> penguins_clean <- penguins_mission |>
>   filter(
>     is.na(flipper_length_mm) | flipper_length_mm <= 300,
>     is.na(body_mass_g) | body_mass_g <= 8000,
>     is.na(bill_length_mm) | bill_length_mm >= 25
>   )
>
> ggplot(penguins_clean, aes(x = bill_length_mm)) +
>   geom_histogram(binwidth = 2, fill = "steelblue", colour = "white") +
>   facet_wrap(~ species) +
>   labs(
>     title = "Bill length distribution by species",
>     x = "Bill length (mm)",
>     y = "Number of penguins"
>   ) +
>   theme_minimal()
> ```

## Exercise 11 - Box Plots

Compare flipper length between species with a box plot.

> **TIP:**
>
> ``` r
> library(readxl)
> library(dplyr)
> library(ggplot2)
>
> penguins_mission <- read_excel("resources/manchots_donnees.xlsx")
>
> penguins_clean <- penguins_mission |>
>   filter(
>     is.na(flipper_length_mm) | flipper_length_mm <= 300,
>     is.na(body_mass_g) | body_mass_g <= 8000,
>     is.na(bill_length_mm) | bill_length_mm >= 25
>   )
>
> ggplot(penguins_clean, aes(x = species, y = flipper_length_mm, fill = species)) +
>   geom_boxplot(alpha = 0.8) +
>   labs(
>     title = "Flipper length by species",
>     x = "Species",
>     y = "Flipper length (mm)",
>     fill = "Species"
>   ) +
>   theme_minimal()
> ```

## Exercise 12 - Scatterplot

Create `indice_grandeur = flipper_length_mm + bill_length_mm`, then produce a scatterplot of `indice_grandeur` and `body_mass_g`, with one color per species.

> **TIP:**
>
> ``` r
> library(readxl)
> library(dplyr)
> library(ggplot2)
>
> penguins_mission <- read_excel("resources/manchots_donnees.xlsx")
>
> penguins_clean <- penguins_mission |>
>   filter(
>     is.na(flipper_length_mm) | flipper_length_mm <= 300,
>     is.na(body_mass_g) | body_mass_g <= 8000,
>     is.na(bill_length_mm) | bill_length_mm >= 25
>   ) |>
>   mutate(indice_grandeur = flipper_length_mm + bill_length_mm)
>
> ggplot(penguins_clean, aes(x = indice_grandeur, y = body_mass_g, colour = species)) +
>   geom_point(alpha = 0.75, size = 2) +
>   labs(
>     title = "Size indicator and body mass",
>     x = "Size indicator (mm)",
>     y = "Body mass (g)",
>     colour = "Species"
>   ) +
>   theme_minimal()
> ```

## Exercise 13 - Facets by Island

Create a histogram of `body_mass_g` and compare distributions between islands with `facet_wrap()`.

> **TIP:**
>
> ``` r
> library(readxl)
> library(dplyr)
> library(ggplot2)
>
> penguins_mission <- read_excel("resources/manchots_donnees.xlsx")
>
> penguins_clean <- penguins_mission |>
>   filter(
>     is.na(flipper_length_mm) | flipper_length_mm <= 300,
>     is.na(body_mass_g) | body_mass_g <= 8000,
>     is.na(bill_length_mm) | bill_length_mm >= 25
>   )
>
> ggplot(penguins_clean, aes(x = body_mass_g)) +
>   geom_histogram(binwidth = 250, fill = "darkseagreen", colour = "white") +
>   facet_wrap(~ island) +
>   labs(
>     title = "Penguin body mass by island",
>     x = "Body mass (g)",
>     y = "Number of penguins"
>   ) +
>   theme_minimal()
> ```

# Block D - Statistics, Style and Transfer

## Exercise 14 - Complete Summary with `mpg`

The `mpg` dataset from `ggplot2` contains vehicle fuel economy measurements. Compute the mean, median, standard deviation, IQR, minimum and maximum of `hwy`.

> **TIP:**
>
> ``` r
> library(ggplot2)
> library(dplyr)
>
> mpg |>
>   summarise(
>     n = n(),
>     mean = mean(hwy, na.rm = TRUE),
>     median = median(hwy, na.rm = TRUE),
>     sd = sd(hwy, na.rm = TRUE),
>     iqr = IQR(hwy, na.rm = TRUE),
>     minimum = min(hwy, na.rm = TRUE),
>     maximum = max(hwy, na.rm = TRUE)
>   )
> ```

## Exercise 15 - Compare Groups with `mpg`

Create a box plot of `hwy` by `class`, ordering classes by their median.

> **TIP:**
>
> ``` r
> library(ggplot2)
>
> ggplot(mpg, aes(x = reorder(class, hwy, median), y = hwy)) +
>   geom_boxplot(fill = "orange", alpha = 0.8) +
>   coord_flip() +
>   labs(
>     title = "Highway fuel economy by vehicle class",
>     x = "Vehicle class",
>     y = "Highway MPG"
>   ) +
>   theme_minimal()
> ```

## Exercise 16 - Rewrite Code with Style

Rewrite the following code to make it more readable.

``` r
plot(mpg$displ,mpg$hwy,col=as.factor(mpg$class));title("plot")
```

> **TIP:**
>
> ``` r
> library(ggplot2)
>
> ggplot(mpg, aes(x = displ, y = hwy, colour = class)) +
>   geom_point(alpha = 0.8) +
>   labs(
>     title = "Highway fuel economy by engine displacement",
>     x = "Displacement (L)",
>     y = "Highway MPG",
>     colour = "Class"
>   ) +
>   theme_minimal()
> ```

# Case Studies

The following two case studies use small fictitious files. They do not represent real data; they only help practise module skills in contexts other than penguins.

## Case Study 1 - Urban Trees

File: `data/fictitious_urban_trees.csv`

You are helping a municipal team prepare an overview of the urban canopy. The file contains fictitious observations on trees in a few Quebec cities.

Complete the following tasks:

1.  Import the file with `readr::read_csv()`.
2.  Inspect the table structure.
3.  For each tree species, compute mean height, mean diameter and number of trees.
4.  Produce a box plot of `height_m` by `species`.
5.  Produce a scatterplot of `estimated_age_years` and `diameter_cm`, colored by `health_status`.
6.  Write two sentences summarizing what you observe.

> **TIP:**
>
> ``` r
> library(readr)
> library(dplyr)
> library(ggplot2)
>
> trees <- read_csv("data/fictitious_urban_trees.csv")
>
> glimpse(trees)
>
> tree_summary <- trees |>
>   group_by(species) |>
>   summarise(
>     n = n(),
>     mean_height_m = mean(height_m, na.rm = TRUE),
>     mean_diameter_cm = mean(diameter_cm, na.rm = TRUE),
>     .groups = "drop"
>   )
>
> tree_summary
>
> ggplot(trees, aes(x = species, y = height_m, fill = species)) +
>   geom_boxplot(alpha = 0.8) +
>   labs(
>     title = "Tree height by species",
>     x = "Species",
>     y = "Height (m)",
>     fill = "Species"
>   ) +
>   theme_minimal()
>
> ggplot(trees, aes(x = estimated_age_years, y = diameter_cm, colour = health_status)) +
>   geom_point(size = 2, alpha = 0.8) +
>   labs(
>     title = "Tree diameter and estimated age",
>     x = "Estimated age (years)",
>     y = "Diameter (cm)",
>     colour = "Health status"
>   ) +
>   theme_minimal()
> ```

## Case Study 2 - Bike Share

File: `data/fictitious_bike_share.csv`

You are preparing a short diagnostic for a fictitious bike-share service. The file contains aggregated observations by station, month and day type.

Complete the following tasks:

1.  Import the file.
2.  Compute the mean number of trips by city and day type.
3.  Create a variable `rainy_day` equal to `TRUE` when `precipitation_mm` is greater than or equal to 5.
4.  Produce a scatterplot of `temperature_c` and `trips`, colored by city.
5.  Compare `median_duration_min` between day types with a box plot.
6.  Write a short recommendation for the planning team.

> **TIP:**
>
> ``` r
> library(readr)
> library(dplyr)
> library(ggplot2)
>
> bike <- read_csv("data/fictitious_bike_share.csv")
>
> bike_summary <- bike |>
>   group_by(city, day_type) |>
>   summarise(
>     mean_trips = mean(trips, na.rm = TRUE),
>     typical_median_duration = median(median_duration_min, na.rm = TRUE),
>     .groups = "drop"
>   )
>
> bike_summary
>
> bike_prepared <- bike |>
>   mutate(rainy_day = precipitation_mm >= 5)
>
> ggplot(bike_prepared, aes(x = temperature_c, y = trips, colour = city)) +
>   geom_point(size = 2, alpha = 0.8) +
>   labs(
>     title = "Bike-share trips by temperature",
>     x = "Temperature (°C)",
>     y = "Number of trips",
>     colour = "City"
>   ) +
>   theme_minimal()
>
> ggplot(bike_prepared, aes(x = day_type, y = median_duration_min, fill = day_type)) +
>   geom_boxplot(alpha = 0.8) +
>   labs(
>     title = "Median trip duration by day type",
>     x = "Day type",
>     y = "Median duration (minutes)",
>     fill = "Day type"
>   ) +
>   theme_minimal()
> ```
