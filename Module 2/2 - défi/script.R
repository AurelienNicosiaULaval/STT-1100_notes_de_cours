library(UlavalSSD)
library(tidyverse)

df = MeteoQuebec %>% filter(year == 1996) %>%
  select(month, day, mean_temp, total_precip) %>%
  mutate(id = 1:n()-1)

# Q1.1
summary(df)

# Q1.2
df %>% group_by(month) %>% summarise( m = mean(mean_temp, na.rm=TRUE))

# Q1.3
df %>% group_by(month) %>% 
  summarise( m = sd(total_precip, na.rm=TRUE)/mean(total_precip, na.rm=TRUE))



# Q2

# faire un graphiquique nombres de jours depuis le début de l'année 
# couleur par taux de précipitation



ggplot(df, aes( x= id,y = mean_temp)) + 
  geom_point(aes( color =total_precip ))+
  geom_line(aes(linetype = "dashed"))


# Q3

df_sans_na = df %>% na.omit() %>% mutate(precipitation = ifelse(total_precip>0, "oui", "non"))
ggplot(data = df_sans_na, aes(x = month, y = mean_temp, fill = precipitation))+
  geom_boxplot()
  

df_sans_na %>% group_by(month, precipitation) %>% summarise(m = mean(mean_temp))

