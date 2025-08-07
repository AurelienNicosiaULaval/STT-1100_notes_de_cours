# ─────────────────────────────────────────────
# Fusion complète des tables nycflights23
# Auteur : Dr Sofia Martínez (PADL)
# ─────────────────────────────────────────────
library(tidyverse)
library(nycflights23)
library(lubridate)

# 1. Base principale — on enlève year, month, day, hour pour les recréer plus tard
flights23 <- flights |>
  select(-year, -month, -day, -hour)

# 2. Jointure compagnies
flights23 <- flights23 |>
  left_join(airlines, by = "carrier")

# 3. Jointure infos avion
planes_clean <- planes |>
  rename(plane_year = year)
flights23 <- flights23 |>
  left_join(planes_clean, by = "tailnum")

# 4. Météo
flights23 <- flights23 |>
  left_join(weather, by = c("origin", "time_hour"))

# 5. Aéroports - origine
airports_origin <- airports |>
  select(faa, name, lat, lon, alt, tz, dst, tzone) |>
  rename(
    origin = faa,
    origin_name = name,
    origin_lat = lat,
    origin_lon = lon,
    origin_alt = alt,
    origin_tz_code = tz,
    origin_dst = dst,
    origin_tz = tzone
  )
flights23 <- flights23 |>
  left_join(airports_origin, by = "origin")

# 6. Aéroports - destination
airports_dest <- airports |>
  select(faa, name, lat, lon, alt, tz, dst, tzone) |>
  rename(
    dest = faa,
    dest_name = name,
    dest_lat = lat,
    dest_lon = lon,
    dest_alt = alt,
    dest_tz_code = tz,
    dest_dst = dst,
    dest_tz = tzone
  )
flights23 <- flights23 |>
  left_join(airports_dest, by = "dest")

# 7. Extraire année, mois, jour et heure depuis time_hour
flights_merged <- flights23 |>
  mutate(
    year = year(time_hour),
    month = month(time_hour),
    day = day(time_hour),
    hour = hour(time_hour)
  ) |>
  relocate(year, month, day, hour, .before = 1) |> # met en début de tableau
  select(-time_hour) # on n’en a plus besoin

# 8. Aperçu final
glimpse(flights_merged)


# 8. Sauvegarde (optionnel)
saveRDS(flights_merged, "flights_merged_2023.rds")
