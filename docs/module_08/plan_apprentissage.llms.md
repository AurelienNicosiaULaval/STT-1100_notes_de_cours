# Module 8 - Plan d’apprentissage

STT-1100 Introduction à la science des données

# Objectifs du module

À la fin de ce module, vous devriez être capable de :

- Extraire des données textuelles d’une page web en utilisant `rvest`.
- Automatiser des tâches répétitives à l’aide de boucles et de fonctions en R.
- Identifier les aspects éthiques liés à la collecte automatisée de données en ligne.

# Lectures

Pour vous préparer, consultez les ressources suivantes :

- [R for Data Science — Web scraping](https://r4ds.hadley.nz/webscraping.html)
- [robots.txt documentation (MDN)](https://developer.mozilla.org/en-US/docs/Glossary/Robots.txt)

# Aventure

Vous incarnez un·e **consultant·e freelance** engagé·e pour développer une fonction d’extraction automatisée de métadonnées à partir du portail Données Québec.
Lien vers l’aventure :
[Aventure 8 — Données ouvertes du Québec](../module_08/aventure.llms.md)

# Défi — Fonction de scraping

Vous devrez concevoir une fonction `scrape_page(url)` qui :

- prend en entrée une URL d’une page de recherche de Données Québec ;
- retourne un `data.frame` avec les colonnes `titre`, `producteur`, `categorie`.

Vous remettrez cette fonction dans un fichier `IDUL.R` dans votre dépôt GitHub. Elle sera testée automatiquement sur plusieurs pages.

# Exercices de consolidation

Ces exercices utilisent une **page différente** du portail Données Québec, afin de pratiquer dans un autre contexte.
Utilisez la version archivée de la page IMDb des 250 meilleurs films : <https://web.archive.org/web/20220201012049/https://www.imdb.com/chart/top/>

1.  **Lire la page HTML**
    Utilisez `read_html()` puis `html_nodes()` pour observer les sections contenant les titres des films.

2.  **Extraire les titres des films**
    Essayez `html_nodes(..., ".titleColumn a") %>% html_text()`.

3.  **Extraire les années**
    Utilisez `html_nodes(..., ".titleColumn span")` pour extraire les années entre parenthèses.

4.  **Extraire les notes**
    Utilisez `html_nodes(..., ".imdbRating strong")` pour obtenir les cotes de chaque film.

5.  **Construire un tableau**
    Combinez les trois vecteurs (`titre`, `année`, `note`) dans un `data.frame`.

6.  **Réflexion éthique**
    Vérifiez si l’archive de la page IMDb (ou IMDb directement) autorise le scraping en consultant leur [robots.txt](https://www.imdb.com/robots.txt).
