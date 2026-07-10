#!/usr/bin/env Rscript

if (!requireNamespace("readr", quietly = TRUE) ||
    !requireNamespace("jsonlite", quietly = TRUE)) {
  stop("The readr and jsonlite packages are required.", call. = FALSE)
}

afdr_url <- paste0(
  "https://www.donneesquebec.ca/recherche/dataset/",
  "c71c8cb8-76fe-4ebe-89a7-c04a53fc69f5/resource/",
  "efe7fdbf-9ea5-46e3-98f1-63f8fc51e637/download/",
  "afdr-clienteles-202212.csv"
)

installations_url <- paste0(
  "https://donneesouvertes-sherbrooke.opendata.arcgis.com/api/download/v1/",
  "items/b6498f3436974ecbb8fa636a7d9c0b2f/csv?layers=0"
)

metadata_url <- paste0(
  "https://services3.arcgis.com/qsNXG7LzoUbR4c1C/arcgis/rest/services/",
  "InstallationSportLoisir/FeatureServer/0?f=pjson"
)

afdr <- readr::read_csv(afdr_url, show_col_types = FALSE)
installations <- readr::read_csv(installations_url, show_col_types = FALSE)

metadata <- jsonlite::read_json(metadata_url, simplifyVector = FALSE)
metadata_file <- tempfile(fileext = ".json")
jsonlite::write_json(
  metadata,
  metadata_file,
  auto_unbox = TRUE,
  pretty = TRUE
)

stopifnot(
  nrow(afdr) == 43L,
  nrow(installations) > 800L,
  all(c("Caracteristique", "Valeur", "Prestation_totale_versee") %in% names(afdr)),
  all(c("TYPE", "NOM", "SURFACE", "ECLAIRAGE", "OBJECTID", "x", "y") %in% names(installations))
)

for (directory in c("module_04/data", "en/module_04/data")) {
  readr::write_csv(
    afdr,
    file.path(directory, "afdr_clientele_prestations_2022_12.csv")
  )
  readr::write_csv(
    installations,
    file.path(directory, "installations_sportives_sherbrooke.csv")
  )
  file.copy(
    metadata_file,
    file.path(directory, "metadonnees_installations_sherbrooke.json"),
    overwrite = TRUE
  )
}
