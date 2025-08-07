# Code de test pour scraper les données de donneesquebec.ca
library(rvest)
library(dplyr)
library(purrr)
library(stringr)

# Fonction pour extraire les données d'une seule page
scrape_page <- function(url) {
  page <- read_html(url)

  # Blocs de contenu pour chaque jeu de données
  blocs <- page |> html_nodes(".dataset-content")

  # Titres
  titres <- blocs |> html_node(".dataset-heading a") |> html_text(trim = TRUE)

  # Producteurs
  producteurs <- blocs |>
    map_chr(function(bloc) {
      orgs <- bloc |> html_nodes(".dqc-org-cat") |> html_text(trim = TRUE)
      org <- orgs[grepl("^Organisation", orgs)][1]
      gsub("^Organisation : ", "", org)
    })

  # Catégories
  categories <- blocs |>
    map_chr(function(bloc) {
      cats <- bloc |> html_nodes(".dqc-org-cat") |> html_text(trim = TRUE)
      cat <- cats[grepl("^Cat[ée]gorie", cats)][1]
      cat <- str_squish(cat)
      cat <- gsub("^Cat[ée]gorie[s]* : ", "", cat)
      cat <- gsub(";", ",", cat)
      cat
    })
  tibble(
    titre = titres,
    producteur = producteurs,
    categorie = categories
  )
}

# Test sur une seule page
url_test <- "https://www.donneesquebec.ca/recherche/?sort=metadata_modified+desc&page=7"
data_test <- scrape_page(url_test)

print(head(data_test))
