# Mini-test formatif - Lectures du module 8

STT-1100 Introduction à la science des données

## Mini-test formatif

Ce mini-test sert à vérifier les lectures du module 8. Il n’est pas noté. Répondez d’abord sans ouvrir les réponses, puis utilisez les explications pour repérer ce qui doit être relu.

### Question 1

Quelle fonction sert à lire une page HTML avec `rvest`?

1.  `read_html()`
2.  `read_csv()`
3.  `geom_html()`
4.  `left_join()`

> **TIP:**
>
> Réponse: a. `read_html()` lit une page web ou un fichier HTML et crée un objet que `rvest` peut interroger.

### Question 2

Vrai ou faux: un sélecteur CSS sert à cibler des éléments précis dans une page HTML.

> **TIP:**
>
> Vrai. Par exemple, `.dataset-card` cible les éléments qui ont la classe `dataset-card`.

### Question 3

Quelle fonction extrait le texte propre d’un noeud HTML?

1.  `html_text2()`
2.  `html_table2()`
3.  `text_join()`
4.  `parse_css()`

> **TIP:**
>
> Réponse: a. `html_text2()` retourne le texte en gérant mieux les espaces que `html_text()`.

### Question 4

Vrai ou faux: une fonction de scraping testable doit dépendre d’objets créés manuellement dans la console.

> **TIP:**
>
> Faux. Une fonction testable doit recevoir ses entrées par ses arguments et fonctionner dans une nouvelle session R.

### Question 5

Pourquoi transformer une extraction en fonction?

1.  Pour pouvoir la réutiliser et la tester
2.  Pour éviter d’écrire un nom de variable
3.  Pour rendre le code moins lisible
4.  Pour contourner les conditions d’utilisation

> **TIP:**
>
> Réponse: a. Une fonction regroupe une logique, rend le code réutilisable et permet de tester le contrat de sortie.

### Question 6

Vrai ou faux: `map_chr()` est utile lorsqu’on veut appliquer une extraction à plusieurs blocs HTML et obtenir un vecteur de textes.

> **TIP:**
>
> Vrai. `map_chr()` applique une fonction à chaque élément et garantit un résultat de type caractère.

### Question 7

Que devrait retourner une fonction robuste lorsqu’un champ facultatif manque?

1.  `NA_character_`
2.  Une erreur volontaire
3.  Une fenêtre interactive
4.  Le contenu complet de la page

> **TIP:**
>
> Réponse: a. `NA_character_` permet de représenter une information manquante sans casser toute l’extraction.

### Question 8

Vrai ou faux: `robots.txt` donne une autorisation complète de collecte et de redistribution.

> **TIP:**
>
> Faux. `robots.txt` donne des consignes techniques aux robots. Il ne remplace pas les conditions d’utilisation, la licence, l’éthique ou une autorisation écrite.

### Question 9

Quelle pratique réduit la charge sur un serveur lorsqu’on extrait plusieurs pages?

1.  Ajouter une pause avec `Sys.sleep()`
2.  Lancer plusieurs milliers de requêtes en même temps
3.  Ignorer les erreurs de connexion
4.  Cacher son identité dans le code

> **TIP:**
>
> Réponse: a. Une pause limite la pression exercée sur le serveur.

### Question 10

Vrai ou faux: un test simple peut vérifier les noms de colonnes retournés par une fonction.

> **TIP:**
>
> Vrai. Par exemple, `identical(names(resultat), c("titre", "producteur", "categorie"))` vérifie le contrat de sortie.

### Question 11

Quel comportement est le plus sobre pour le défi?

1.  Scraper une page à la fois
2.  Télécharger tout le site
3.  Contourner les protections
4.  Publier des copies brutes sans vérifier les droits

> **TIP:**
>
> Réponse: a. Le défi demande une fonction qui traite une page à la fois; c’est plus contrôlable et plus respectueux.

### Question 12

Vrai ou faux: une page HTML locale de test aide à rendre un exercice reproductible.

> **TIP:**
>
> Vrai. Une page locale reste disponible même si un site externe change, bloque une requête ou devient indisponible.
