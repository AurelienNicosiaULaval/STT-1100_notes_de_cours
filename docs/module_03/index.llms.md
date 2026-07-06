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

## Plan d’apprentissage

1 Lectures et mini-test Revoir chaînes, facteurs, fréquences et proportions. [Mini-test](mini_test.llms.md) Ouvrir la carteRéduire

À lire avant l’aventure:

- [R for Data Science - Strings](https://r4ds.hadley.nz/strings.html)
- [R for Data Science - Factors](https://r4ds.hadley.nz/factors.html)
- [Introduction to Modern Statistics - Explore categorical data](https://openintro-ims.netlify.app/explore-categorical)
- [Documentation de forcats](https://forcats.tidyverse.org/)

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

## Données et outils

### Bases de données

[UlavalSSD::listecondamnation](../donnees.llms.md#dataset-card-listecondamnation) [requetes_311_fictif.csv](data/requetes_311_fictif.csv) [plaintes_transport_fictif.csv](data/plaintes_transport_fictif.csv) [palmerpenguins::penguins_raw](../donnees.llms.md#dataset-card-penguins-raw) [titanic::titanic_train](../donnees.llms.md#dataset-card-titanic-train)

### Packages R

[tidyverse](../packages.llms.md#tidyverse) [stringr](../packages.llms.md#stringr) [forcats](../packages.llms.md#forcats) [ggplot2](../packages.llms.md#ggplot2) [ulavalssd](../packages.llms.md#ulavalssd) [tidygeocoder](../packages.llms.md#tidygeocoder) [scales](../packages.llms.md#scales)

## Révision et prolongement

### Finir le module avec l’IA du cours

Ouvrez [la page IA](../ia.llms.md) ou [GPT STT-1100](https://chatgpt.com/g/g-682d165f32e881918633affa3fe9dfd6-gpt-stt-1100), puis demandez une rétroaction ciblée:

*Voici mon travail pour ce module. Questionne mon raisonnement, repère une ligne de code fragile, vérifie si mon interprétation répond à la consigne, puis propose une seule amélioration réaliste que je peux faire moi-même.*

- Expliquez le produit fini en trois phrases.
- Collez un extrait de code ou de sortie et demandez un diagnostic.
- Demandez une variante plus ambitieuse, puis choisissez ce qui reste raisonnable.
