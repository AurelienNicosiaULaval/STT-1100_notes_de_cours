#!/usr/bin/env Rscript

if (!requireNamespace("readr", quietly = TRUE) ||
    !requireNamespace("dplyr", quietly = TRUE) ||
    !requireNamespace("jsonlite", quietly = TRUE)) {
  stop("The readr, dplyr and jsonlite packages are required.", call. = FALSE)
}

laval_url <- paste0(
  "https://www.donneesquebec.ca/recherche/dataset/",
  "b9421a88-ce06-4a94-9672-760f54022195/resource/",
  "00b01717-8fbe-493f-bf27-2beb027ece5b/download/",
  "comptage-velos-boucle-chevillon.csv"
)

air_url <- paste0(
  "https://www.donneesquebec.ca/recherche/dataset/",
  "a80757bd-d442-4d3d-9269-11628330b727/resource/",
  "370a6be4-1530-4c2b-92f3-0a308224f284/download/",
  "rsqaq_continues_horaires_2025.csv"
)

gatineau_url <- paste0(
  "https://www.donneesquebec.ca/recherche/dataset/",
  "f1e7f552-278d-47d6-89c9-6aa9d3293bd1/resource/",
  "388e4ff5-e1f1-4c81-a734-79b907fcf236/download/comptage.json"
)

velos_laval <- readr::read_csv(laval_url, show_col_types = FALSE) |>
  dplyr::filter(
    date >= as.Date("2016-06-01"),
    date <= as.Date("2016-06-30")
  ) |>
  dplyr::transmute(
    date,
    heure = as.character(heure),
    velos_total = `nbr-total-site`,
    velos_entrants = `nbr-entrant`,
    velos_sortants = `nbr-sortant`
  )

qualite_air <- readr::read_csv(air_url, show_col_types = FALSE) |>
  dplyr::filter(
    Station == "03006 - Québec - Vieux-Limoilou",
    format(Date_Heure, "%Y-%m") == "2025-07"
  ) |>
  dplyr::transmute(
    station = Station,
    date_heure = format(Date_Heure, "%Y-%m-%d %H:%M:%S"),
    carbone_noir = BC_880nm,
    monoxyde_carbone = CO,
    ozone = O3,
    particules_fines = `PM2.5-T640`,
    dioxyde_soufre = SO2
  )

gatineau_json <- paste(
  readLines(gatineau_url, encoding = "UTF-8", warn = FALSE),
  collapse = "\n"
)
gatineau_json <- sub("^\\ufeff", "", gatineau_json)
gatineau_raw <- jsonlite::fromJSON(gatineau_json)$features$properties

debits_gatineau <- gatineau_raw |>
  dplyr::group_by(ANNEE) |>
  dplyr::slice_head(n = 150L) |>
  dplyr::ungroup() |>
  dplyr::transmute(
    secteur = dplyr::coalesce(SECTEUR, "Non précisé"),
    intersection = NOMRUE,
    approche = APPROCHE,
    direction_circulation = DIRECTION_CIRCULATION,
    debit_total_24h = DEBIT_TOTAL24H,
    pourcentage_vehicules_lourds = PCENT_V_LOURD,
    annee = ANNEE
  )

stopifnot(
  nrow(velos_laval) == 2688L,
  nrow(qualite_air) == 744L,
  nrow(debits_gatineau) == 1200L,
  all(velos_laval$velos_total == velos_laval$velos_entrants + velos_laval$velos_sortants),
  sum(stats::complete.cases(qualite_air[-c(1, 2)])) > 600L,
  all(debits_gatineau$debit_total_24h >= 0, na.rm = TRUE)
)

for (directory in c("module_05/data", "en/module_05/data")) {
  readr::write_csv(
    velos_laval,
    file.path(directory, "comptages_velos_laval_2016_06.csv")
  )
  readr::write_csv(
    qualite_air,
    file.path(directory, "qualite_air_quebec_vieux_limoilou_2025_07.csv")
  )
  readr::write_csv(
    debits_gatineau,
    file.path(directory, "debits_circulation_gatineau_2016_2023.csv")
  )
}
