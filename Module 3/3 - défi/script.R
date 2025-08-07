############################################################
# Défi : Module 3 - Variables catégoriques
# Données : listecondamnation.rda
# Auteur  : Aurélien Nicosia
#
# La base de données contient :
#  1) Nom_exploitant
#  2) Raison_sociale
#  3) Description_infraction
#  4) Adresse_lieu_infraction
#  5) Type_etablissement
#  6) Date_infraction
#  7) Date_jugement
#  8) Date_publication
#  9) Amende (ex: "5 000 $")
#  10) SOC_NOM_ARTCL_INFRC
#
# Chaque question ci-dessous correspond à une partie
# du questionnaire Gradescope. Les étudiants fournissent
# la réponse attendue (texte, nombre, code).
############################################################

# Chargement des packages ---------------------------------
library(dplyr)
library(stringr)
library(ggplot2)

# Chargement du jeu de données ----------------------------
library(UlavalSSD)

# Vérifions le contenu
# head(listecondamnation)
# str(listecondamnation)

############################################################
# Q1 : Nombre total d'observations
############################################################

# Code pour Q1
nombre_observations <- nrow(listecondamnation)

cat("Q1) Le nombre total d'observations est :", nombre_observations, "\n")

############################################################
# Q2 : Nombre distinct d'exploitants
############################################################

# Code pour Q2
nombre_exploitants_distincts <- listecondamnation %>%
  distinct(Nom_exploitant) %>%
  nrow()

cat("Q2) Le nombre distinct d'exploitants est :", nombre_exploitants_distincts, "\n")

############################################################
# Q3 : Conversion de la colonne 'Amende' en numérique
############################################################

# Les amendes sont de la forme "5 000 $". On veut en faire un nombre, ex: 5000
# Méthode : retirer tout caractère qui n'est pas un chiffre, puis convertir en numérique.
listecondamnation <- listecondamnation %>%
  mutate(
    Amende_num = as.numeric(str_remove_all(Amende, "[^0-9]"))
  )

# Affichons quelques valeurs pour vérification
cat("Q3) Exemple de conversion d'amende :\n")
print(head(listecondamnation$Amende, 3))
print(head(listecondamnation$Amende_num, 3))

############################################################
# Q4 : Statistiques descriptives sur l'amende globale
############################################################

# Moyenne et médiane de l'amende (après conversion)
moy_amende <- mean(listecondamnation$Amende_num, na.rm = TRUE)
med_amende <- median(listecondamnation$Amende_num, na.rm = TRUE)

cat("Q4) Amende moyenne (global) :", round(moy_amende, 2), "\n")
cat("    Amende médiane (global) :", round(med_amende, 2), "\n")

############################################################
# Q5 : Nombre de types d'établissement distincts
############################################################

# On regarde la variable 'Type_etablissement'
nb_types <- listecondamnation %>%
  distinct(Type_etablissement) %>%
  nrow()

cat("Q5) Nombre distinct de types d'établissement :", nb_types, "\n")

############################################################
# Q6 : Moyenne d'amende par type d'établissement (group_by)
############################################################

# On regroupe par type, puis on calcule le nombre et l'amende moyenne
amende_par_type <- listecondamnation %>%
  group_by(Type_etablissement) %>%
  summarise(
    nb = n(),
    amende_moy = mean(Amende_num, na.rm = TRUE)
  ) %>%
  arrange(desc(amende_moy))

cat("Q6) Moyenne d'amende par type d'établissement :\n")
print(amende_par_type)

############################################################
# Q7 : Top 2 infractions (SOC_NOM_ARTCL_INFRC) par type
#     -> question plus complexe (group_by + slice_max)
############################################################

# On veut savoir, pour chaque type d'établissement,
# quelles sont les 2 infractions (SOC_NOM_ARTCL_INFRC)
# les plus fréquentes.
top_infractions_par_type <- listecondamnation %>%
  group_by(Type_etablissement, SOC_NOM_ARTCL_INFRC) %>%
  summarise(
    nb = n(),
    .groups = "drop"
  ) %>%
  group_by(Type_etablissement) %>%
  slice_max(nb, n =2) %>%
  arrange(Type_etablissement, desc(nb))

cat("\nQ7) Top 2 infractions par type d'établissement :\n")
print(top_infractions_par_type)

############################################################
# Q8 : Code pour un diagramme à barres
#     -> Exemple : Nombre de condamnations par type
############################################################

cat("\nQ8) Ci-dessous, un bar plot du nombre de condamnations par type d'établissement.\n")

ggplot(listecondamnation, aes(x = Type_etablissement)) +
  geom_bar(fill = "coral") +
  labs(
    title = "Nombre de condamnations par type d'établissement",
    x = "Type d'établissement",
    y = "Nombre de condamnations"
  ) +
  theme_minimal() +
  coord_flip()


############################################################
# Q9 : Boxplot comparant l’amende (numérique) par type (catégorique)
############################################################

cat("\nQ9) Boxplot Amende_num ~ Type_etablissement.\n")

ggplot(listecondamnation, aes(
  x = Amende_num, 
  fill = Type_etablissement
)) +
  geom_histogram() +
  labs(
    title = "Distribution de l'amende par type d'établissement",
    x = "Amende (en $)",
   # y = "Amende (en $)"
  ) +
  theme_minimal() +
  facet_grid(Type_etablissement~.)#+
# coord_flip()

############################################################
# Fin du script
############################################################
