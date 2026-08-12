# Provenance of Module 1 real data

The two files in this folder are reproducible extracts of open data. They are created by `scripts/build_module01_real_data.R`, which must be run from the repository root.

## `bibliotheques_publiques_quebec_2024.csv`

- Source: Bibliothèque et Archives nationales du Québec, [Statistiques des bibliothèques publiques du Québec](https://www.donneesquebec.ca/recherche/dataset/statistiques_des_bibliotheques_publiques_du_quebec).
- Resource used: 2024 annual statistics, downloaded on July 10, 2026.
- Unit of observation: one public library or regional centre.
- Transformation: selection of six fields used directly in the exercises, without changing observations.
- Licence: [CC-BY 4.0](https://www.donneesquebec.ca/licence/#cc-by).
- Important limitation: an empty cell means the statistic is unavailable or not applicable; it does not mean zero.

## `frequentation_portail_montreal_2023.csv`

- Source: City of Montréal, [Open Data Portal Traffic](https://donnees.montreal.ca/dataset/frequentation-du-portail-de-donnees-ouvertes).
- Resource used: traffic file since July 2021, downloaded on July 10, 2026.
- Unit of observation: one Open Data Portal page observed on one day.
- Transformation: rows from June 21, 2023 with at least one session; no values are invented.
- Licence: [CC-BY 4.0](https://creativecommons.org/licenses/by/4.0/).
- Important limitation: these data describe portal web traffic, not the use, quality, or impact of the datasets viewed.
