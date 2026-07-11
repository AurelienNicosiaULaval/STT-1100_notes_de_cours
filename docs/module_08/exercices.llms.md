# Module 8 - Exercices

STT-1100 Introduction à la science des données

## Exercices de consolidation

Ces exercices sont indépendants de l’aventure et du défi. Ils servent à consolider les gestes techniques du module 8: lire une page HTML, cibler des éléments avec des sélecteurs CSS, transformer une extraction en fonction, automatiser une extraction répétée et documenter les limites d’une collecte.

Les pages HTML utilisées ici sont des instantanés locaux de données québécoises réelles. Les deux catalogues proviennent de l’[API officielle de Données Québec](https://www.donneesquebec.ca/page-api/); la page d’événements est tirée du jeu [Événements - Système d’information touristique Québec](https://www.donneesquebec.ca/recherche/dataset/sit-quebec-evenements) du ministère du Tourisme. Les instantanés conservent les valeurs publiées, mais leur structure HTML est simplifiée pour rendre l’exercice stable et reproductible. Les métadonnées et les événements sont diffusés sous licence CC BY 4.0.

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

Lisez `catalogue_donnees_quebec.html` avec `read_html()`. Repérez les six cartes de jeux de données avec le sélecteur `.dataset-card`. Elles couvrent Québec, Gatineau, Sherbrooke, Trois-Rivières, Saguenay et Montréal.

> **NOTE:**
>
> ``` r
> page_catalogue <- read_html("data/catalogue_donnees_quebec.html")
>
> cartes <- page_catalogue |>
>   html_elements(".dataset-card")
>
> length(cartes)
> ```
>
>     [1] 6
>
> ``` r
> cartes[[1]]
> ```
>
>     {html_node}
>     <article class="dataset-card" data-source-url="https://www.donneesquebec.ca/recherche/dataset/vque_31">
>     [1] <h2 class="dataset-title">Arbres non-répertoriés</h2>
>     [2] <p class="dataset-producer">Ville de Québec</p>
>     [3] <p class="dataset-category">Environnement, ressources naturelles et énerg ...
>     [4] <p class="dataset-updated">2026-07-10</p>

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
>     [1] "Arbres non-répertoriés"
>     [2] "Pistes cyclables"
>     [3] "Milieux humides RCI"
>     [4] "Avis de grands travaux"
>     [5] "Chantiers - 511"
>     [6] "RSQA - indice de la qualité de l'air temps réel (quotidien)"

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
>     # A tibble: 6 × 4
>       titre                                    producteur categorie date_mise_a_jour
>       <chr>                                    <chr>      <chr>     <date>
>     1 Arbres non-répertoriés                   Ville de … Environn… 2026-07-10
>     2 Pistes cyclables                         Ville de … Infrastr… 2025-11-25
>     3 Milieux humides RCI                      Ville de … Environn… 2026-06-02
>     4 Avis de grands travaux                   Ville de … Infrastr… 2026-07-11
>     5 Chantiers - 511                          Ville de … Transport 2026-07-11
>     6 RSQA - indice de la qualité de l'air te… Ville de … Environn… 2026-07-11

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
>     [1] "Arbres non-répertoriés"
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
> extraire_catalogue("data/catalogue_donnees_quebec.html")
> ```
>
>     # A tibble: 6 × 4
>       titre                                    producteur categorie date_mise_a_jour
>       <chr>                                    <chr>      <chr>     <date>
>     1 Arbres non-répertoriés                   Ville de … Environn… 2026-07-10
>     2 Pistes cyclables                         Ville de … Infrastr… 2025-11-25
>     3 Milieux humides RCI                      Ville de … Environn… 2026-06-02
>     4 Avis de grands travaux                   Ville de … Infrastr… 2026-07-11
>     5 Chantiers - 511                          Ville de … Transport 2026-07-11
>     6 RSQA - indice de la qualité de l'air te… Ville de … Environn… 2026-07-11

### Exercice 6 - Tester une page irrégulière

Utilisez la même fonction sur `catalogue_donnees_quebec_irregulier.html`. Certaines fiches officielles ne sont associées à aucune catégorie dans le portail. Quelles valeurs manquent?

> **NOTE:**
>
> ``` r
> catalogue_irregulier <- extraire_catalogue("data/catalogue_donnees_quebec_irregulier.html")
>
> catalogue_irregulier
> ```
>
>     # A tibble: 4 × 4
>       titre                                    producteur categorie date_mise_a_jour
>       <chr>                                    <chr>      <chr>     <date>
>     1 Débits de circulation                    Ville de … <NA>      2025-11-20
>     2 Sondage de satisfaction auprès des cito… Ville de … <NA>      2026-04-07
>     3 Zones inondables                         Ville de … Environn… 2026-06-01
>     4 Sentiers pédestres                       Ville de … Tourisme… 2026-07-06
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
>     1                     0                     2
>
> La fonction ne s’arrête pas lorsqu’un champ manque. Elle retourne `NA`, ce qui permet de diagnostiquer le problème dans un tableau.

### Exercice 7 - Automatiser sur plusieurs pages

Utilisez `purrr::imap_dfr()` pour appliquer `extraire_catalogue()` aux deux pages de catalogue et ajouter une colonne `source`.

> **NOTE:**
>
> ``` r
> fichiers_catalogue <- c(
>   regulier = "data/catalogue_donnees_quebec.html",
>   irregulier = "data/catalogue_donnees_quebec_irregulier.html"
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
>     # A tibble: 10 × 5
>        source     titre                        producteur categorie date_mise_a_jour
>        <chr>      <chr>                        <chr>      <chr>     <date>
>      1 regulier   Arbres non-répertoriés       Ville de … Environn… 2026-07-10
>      2 regulier   Pistes cyclables             Ville de … Infrastr… 2025-11-25
>      3 regulier   Milieux humides RCI          Ville de … Environn… 2026-06-02
>      4 regulier   Avis de grands travaux       Ville de … Infrastr… 2026-07-11
>      5 regulier   Chantiers - 511              Ville de … Transport 2026-07-11
>      6 regulier   RSQA - indice de la qualité… Ville de … Environn… 2026-07-11
>      7 irregulier Débits de circulation        Ville de … <NA>      2025-11-20
>      8 irregulier Sondage de satisfaction aup… Ville de … <NA>      2026-04-07
>      9 irregulier Zones inondables             Ville de … Environn… 2026-06-01
>     10 irregulier Sentiers pédestres           Ville de … Tourisme… 2026-07-06

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

## Étude de cas 1 - Catalogue municipal québécois

Vous devez produire un court résumé de métadonnées publiées par plusieurs municipalités québécoises dans Données Québec.

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
>     # A tibble: 7 × 2
>       categorie                                                                    n
>       <chr>                                                                    <int>
>     1 Environnement, ressources naturelles et énergie                              3
>     2 Non indiquee                                                                 2
>     3 Environnement, ressources naturelles et énergie; Loi, justice et sécuri…     1
>     4 Infrastructures                                                              1
>     5 Infrastructures; Transport                                                   1
>     6 Tourisme, sports et loisirs                                                  1
>     7 Transport                                                                    1

### Exercice 10 - Produire une note de collecte

Écrivez trois phrases qui expliquent ce que votre code collecte, comment il limite les risques et ce qu’il faudrait vérifier avant de l’appliquer à un vrai site.

> **NOTE:**
>
> Le code lit seulement des pages HTML locales préparées pour l’exercice et extrait des champs publics agrégés. Dans un vrai contexte, il faudrait limiter le nombre de pages, ajouter des pauses entre les requêtes et éviter toute collecte massive ou contourner des protections. Il faudrait aussi vérifier `robots.txt`, les conditions d’utilisation, la licence des données et les règles de redistribution avant de publier une table dérivée.

## Étude de cas 2 - Page d’événements publics

Le ministère du Tourisme publie des événements du SIT Québec. L’instantané retient six événements annoncés à Gatineau, Montréal, Québec, Saguenay, Sherbrooke et Trois-Rivières. Vous voulez extraire les titres, les dates, les lieux et les types pour produire un calendrier.

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
> evenements <- extraire_evenements("data/evenements_sit_quebec.html")
>
> evenements
> ```
>
>     # A tibble: 6 × 4
>       titre                                                   date       lieu  theme
>       <chr>                                                   <date>     <chr> <chr>
>     1 Festival Parasol                                        2026-07-15 Gati… Fest…
>     2 Rendez-vous familial des pompiers et pompières de Mont… 2026-07-11 Mont… Fête…
>     3 L'Horizon de Khéops à Québec                            2026-07-15 Québ… Expé…
>     4 Festival International des Rythmes du Monde             2026-07-16 Sagu… Fest…
>     5 La Fête du Lac des Nations Promutuel Assurance          2026-07-14 Sher… Fest…
>     6 Rendez-vous des coureurs des bois de Trois-Rivières     2026-07-17 Troi… Fest…

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
>       theme                                 n
>       <chr>                             <int>
>     1 Festival                              4
>     2 Expérience multimédia / immersive     1
>     3 Fête populaire                        1
>
> ``` r
> stopifnot(
>   nrow(evenements) == 6,
>   identical(names(evenements), c("titre", "date", "lieu", "theme")),
>   all(!is.na(evenements$titre))
> )
> ```
>
> Ces tests sont simples, mais ils détectent déjà des erreurs fréquentes: mauvais nombre de lignes, colonnes mal nommées ou titres non extraits.
