# Build the local HTML snapshots used in module 8 from official Quebec sources.

library(dplyr)
library(htmltools)
library(jsonlite)
library(lubridate)
library(purrr)
library(readr)
library(stringr)

catalog_api <- "https://www.donneesquebec.ca/recherche/api/3/action/package_show?id="
snapshot_date <- Sys.Date()
events_url <- paste0(
  "https://www.donneesquebec.ca/recherche/dataset/",
  "82b06c86-253a-4e77-a050-c022462e90eb/resource/",
  "633fea25-6c70-43f6-8db1-547103849080/download/",
  "sit-quebec-evenements.csv"
)

regular_ids <- c(
  "vque_31",
  "pistes-cyclables-standard",
  "milieux-humides-rci",
  "avis-grands-travaux-v3r",
  "sag_entrave_a_la_circulation",
  "vmtl-rsqa-indice-qualite-air"
)

irregular_ids <- c(
  "debits-de-circulation",
  "vdq_sondage-de-satisfaction-aupres-des-citoyens-a-l-egard-des-services-collectifs",
  "82ceb448fe9847ef8bc444d8da0adbc8_0",
  "sentier-pedestre"
)

event_ids <- c(
  "EVENMTOV500SU2",
  "EVENMTOV503J4S",
  "EVENMTOV503RZU",
  "EVENMTOV500O1O",
  "EVENMTOV500OCO",
  "EVENMTOV500RDN"
)

escape <- function(x) htmlEscape(as.character(x))

fetch_package <- function(id) {
  response <- fromJSON(paste0(catalog_api, URLencode(id)), simplifyVector = FALSE)
  stopifnot(isTRUE(response$success))
  response$result
}

package_row <- function(id) {
  item <- fetch_package(id)
  categories <- map_chr(item$groups, "display_name", .default = NA_character_)

  tibble(
    title = item$title,
    producer = item$organization$title,
    category = if (length(categories) == 0) NA_character_ else str_c(categories, collapse = "; "),
    updated_at = as.Date(substr(item$metadata_modified, 1, 10)),
    source_url = paste0("https://www.donneesquebec.ca/recherche/dataset/", item$name)
  )
}

dataset_card <- function(row) {
  category <- if (is.na(row$category)) "" else paste0(
    '      <p class="dataset-category">', escape(row$category), "</p>\n"
  )

  paste0(
    '    <article class="dataset-card" data-source-url="', escape(row$source_url), '">\n',
    '      <h2 class="dataset-title">', escape(row$title), "</h2>\n",
    '      <p class="dataset-producer">', escape(row$producer), "</p>\n",
    category,
    '      <p class="dataset-updated">', row$updated_at, "</p>\n",
    "    </article>"
  )
}

write_catalog <- function(data, path, page_title) {
  cards <- pmap_chr(data, function(...) dataset_card(list(...)))
  html <- paste0(
    "<!doctype html>\n<html lang=\"fr\">\n<head>\n",
    "  <meta charset=\"utf-8\">\n",
    "  <meta name=\"source\" content=\"Données Québec CKAN API\">\n",
    "  <meta name=\"snapshot-date\" content=\"", snapshot_date, "\">\n",
    "  <title>", escape(page_title), "</title>\n",
    "</head>\n<body>\n",
    "  <main>\n",
    paste(cards, collapse = "\n"), "\n",
    "  </main>\n",
    "  <footer>Source: Données Québec. Licence des métadonnées: CC BY 4.0.</footer>\n",
    "</body>\n</html>"
  )
  writeLines(html, path, useBytes = TRUE)
}

event_card <- function(row) {
  start_date <- dmy(row$PeriodeOuvertureDateDebut)
  paste0(
    '    <article class="event-card" data-event-id="', escape(row$IdentifiantUnique), '">\n',
    '      <h2 class="event-title">', escape(row$NomEtablissement), "</h2>\n",
    '      <time class="event-date" datetime="', start_date, '">', start_date, "</time>\n",
    '      <p class="event-location">', escape(row$Municipalite), "</p>\n",
    '      <p class="event-theme">', escape(row$TypeEtablissement), "</p>\n",
    "    </article>"
  )
}

regular <- map_dfr(regular_ids, package_row)
irregular <- map_dfr(irregular_ids, package_row)

events <- read_delim(
  events_url,
  delim = ";",
  show_col_types = FALSE,
  locale = locale(encoding = "UTF-8")
) |>
  filter(IdentifiantUnique %in% event_ids) |>
  distinct(IdentifiantUnique, .keep_all = TRUE) |>
  mutate(order = match(IdentifiantUnique, event_ids)) |>
  arrange(order)

stopifnot(
  nrow(regular) == length(regular_ids),
  nrow(irregular) == length(irregular_ids),
  sum(is.na(irregular$category)) == 2,
  nrow(events) == length(event_ids)
)

dir.create("module_08/data", recursive = TRUE, showWarnings = FALSE)
dir.create("en/module_08/data", recursive = TRUE, showWarnings = FALSE)

write_catalog(
  regular,
  "module_08/data/catalogue_donnees_quebec.html",
  "Métadonnées réelles de Données Québec"
)
write_catalog(
  irregular,
  "module_08/data/catalogue_donnees_quebec_irregulier.html",
  "Métadonnées réelles avec catégories absentes"
)

event_cards <- pmap_chr(events, function(...) event_card(list(...)))
events_html <- paste0(
  "<!doctype html>\n<html lang=\"fr\">\n<head>\n",
  "  <meta charset=\"utf-8\">\n",
  "  <meta name=\"source\" content=\"Système d'information touristique Québec\">\n",
  "  <meta name=\"snapshot-date\" content=\"2026-07-05\">\n",
  "  <title>Événements touristiques québécois</title>\n",
  "</head>\n<body>\n",
  "  <main>\n", paste(event_cards, collapse = "\n"), "\n  </main>\n",
  "  <footer>Source: ministère du Tourisme, SIT Québec. Licence: CC BY 4.0.</footer>\n",
  "</body>\n</html>"
)
writeLines(events_html, "module_08/data/evenements_sit_quebec.html", useBytes = TRUE)

files <- c(
  "catalogue_donnees_quebec.html",
  "catalogue_donnees_quebec_irregulier.html",
  "evenements_sit_quebec.html"
)
file.copy(
  file.path("module_08/data", files),
  file.path("en/module_08/data", files),
  overwrite = TRUE
)

message("Module 8 HTML snapshots built from official Quebec sources.")
