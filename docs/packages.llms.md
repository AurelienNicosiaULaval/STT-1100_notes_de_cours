Bibliothèque R

# Packages utilisés dans le cours

Cette page rassemble les packages R utilisés ou mentionnés dans les notes, exercices, aventures et scripts. Elle sert à comprendre à quoi sert chaque package et dans quels modules il revient.

[Par module](#par-module) [Bibliothèque](#bibliothèque-de-packages) [Bases de données](donnees.llms.md)

01

Importer et nettoyer

02

Transformer et joindre

03

Visualiser et communiquer

04

Texte, web et tableaux de bord

## Par module

### Module 01

[`tidyverse`](#tidyverse) [`dplyr`](#dplyr) [`knitr`](#knitr) [`remotes`](#remotes) [`UlavalSSD`](#ulavalssd)

### Module 02

[`tidyverse`](#tidyverse) [`palmerpenguins`](#palmerpenguins) [`UlavalSSD`](#ulavalssd) [`readxl`](#readxl) [`ggplot2`](#ggplot2) [`patchwork`](#patchwork)

### Module 03

[`tidyverse`](#tidyverse) [`stringr`](#stringr) [`forcats`](#forcats) [`palmerpenguins`](#palmerpenguins) [`titanic`](#titanic) [`UlavalSSD`](#ulavalssd) [`ggplot2`](#ggplot2) [`tidygeocoder`](#tidygeocoder) [`viridis`](#viridis) [`scales`](#scales)

### Module 04

[`readr`](#readr) [`readxl`](#readxl) [`dplyr`](#dplyr) [`tidyr`](#tidyr) [`jsonlite`](#jsonlite) [`janitor`](#janitor) [`stringr`](#stringr) [`forcats`](#forcats) [`tibble`](#tibble) [`ggplot2`](#ggplot2) [`messy`](#messy)

### Module 05

[`tidyverse`](#tidyverse) [`lubridate`](#lubridate) [`dplyr`](#dplyr) [`ggplot2`](#ggplot2)

### Module 06

[`tidyverse`](#tidyverse) [`nycflights23`](#nycflights23) [`dplyr`](#dplyr) [`readr`](#readr) [`ggplot2`](#ggplot2)

### Module 07

[`tidyverse`](#tidyverse) [`ggplot2`](#ggplot2) [`dplyr`](#dplyr) [`readr`](#readr) [`lubridate`](#lubridate) [`scales`](#scales)

### Module 08

[`tidyverse`](#tidyverse) [`rvest`](#rvest) [`purrr`](#purrr) [`dplyr`](#dplyr) [`stringr`](#stringr) [`robotstxt`](#robotstxt)

### Module 09

[`tidyverse`](#tidyverse) [`palmerpenguins`](#palmerpenguins)

### Module 10

[`tidytext`](#tidytext) [`stringr`](#stringr) [`dplyr`](#dplyr) [`tibble`](#tibble) [`ggplot2`](#ggplot2) [`stopwords`](#stopwords) [`tidyr`](#tidyr) [`forcats`](#forcats) [`wordcloud`](#wordcloud) [`wordcloud2`](#wordcloud2) [`ggwordcloud`](#ggwordcloud) [`plotly`](#plotly) [`flexdashboard`](#flexdashboard) [`shiny`](#shiny)

## Bibliothèque de packages

[BAB ](https://CRAN.R-project.org/package=babynames)

## babynames

Données de prénoms utilisées pour pratiquer les jointures et les résumés.Documentation externe [COU ](https://CRAN.R-project.org/package=countrycode)

## countrycode

Codes et correspondances de pays pour enrichir des données internationales.Documentation externe [![Logo hexagonal du package dplyr](assets/img/packages/dplyr.png) ](https://CRAN.R-project.org/package=dplyr)

## dplyr

Manipulation de tableaux avec des verbes comme filter, select, mutate et summarise.Documentation externe [FIV ](https://CRAN.R-project.org/package=fivethirtyeight)

## fivethirtyeight

Jeux de données de démonstration issus d’articles et d’exemples publics.Documentation externe [FLE ](https://CRAN.R-project.org/package=flexdashboard)

## flexdashboard

Création de tableaux de bord HTML avec R Markdown.Documentation externe [FOR ](https://CRAN.R-project.org/package=forcats)

## forcats

Manipulation de facteurs et d’ordres de catégories.Documentation externe [GAP ](https://CRAN.R-project.org/package=gapminder)

## gapminder

Données pays-années utilisées pour pratiquer les jointures et les regroupements.Documentation externe [GGC ](https://CRAN.R-project.org/package=ggcorrplot)

## ggcorrplot

Visualisation de matrices de corrélation.Documentation externe [![Logo hexagonal du package ggplot2](assets/img/packages/ggplot2.png) ](https://CRAN.R-project.org/package=ggplot2)

## ggplot2

Visualisation statistique avec la grammaire des graphiques.Documentation externe [GGP ](https://CRAN.R-project.org/package=ggplot2movies)

## ggplot2movies

Jeu de données de films pour pratiquer les jointures et les comparaisons.Documentation externe [GGW ](https://CRAN.R-project.org/package=ggwordcloud)

## ggwordcloud

Option mentionnée pour créer des nuages de mots avec ggplot2.Documentation externe [JAN ](https://CRAN.R-project.org/package=janitor)

## janitor

Nettoyage de noms de colonnes et diagnostics rapides de tableaux.Documentation externe [JSO ](https://CRAN.R-project.org/package=jsonlite)

## jsonlite

Lecture et transformation de fichiers JSON.Documentation externe [KNI ](https://CRAN.R-project.org/package=knitr)

## knitr

Exécution de blocs de code et production de sorties dans les documents Quarto.Documentation externe [LAH ](https://CRAN.R-project.org/package=Lahman)

## Lahman

Tables de baseball utilisées pour pratiquer les jointures.Documentation externe [LEA ](https://CRAN.R-project.org/package=leaflet)

## leaflet

Cartes interactives utilisées pour discuter des risques de localisation individuelle.Documentation externe [LUB ](https://CRAN.R-project.org/package=lubridate)

## lubridate

Manipulation de dates, mois, années et variables temporelles.Documentation externe [MES ](https://CRAN.R-project.org/package=messy)

## messy

Package utilisé dans un script de préparation de données du module 04.Documentation externe [NYC ](https://CRAN.R-project.org/package=nycflights23)

## nycflights23

Tables de vols, transporteurs, aéroports et météo de New York en 2023.Documentation externe [PAL ](https://CRAN.R-project.org/package=palmerpenguins)

## palmerpenguins

Jeux de données sur les manchots pour l’exploration, les graphiques et les jointures.Documentation externe [PAT ](https://CRAN.R-project.org/package=patchwork)

## patchwork

Assemblage de plusieurs graphiques ggplot2.Documentation externe [PLO ](https://CRAN.R-project.org/package=plotly)

## plotly

Visualisation interactive mentionnée pour le tableau de bord du module 10.Documentation externe [PUR ](https://CRAN.R-project.org/package=purrr)

## purrr

Itération fonctionnelle et traitement de listes.Documentation externe [REA ](https://CRAN.R-project.org/package=readr)

## readr

Importation de fichiers CSV et textes délimités.Documentation externe [REA ](https://CRAN.R-project.org/package=readxl)

## readxl

Importation de fichiers Excel.Documentation externe [REM ](https://CRAN.R-project.org/package=remotes)

## remotes

Installation de packages depuis GitHub ou d’autres sources de développement.Documentation externe [ROB ](https://CRAN.R-project.org/package=robotstxt)

## robotstxt

Vérification programmatique des consignes robots.txt avant une collecte automatisée.Documentation externe [RVE ](https://CRAN.R-project.org/package=rvest)

## rvest

Extraction de données depuis des pages HTML.Documentation externe [SCA ](https://CRAN.R-project.org/package=scales)

## scales

Étiquettes, formats et échelles pour graphiques.Documentation externe [SHI ](https://CRAN.R-project.org/package=shiny)

## shiny

Applications et composants interactifs en R.Documentation externe [SKI ](https://CRAN.R-project.org/package=skimr)

## skimr

Résumé rapide de la structure et des variables d’un tableau.Documentation externe [STO ](https://CRAN.R-project.org/package=stopwords)

## stopwords

Listes de mots fréquents pour le traitement du texte.Documentation externe [STR ](https://CRAN.R-project.org/package=stringr)

## stringr

Manipulation de chaînes de caractères.Documentation externe [TIB ](https://CRAN.R-project.org/package=tibble)

## tibble

Création et affichage de tableaux modernes dans R.Documentation externe [TID ](https://CRAN.R-project.org/package=tidygeocoder)

## tidygeocoder

Géocodage d’adresses et de codes postaux.Documentation externe [TID ](https://CRAN.R-project.org/package=tidyr)

## tidyr

Restructuration de tableaux avec pivot_longer, pivot_wider et unnest.Documentation externe [TID ](https://CRAN.R-project.org/package=tidytext)

## tidytext

Traitement du texte sous forme de données tidy.Documentation externe [![Logo hexagonal du package tidyverse](assets/img/packages/tidyverse.png) ](https://CRAN.R-project.org/package=tidyverse)

## tidyverse

Écosystème central pour importer, transformer et visualiser des données.Documentation externe [TIT ](https://CRAN.R-project.org/package=titanic)

## titanic

Jeu de données Titanic utilisé pour pratiquer les variables catégorielles.Documentation externe

ULA

## UlavalSSD

Package de données et exemples utilisé dans les premiers modules du cours.Documentation locale ou à préciser

[UNV ](https://CRAN.R-project.org/package=unvotes)

## unvotes

Votes des Nations Unies pour pratiquer les jointures et les regroupements.Documentation externe [VIR ](https://CRAN.R-project.org/package=viridis)

## viridis

Palettes de couleurs adaptées aux graphiques statistiques.Documentation externe

WEA

## weathercan

Téléchargement et manipulation de données météorologiques canadiennes.Documentation locale ou à préciser

[WOR ](https://CRAN.R-project.org/package=wordcloud)

## wordcloud

Nuages de mots mentionnés dans le module 10.Documentation externe [WOR ](https://CRAN.R-project.org/package=wordcloud2)

## wordcloud2

[Option mentionnée pour produire des nuages de mots interactifs.Documentation externe](https://CRAN.R-project.org/package=wordcloud2)
