# Exercices de consolidation

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
