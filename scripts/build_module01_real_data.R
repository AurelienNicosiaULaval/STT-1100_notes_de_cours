#!/usr/bin/env Rscript

# Build the real-data extracts used in Module 1 case studies.
# Run from the repository root:
#   Rscript scripts/build_module01_real_data.R

required_packages <- c("readr")
missing_packages <- required_packages[!vapply(required_packages, requireNamespace, logical(1), quietly = TRUE)]

if (length(missing_packages) > 0) {
  stop(
    "Missing required package(s): ",
    paste(missing_packages, collapse = ", "),
    ". Install them before running this script.",
    call. = FALSE
  )
}

library(readr)

library_source_url <- paste0(
  "https://www.donneesquebec.ca/recherche/dataset/",
  "231a38a8-f28e-4bef-82ea-dc98a14c1b6f/resource/",
  "01183d3e-c79c-4d09-915c-f35ffe4dfda8/download/",
  "statistiques_bibliotheques_quebec_2024.csv"
)

portal_source_url <- paste0(
  "https://donnees.montreal.ca/dataset/",
  "b9871478-b6e9-44a7-8d4e-0a5eb9e5c36f/resource/",
  "f859c1c0-60bb-41d2-b0a8-bd7ab68aeb3a/download/",
  "frequentation-portail-donnees-ouvertes.csv"
)

output_directories <- c("module_01/data", "en/module_01/data")

if (!all(dir.exists(output_directories))) {
  stop("Run this script from the repository root.", call. = FALSE)
}

# Case study 1: one row per Quebec public library or regional centre in 2024.
libraries_raw <- read.csv(
  library_source_url,
  sep = ";",
  check.names = FALSE,
  fileEncoding = "UTF-8-BOM"
)

library_columns <- c(
  "Bibliothèque ou Centre régional",
  "Région administrative",
  "Population desservie",
  "Prêts / Tous les doc. (Total)",
  "Progr. / Toutes les activités (Total)",
  "Visites (Total)"
)

if (!all(library_columns %in% names(libraries_raw))) {
  stop("The BAnQ source schema has changed. Update library_columns before rebuilding.", call. = FALSE)
}

libraries <- libraries_raw[library_columns]
names(libraries) <- c(
  "bibliotheque",
  "region",
  "population_desservie",
  "prets",
  "activites",
  "visites"
)

# Case study 2: one row per portal page with at least one session on 2023-06-21.
portal_raw <- read_csv(portal_source_url, show_col_types = FALSE)
portal <- portal_raw[
  portal_raw$date == 20230621 & portal_raw$sessions > 0,
  c("date", "path", "title", "sessions", "pageviews", "avgSessionDuration")
]

if (nrow(portal) == 0) {
  stop("The selected portal-data extract is empty. Check the source before rebuilding.", call. = FALSE)
}

portal$date <- as.Date(as.character(portal$date), format = "%Y%m%d")
names(portal)[names(portal) == "avgSessionDuration"] <- "duree_moyenne_session_secondes"

for (output_directory in output_directories) {
  write_csv(libraries, file.path(output_directory, "bibliotheques_publiques_quebec_2024.csv"), na = "")
  write_csv(portal, file.path(output_directory, "frequentation_portail_montreal_2023.csv"), na = "")
}

message("Wrote ", nrow(libraries), " library records and ", nrow(portal), " portal records to each language directory.")
