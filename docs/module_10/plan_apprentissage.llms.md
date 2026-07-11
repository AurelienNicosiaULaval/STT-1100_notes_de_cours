# Module 10 - Plan d’apprentissage

STT-1100 Introduction à la science des données

## Objectifs du module

À la fin de ce module, vous devriez être capable de :

- Nettoyer et analyser des données textuelles.
- Construire un lexique de sentiment simple en français.
- Visualiser les tendances lexicales et émotionnelles dans le temps.
- Utiliser TF-IDF pour repérer les mots distinctifs.
- Créer un tableau de bord interactif avec `flexdashboard` et `shiny`.

## Lectures

Pour vous préparer, commencez par `unnest_tokens()`, `bind_tf_idf()` et le gabarit `flexdashboard`. Les ressources Shiny, les nuages de mots et les options de personnalisation viennent après un premier tableau de bord local qui fonctionne.

- [Text Mining with R](https://www.tidytextmining.com/) - Chapitres 1 à 3 pour le format tidy text, l’analyse de sentiment et le TF-IDF.
- [Documentation tidytext - `unnest_tokens()`](https://juliasilge.github.io/tidytext/reference/unnest_tokens.html)
- [Documentation tidytext - `bind_tf_idf()`](https://juliasilge.github.io/tidytext/reference/bind_tf_idf.html)
- [Documentation flexdashboard](https://rmarkdown.rstudio.com/flexdashboard/)
- [Using Shiny with flexdashboard](https://rstudio.github.io/flexdashboard/articles/shiny.html)
- [Posit - Shiny Basics](https://shiny.posit.co/r/getstarted/shiny-basics/lesson1/)

### Aide-mémoires Posit

- [String manipulation with stringr :: Cheatsheet](https://rstudio.github.io/cheatsheets/strings.pdf) Préparation et nettoyage de texte avant la tokenisation.

- [Data tidying with tidyr :: Cheatsheet](https://rstudio.github.io/cheatsheets/tidyr.pdf) Restructuration des sorties textuelles et des tableaux de bord.

- [Data transformation with dplyr :: Cheatsheet](https://rstudio.github.io/cheatsheets/data-transformation.pdf) Résumés, regroupements et calculs de scores.

- [Data visualization with ggplot2 :: Cheat Sheet](https://rstudio.github.io/cheatsheets/data-visualization.pdf) Graphiques statiques à intégrer dans le tableau de bord.

- [rmarkdown :: Cheatsheet](https://rstudio.github.io/cheatsheets/rmarkdown.pdf) Repères utiles pour les tableaux de bord fondés sur R Markdown.

- [Shiny for R :: Cheatsheet](https://rstudio.github.io/cheatsheets/shiny.pdf) Composants interactifs et logique réactive de base.

Après les lectures, faites le [mini-test formatif du module 10](../module_10/mini_test.llms.md).

## Aventure

Vous êtes analyste d’affaires junior engagé par la Faculté des sciences et de génie de l’Université Laval. Votre mandat est de produire un tableau de bord interactif à partir de commentaires fictifs. Des rétroactions réelles ne peuvent être utilisées que si l’enseignant·e fournit un fichier anonymisé et confirme explicitement le cadre d’utilisation.

[Aventure 10 - Au-delà des données : texte et tableau de bord](../module_10/aventure.llms.md)

## Défi - Tableau de bord local ou partagé

Vous devez construire un tableau de bord interactif à partir du modèle fourni. Ce tableau de bord devra :

- Afficher un score de sentiment par semaine ;
- Identifier les mots distinctifs (TF-IDF) ou un nuage de mots ;
- Analyser les variables numériques (`plaisir`, `engagement`, `difficulte`) ;
- Être personnalisé (filtrage, couleurs, résumé) ;
- Fonctionner localement ; être déployé ou partagé seulement si cette consigne est donnée en classe.

Commencez par le noyau minimal: faire fonctionner le gabarit localement, ajouter un filtre, un graphique et une conclusion courte. Ajoutez ensuite le sentiment, le TF-IDF, les variables numériques et les extensions visuelles.

Consigne complète : [Défi 10 - Tableau de bord de rétroactions](../module_10/defi.llms.md)

Dépôt de départ : `STT-1100/aventure-10`

## Exercices de consolidation

Les exercices sont indépendants de l’aventure et du défi. Ils utilisent deux extraits québécois réels et publics:

1.  `descriptions_donnees_quebec.csv` pour pratiquer la tokenisation, les stopwords, un score lexical et le TF-IDF;
2.  `evenements_touristiques_quebec.csv` pour préparer une synthèse textuelle et numérique de tableau de bord.

La série se termine par deux études de cas: une révision de descriptions de jeux de données et une synthèse d’événements touristiques.

Lien vers les exercices: [Exercices de consolidation](../module_10/exercices.llms.md)

## Grille d’évaluation

Chaque équipe doit remettre un tableau de bord interactif basé sur les données fictives fournies ou, seulement si cela est explicitement autorisé, sur un fichier anonymisé fourni par l’enseignant·e. Voici la grille utilisée pour l’évaluation :

| Critère | Description | Points |
|----|----|----|
| **Nettoyage du texte** | Texte bien transformé, tokenisé, stopwords retirés | /10 |
| **Lexique et score de sentiment** | Construction claire du lexique FR, application correcte par semaine | /15 |
| **TF-IDF ou nuage de mots** | Analyse de mots distinctifs claire et bien illustrée | /15 |
| **Analyse des variables numériques** | Moyennes ou tendances bien explorées (`plaisir`, `difficulte`, etc.) | /15 |
| **Visualisations** | Graphiques lisibles, pertinents, esthétiques | /15 |
| **Tableau de bord interactif (Shiny)** | Utilisation efficace de filtres et composants dynamiques | /15 |
| **Personnalisation / effort créatif** | Adaptation du modèle fourni, effort visuel et rédactionnel | /10 |
| **Accessibilité et partage** | Tableau de bord fonctionnel localement, avec lien valide seulement si un déploiement est demandé | /5 |

**Total : /100**
