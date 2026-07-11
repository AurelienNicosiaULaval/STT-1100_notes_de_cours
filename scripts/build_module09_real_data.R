# Build the real Quebec municipal water snapshots used in module 9.

library(dplyr)
library(readr)
library(stringr)

consumption_url <- paste0(
  "https://donneesouvertes.affmunqc.net/sqeep_2019_2025/",
  "consommation_region_2023.csv"
)
validity_url <- paste0(
  "https://donneesouvertes.affmunqc.net/sqeep_2019_2025/",
  "validite_region_2023.csv"
)

parse_french_number <- function(x) {
  cleaned <- str_remove_all(x, "[[:space:]\\u00a0\\u202f]")
  parse_double(
    cleaned,
    locale = locale(decimal_mark = ","),
    na = c("", "Non disponible")
  )
}

municipality_type_fr <- c(
  M = "Municipalité",
  V = "Ville",
  P = "Paroisse",
  VL = "Village",
  CT = "Canton",
  CU = "Cantons unis"
)
municipality_type_en <- c(
  M = "Municipality",
  V = "City",
  P = "Parish",
  VL = "Village",
  CT = "Township",
  CU = "United townships"
)

consumption_raw <- read_csv(
  consumption_url,
  col_types = cols(.default = col_character())
)

consumption_fr <- consumption_raw |>
  transmute(
    code_municipalite = mun_c,
    municipalite = str_to_title(mun_n, locale = "fr"),
    type_municipalite = recode(mun_d, !!!municipality_type_fr),
    region = reg_n,
    consommation_residentielle_l_pers_j = parse_french_number(consom_resid),
    population_desservie = parse_french_number(pop_desservie),
    population_desservie_milliers = population_desservie / 1000,
    residences_desservies = parse_french_number(nb_resid_desservi),
    personnes_par_residence = parse_french_number(nb_pers_resid),
    eau_distribuee_l_pers_j = parse_french_number(qte_eau_pers)
  ) |>
  filter(
    if_all(
      c(
        consommation_residentielle_l_pers_j,
        population_desservie,
        residences_desservies,
        personnes_par_residence,
        eau_distribuee_l_pers_j
      ),
      ~ !is.na(.x)
    ),
    population_desservie >= 500
  ) |>
  arrange(region, municipalite)

consumption_en <- consumption_fr |>
  transmute(
    municipality_code = code_municipalite,
    municipality = municipalite,
    municipality_type = recode(
      consumption_raw$mun_d[match(code_municipalite, consumption_raw$mun_c)],
      !!!municipality_type_en
    ),
    region,
    residential_consumption_l_person_day = consommation_residentielle_l_pers_j,
    population_served = population_desservie,
    population_served_thousands = population_desservie_milliers,
    residences_served = residences_desservies,
    persons_per_residence = personnes_par_residence,
    distributed_water_l_person_day = eau_distribuee_l_pers_j
  )

validity_raw <- read_csv(
  validity_url,
  col_types = cols(.default = col_character())
)

validity_fr <- validity_raw |>
  transmute(
    code_municipalite = mun_c,
    municipalite = str_to_title(mun_n, locale = "fr"),
    type_municipalite = recode(mun_d, !!!municipality_type_fr),
    region = reg_n,
    indice_validite_pct = parse_french_number(pourc_indice_validite),
    branchements_non_residentiels_comptes_pct =
      parse_french_number(pourc_brchm_nresid_compt),
    validite_disponible = !is.na(indice_validite_pct)
  ) |>
  arrange(region, municipalite)

validity_en <- validity_raw |>
  transmute(
    municipality_code = mun_c,
    municipality = str_to_title(mun_n, locale = "fr"),
    municipality_type = recode(mun_d, !!!municipality_type_en),
    region = reg_n,
    validity_index_pct = parse_french_number(pourc_indice_validite),
    metered_non_residential_connections_pct =
      parse_french_number(pourc_brchm_nresid_compt),
    validity_available = !is.na(validity_index_pct)
  ) |>
  arrange(region, municipality)

stopifnot(
  nrow(consumption_fr) == 496,
  nrow(consumption_en) == nrow(consumption_fr),
  n_distinct(consumption_fr$region) == 17,
  !any(is.na(consumption_fr$type_municipalite)),
  !any(is.na(consumption_en$municipality_type)),
  nrow(validity_fr) == 1104,
  nrow(validity_en) == nrow(validity_fr),
  sum(validity_fr$validite_disponible) == 669,
  n_distinct(validity_fr$region) == 17,
  !any(is.na(validity_fr$type_municipalite)),
  !any(is.na(validity_en$municipality_type))
)

dir.create("module_09/data", recursive = TRUE, showWarnings = FALSE)
dir.create("en/module_09/data", recursive = TRUE, showWarnings = FALSE)

write_csv(
  consumption_fr,
  "module_09/data/consommation_eau_municipalites_2023.csv",
  na = ""
)
write_csv(
  validity_fr,
  "module_09/data/validite_audits_eau_2023.csv",
  na = ""
)
write_csv(
  consumption_en,
  "en/module_09/data/municipal_water_consumption_2023.csv",
  na = ""
)
write_csv(
  validity_en,
  "en/module_09/data/water_audit_validity_2023.csv",
  na = ""
)

message("Module 9 municipal water snapshots built from official MAMH data.")
