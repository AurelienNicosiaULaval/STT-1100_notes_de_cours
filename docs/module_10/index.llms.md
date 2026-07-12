# Au-delà des données : texte et tableau de bord

Module 10

Communiquer une analyse avec du texte, des tableaux et des sorties interactives.

Fil principalTexte, sentiments et tableau de bord

DonnéesCommentaires et corpus de travail

DéfiTableau de bord interactif local

## Produit fini du module

Produit final

### Un tableau de bord interactif appuyé par une analyse textuelle

Le dernier module assemble exploration de texte, visualisations et communication dans un tableau de bord que l'on peut ouvrir localement.

**tableau de bord**

texte préparé

graphique

lecture interactive

texte préparé graphique lecture interactive

## Objectifs du module

À la fin de ce module, vous devriez être capable de:

- Nettoyer et analyser des données textuelles.
- Construire un lexique de sentiment simple en français.
- Visualiser les tendances lexicales et émotionnelles dans le temps.
- Utiliser TF-IDF pour repérer les mots distinctifs.
- Créer un tableau de bord interactif avec `flexdashboard` et `shiny`.

## Préparer le module

### Prérequis

Reprenez les limites de modèle du module 9, les transformations de texte de base et les principes de confidentialité du module 7. Le gabarit est en `Rmd` parce que le tableau de bord demandé utilise `flexdashboard`; le reste du cours demeure en Quarto.

### Parcours minimal

Utilisez d’abord les données fictives fournies. Faites fonctionner localement le gabarit, ajoutez un filtre, un graphique et une courte conclusion. L’analyse textuelle soutient le tableau de bord: elle ne remplace pas le livrable.

### Extensions après le minimum

Ajoutez ensuite le sentiment, le TF-IDF, les variables numériques, puis seulement les options plus ambitieuses comme nuage de mots, `plotly` ou personnalisation avancée.

### Rétroactions de cours

N’utilisez des rétroactions réelles que si l’enseignant·e le confirme. Retirez les informations identifiantes, conservez la version anonymisée minimale et ne partagez jamais les données ni un lien public sans autorisation explicite.

## Plan d’apprentissage

## Plan d’apprentissage

Les cartes reprennent les quatre blocs du plan: lectures, aventure, défi, exercices. Ouvrez les cartes pour voir l’action attendue et le lien utile.

1 Lectures à faire Préparer texte, tableaux de bord et communication interactive. Dans la carte Ouvrir la carteRéduire

### Lectures

Pour vous préparer, consultez les ressources suivantes :

- [Tidytext Text Mining](https://www.tidytextmining.com/) – Chapitres 1 à 3 - Ce livre vous introduit aux bases du traitement de texte avec R.
- [Documentation tidytext - `unnest_tokens()`](https://juliasilge.github.io/tidytext/reference/unnest_tokens.html) - Cette page précise comment transformer une colonne de texte en tokens.
- [Documentation tidytext - `bind_tf_idf()`](https://juliasilge.github.io/tidytext/reference/bind_tf_idf.html) - Cette page décrit le calcul TF-IDF dans un tableau tidy.
- [Flexdashboard documentation (RStudio)](https://rmarkdown.rstudio.com/flexdashboard/) - ce document vous guide dans la création de tableaux de bord interactifs avec `flexdashboard`.
- [Using Shiny with flexdashboard](https://rstudio.github.io/flexdashboard/articles/shiny.html) - Ce guide vous montre comment intégrer des éléments interactifs dans vos tableaux de bord avec `shiny`.
- [Posit - Shiny Basics](https://shiny.posit.co/r/getstarted/shiny-basics/lesson1/) - Cette introduction situe la structure d'une application interactive.

#### Aide-mémoires Posit

- [String manipulation with stringr :: Cheatsheet](https://rstudio.github.io/cheatsheets/strings.pdf) - nettoyer le texte avant la tokenisation.
- [Data tidying with tidyr :: Cheatsheet](https://rstudio.github.io/cheatsheets/tidyr.pdf) - restructurer les sorties textuelles et les tableaux de bord.
- [Data transformation with dplyr :: Cheatsheet](https://rstudio.github.io/cheatsheets/data-transformation.pdf) - produire des résumés et des scores.
- [Data visualization with ggplot2 :: Cheat Sheet](https://rstudio.github.io/cheatsheets/data-visualization.pdf) - préparer les graphiques statiques du tableau de bord.
- [rmarkdown :: Cheatsheet](https://rstudio.github.io/cheatsheets/rmarkdown.pdf) - repères utiles pour les tableaux de bord fondés sur R Markdown.
- [Shiny for R :: Cheatsheet](https://rstudio.github.io/cheatsheets/shiny.pdf) - composants interactifs et logique réactive de base.

Après les lectures, vérifiez les idées clés avec le [mini-test formatif du module 10](mini_test.llms.md).

2 Aventure Transformer des textes en résultats visuels partageables. [Aventure](aventure.llms.md) Ouvrir la carteRéduire

Objectif Passer de la lecture à la pratique guidée.

Ressource [Page Aventure](aventure.llms.md)

Action Suivre les consignes, exécuter le code et garder les sorties importantes.

Résultat Un premier objet de travail que vous pouvez expliquer.

Arrêtez-vous après chaque résultat important et formulez ce qu’il montre.

3 Défi Ouvrir localement ou partager un tableau de bord final cohérent. [Défi](defi.llms.md) Ouvrir la carteRéduire

### Défi - Tableau de bord local ou partagé

Vous devez construire un tableau de bord interactif à partir du modèle fourni. Ce tableau de bord devra :

- Afficher un score de sentiment par semaine ;
- Identifier les mots distinctifs (TF-IDF) ou un nuage de mots ;
- Analyser les variables numériques (`plaisir`, `engagement`, `difficulte`) ;
- Être personnalisé (filtrage, couleurs, résumé) ;
- Fonctionner localement ; être déployé ou partagé seulement si cette consigne est donnée en classe.

La consigne complète est disponible dans la page [Défi 10](defi.llms.md). Le dépôt de départ est `STT-1100/aventure-10`. Le fonctionnement local est le minimum attendu ; le déploiement dépend des consignes données en classe.

4 Exercices Consolider tokens, sentiment, TF-IDF et synthèses de tableau de bord. [Exercices](exercices.llms.md) Ouvrir la carteRéduire

Ressource [Page Exercices](exercices.llms.md)

Pourquoi Les exercices sont indépendants de l'aventure et du défi. Ils utilisent des descriptions de Données Québec et des événements du SIT Québec pour pratiquer l'analyse textuelle sur des textes publics réels.

Refaites au moins un passage sans regarder la solution immédiatement.

## Données et outils

### Bases de données

[Télécharger le dossier de travail du module (.zip)](../downloads/donnees/stt1100-module-10-fr.zip)

[Commentaires et textes de travail](../donnees.llms.md#dataset-card-textes-module-10) [Descriptions de Données Québec](data/descriptions_donnees_quebec.csv) [Événements touristiques québécois](data/evenements_touristiques_quebec.csv)

### Packages R

[tidyverse](../packages.llms.md#tidyverse) [tidytext](../packages.llms.md#tidytext) [readr](../packages.llms.md#readr) [stringr](../packages.llms.md#stringr) [dplyr](../packages.llms.md#dplyr) [tibble](../packages.llms.md#tibble) [ggplot2](../packages.llms.md#ggplot2) [stopwords](../packages.llms.md#stopwords) [tidyr](../packages.llms.md#tidyr) [forcats](../packages.llms.md#forcats) [wordcloud](../packages.llms.md#wordcloud) [wordcloud2](../packages.llms.md#wordcloud2) [ggwordcloud](../packages.llms.md#ggwordcloud) [plotly](../packages.llms.md#plotly) [flexdashboard](../packages.llms.md#flexdashboard) [shiny](../packages.llms.md#shiny)

## Révision et prolongement

### Finir le module avec l’IA du cours

Ouvrez [la page IA](../ia.llms.md) ou [GPT STT-1100](https://chatgpt.com/g/g-682d165f32e881918633affa3fe9dfd6-gpt-stt-1100), puis demandez une rétroaction ciblée:

*Voici mon travail pour ce module. Questionne mon raisonnement, repère une ligne de code fragile, vérifie si mon interprétation répond à la consigne, puis propose une seule amélioration réaliste que je peux faire moi-même.*

- Expliquez le produit fini en trois phrases.
- Collez un extrait de code ou de sortie et demandez un diagnostic.
- Demandez une variante plus ambitieuse, puis choisissez ce qui reste raisonnable.
