# Les catégories sous toutes leurs formes

Module 03

Nettoyer, compter et visualiser des variables catégoriques.

Fil principalChaînes, catégories et graphiques

DonnéesInfractions alimentaires et données fictives

DéfiArticle journalistique reproductible

## Produit fini du module

Produit final

### Un article de données sur les infractions alimentaires

Le module produit un jeu de données nettoyé, des catégories vérifiées, des graphiques lisibles et un court article Quarto appuyé par des chiffres.

**article.html**

données nettoyées

catégories vérifiées

article rédigé

données nettoyées catégories vérifiées article rédigé

## Objectifs du module

À la fin de ce module, vous devriez être capable de:

- manipuler des chaînes de caractères avec `stringr`;
- reconnaître des motifs simples avec des expressions régulières;
- nettoyer des montants, des codes postaux et des catégories de manière reproductible;
- calculer et interpréter des fréquences, des proportions et des tableaux croisés;
- recoder, regrouper et ordonner des catégories avec `dplyr` et `forcats`;
- produire et interpréter des diagrammes à bandes, des bandes empilées et des bandes empilées standardisées avec `ggplot2`.

## Préparer le module

### Prérequis

Reprenez `filter()`, `mutate()`, `group_by()`, `summarise()` et un graphique `ggplot2` du module 2. Vous n’avez pas besoin de tout mémoriser, mais vous devez pouvoir relire un exemple.

### Parcours minimal

Nettoyez une catégorie, construisez une fréquence ou une proportion, puis expliquez un graphique en une phrase précise. C’est le noyau du module.

### Ce module, puis le suivant

Ici, les catégories servent à compter, comparer et raconter. Le module 4 approfondira la qualité du fichier, l’importation et la documentation des corrections.

### Si vous bloquez

Commencez avec les données fictives des exercices. Une fois le geste compris, revenez aux infractions alimentaires et notez chaque recodage choisi.

## Plan d’apprentissage

Les cartes reprennent les cinq étapes du plan: lectures, aventure, défi, exercices et rétroaction IA. La rétroaction IA revient sur un élément du travail déjà réalisé; elle ne demande aucune remise supplémentaire.

1 Lectures et mini-test Revoir chaînes, facteurs, fréquences et proportions. [Mini-test](mini_test.llms.md) Ouvrir la carteRéduire

À lire avant l’aventure:

- [R for Data Science - Strings](https://r4ds.hadley.nz/strings.html)
- [R for Data Science - Factors](https://r4ds.hadley.nz/factors.html)
- [Introduction to Modern Statistics - Explore categorical data](https://openintrostat.github.io/ims/explore-categorical)
- [Documentation de forcats](https://forcats.tidyverse.org/)

### Aide-mémoires Posit

- [String manipulation with stringr :: Cheatsheet](https://rstudio.github.io/cheatsheets/strings.pdf)
- [Factors with forcats :: Cheatsheet](https://rstudio.github.io/cheatsheets/factors.pdf)
- [Data visualization with ggplot2 :: Cheat Sheet](https://rstudio.github.io/cheatsheets/data-visualization.pdf)

Après les lectures, complétez le [mini-test formatif](mini_test.llms.md).

2 Aventure Nettoyer les infractions alimentaires et extraire des faits saillants. [Aventure](aventure.llms.md) Ouvrir la carteRéduire

Rôle Journaliste de données pour Le Courrier Gourmand.

Action Nettoyer les catégories, extraire les codes postaux et produire de premiers résultats.

Gardez les sorties qui pourraient devenir des chiffres narratifs dans l’article.

3 Défi Rédiger un article Quarto à partir des infractions alimentaires. [Défi](defi.llms.md) Ouvrir la carteRéduire

Votre mission consiste à nettoyer `listecondamnation`, à extraire des faits marquants et à rédiger un article Quarto reproductible.

[Consulter le défi du module 3](defi.llms.md)

- Livrables: `template_article.qmd` complété et HTML rendu.
- Analyse: au moins deux chiffres narratifs et deux visuels, dont un graphique de catégories.
- Extension optionnelle: carte des amendes, avec une note sur la reproductibilité du géocodage.
- GitHub: plusieurs commits clairs et un dépôt complet.

4 Exercices Pratiquer fréquences, nettoyage, graphiques et deux études de cas. [Exercices](exercices.llms.md) Ouvrir la carteRéduire

Ressource [Page Exercices](exercices.llms.md)

Portée Ces exercices ne sont pas une étape du défi. Ils pratiquent les catégories, les chaînes, les graphiques et trois contextes fictifs.

Études de cas Requêtes 311 fictives et plaintes de transport collectif fictives.

Refaites au moins un bloc sans regarder la solution immédiatement.

5 Rétroaction IA Faire relire un extrait du travail, puis décider quoi améliorer soi-même. [Mode /retroaction](../ia.llms.md) Ouvrir la carteRéduire

Point de départ Choisissez un seul élément réellement produit dans l'aventure, le défi ou les exercices: un extrait de code, un graphique, une interprétation ou un choix méthodologique.

Préparer Donnez la consigne, le contexte, ce que vous avez essayé et l'élément précis à relire.

Demander Ouvrez [GPT STT-1100](https://chatgpt.com/g/g-682d165f32e881918633affa3fe9dfd6-gpt-stt-1100) en mode `/retroaction`. Demandez un point solide, une fragilité à vérifier et une question qui vous aidera à corriger.

Décider Comparez la réponse aux données et à la consigne. Modifiez vous-même seulement ce que vous comprenez et pouvez expliquer.

Demande prête à copier

`/retroaction Je termine ce module. Voici la consigne visée, ce que j'ai essayé et l'extrait précis que je veux améliorer. Donne-moi un point solide, une fragilité à vérifier et une question qui m'aidera à corriger moi-même. Ne réécris pas tout le travail.`

Résultat attendu Une amélioration comprise et appliquée dans votre travail, ou une raison claire de ne pas suivre la suggestion. Il n'y a ni portfolio ni remise supplémentaire à produire.

Confidentialité Ne transmettez aucune donnée personnelle, confidentielle ou protégée.

## Données et outils

### Bases de données

[Télécharger le dossier de travail du module (.zip)](../downloads/donnees/stt1100-module-03-fr.zip)

[UlavalSSD::listecondamnation](../donnees.llms.md#dataset-card-listecondamnation) [Requêtes 311 de Montréal](data/requetes_311_montreal.csv) [Plaintes de consommation au Québec](data/plaintes_consommation_quebec.csv) [palmerpenguins::penguins_raw](../donnees.llms.md#dataset-card-penguins-raw) [titanic::titanic_train](../donnees.llms.md#dataset-card-titanic-train)

### Packages R

[tidyverse](../packages.llms.md#tidyverse) [stringr](../packages.llms.md#stringr) [forcats](../packages.llms.md#forcats) [ggplot2](../packages.llms.md#ggplot2) [ulavalssd](../packages.llms.md#ulavalssd) [tidygeocoder](../packages.llms.md#tidygeocoder) [scales](../packages.llms.md#scales)
