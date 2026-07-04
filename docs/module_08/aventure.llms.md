# Aventure 8 - Données ouvertes du Québec

STT-1100 Introduction à la science des données

# Mise en situation

Vous travaillez comme consultant ou consultante indépendante en science des données. À la différence d’un poste salarié, vous êtes mandaté ponctuellement par des clientes et clients pour résoudre des problèmes précis. Vous devez donc être autonome, rigoureux et capable de livrer des solutions efficaces, réutilisables et bien documentées.

Aujourd’hui, vous êtes engagé par Marie-Pier, directrice de recherche à l’Institut québécois pour les données durables. Elle souhaite explorer le portail [Données Québec](https://www.donneesquebec.ca) pour repérer des jeux de données récents et pertinents. Votre mission consiste à concevoir un outil de scraping fiable pour extraire les titres, producteurs et catégories des jeux de données, tout en respectant les bonnes pratiques techniques et éthiques.

> **NOTE:**
>
> Votre interlocutrice : Marie-Pier
>
> Elle vous accompagne tout au long de cette aventure. Elle pose des questions clés, vérifie vos résultats et vous aide à clarifier vos livrables.

Carte de visite

Votre rôle Consultant·e indépendant·e en science des données

Interlocutrice Marie-Pier

Organisation et contexte Institut québécois pour les données durables

Mission Créer un outil de scraping robuste, testable et respectueux

Données Page Données Québec ou petite page HTML locale de test

Livrable `IDUL.R` avec `scrape_page()`

## Objectifs de l’aventure

- Comprendre les bases du web scraping avec `rvest`.
- Créer une fonction pour extraire des métadonnées depuis une page web.
- Automatiser l’extraction sur plusieurs pages.
- Explorer les tendances dans les données ouvertes du Québec.
- Évaluer les limites éthiques et techniques d’une collecte automatisée.

> **NOTE:**
>
> - Vous lisez la structure d’une page web comme une source de données.
> - Vous transformez une extraction manuelle en fonction réutilisable.
> - Vous testez votre fonction sur une page locale pour rester indépendant·e des changements du portail.
> - Vous reliez le code à des limites éthiques : `robots.txt`, conditions d’utilisation et charge serveur.

# Avant de scraper : vérifier le contexte

> **IMPORTANT:**
>
> *Que peut-on extraire de ce portail? Le scraping est-il raisonnable ici?*

Un premier réflexe consiste à consulter le fichier `robots.txt`. Ce fichier indique les chemins qu’un site demande aux robots d’éviter. Il ne remplace pas les conditions d’utilisation, le jugement éthique, ni le respect de la charge serveur, mais il donne un signal utile avant d’automatiser une collecte.

``` r
robots <- safe_read_lines(
  "https://www.donneesquebec.ca/robots.txt",
  fallback = c(
    "User-agent: *",
    "Disallow: /api/",
    "Disallow: /dataset/rate/"
  )
)

cat("Contenu du fichier robots.txt :\n")
```

    Contenu du fichier robots.txt :

``` r
writeLines(robots)
```

    User-agent: *
    Disallow: /wp-admin/
    Allow: /wp-admin/admin-ajax.php
    Disallow: /recherche/dataset/*?
    Disallow: /recherche/organization/*?
    Disallow: /recherche/group/*?
    Disallow: /recherche/dataset/rate/
    Disallow: /recherche/revision/
    Disallow: /recherche/dataset/*/history
    Disallow: /recherche/api/
    Disallow: /api/
    Crawl-Delay: 10

``` r
disinstructions <- robots[grepl("^Disallow", robots)]

cat("\nChemins interdits aux robots :\n")
```


    Chemins interdits aux robots :

``` r
writeLines(disinstructions)
```

    Disallow: /wp-admin/
    Disallow: /recherche/dataset/*?
    Disallow: /recherche/organization/*?
    Disallow: /recherche/group/*?
    Disallow: /recherche/dataset/rate/
    Disallow: /recherche/revision/
    Disallow: /recherche/dataset/*/history
    Disallow: /recherche/api/
    Disallow: /api/

> **WARNING:**
>
> Un `robots.txt` qui n’interdit pas explicitement une page ne signifie pas que tout est automatiquement acceptable. Pour ce module, nous limiterons la collecte à quelques pages de résultats publiques, avec une pause entre les requêtes et sans contourner de mécanisme de protection.

# Comprendre le web scraping avec `rvest`

Dans cette section, vous découvrez les fonctions essentielles du package `rvest`. L’objectif est d’extraire du contenu HTML structuré depuis une page de recherche.

``` r
url <- "https://www.donneesquebec.ca/recherche/?sort=metadata_modified+desc&page=1"
page <- safe_read_html(url)
page
```

    {html_document}
    <html lang="fr">
    [1] <head>\n<meta http-equiv="Content-Type" content="text/html; charset=UTF-8 ...
    [2] <body data-site-root="https://www.donneesquebec.ca/recherche/" data-local ...

La fonction `read_html()` télécharge et convertit la page web pour en permettre la manipulation.

> **IMPORTANT:**
>
> *Peux-tu me montrer à quoi ressemble la structure de cette page? Est-ce que tu peux repérer un élément intéressant?*

On peut maintenant cibler les éléments HTML avec `html_elements()` :

``` r
blocs <- html_elements(page, ".dataset-content")
length(blocs)
```

    [1] 20

``` r
blocs[[1]]
```

    {html_node}
    <div class="dataset-content">
    [1] <h3 class="dataset-heading short">\n    \n    \n      \n    \n    \n      ...
    [2] <div class="dqc_donne_spat">\n      <img src="/recherche/images/2_icone_g ...
    [3] <div class="dqc-org-cat">\n    Organisation : <a href="/recherche/organiz ...
    [4] <div class="dqc-org-cat"></div>
    [5] <div class="dqc-notes"> Le ministère de l’Environnement, de la Lutte cont ...

Pour extraire le texte d’un élément HTML :

``` r
html_text2(blocs[[1]])
```

    [1] "Prévisions hydrologiques des débits et niveaux de cours d’eau du Québec méridional\nOrganisation : Ministère de l’Environnement, de la Lutte contre les changements climatiques, de la Faune et des Parcs\nLe ministère de l’Environnement, de la Lutte contre les changements climatiques, de la Faune et des Parcs (MELCCFP) développe et exploite un système de prévision du niveau et du..."

Maintenant, testons l’extraction du titre :

``` r
html_elements(blocs[[1]], ".dataset-heading a") |>
  html_text2()
```

    [1] "Prévisions hydrologiques des débits et niveaux de cours d’eau du Québec méridional"

Et pour le producteur? Il faut repérer une sous-structure contenant l’information :

``` r
infos <- html_elements(blocs[[1]], ".dqc-org-cat") |>
  html_text2()

infos
```

    [1] "Organisation : Ministère de l’Environnement, de la Lutte contre les changements climatiques, de la Faune et des Parcs"
    [2] ""

On peut filtrer le bon élément avec `grepl()` puis nettoyer la chaîne avec `sub()` :

``` r
producteur <- extraire_valeur(
  infos,
  "^(Organisation|Organisme|Producteur|Producer|Organization)\\s*:?\\s*"
)

producteur
```

    [1] "Ministère de l’Environnement, de la Lutte contre les changements climatiques, de la Faune et des Parcs"

> **TIP:**
>
> Pourquoi utiliser `map_chr()`?
>
> `map_chr()` appartient au package `purrr`, qui fait partie du `tidyverse`. Cette fonction applique une fonction à chaque élément d’une liste et retourne un vecteur de caractères. C’est exactement ce qu’il faut lorsqu’on veut une valeur texte par bloc HTML.
>
> ``` r
> producteurs <- map_chr(blocs, function(bloc) {
>   infos <- html_elements(bloc, ".dqc-org-cat") |>
>     html_text2()
>
>   extraire_valeur(
>     infos,
>     "^(Organisation|Organisme|Producteur|Producer|Organization)\\s*:?\\s*"
>   )
> })
> ```

> **TIP:**
>
> À vous de jouer : à partir de ce même bloc HTML, trouvez comment extraire les catégories associées à chaque jeu de données. Attention, le libellé observé peut être `Catégorie`, `Catégories`, `Category` ou `Categories`.

# Création guidée de la fonction `scrape_page()`

Marie-Pier souhaite que vous créiez une fonction réutilisable nommée `scrape_page()`. Elle prend en argument une URL et retourne un `data.frame` avec exactement les colonnes suivantes :

- `titre`;
- `producteur`;
- `categorie`.

Ces noms de colonnes seront utilisés dans les tests automatiques.

> **NOTE:**
>
> Le dépôt template contient une petite page HTML locale pour tester la fonction même si le portail change ou si le réseau est indisponible. Votre fonction doit donc fonctionner avec une page publique et avec cette source locale, sans changer le contrat de sortie.

Voici un squelette à compléter :

``` r
scrape_page <- function(url) {
  page <- rvest::read_html(url)

  blocs <- rvest::html_elements(page, ".dataset-content")

  titres <- rvest::html_elements(blocs, ".dataset-heading a") |>
    rvest::html_text2()

  producteurs <- purrr::map_chr(blocs, function(bloc) {
    infos <- rvest::html_elements(bloc, ".dqc-org-cat") |>
      rvest::html_text2()

    # Extraire l'organisation ou le producteur.
  })

  categories <- purrr::map_chr(blocs, function(bloc) {
    infos <- rvest::html_elements(bloc, ".dqc-org-cat") |>
      rvest::html_text2()

    # Extraire la catégorie ou les catégories.
  })

  data.frame(
    titre = titres,
    producteur = producteurs,
    categorie = categories,
    stringsAsFactors = FALSE
  )
}
```

> **NOTE:**
>
> Testez votre fonction avec la page 3. Elle devrait retourner 20 lignes et exactement les colonnes `titre`, `producteur`, `categorie`.

# Répétition manuelle, puis boucle `for`

Testez maintenant l’extraction des cinq premières pages en appelant plusieurs fois votre fonction :

``` r
p1 <- scrape_page("https://www.donneesquebec.ca/recherche/?sort=metadata_modified+desc&page=1")
p2 <- scrape_page("https://www.donneesquebec.ca/recherche/?sort=metadata_modified+desc&page=2")
```

> **TIP:**
>
> Marie-Pier : *Est-ce que tu as remarqué ce qui change dans l’URL à chaque fois? Peux-tu généraliser ce comportement?*

Rappel du module 1 : une boucle permet d’automatiser un comportement répétitif.

``` r
resultats <- data.frame()

for (i in 1:5) {
  url <- paste0(
    "https://www.donneesquebec.ca/recherche/?sort=metadata_modified+desc&page=",
    i
  )

  cat("Page", i, "en cours...\n")
  page_data <- scrape_page(url)

  resultats <- bind_rows(resultats, page_data)
  Sys.sleep(1)
}
```

# Exploration guidée par Marie-Pier

Utilisez le tableau `resultats` pour répondre aux questions de votre cliente. Elle attend des résultats précis et prudents.

> **IMPORTANT:**
>
> 1.  Quelles sont les catégories de jeux de données les plus fréquentes?
> 2.  Quels organismes publient le plus?
> 3.  Observe-t-on une diversité de domaines ou une concentration sur quelques thèmes?

# Réflexion éthique

> **NOTE:**
>
> Rendez compte brièvement :
>
> - ce que le fichier `robots.txt` indique;
> - les limites de cette vérification;
> - les comportements adoptés pour rester respectueux, par exemple limiter le nombre de pages, ajouter une pause et ne pas contourner de protection;
> - la situation de deux autres sites web, par exemple `bonjourquebec.com` ou `ulaval.ca`, en vous appuyant sur `robots.txt` ou les conditions d’utilisation.

# Défi à remettre

Le défi associé à cette aventure est décrit dans la page [Défi 8 - Fonction de scraping](../module_08/defi.llms.md).

Vous devrez remettre un fichier `IDUL.R` contenant votre fonction `scrape_page()`. Le dépôt de départ est le template GitHub `STT-1100/aventure-8`.

Trace portfolio

Gardez une trace qui prouve que votre fonction est robuste et responsable.

- le contrat de sortie de `scrape_page()`;
- un test réussi sur une page HTML locale;
- une note d’éthique sur `robots.txt`, la charge serveur et les conditions d’utilisation;
- une courte exploration des résultats, si une page publique est disponible.

# Conclusion de l’aventure

Vous avez conçu un outil de scraping fonctionnel et automatisable, utilisé une boucle `for`, extrait des métadonnées structurées et approfondi votre compréhension de l’éthique du scraping.
