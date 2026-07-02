# Aventure 8 - Données ouvertes du Québec

STT-1100 Introduction à la science des données

# Mise en situation : Plongez dans la peau d’un·e consultant·e freelance

Vous travaillez comme **freelancer** en science des données. À la différence d’un poste salarié, vous êtes mandaté·e ponctuellement par des client·e·s pour résoudre des problèmes spécifiques. Vous devez être autonome, rigoureux·se et capable de livrer des solutions efficaces, réutilisables et bien documentées.

Les consultant·e·s freelance sont souvent appelés pour leur capacité à débloquer des projets rapidement et efficacement. Ils livrent des outils bien documentés, testables, et faciles à maintenir par leurs client·e·s. La clarté du code, le respect des standards et l’éthique sont donc des éléments clés de leur pratique.

Aujourd’hui, vous êtes engagé·e par **Marie-Pier**, directrice de recherche à l’Institut québécois pour les données durables. Elle souhaite explorer le portail [donnéesquebec.ca](https://www.donneesquebec.ca) pour identifier les jeux de données les plus récents et pertinents pour ses projets. Votre mission : **concevoir un outil de scraping fiable** pour extraire les titres, producteurs et catégories de jeux de données, tout en respectant les bonnes pratiques éthiques.

> **NOTE:**
>
> **Votre interlocutrice : Marie-Pier**
> Elle vous accompagne tout au long de cette aventure : elle posera des questions clés, vérifiera vos résultats, et vous aidera à affiner vos livrables.

## Objectifs de l’aventure

- Comprendre les bases du web scraping avec `rvest`.
- Créer une fonction pour extraire des métadonnées depuis une page web.
- Automatiser l’extraction sur plusieurs pages.
- Explorer les tendances dans les données ouvertes du Québec.
- Évaluer la faisabilité éthique et technique du scraping sur d’autres sites web.

------------------------------------------------------------------------

# Prérequis

> **IMPORTANT:**
>
> *« Que peut-on légalement extraire de ce portail ? Le scraping est-il autorisé ici ? »*

Pour répondre à cette question, nous allons d’abord consulter le fichier `robots.txt` du site. Ce fichier indique les règles que les robots d’indexation (et donc de scraping) doivent suivre.

``` r
# Affichez le robots.txt
robots <- safe_read_lines(
  "https://www.donneesquebec.ca/robots.txt",
  fallback = c(
    "User-agent: *",
    "Disallow: /api/",
    "Disallow: /dataset/rate/"
  )
)
cat("\nContenu du fichier robots.txt :\n")
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
# Analyse rapide
disinstructions <- robots[grepl("^Disallow", robots)]
cat("\n\nChemins interdits aux robots :\n")
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

``` r
# Note éthique
cat("\n\nNote :\nLes jeux de données publics listés dans les pages de résultat ne sont pas explicitement restreints.\nLe scraping des pages principales de recherche est donc permis, tant qu'on évite les chemins /api/, /dataset/rate/, etc.\n")
```



    Note :
    Les jeux de données publics listés dans les pages de résultat ne sont pas explicitement restreints.
    Le scraping des pages principales de recherche est donc permis, tant qu'on évite les chemins /api/, /dataset/rate/, etc.

# Comprendre le web scraping avec `rvest`

Dans cette section, vous découvrirez les fonctions essentielles du package `rvest`. Votre objectif : apprendre à extraire du contenu HTML structuré depuis un site web.

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

Marie-Pier vous demande :

> **IMPORTANT:**
>
> *« Peux-tu me montrer à quoi ressemble la structure de cette page ? Est-ce que tu peux repérer un élément intéressant ? »*

On peut maintenant cibler les éléments HTML avec `html_nodes()` (ou `html_elements()` dans les versions récentes) :

``` r
blocs <- html_nodes(page, ".dataset-content")
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

Pour extraire du texte d’un nœud HTML :

``` r
html_text(blocs[[1]])
```

    [1] "\n        \n  \n    \n    \n      \n    \n    \n      Prévisions hydrologiques des débits et niveaux de cours d’eau du Québec méridional\n    \n    \n      \n      \n\n    \n  \n  \n  \n\n  \n  \n  \n  \n  \n    \n      \n  \n \n  \n  \n\n\n        \n  \n  \n    Organisation : Ministère de l’Environnement, de la Lutte contre les changements climatiques, de la Faune et des Parcs\n  \n  \n  \n     Le ministère de l’Environnement, de la Lutte contre les changements climatiques, de la Faune et des Parcs (MELCCFP) développe et exploite un système de prévision du niveau et du... \n  \n\n      "

Maintenant, testons l’extraction du **titre** :

``` r
html_nodes(blocs[[1]], ".dataset-heading a") %>% html_text(trim = TRUE)
```

    [1] "Prévisions hydrologiques des débits et niveaux de cours d’eau du Québec méridional"

Et pour les **producteurs** ? Il faut repérer une sous-structure contenant l’information :

``` r
orgs <- html_nodes(blocs[[1]], ".dqc-org-cat") %>% html_text(trim = TRUE)
orgs
```

    [1] "Organisation : Ministère de l’Environnement, de la Lutte contre les changements climatiques, de la Faune et des Parcs"
    [2] ""

On peut filtrer le bon élément avec `grepl()` puis nettoyer la chaîne avec `gsub()` :

``` r
org <- orgs[grepl("^Organisation", orgs)][1]
org_clean <- gsub("^Organisation : ", "", org)
org_clean
```

    [1] "Ministère de l’Environnement, de la Lutte contre les changements climatiques, de la Faune et des Parcs"

> **TIP:**
>
> **Pourquoi utiliser `map_chr()` ?**
> `map_chr()` appartient au package **purrr**, qui fait partie du `tidyverse`. Cette fonction permet d’appliquer une fonction à chaque élément d’une liste (ici chaque bloc HTML), et de retourner un vecteur de caractères. C’est parfait lorsqu’on veut une valeur texte par bloc.
>
> > Exemple :
> >
> > ``` r
> > producteurs <- map_chr(blocs, function(bloc) {
> >   orgs <- html_nodes(bloc, ".dqc-org-cat") %>% html_text(trim = TRUE)
> >   org <- orgs[grepl("^Organisation", orgs)][1]
> >   gsub("^Organisation : ", "", org)
> > })
> > ```

> **TIP:**
>
> **À vous de jouer** : À partir de ce même bloc HTML, trouvez comment extraire : - les **catégories** associées à chaque jeu de données

------------------------------------------------------------------------

# Création guidée de la fonction `scrape_page()`

Marie-Pier souhaite que vous créiez une fonction réutilisable nommée `scrape_page()` qui prend en argument une URL et retourne un `data.frame` avec les colonnes : `titre`, `producteur`, `categorie`.

Voici un squelette à compléter :

``` r
scrape_page <- function(url) {
  # Lire le contenu HTML de la page
  page <- read_html(url)

  # Sélectionner les blocs de résultats individuels
  blocs <- html_nodes(page, ".dataset-content")

  # Titre (déjà fait pour vous)
  titres <- html_nodes(blocs, ".dataset-heading a") %>% html_text(trim = TRUE)

  # Producteur (à compléter)
  producteurs <- map_chr(blocs, function(bloc) {
    # ... votre code ici ...
  })

  # Catégorie (à compléter)
  categories <- map_chr(blocs, function(bloc) {
    # ... votre code ici ...
  })

  # Créer un data.frame standard
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
> **Testez votre fonction avec la page 3** : elle devrait retourner les 20 jeux de données de cette page.

------------------------------------------------------------------------

# Répétition manuelle, puis boucle `for`

Testez maintenant l’extraction des **5 premières pages** en appelant plusieurs fois votre fonction :

``` r
# Exemple manuel (à compléter)
p1 <- scrape_page("...")
p2 <- scrape_page("...")
# etc.
```

> **TIP:**
>
> **Marie-Pier** : « Est-ce que tu as remarqué ce qui change dans l’URL à chaque fois ? Peux-tu généraliser ce comportement ? »

Rappel du **module 1** : une boucle permet d’automatiser un comportement répétitif. Voici un début de boucle `for` à compléter :

``` r
resultats <- data.frame()

for (i in 1:5) {
  # Construire l'URL ici
  url <- "..."

  cat("Page", i, "en cours...\n")
  page_data <- scrape_page(url)

  resultats <- bind_rows(resultats, page_data)
  Sys.sleep(1)
}
```

------------------------------------------------------------------------

# Exploration guidée par Marie-Pier

Utilisez le tableau `resultats` pour répondre aux questions de votre cliente. Elle attend de vous des résultats précis, illustrés si nécessaire.

> **IMPORTANT:**
>
> 1.  Quelles sont les catégories de jeux de données les plus fréquentes ?
> 2.  Quels organismes publient le plus ?
> 3.  Observe-t-on une diversité de domaines ou une concentration sur quelques thèmes ?

------------------------------------------------------------------------

# Réflexion éthique

> **NOTE:**
>
> Rendez compte brièvement :
>
> - Le site Données Québec permet-il explicitement le scraping ?
> - Quels comportements avez-vous adoptés pour rester respectueux ?
> - Choisissez **deux autres sites web** (ex: bonjourquebec.com, ulaval.ca) et vérifiez si le scraping semble autorisé ou non. Appuyez-vous sur les fichiers `robots.txt` ou les conditions d’utilisation.

------------------------------------------------------------------------

# Défi à remettre

Vous devez remettre un **fichier `IDUL.R`** contenant votre fonction `scrape_page()`.

- Ce fichier doit être placé dans votre dépôt GitHub à l’endroit indiqué.
- Nous testerons automatiquement votre fonction avec plusieurs pages.

Bonne chance — soyez rigoureux dans la conception de votre fonction !

------------------------------------------------------------------------

# Conclusion de l’aventure

Vous avez conçu un outil de scraping fonctionnel et automatisé, utilisé une boucle `for`, extrait des métadonnées structurées, et approfondi votre compréhension de l’éthique du scraping.

Bravo, consultant·e !
