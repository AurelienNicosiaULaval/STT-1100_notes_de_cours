### Libraire Weathercan

install.packages("weathercan", 
                 repos = c("https://ropensci.r-universe.dev", 
                           "https://cloud.r-project.org"))


library(weathercan)

## on regarde les stations contenu ----
library(tidyverse)
 View(stations() %>% filter(prov == "QC") %>%## on prend QC
   filter(interval == "day")) # on prend par jours

  
  ## on va chercher des données de météo 
  df <- weather_dl(station_ids = 5251, interval = "day", start = "1970-01-01", end = "1995-12-31")
  
  # on essai avec une autre station pour les données plus récentes
  df3 <- weather_dl(station_ids = 26892, interval = "day", start = "1996-01-01")
  
  df = rbind(df, df3)
  # on garde juste ce qui nous interesse:
  
  df2 = df %>% select(year, month, day, 
                      max_temp, mean_temp, min_temp,
                      total_precip, total_rain, total_snow,
                      snow_grnd) 
  summary(df2)
  
  
  write.csv(df2, file = "Donnees meteo quebec 1970_2025.csv")
  