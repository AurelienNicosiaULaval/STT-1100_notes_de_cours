#!/usr/bin/env Rscript

if (!requireNamespace("readr", quietly = TRUE) || !requireNamespace("dplyr", quietly = TRUE)) {
  stop("The readr and dplyr packages are required.", call. = FALSE)
}

requests_url <- "https://donnees.montreal.ca/dataset/5866f832-676d-4b07-be6a-e99c21eb17e4/resource/2cfa0e06-9be4-49a6-b7f1-ee9f2363a872/download/requetes311.csv"
complaints_url <- "https://www.donneesquebec.ca/recherche/dataset/bcc45cfc-bfb3-4afd-b162-eb76dfd4e8a3/resource/b3926d33-575a-4de8-aa85-fb95c9459685/download/opc-plaintes-2026-07-02.csv"

requests <- readr::read_csv(requests_url, n_max = 750, show_col_types = FALSE) |>
  dplyr::transmute(
    nature = NATURE,
    categorie = ACTI_NOM,
    arrondissement = dplyr::coalesce(ARRONDISSEMENT_GEO, ARRONDISSEMENT, "Non assigné"),
    statut = dplyr::coalesce(DERNIER_STATUT, "Sans statut"),
    date_creation = as.Date(DDS_DATE_CREATION)
  )

complaints <- readr::read_csv(complaints_url, n_max = 750, show_col_types = FALSE) |>
  dplyr::transmute(
    periode = DATE,
    categorie_produit = COCON,
    motif = MOTIF,
    secteur = SECTEUR_ACTIVITE,
    ville_siege_social = VILLE_SIEGE_SOCIAL
  )

for (directory in c("module_03/data", "en/module_03/data")) {
  readr::write_csv(requests, file.path(directory, "requetes_311_montreal.csv"))
  readr::write_csv(complaints, file.path(directory, "plaintes_consommation_quebec.csv"))
}
