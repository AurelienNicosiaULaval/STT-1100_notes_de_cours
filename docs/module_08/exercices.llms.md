# Module 8 - Exercices

STT-1100 Introduction à la science des données

## Exercices de consolidation

Ces exercices sont indépendants de l’aventure et du défi. Ils servent à consolider les gestes techniques du module 8: lire une page HTML, cibler des éléments avec des sélecteurs CSS, transformer une extraction en fonction, automatiser une extraction répétée et documenter les limites d’une collecte.

Les pages HTML utilisées ici sont fictives et locales. Elles ne dépendent d’aucun site web externe.

``` r
library(tidyverse)
library(rvest)
library(purrr)
```

## Lectures à revoir

- [R for Data Science - Web scraping](https://r4ds.hadley.nz/webscraping.html)
- [R for Data Science - Functions](https://r4ds.hadley.nz/functions.html)
- [R for Data Science - Iteration](https://r4ds.hadley.nz/iteration.html)
- [Documentation officielle de rvest](https://rvest.tidyverse.org/)
- [MDN - robots.txt](https://developer.mozilla.org/en-US/docs/Glossary/Robots.txt)
- [Google Search Central - Introduction to robots.txt](https://developers.google.com/search/docs/crawling-indexing/robots/intro)

Après les lectures, faites aussi le [mini-test formatif](../module_08/mini_test.llms.md). Il n’est pas noté.

## Bloc A - Lire une page HTML locale

### Exercice 1 - Importer une page HTML

Lisez `catalogue_donnees_fictif.html` avec `read_html()`. Repérez les cartes de jeux de données avec le sélecteur `.dataset-card`.

> **NOTE:**
>
> ``` r
> page_catalogue <- read_html("data/catalogue_donnees_fictif.html")
>
> cartes <- page_catalogue |>
>   html_elements(".dataset-card")
>
> length(cartes)
> ```
>
>     [1] 5
>
> ``` r
> cartes[[1]]
> ```
>
>     {html_node}
>     <article class="dataset-card">
>     [1] <h2 class="dataset-title">Comptages cyclistes mensuels</h2>
>     [2] <p class="dataset-producer">Ville fictive de Saint-Laurent</p>
>     [3] <p class="dataset-category">Transport</p>
>     [4] <p class="dataset-updated">2026-01-15</p>

### Exercice 2 - Extraire un premier vecteur

Extrayez les titres des jeux de données avec le sélecteur `.dataset-title`.

> **NOTE:**
>
> ``` r
> titres <- cartes |>
>   html_element(".dataset-title") |>
>   html_text2()
>
> titres
> ```
>
>     [1] "Comptages cyclistes mensuels"      "Inventaire des arbres publics"
>     [3] "Permis de construction anonymises" "Qualite de l'air par secteur"
>     [5] "Frequentation des bibliotheques"

### Exercice 3 - Construire un tableau

Extrayez les producteurs, les catégories et les dates de mise à jour. Combinez le tout dans un tibble.

> **NOTE:**
>
> ``` r
> catalogue <- tibble(
>   titre = html_element(cartes, ".dataset-title") |> html_text2(),
>   producteur = html_element(cartes, ".dataset-producer") |> html_text2(),
>   categorie = html_element(cartes, ".dataset-category") |> html_text2(),
>   date_mise_a_jour = html_element(cartes, ".dataset-updated") |>
>     html_text2() |>
>     as.Date()
> )
>
> catalogue
> ```
>
>     # A tibble: 5 × 4
>       titre                             producteur        categorie date_mise_a_jour
>       <chr>                             <chr>             <chr>     <date>
>     1 Comptages cyclistes mensuels      Ville fictive de… Transport 2026-01-15
>     2 Inventaire des arbres publics     Service fictif d… Environn… 2026-01-22
>     3 Permis de construction anonymises Direction fictiv… Urbanisme 2026-02-02
>     4 Qualite de l'air par secteur      Observatoire fic… Environn… 2026-02-08
>     5 Frequentation des bibliotheques   Reseau fictif de… Culture   2026-02-12

## Bloc B - Transformer l’extraction en fonction

### Exercice 4 - Créer une fonction auxiliaire

Créez une fonction `extraire_texte()` qui reçoit un noeud HTML et un sélecteur CSS, puis retourne le texte correspondant. Si l’élément manque, la fonction doit retourner `NA_character_`.

> **NOTE:**
>
> ``` r
> extraire_texte <- function(noeud, selecteur) {
>   element <- html_element(noeud, selecteur)
>   texte <- html_text2(element)
>
>   if (length(texte) == 0 || is.na(texte) || !nzchar(texte)) {
>     return(NA_character_)
>   }
>
>   texte
> }
>
> extraire_texte(cartes[[1]], ".dataset-title")
> ```
>
>     [1] "Comptages cyclistes mensuels"
>
> ``` r
> extraire_texte(cartes[[1]], ".champ-inexistant")
> ```
>
>     [1] NA

### Exercice 5 - Créer une fonction d’extraction

Écrivez une fonction `extraire_catalogue(fichier)` qui lit une page HTML locale et retourne un tibble avec les colonnes `titre`, `producteur`, `categorie`, `date_mise_a_jour`.

> **NOTE:**
>
> ``` r
> extraire_catalogue <- function(fichier) {
>   page <- read_html(fichier)
>   cartes <- html_elements(page, ".dataset-card")
>
>   tibble(
>     titre = map_chr(cartes, extraire_texte, ".dataset-title"),
>     producteur = map_chr(cartes, extraire_texte, ".dataset-producer"),
>     categorie = map_chr(cartes, extraire_texte, ".dataset-category"),
>     date_mise_a_jour = map_chr(cartes, extraire_texte, ".dataset-updated") |>
>       as.Date()
>   )
> }
>
> extraire_catalogue("data/catalogue_donnees_fictif.html")
> ```
>
>     # A tibble: 5 × 4
>       titre                             producteur        categorie date_mise_a_jour
>       <chr>                             <chr>             <chr>     <date>
>     1 Comptages cyclistes mensuels      Ville fictive de… Transport 2026-01-15
>     2 Inventaire des arbres publics     Service fictif d… Environn… 2026-01-22
>     3 Permis de construction anonymises Direction fictiv… Urbanisme 2026-02-02
>     4 Qualite de l'air par secteur      Observatoire fic… Environn… 2026-02-08
>     5 Frequentation des bibliotheques   Reseau fictif de… Culture   2026-02-12

### Exercice 6 - Tester une page irrégulière

Utilisez la même fonction sur `catalogue_irregulier_fictif.html`. Quelles valeurs manquent?

> **NOTE:**
>
> ``` r
> catalogue_irregulier <- extraire_catalogue("data/catalogue_irregulier_fictif.html")
>
> catalogue_irregulier
> ```
>
>     # A tibble: 4 × 4
>       titre                          producteur           categorie date_mise_a_jour
>       <chr>                          <chr>                <chr>     <date>
>     1 Stations de recharge publiques Bureau fictif de la… Transport 2026-03-01
>     2 Subventions communautaires     <NA>                 Administ… 2026-03-04
>     3 Espaces publics accessibles    Service fictif de l… <NA>      2026-03-08
>     4 Travaux routiers planifies     Direction fictive d… Transport 2026-03-12
>
> ``` r
> catalogue_irregulier |>
>   summarise(
>     producteurs_manquants = sum(is.na(producteur)),
>     categories_manquantes = sum(is.na(categorie))
>   )
> ```
>
>     # A tibble: 1 × 2
>       producteurs_manquants categories_manquantes
>                       <int>                 <int>
>     1                     1                     1
>
> La fonction ne s’arrête pas lorsqu’un champ manque. Elle retourne `NA`, ce qui permet de diagnostiquer le problème dans un tableau.

### Exercice 7 - Automatiser sur plusieurs pages

Utilisez `purrr::imap_dfr()` pour appliquer `extraire_catalogue()` aux deux pages de catalogue et ajouter une colonne `source`.

> **NOTE:**
>
> ``` r
> fichiers_catalogue <- c(
>   regulier = "data/catalogue_donnees_fictif.html",
>   irregulier = "data/catalogue_irregulier_fictif.html"
> )
>
> catalogues_combines <- imap_dfr(
>   fichiers_catalogue,
>   function(fichier, source) {
>     extraire_catalogue(fichier) |>
>       mutate(source = source, .before = 1)
>   }
> )
>
> catalogues_combines
> ```
>
>     # A tibble: 9 × 5
>       source     titre                         producteur categorie date_mise_a_jour
>       <chr>      <chr>                         <chr>      <chr>     <date>
>     1 regulier   Comptages cyclistes mensuels  Ville fic… Transport 2026-01-15
>     2 regulier   Inventaire des arbres publics Service f… Environn… 2026-01-22
>     3 regulier   Permis de construction anony… Direction… Urbanisme 2026-02-02
>     4 regulier   Qualite de l'air par secteur  Observato… Environn… 2026-02-08
>     5 regulier   Frequentation des bibliotheq… Reseau fi… Culture   2026-02-12
>     6 irregulier Stations de recharge publiqu… Bureau fi… Transport 2026-03-01
>     7 irregulier Subventions communautaires    <NA>       Administ… 2026-03-04
>     8 irregulier Espaces publics accessibles   Service f… <NA>      2026-03-08
>     9 irregulier Travaux routiers planifies    Direction… Transport 2026-03-12

## Bloc C - Sobriété et éthique de collecte

### Exercice 8 - Interpréter un `robots.txt`

Voici un exemple fictif de fichier `robots.txt`.

``` r
robots_exemple <- c(
  "User-agent: *",
  "Disallow: /admin/",
  "Disallow: /api/privee/",
  "Crawl-delay: 1"
)

writeLines(robots_exemple)
```

    User-agent: *
    Disallow: /admin/
    Disallow: /api/privee/
    Crawl-delay: 1

Identifiez les chemins à éviter et expliquez pourquoi ce fichier ne constitue pas une autorisation complète de collecte.

> **NOTE:**
>
> ``` r
> chemins_interdits <- robots_exemple |>
>   str_subset("^Disallow:") |>
>   str_remove("^Disallow:\\s*")
>
> chemins_interdits
> ```
>
>     [1] "/admin/"      "/api/privee/"
>
> `robots.txt` donne des consignes techniques aux robots. Il ne remplace pas les conditions d’utilisation, le jugement éthique, la prudence sur la charge serveur ou une autorisation écrite lorsque la collecte et la redistribution sont sensibles.

## Étude de cas 1 - Catalogue municipal fictif

Une municipalité fictive vous demande de produire un court résumé des jeux de données visibles dans son mini-catalogue.

### Exercice 9 - Résumer les catégories

À partir des deux pages de catalogue combinées, calculez le nombre de jeux de données par catégorie.

> **NOTE:**
>
> ``` r
> resume_categories <- catalogues_combines |>
>   mutate(categorie = replace_na(categorie, "Non indiquee")) |>
>   count(categorie, sort = TRUE)
>
> resume_categories
> ```
>
>     # A tibble: 6 × 2
>       categorie          n
>       <chr>          <int>
>     1 Transport          3
>     2 Environnement      2
>     3 Administration     1
>     4 Culture            1
>     5 Non indiquee       1
>     6 Urbanisme          1

### Exercice 10 - Produire une note de collecte

Écrivez trois phrases qui expliquent ce que votre code collecte, comment il limite les risques et ce qu’il faudrait vérifier avant de l’appliquer à un vrai site.

> **NOTE:**
>
> Le code lit seulement des pages HTML locales préparées pour l’exercice et extrait des champs publics agrégés. Dans un vrai contexte, il faudrait limiter le nombre de pages, ajouter des pauses entre les requêtes et éviter toute collecte massive ou contourner des protections. Il faudrait aussi vérifier `robots.txt`, les conditions d’utilisation, la licence des données et les règles de redistribution avant de publier une table dérivée.

## Étude de cas 2 - Page d’événements publics

Une association fictive publie une petite page d’événements. Vous voulez extraire les titres, les dates, les lieux et les thèmes pour produire un calendrier.

### Exercice 11 - Extraire les événements

Créez une fonction `extraire_evenements(fichier)` qui retourne un tibble avec les colonnes `titre`, `date`, `lieu`, `theme`.

> **NOTE:**
>
> ``` r
> extraire_evenements <- function(fichier) {
>   page <- read_html(fichier)
>   evenements <- html_elements(page, ".event-card")
>
>   tibble(
>     titre = map_chr(evenements, extraire_texte, ".event-title"),
>     date = html_element(evenements, ".event-date") |>
>       html_attr("datetime") |>
>       as.Date(),
>     lieu = map_chr(evenements, extraire_texte, ".event-location"),
>     theme = map_chr(evenements, extraire_texte, ".event-theme")
>   )
> }
>
> evenements <- extraire_evenements("data/evenements_publics_fictif.html")
>
> evenements
> ```
>
>     # A tibble: 4 × 4
>       titre                            date       lieu                     theme
>       <chr>                            <date>     <chr>                    <chr>
>     1 Atelier de donnees ouvertes      2026-02-18 Bibliotheque centrale    Numerique
>     2 Consultation sur la mobilite     2026-02-24 Maison citoyenne         Transport
>     3 Rencontre climat quartier        2026-03-03 Centre communautaire Est Environn…
>     4 Formation cartographie citoyenne 2026-03-10 Laboratoire urbain       Numerique

### Exercice 12 - Vérifier le résultat

Produisez un résumé du nombre d’événements par thème et formulez une vérification simple qui pourrait servir de test.

> **NOTE:**
>
> ``` r
> evenements |>
>   count(theme, sort = TRUE)
> ```
>
>     # A tibble: 3 × 2
>       theme             n
>       <chr>         <int>
>     1 Numerique         2
>     2 Environnement     1
>     3 Transport         1
>
> ``` r
> stopifnot(
>   nrow(evenements) == 4,
>   identical(names(evenements), c("titre", "date", "lieu", "theme")),
>   all(!is.na(evenements$titre))
> )
> ```
>
> Ces tests sont simples, mais ils détectent déjà des erreurs fréquentes: mauvais nombre de lignes, colonnes mal nommées ou titres non extraits.
