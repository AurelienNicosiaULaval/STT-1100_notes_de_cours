# Build real Quebec text datasets for module 10.

library(dplyr)
library(jsonlite)
library(lubridate)
library(purrr)
library(readr)
library(rvest)
library(stringr)

catalog_api <- "https://www.donneesquebec.ca/recherche/api/3/action/package_search"
events_url <- paste0(
  "https://www.donneesquebec.ca/recherche/dataset/",
  "82b06c86-253a-4e77-a050-c022462e90eb/resource/",
  "633fea25-6c70-43f6-8db1-547103849080/download/",
  "sit-quebec-evenements.csv"
)
snapshot_date <- Sys.Date()

organizations <- c(
  "ville-de-quebec",
  "ville-de-gatineau",
  "ville-de-sherbrooke-donnees-geomatiques",
  "ville-de-trois-rivieres",
  "ville-de-saguenay",
  "ville-de-laval",
  "ville-de-longueuil",
  "ville-de-montreal"
)

clean_html <- function(x) {
  if (is.null(x) || is.na(x) || !nzchar(x)) return(NA_character_)
  read_html(paste0("<div>", x, "</div>")) |>
    html_element("div") |>
    html_text2() |>
    str_squish()
}

fetch_organization <- function(organization) {
  query <- paste0(
    catalog_api,
    "?fq=organization%3A", organization,
    "&rows=40&sort=metadata_modified%20desc"
  )
  response <- fromJSON(query, simplifyVector = FALSE)
  stopifnot(isTRUE(response$success))

  map_dfr(response$result$results, function(item) {
    categories <- map_chr(item$groups, "display_name", .default = NA_character_)
    tibble(
      jeu_id = item$name,
      producteur = item$organization$title,
      categorie = if (length(categories) == 0) {
        "Non classé"
      } else {
        str_c(categories, collapse = "; ")
      },
      titre = item$title,
      description = clean_html(item$notes),
      nb_ressources = length(item$resources),
      date_mise_a_jour = as.Date(substr(item$metadata_modified, 1, 10)),
      licence = item$license_title,
      date_instantane = snapshot_date
    )
  }) |>
    filter(!is.na(description), str_length(description) >= 50) |>
    slice_head(n = 12)
}

catalogue_fr <- map_dfr(organizations, fetch_organization) |>
  distinct(jeu_id, .keep_all = TRUE) |>
  arrange(producteur, desc(date_mise_a_jour), titre)

catalogue_en <- catalogue_fr |>
  transmute(
    dataset_id = jeu_id,
    producer = producteur,
    category = categorie,
    title = titre,
    description,
    resource_count = nb_ressources,
    updated_at = date_mise_a_jour,
    licence,
    snapshot_date = date_instantane
  )

events_raw <- read_delim(
  events_url,
  delim = ";",
  show_col_types = FALSE,
  locale = locale(encoding = "UTF-8")
)

events_fr <- events_raw |>
  transmute(
    evenement_id = IdentifiantUnique,
    titre = str_squish(NomEtablissement),
    type_evenement = str_squish(TypeEtablissement),
    theme = str_squish(Theme),
    region_touristique = str_squish(RegionTouristique),
    municipalite = str_to_title(Municipalite, locale = "fr"),
    date_debut = dmy(PeriodeOuvertureDateDebut),
    date_fin = dmy(PeriodeOuvertureDateFin),
    site_web_disponible = !is.na(SiteInternet) & nzchar(SiteInternet),
    texte = str_squish(str_c(
      coalesce(NomEtablissement, ""),
      coalesce(Theme, ""),
      coalesce(ActivitesRecreativesCulturelles, ""),
      sep = " | "
    ))
  ) |>
  filter(
    !is.na(evenement_id),
    !is.na(titre),
    nzchar(titre),
    !is.na(type_evenement),
    nzchar(type_evenement),
    !is.na(region_touristique),
    nzchar(region_touristique),
    !is.na(municipalite),
    nzchar(municipalite),
    !is.na(date_debut),
    str_length(texte) >= 15
  ) |>
  distinct(evenement_id, .keep_all = TRUE) |>
  mutate(
    date_fin = coalesce(date_fin, date_debut),
    duree_jours = pmax(as.integer(date_fin - date_debut) + 1L, 1L)
  ) |>
  group_by(region_touristique) |>
  arrange(date_debut, titre, .by_group = TRUE) |>
  slice_head(n = 8) |>
  ungroup() |>
  arrange(region_touristique, date_debut, titre)

events_en <- events_fr |>
  transmute(
    event_id = evenement_id,
    title = titre,
    event_type = type_evenement,
    theme,
    tourism_region = region_touristique,
    municipality = municipalite,
    start_date = date_debut,
    end_date = date_fin,
    website_available = site_web_disponible,
    text = texte,
    duration_days = duree_jours
  )

stopifnot(
  nrow(catalogue_fr) >= 80,
  nrow(catalogue_en) == nrow(catalogue_fr),
  n_distinct(catalogue_fr$producteur) == length(organizations),
  all(catalogue_fr$licence == "Attribution (CC-BY 4.0)"),
  nrow(events_fr) >= 100,
  nrow(events_en) == nrow(events_fr),
  n_distinct(events_fr$region_touristique) >= 14,
  !any(is.na(events_fr$duree_jours))
)

dir.create("module_10/data", recursive = TRUE, showWarnings = FALSE)
dir.create("en/module_10/data", recursive = TRUE, showWarnings = FALSE)

write_csv(
  catalogue_fr,
  "module_10/data/descriptions_donnees_quebec.csv",
  na = ""
)
write_csv(
  events_fr,
  "module_10/data/evenements_touristiques_quebec.csv",
  na = ""
)
write_csv(
  catalogue_en,
  "en/module_10/data/quebec_dataset_descriptions.csv",
  na = ""
)
write_csv(
  events_en,
  "en/module_10/data/quebec_tourism_events.csv",
  na = ""
)

message("Module 10 text snapshots built from official Quebec sources.")
