#!/usr/bin/env Rscript

if (!requireNamespace("readr", quietly = TRUE) ||
    !requireNamespace("dplyr", quietly = TRUE)) {
  stop("The readr and dplyr packages are required.", call. = FALSE)
}

incidents_url <- paste0(
  "https://donneesouvertes-sherbrooke.opendata.arcgis.com/api/download/v1/",
  "items/64d19d62f0804f5896e4b24c32aea49d/csv?layers=0"
)

population_url <- paste0(
  "https://www150.statcan.gc.ca/n1/tbl/csv/17100155-fra.zip"
)

survey_url <- paste0(
  "https://www.donneesquebec.ca/recherche/dataset/",
  "4d1d7428-eaf8-409d-a31a-af426183ae22/resource/",
  "4acc10a7-fbec-47db-937b-ce750d5e6b0f/download/",
  "2025_reponsessondagecq_q3611.csv"
)

incidents <- readr::read_csv(incidents_url, show_col_types = FALSE) |>
  dplyr::transmute(
    annee = as.integer(ANNEE),
    mois = as.integer(substr(DATETEXTE, 6L, 7L)),
    type_incident = DESCRIPTION
  ) |>
  dplyr::count(annee, mois, type_incident, name = "nb_incidents") |>
  dplyr::arrange(annee, mois, type_incident)

population_zip <- tempfile(fileext = ".zip")
population_dir <- tempfile(pattern = "statcan-population-")
dir.create(population_dir)
download.file(population_url, population_zip, mode = "wb", quiet = TRUE)
utils::unzip(population_zip, files = "17100155.csv", exdir = population_dir)

population <- readr::read_delim(
  file.path(population_dir, "17100155.csv"),
  delim = ";",
  col_types = readr::cols(.default = readr::col_character())
) |>
  dplyr::filter(
    GÉO == "Sherbrooke (V), Québec",
    `PÉRIODE DE RÉFÉRENCE` %in% c("2022", "2023", "2024")
  ) |>
  dplyr::transmute(
    annee = as.integer(`PÉRIODE DE RÉFÉRENCE`),
    population_estimee = readr::parse_double(VALEUR),
    geographie = GÉO
  )

survey <- readr::read_csv(survey_url, show_col_types = FALSE) |>
  dplyr::transmute(
    annee = as.integer(Annee),
    question = as.integer(No_question),
    reponse = Reponse,
    nb_reponses = as.integer(NB),
    pourcentage = as.numeric(PCT)
  )

stopifnot(
  nrow(incidents) > 200L,
  nrow(population) == 3L,
  nrow(survey) > 150L,
  all(incidents$annee %in% 2022:2024),
  all(incidents$nb_incidents > 0L),
  all(population$population_estimee > 170000),
  all(survey$annee %in% 2020:2025)
)

for (directory in c("module_07/data", "en/module_07/data")) {
  readr::write_csv(
    incidents,
    file.path(directory, "incidents_securite_sherbrooke_agreges.csv")
  )
  readr::write_csv(
    population,
    file.path(directory, "population_sherbrooke_2022_2024.csv")
  )
  readr::write_csv(
    survey,
    file.path(
      directory,
      "sondage_utilisateurs_donnees_quebec_2020_2025.csv"
    )
  )
}
