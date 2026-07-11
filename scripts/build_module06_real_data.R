#!/usr/bin/env Rscript

if (!requireNamespace("jsonlite", quietly = TRUE) ||
    !requireNamespace("dplyr", quietly = TRUE) ||
    !requireNamespace("readr", quietly = TRUE) ||
    !requireNamespace("tibble", quietly = TRUE)) {
  stop(
    "The jsonlite, dplyr, readr and tibble packages are required.",
    call. = FALSE
  )
}

organizations_url <- paste0(
  "https://www.donneesquebec.ca/recherche/api/3/action/",
  "organization_list?all_fields=true&include_dataset_count=true"
)

packages_url <- paste0(
  "https://www.donneesquebec.ca/recherche/api/3/action/",
  "package_search?rows=1000&sort=metadata_modified%20desc"
)

organizations_api <- jsonlite::fromJSON(
  organizations_url,
  simplifyDataFrame = TRUE
)
packages_api <- jsonlite::fromJSON(
  packages_url,
  simplifyDataFrame = TRUE
)

stopifnot(organizations_api$success, packages_api$success)

organizations_raw <- organizations_api$result
packages_raw <- packages_api$result$results |>
  dplyr::group_by(owner_org) |>
  dplyr::slice_head(n = 8L) |>
  dplyr::ungroup()

organizations <- organizations_raw |>
  dplyr::transmute(
    organisation_id = id,
    organisation_nom = title,
    organisation_slug = name,
    nb_jeux_catalogue = package_count,
    etat = state
  ) |>
  dplyr::arrange(organisation_nom)

datasets <- packages_raw |>
  dplyr::transmute(
    jeu_id = id,
    titre = title,
    organisation_id = owner_org,
    licence = license_title,
    date_creation = substr(metadata_created, 1L, 10L),
    date_modification = substr(metadata_modified, 1L, 10L),
    nb_ressources = num_resources,
    nb_etiquettes = num_tags
  )

extract_resources <- function(resource_table) {
  if (is.null(resource_table) || nrow(resource_table) == 0L) {
    return(tibble::tibble())
  }

  get_column <- function(name, default = NA_character_) {
    if (name %in% names(resource_table)) {
      resource_table[[name]]
    } else {
      rep(default, nrow(resource_table))
    }
  }

  tibble::tibble(
    ressource_id = get_column("id"),
    jeu_id = get_column("package_id"),
    ressource_nom = get_column("name"),
    format = get_column("format"),
    type_ressource = get_column("resource_type"),
    taille_octets = as.numeric(get_column("size", NA_real_)),
    date_modification = substr(
      get_column("metadata_modified"),
      1L,
      10L
    )
  )
}

resources <- packages_raw$resources |>
  lapply(extract_resources) |>
  dplyr::bind_rows()

extract_tags <- function(tag_table, dataset_id) {
  if (is.null(tag_table) || nrow(tag_table) == 0L) {
    return(tibble::tibble())
  }

  tag_table |>
    dplyr::transmute(
      jeu_id = dataset_id,
      etiquette = display_name
    )
}

tags <- Map(
  extract_tags,
  packages_raw$tags,
  packages_raw$id
) |>
  dplyr::bind_rows()

stopifnot(
  nrow(organizations) > 100L,
  nrow(datasets) > 250L,
  nrow(resources) > 2000L,
  nrow(tags) > 1000L,
  !anyDuplicated(organizations$organisation_id),
  !anyDuplicated(datasets$jeu_id),
  !anyDuplicated(resources$ressource_id),
  nrow(dplyr::anti_join(datasets, organizations, by = "organisation_id")) == 0L,
  nrow(dplyr::anti_join(resources, datasets, by = "jeu_id")) == 0L,
  nrow(dplyr::anti_join(tags, datasets, by = "jeu_id")) == 0L
)

for (directory in c("module_06/data", "en/module_06/data")) {
  readr::write_csv(
    organizations,
    file.path(directory, "organisations_donnees_quebec.csv")
  )
  readr::write_csv(
    datasets,
    file.path(directory, "jeux_donnees_quebec.csv")
  )
  readr::write_csv(
    resources,
    file.path(directory, "ressources_donnees_quebec.csv")
  )
  readr::write_csv(
    tags,
    file.path(directory, "etiquettes_donnees_quebec.csv")
  )
}
