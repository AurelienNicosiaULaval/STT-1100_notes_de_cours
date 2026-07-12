# Exercices de consolidation

> **IMPORTANT:**
>
> [Télécharger le dossier prêt à ouvrir (.zip)](../downloads/donnees/stt1100-module-02-fr.zip)
>
> Décompressez le fichier, puis ouvrez le projet `.Rproj`. Les chemins utilisés dans les exercices fonctionneront sans déplacer les données.

Ces exercices consolident les gestes du module 2: travailler dans un dépôt GitHub, importer un fichier Excel, inspecter les données, transformer un tableau avec `dplyr`, produire des graphiques lisibles avec `ggplot2` et interpréter des statistiques descriptives.

Ils sont indépendants de l’aventure et du défi. Le fichier des manchots est utilisé ici comme fichier d’entraînement, pas comme consigne supplémentaire du défi.

Travaillez dans un fichier `.R`, un fichier `.qmd`, ou les deux. Les réponses sont repliées pour vous permettre d’essayer avant de comparer.

Dans plusieurs exercices, le fichier Excel des manchots est lu avec le chemin `resources/manchots_donnees.xlsx`, car cette page se trouve dans le site du cours.

## Bloc A - GitHub, projet et importation

### Exercice 1 - Remettre les étapes dans l’ordre

Vous simulez une courte séance de travail dans un dépôt GitHub. Remettez les actions suivantes dans un ordre logique.

- Modifier le journal de bord.
- Cloner le dépôt GitHub dans RStudio.
- Faire un commit avec un message clair.
- Ouvrir le projet `.Rproj`.
- Faire un push vers GitHub.
- Rendre le journal de bord en HTML.

> **TIP:**
>
> Un ordre possible:
>
> 1.  Cloner le dépôt GitHub dans RStudio.
> 2.  Ouvrir le projet `.Rproj`.
> 3.  Modifier le journal de bord.
> 4.  Rendre le journal de bord en HTML.
> 5.  Faire un commit avec un message clair.
> 6.  Faire un push vers GitHub.
>
> L’idée importante est de produire une étape vérifiable avant de la committer, puis de pousser vers GitHub.

### Exercice 2 - Importer le fichier Excel

Importez le fichier des manchots dans un objet nommé `penguins_mission`.

> **TIP:**
>
> ``` r
> library(readxl)
>
> penguins_mission <- read_excel("resources/manchots_donnees.xlsx")
>
> penguins_mission
> ```

### Exercice 3 - Inspecter la structure

Utilisez trois fonctions différentes pour comprendre la structure de `penguins_mission`.

Votre objectif est de repérer les noms de variables, les types et les premières lignes.

> **TIP:**
>
> ``` r
> library(readxl)
> library(dplyr)
>
> penguins_mission <- read_excel("resources/manchots_donnees.xlsx")
>
> names(penguins_mission)
> glimpse(penguins_mission)
> head(penguins_mission)
> ```

### Exercice 4 - Repérer des valeurs problématiques

Un contrôle de qualité signale que certaines observations semblent étranges. Trouvez les lignes où:

- la longueur des nageoires dépasse 300 mm;
- la masse corporelle dépasse 8000 g;
- la longueur du bec est inférieure à 25 mm.

> **TIP:**
>
> ``` r
> library(readxl)
> library(dplyr)
>
> penguins_mission <- read_excel("resources/manchots_donnees.xlsx")
>
> observations_problematiques <- penguins_mission |>
>   filter(
>     flipper_length_mm > 300 |
>       body_mass_g > 8000 |
>       bill_length_mm < 25
>   )
>
> observations_problematiques
> ```

## Bloc B - Manipuler les données avec `dplyr`

### Exercice 5 - Sélectionner les variables utiles

Créez un tableau `penguins_subset` qui contient seulement `species`, `island`, `bill_length_mm`, `bill_depth_mm`, `flipper_length_mm` et `body_mass_g`.

> **TIP:**
>
> ``` r
> library(readxl)
> library(dplyr)
>
> penguins_mission <- read_excel("resources/manchots_donnees.xlsx")
>
> penguins_subset <- penguins_mission |>
>   select(
>     species,
>     island,
>     bill_length_mm,
>     bill_depth_mm,
>     flipper_length_mm,
>     body_mass_g
>   )
>
> glimpse(penguins_subset)
> ```

### Exercice 6 - Filtrer une espèce et une île

Gardez seulement les manchots de l’espèce `Adelie` observés sur l’île `Biscoe`. Combien de lignes restent dans le tableau?

> **TIP:**
>
> ``` r
> library(readxl)
> library(dplyr)
>
> penguins_mission <- read_excel("resources/manchots_donnees.xlsx")
>
> adelie_biscoe <- penguins_mission |>
>   filter(species == "Adelie", island == "Biscoe")
>
> nrow(adelie_biscoe)
> ```

### Exercice 7 - Créer deux variables

Ajoutez:

- `body_mass_kg`, la masse corporelle en kilogrammes;
- `bill_ratio`, le ratio entre longueur et profondeur du bec.

Affichez ensuite les cinq premières lignes de ces nouvelles variables.

> **TIP:**
>
> ``` r
> library(readxl)
> library(dplyr)
>
> penguins_mission <- read_excel("resources/manchots_donnees.xlsx")
>
> penguins_variables <- penguins_mission |>
>   mutate(
>     body_mass_kg = body_mass_g / 1000,
>     bill_ratio = bill_length_mm / bill_depth_mm
>   )
>
> penguins_variables |>
>   select(species, body_mass_g, body_mass_kg, bill_length_mm, bill_depth_mm, bill_ratio) |>
>   head(5)
> ```

### Exercice 8 - Résumer par espèce

Calculez, par espèce, le nombre d’observations, la moyenne et l’écart-type de `body_mass_g` et de `flipper_length_mm`.

> **TIP:**
>
> ``` r
> library(readxl)
> library(dplyr)
>
> penguins_mission <- read_excel("resources/manchots_donnees.xlsx")
>
> resume_especes <- penguins_mission |>
>   group_by(species) |>
>   summarise(
>     n = n(),
>     masse_moyenne_g = mean(body_mass_g, na.rm = TRUE),
>     masse_ecart_type_g = sd(body_mass_g, na.rm = TRUE),
>     nageoire_moyenne_mm = mean(flipper_length_mm, na.rm = TRUE),
>     nageoire_ecart_type_mm = sd(flipper_length_mm, na.rm = TRUE),
>     .groups = "drop"
>   )
>
> resume_especes
> ```

### Exercice 9 - Construire une version nettoyée

Créez un tableau `penguins_clean` qui retire les observations problématiques repérées à l’exercice 4, sans modifier le fichier Excel original.

> **TIP:**
>
> ``` r
> library(readxl)
> library(dplyr)
>
> penguins_mission <- read_excel("resources/manchots_donnees.xlsx")
>
> penguins_clean <- penguins_mission |>
>   filter(
>     is.na(flipper_length_mm) | flipper_length_mm <= 300,
>     is.na(body_mass_g) | body_mass_g <= 8000,
>     is.na(bill_length_mm) | bill_length_mm >= 25
>   )
>
> tibble(
>   lignes_avant = nrow(penguins_mission),
>   lignes_apres = nrow(penguins_clean),
>   lignes_retirees = nrow(penguins_mission) - nrow(penguins_clean)
> )
> ```

## Bloc C - Visualiser des variables numériques

### Exercice 10 - Histogramme par espèce

Avec `penguins_clean`, créez un histogramme de `bill_length_mm` par espèce.

> **TIP:**
>
> ``` r
> library(readxl)
> library(dplyr)
> library(ggplot2)
>
> penguins_mission <- read_excel("resources/manchots_donnees.xlsx")
>
> penguins_clean <- penguins_mission |>
>   filter(
>     is.na(flipper_length_mm) | flipper_length_mm <= 300,
>     is.na(body_mass_g) | body_mass_g <= 8000,
>     is.na(bill_length_mm) | bill_length_mm >= 25
>   )
>
> ggplot(penguins_clean, aes(x = bill_length_mm)) +
>   geom_histogram(binwidth = 2, fill = "steelblue", colour = "white") +
>   facet_wrap(~ species) +
>   labs(
>     title = "Distribution de la longueur du bec par espèce",
>     x = "Longueur du bec (mm)",
>     y = "Nombre de manchots"
>   ) +
>   theme_minimal()
> ```

### Exercice 11 - Boîtes à moustaches

Comparez la longueur des nageoires entre les espèces avec une boîte à moustaches.

> **TIP:**
>
> ``` r
> library(readxl)
> library(dplyr)
> library(ggplot2)
>
> penguins_mission <- read_excel("resources/manchots_donnees.xlsx")
>
> penguins_clean <- penguins_mission |>
>   filter(
>     is.na(flipper_length_mm) | flipper_length_mm <= 300,
>     is.na(body_mass_g) | body_mass_g <= 8000,
>     is.na(bill_length_mm) | bill_length_mm >= 25
>   )
>
> ggplot(penguins_clean, aes(x = species, y = flipper_length_mm, fill = species)) +
>   geom_boxplot(alpha = 0.8) +
>   labs(
>     title = "Longueur des nageoires selon l'espèce",
>     x = "Espèce",
>     y = "Longueur des nageoires (mm)",
>     fill = "Espèce"
>   ) +
>   theme_minimal()
> ```

### Exercice 12 - Nuage de points

Créez `indice_grandeur = flipper_length_mm + bill_length_mm`, puis produisez un nuage de points entre `indice_grandeur` et `body_mass_g`, avec une couleur par espèce.

> **TIP:**
>
> ``` r
> library(readxl)
> library(dplyr)
> library(ggplot2)
>
> penguins_mission <- read_excel("resources/manchots_donnees.xlsx")
>
> penguins_clean <- penguins_mission |>
>   filter(
>     is.na(flipper_length_mm) | flipper_length_mm <= 300,
>     is.na(body_mass_g) | body_mass_g <= 8000,
>     is.na(bill_length_mm) | bill_length_mm >= 25
>   ) |>
>   mutate(indice_grandeur = flipper_length_mm + bill_length_mm)
>
> ggplot(penguins_clean, aes(x = indice_grandeur, y = body_mass_g, colour = species)) +
>   geom_point(alpha = 0.75, size = 2) +
>   labs(
>     title = "Indice de grandeur et masse corporelle",
>     x = "Indice de grandeur (mm)",
>     y = "Masse corporelle (g)",
>     colour = "Espèce"
>   ) +
>   theme_minimal()
> ```

### Exercice 13 - Facettes par île

Créez un histogramme de `body_mass_g` et comparez les distributions entre les îles avec `facet_wrap()`.

> **TIP:**
>
> ``` r
> library(readxl)
> library(dplyr)
> library(ggplot2)
>
> penguins_mission <- read_excel("resources/manchots_donnees.xlsx")
>
> penguins_clean <- penguins_mission |>
>   filter(
>     is.na(flipper_length_mm) | flipper_length_mm <= 300,
>     is.na(body_mass_g) | body_mass_g <= 8000,
>     is.na(bill_length_mm) | bill_length_mm >= 25
>   )
>
> ggplot(penguins_clean, aes(x = body_mass_g)) +
>   geom_histogram(binwidth = 250, fill = "darkseagreen", colour = "white") +
>   facet_wrap(~ island) +
>   labs(
>     title = "Masse corporelle des manchots selon l'île",
>     x = "Masse corporelle (g)",
>     y = "Nombre de manchots"
>   ) +
>   theme_minimal()
> ```

## Bloc D - Statistiques, style et transfert

### Exercice 14 - Sommaire complet avec `mpg`

Le jeu de données `mpg` du package `ggplot2` contient des mesures de consommation de véhicules. Calculez la moyenne, la médiane, l’écart-type, l’IQR, le minimum et le maximum de `hwy`.

> **TIP:**
>
> ``` r
> library(ggplot2)
> library(dplyr)
>
> mpg |>
>   summarise(
>     n = n(),
>     moyenne = mean(hwy, na.rm = TRUE),
>     mediane = median(hwy, na.rm = TRUE),
>     ecart_type = sd(hwy, na.rm = TRUE),
>     iqr = IQR(hwy, na.rm = TRUE),
>     minimum = min(hwy, na.rm = TRUE),
>     maximum = max(hwy, na.rm = TRUE)
>   )
> ```

### Exercice 15 - Comparer des groupes avec `mpg`

Créez une boîte à moustaches de `hwy` par `class`, en triant les classes selon leur médiane.

> **TIP:**
>
> ``` r
> library(ggplot2)
>
> ggplot(mpg, aes(x = reorder(class, hwy, median), y = hwy)) +
>   geom_boxplot(fill = "orange", alpha = 0.8) +
>   coord_flip() +
>   labs(
>     title = "Consommation autoroute selon la catégorie de véhicule",
>     x = "Catégorie de véhicule",
>     y = "MPG autoroute"
>   ) +
>   theme_minimal()
> ```

### Exercice 16 - Réécrire du code avec style

Réécrivez le code suivant pour le rendre plus lisible.

``` r
plot(mpg$displ,mpg$hwy,col=as.factor(mpg$class));title("plot")
```

> **TIP:**
>
> ``` r
> library(ggplot2)
>
> ggplot(mpg, aes(x = displ, y = hwy, colour = class)) +
>   geom_point(alpha = 0.8) +
>   labs(
>     title = "Consommation autoroute selon la cylindrée",
>     x = "Cylindrée (L)",
>     y = "MPG autoroute",
>     colour = "Catégorie"
>   ) +
>   theme_minimal()
> ```

## Études de cas

Les deux études de cas suivantes utilisent des extraits de données ouvertes de la Ville de Québec. Leur provenance et leurs limites sont documentées dans `module_02/data/README.md`.

### Étude de cas 1 - Arbres répertoriés de Québec

Fichier: `data/arbres_repertories_quebec.csv`

Vous aidez une équipe municipale à préparer un aperçu des arbres répertoriés à Québec. Chaque ligne représente un arbre; le diamètre correspond au DHP lorsqu’il est disponible.

Réalisez les tâches suivantes:

1.  Importez le fichier avec `readr::read_csv()`.
2.  Inspectez la structure du tableau.
3.  Calculez, par essence, le diamètre moyen et le nombre d’arbres.
4.  Produisez une boîte à moustaches de `diametre_cm` par `type_arbre`.
5.  Produisez un nuage de points des coordonnées, coloré par `type_arbre`.
6.  Rédigez deux phrases qui résument ce que vous observez.

> **TIP:**
>
> ``` r
> library(readr)
> library(dplyr)
> library(ggplot2)
>
> arbres <- read_csv("data/arbres_repertories_quebec.csv")
>
> glimpse(arbres)
>
> resume_arbres <- arbres |>
>   group_by(essence) |>
>   summarise(
>     n = n(),
>     diametre_moyen_cm = mean(diametre_cm, na.rm = TRUE),
>     .groups = "drop"
>   )
>
> resume_arbres
>
> ggplot(arbres, aes(x = type_arbre, y = diametre_cm, fill = type_arbre)) +
>   geom_boxplot(alpha = 0.8) +
>   labs(
>     title = "Diamètre des arbres selon le type",
>     x = "Type d'arbre",
>     y = "Diamètre (cm)",
>     fill = "Type d'arbre"
>   ) +
>   theme_minimal()
>
> ggplot(arbres, aes(x = longitude, y = latitude, colour = type_arbre)) +
>   geom_point(size = 2, alpha = 0.8) +
>   labs(
>     title = "Localisation des arbres répertoriés",
>     x = "Longitude",
>     y = "Latitude",
>     colour = "Type d'arbre"
>   ) +
>   theme_minimal()
> ```

### Étude de cas 2 - Compteurs cyclistes de Québec

Fichier: `data/comptages_cyclistes_quebec_2026.csv`

Vous préparez un court diagnostic des compteurs cyclistes de Québec. Chaque ligne représente un site et son total cumulé affiché le 10 juillet 2026.

Réalisez les tâches suivantes:

1.  Importez le fichier.
2.  Calculez le nombre moyen de passages par type de compteur.
3.  Créez une variable `compteur_recent` qui vaut `TRUE` si `annee_debut` est supérieure ou égale à 2021.
4.  Produisez un nuage de points entre l’année de début et les passages cumulés, coloré par type de compteur.
5.  Comparez les passages cumulés entre les types de compteur avec une boîte à moustaches.
6.  Rédigez une recommandation courte pour l’équipe de planification.

> **TIP:**
>
> ``` r
> library(readr)
> library(dplyr)
> library(ggplot2)
>
> velo <- read_csv("data/comptages_cyclistes_quebec_2026.csv")
>
> resume_velo <- velo |>
>   group_by(type_compteur) |>
>   summarise(
>     passages_moyens = mean(passages_velo_cumules, na.rm = TRUE),
>     .groups = "drop"
>   )
>
> resume_velo
>
> velo_prepare <- velo |>
>   mutate(compteur_recent = annee_debut >= 2021)
>
> ggplot(velo_prepare, aes(x = annee_debut, y = passages_velo_cumules, colour = type_compteur)) +
>   geom_point(size = 2, alpha = 0.8) +
>   labs(
>     title = "Passages cyclistes selon l'année de début",
>     x = "Année de début",
>     y = "Passages cumulés",
>     colour = "Type de compteur"
>   ) +
>   theme_minimal()
>
> ggplot(velo_prepare, aes(x = type_compteur, y = passages_velo_cumules, fill = type_compteur)) +
>   geom_boxplot(alpha = 0.8) +
>   labs(
>     title = "Passages cumulés selon le type de compteur",
>     x = "Type de compteur",
>     y = "Passages cumulés",
>     fill = "Type de compteur"
>   ) +
>   theme_minimal()
> ```
