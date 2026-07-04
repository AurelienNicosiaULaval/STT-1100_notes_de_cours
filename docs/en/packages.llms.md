R library

# Packages used in the course

This page gathers the R packages used or mentioned in the notes, exercises, adventures and scripts. It explains what each package is for and where it appears in the modules.

[By module](#by-module) [Library](#package-library) [Datasets](donnees.llms.md)

01

Import and clean

02

Transform and join

03

Visualize and communicate

04

Text, web and dashboards

## By module

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

[`tidyverse`](#tidyverse) [`dplyr`](#dplyr) [`ggplot2`](#ggplot2) [`readr`](#readr) [`tibble`](#tibble)

### Module 10

[`tidyverse`](#tidyverse) [`tidytext`](#tidytext) [`readr`](#readr) [`stringr`](#stringr) [`dplyr`](#dplyr) [`tibble`](#tibble) [`ggplot2`](#ggplot2) [`stopwords`](#stopwords) [`tidyr`](#tidyr) [`forcats`](#forcats) [`wordcloud`](#wordcloud) [`wordcloud2`](#wordcloud2) [`ggwordcloud`](#ggwordcloud) [`plotly`](#plotly) [`flexdashboard`](#flexdashboard) [`shiny`](#shiny)

## Package library

[BAB ](https://CRAN.R-project.org/package=babynames)

## babynames

First-name data used to practice joins and summaries.External documentation [COU ](https://CRAN.R-project.org/package=countrycode)

## countrycode

Country codes and correspondence tables for enriching international data.External documentation [![Hexagonal logo of the dplyr package](../assets/img/packages/dplyr.png) ](https://CRAN.R-project.org/package=dplyr)

## dplyr

Data manipulation with verbs such as filter, select, mutate and summarise.External documentation [FIV ](https://CRAN.R-project.org/package=fivethirtyeight)

## fivethirtyeight

Demonstration datasets from public articles and examples.External documentation [FLE ](https://CRAN.R-project.org/package=flexdashboard)

## flexdashboard

HTML dashboards with R Markdown.External documentation [FOR ](https://CRAN.R-project.org/package=forcats)

## forcats

Factor manipulation and category ordering.External documentation [GAP ](https://CRAN.R-project.org/package=gapminder)

## gapminder

Country-year data used to practice joins and grouped summaries.External documentation [GGC ](https://CRAN.R-project.org/package=ggcorrplot)

## ggcorrplot

Visualization of correlation matrices.External documentation [![Hexagonal logo of the ggplot2 package](../assets/img/packages/ggplot2.png) ](https://CRAN.R-project.org/package=ggplot2)

## ggplot2

Statistical visualization with the grammar of graphics.External documentation [GGP ](https://CRAN.R-project.org/package=ggplot2movies)

## ggplot2movies

Movie data used to practice joins and comparisons.External documentation [GGW ](https://CRAN.R-project.org/package=ggwordcloud)

## ggwordcloud

Option mentioned for creating word clouds with ggplot2.External documentation [JAN ](https://CRAN.R-project.org/package=janitor)

## janitor

Column-name cleaning and quick table diagnostics.External documentation [JSO ](https://CRAN.R-project.org/package=jsonlite)

## jsonlite

Reading and transforming JSON files.External documentation [KNI ](https://CRAN.R-project.org/package=knitr)

## knitr

Executing code chunks and producing outputs in Quarto documents.External documentation [LAH ](https://CRAN.R-project.org/package=Lahman)

## Lahman

Baseball tables used to practice joins.External documentation [LEA ](https://CRAN.R-project.org/package=leaflet)

## leaflet

Interactive maps used to discuss individual location risks.External documentation [LUB ](https://CRAN.R-project.org/package=lubridate)

## lubridate

Manipulation of dates, months, years and time variables.External documentation [MES ](https://CRAN.R-project.org/package=messy)

## messy

Package used in a module 04 data preparation script.External documentation [NYC ](https://CRAN.R-project.org/package=nycflights23)

## nycflights23

Flight, carrier, airport and weather tables for New York in 2023.External documentation [PAL ](https://CRAN.R-project.org/package=palmerpenguins)

## palmerpenguins

Penguin datasets for exploration, charts and joins.External documentation [PAT ](https://CRAN.R-project.org/package=patchwork)

## patchwork

Combining several ggplot2 charts.External documentation [PLO ](https://CRAN.R-project.org/package=plotly)

## plotly

Interactive visualization mentioned for the module 10 dashboard.External documentation [PUR ](https://CRAN.R-project.org/package=purrr)

## purrr

Functional iteration and list processing.External documentation [REA ](https://CRAN.R-project.org/package=readr)

## readr

Importing CSV and delimited text files.External documentation [REA ](https://CRAN.R-project.org/package=readxl)

## readxl

Importing Excel files.External documentation [REM ](https://CRAN.R-project.org/package=remotes)

## remotes

Installing packages from GitHub or other development sources.External documentation [ROB ](https://CRAN.R-project.org/package=robotstxt)

## robotstxt

Programmatic checks of robots.txt instructions before automated collection.External documentation [RVE ](https://CRAN.R-project.org/package=rvest)

## rvest

Extracting data from HTML pages.External documentation [SCA ](https://CRAN.R-project.org/package=scales)

## scales

Labels, formats and scales for graphics.External documentation [SHI ](https://CRAN.R-project.org/package=shiny)

## shiny

Interactive applications and components in R.External documentation [SKI ](https://CRAN.R-project.org/package=skimr)

## skimr

Quick summaries of a table’s structure and variables.External documentation [STO ](https://CRAN.R-project.org/package=stopwords)

## stopwords

Stop-word lists for text processing.External documentation [STR ](https://CRAN.R-project.org/package=stringr)

## stringr

String manipulation.External documentation [TIB ](https://CRAN.R-project.org/package=tibble)

## tibble

Modern table creation and display in R.External documentation [TID ](https://CRAN.R-project.org/package=tidygeocoder)

## tidygeocoder

Geocoding addresses and postal codes.External documentation [TID ](https://CRAN.R-project.org/package=tidyr)

## tidyr

Reshaping tables with pivot_longer, pivot_wider and unnest.External documentation [TID ](https://CRAN.R-project.org/package=tidytext)

## tidytext

Text mining in tidy data format.External documentation [![Hexagonal logo of the tidyverse package](../assets/img/packages/tidyverse.png) ](https://CRAN.R-project.org/package=tidyverse)

## tidyverse

Core ecosystem for importing, transforming and visualizing data.External documentation [TIT ](https://CRAN.R-project.org/package=titanic)

## titanic

Titanic data used to practice categorical variables.External documentation

ULA

## UlavalSSD

Data and examples package used in the first course modules.Local documentation or to be specified

[UNV ](https://CRAN.R-project.org/package=unvotes)

## unvotes

United Nations votes used to practice joins and grouped summaries.External documentation [VIR ](https://CRAN.R-project.org/package=viridis)

## viridis

Color palettes adapted to statistical graphics.External documentation

WEA

## weathercan

Downloading and manipulating Canadian weather data.Local documentation or to be specified

[WOR ](https://CRAN.R-project.org/package=wordcloud)

## wordcloud

Word clouds mentioned in module 10.External documentation [WOR ](https://CRAN.R-project.org/package=wordcloud2)

## wordcloud2

[Option mentioned for producing interactive word clouds.External documentation](https://CRAN.R-project.org/package=wordcloud2)
