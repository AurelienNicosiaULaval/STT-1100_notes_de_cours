
library(readr)
listecondamnation <- read_delim("~/Nouveau cours Ulaval/STT-1100 Introduction à la science des données/Developpement materiel de cours/Module 3/3 - Aventure/listecondamnation.csv",
                                       delim = ";", escape_double = FALSE, trim_ws = TRUE)


unique(listecondamnation$SOC_DESC_REGRP_TYP_ENTT)

library(tidyverse)
df = listecondamnation %>% filter( SOC_DESC_REGRP_TYP_ENTT == "RESTAURATION")
table(df$SOC_NOM_ARTCL_INFRC)
table(df$Type_etablissement)

df2 = df %>% filter(Type_etablissement %in% c("RESTAURANT", "RESTAURANT SERVICE RAPIDE", "RESTAURANT METS A EMPORTER", "REST. SERVICE RAPIDE"))
table(df2$Information_etablissement)
table(df2$SOC_CD_LOI)
table(df2$SOC_NOM_LOI)
table(df2$SOC_CD_REGL)
table(df2$SOC_CD_ARTCL_INFRC)
table(df2$SOC_CD_POURS)
table(df2$SOC_DESC_POURS)
table(df2$SOC_CD_REGRP_TYP_ENTT)



library(stringr)
listecondamnation = df2 %>% select(-Information_etablissement, -SOC_CD_LOI, -SOC_NOM_LOI,
                     - SOC_CD_REGL, - SOC_NOM_REGL, - SOC_CD_ARTCL_INFRC,
                     - SOC_CD_POURS, -SOC_DESC_POURS, - SOC_CD_REGRP_TYP_ENTT,
                     - SOC_DESC_REGRP_TYP_ENTT, - `...21`)# %>%
#  mutate(Amende = as.numeric(gsub(" ", "",substr(Amende, 1, nchar(Amende)-2))))


usethis::use_data(listecondamnation, overwrite = TRUE)
