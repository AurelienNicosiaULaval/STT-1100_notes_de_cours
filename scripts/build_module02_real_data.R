#!/usr/bin/env Rscript

if (!requireNamespace("readr", quietly = TRUE)) {
  stop("The readr package is required.", call. = FALSE)
}

tree_source_url <- paste0(
  "https://www.donneesquebec.ca/recherche/dataset/34103a43-3712-4a29-92e1-039e9188e915/resource/",
  "13a51853-a5b5-4add-8791-02ccba5c1be7/download/vdq-arbrerepertorie.csv"
)
output_directories <- c("module_02/data", "en/module_02/data")

trees_raw <- readr::read_csv(tree_source_url, show_col_types = FALSE)
trees <- trees_raw[
  !is.na(trees_raw$NOM_FRANCAIS) & !is.na(trees_raw$DIAMETRE) & trees_raw$DIAMETRE > 0,
  c("ID", "NOM_FRANCAIS", "TYPE_ARBRE", "DIAMETRE", "TYPE_LIEU", "LATITUDE", "LONGITUDE")
]
names(trees) <- c("id_arbre", "essence", "type_arbre", "diametre_cm", "type_lieu", "latitude", "longitude")
trees <- trees[order(trees$essence, trees$id_arbre), ][seq_len(min(500L, nrow(trees))), ]

# Public totals displayed by Ville de Québec's Eco-Counter portal on 2026-07-10.
cycling <- data.frame(
  site = c("Einstein", "Rivière St-Charles", "Parc des Saules", "Corridor des Cheminots", "Corridor des Beauportois", "Route de l'Église", "Chemin Sainte-Foy", "Corridor du Littoral - Chutes Montmorency", "Corridor du Littoral - Maizerets", "Dalhousie", "Corridor Père-Marquette"),
  type_compteur = c("velo", "velo_pieton", "velo_pieton", "velo_pieton", "velo_pieton", "velo_pieton", "velo_pieton", "velo_pieton", "velo", "velo_pieton", "velo"),
  annee_debut = c(2016L, 2016L, 2021L, 2021L, 2021L, 2021L, 2025L, 2021L, 2021L, 2025L, 2016L),
  passages_velo_cumules = c(38475L, 161213L, 34722L, 102973L, 38092L, 19328L, 160265L, 58921L, 146733L, 175961L, 88240L),
  latitude = c(46.79517, 46.81557, 46.80856, 46.86052, 46.88009, 46.76899, 46.79403, 46.87617, 46.83614, 46.81575, 46.79550),
  longitude = c(-71.29139, -71.24019, -71.30830, -71.34030, -71.21680, -71.29172, -71.25573, -71.15608, -71.21582, -71.20198, -71.24823)
)

for (output_directory in output_directories) {
  readr::write_csv(trees, file.path(output_directory, "arbres_repertories_quebec.csv"))
  readr::write_csv(cycling, file.path(output_directory, "comptages_cyclistes_quebec_2026.csv"))
}

message("Wrote ", nrow(trees), " trees and ", nrow(cycling), " cycling-counter records.")
