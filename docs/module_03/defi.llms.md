# Défi 3 - Article de données sur les infractions alimentaires

STT-1100 Introduction à la science des données

## Présentation du défi

Dans ce défi, vous devenez journaliste de données pour *Le Courrier Gourmand*. Votre objectif est de produire un court article Quarto sur les infractions alimentaires à partir du jeu `listecondamnation` du package `UlavalSSD`.

Votre article doit être compréhensible par une personne qui ne connaît pas R. Le code sert à soutenir l’article, mais le texte doit raconter clairement ce que vous avez trouvé.

## Données à utiliser

Utilisez le jeu de données suivant :

``` text
UlavalSSD::listecondamnation
```

Votre rapport doit charger explicitement les packages nécessaires, notamment `tidyverse` et `UlavalSSD`.

Le rapport doit pouvoir être rendu après un redémarrage de R, sans dépendre d’objets déjà présents dans votre environnement.

## Livrables attendus

Votre dépôt GitHub doit contenir les fichiers suivants :

- `template_article.qmd` complété ;

- `template_article.html` rendu.

Vous pouvez renommer le titre de l’article dans l’en-tête Quarto, mais gardez le nom du fichier source fourni dans le gabarit.

Votre historique GitHub doit montrer plusieurs commits utiles. Par exemple, vous pouvez faire un commit après l’importation des données, un autre après le nettoyage, un autre après les graphiques, puis un dernier après la relecture.

## Structure attendue de l’article

Votre article doit contenir les sections suivantes :

- un chapeau introductif ;

- une section contexte et données ;

- une section méthodologie écrite en texte, sans détailler chaque ligne de code ;

- une section résultats avec au moins deux résultats clés ;

- une discussion ;

- une conclusion avec recommandations.

## Travail demandé

### Étape 1 - Importer et inspecter les données

Chargez le package `UlavalSSD`, inspectez `listecondamnation`, puis décrivez brièvement :

- le nombre de lignes ;

- les variables principales ;

- le type initial de la variable `Amende` ;

- les limites du jeu de données que vous jugez importantes.

### Étape 2 - Nettoyer les variables utiles

Créez un tableau propre qui contient au minimum :

- une variable numérique pour les amendes, par exemple `amende_num` ;

- une variable de code postal standardisée ;

- une variable logique qui identifie les constats situés à Montréal ;

- une variable logique qui identifie les infractions liées à la température ;

- une variable de type d’établissement recodée lorsque deux modalités désignent la même catégorie.

Ne modifiez pas le jeu de données original. Faites le nettoyage dans votre code R afin que votre démarche soit reproductible.

### Étape 3 - Extraire des faits marquants

Votre article doit inclure au moins deux chiffres narratifs. Par exemple :

- la proportion de constats situés à Montréal ;

- la proportion d’infractions liées à la température à Montréal ;

- la médiane ou la moyenne des amendes ;

- les types d’infractions les plus fréquents ;

- les types d’établissements les plus souvent présents.

Chaque chiffre doit être accompagné d’une interprétation en texte.

### Étape 4 - Produire au moins deux visuels

Votre article doit contenir au moins deux visualisations :

1.  un graphique de catégories, par exemple un diagramme à barres sur les types d’infractions ou les types d’établissements ;

2.  un deuxième visuel pertinent, par exemple une boîte à moustaches sur les amendes ou un graphique comparant Montréal et le reste du Québec.

La carte des amendes est optionnelle. Si vous choisissez de la faire, indiquez clairement que le géocodage dépend d’un service web externe et peut ne pas être parfaitement reproductible.

Chaque graphique doit avoir :

- un titre informatif ;

- des axes lisibles ;

- une légende claire si une couleur est utilisée ;

- des unités lorsque c’est pertinent.

### Étape 5 - Rédiger l’article

Votre article doit répondre à une question journalistique claire. Par exemple :

> Que révèlent les constats d’infractions alimentaires sur les établissements montréalais ?

Dans la conclusion, ajoutez une courte citation synthétique d’Alexandre. Cette citation doit résumer une implication de vos résultats. Elle peut être fictive, mais elle doit être cohérente avec vos analyses.

## Liste de vérification

Avant de remettre votre défi, vérifiez que :

- `template_article.qmd` se rend sans erreur ;

- `template_article.html` est présent dans le dépôt ;

- les packages nécessaires sont chargés dans le rapport ;

- les données sont nettoyées dans le code, sans modification manuelle du jeu original ;

- `amende_num` est bien numérique ;

- les catégories de type d’établissement sont vérifiées ;

- les analyses distinguent clairement Montréal du reste du Québec ;

- au moins deux chiffres narratifs sont cités et interprétés ;

- au moins deux graphiques sont présents et lisibles ;

- la conclusion répond à la question journalistique ;

- plusieurs commits clairs apparaissent dans l’historique GitHub ;

- les changements ont été poussés sur GitHub.

## Grille d’évaluation

| Critère | Excellent | Satisfaisant | À améliorer |
|----|----|----|----|
| Angle journalistique | Question claire, chapeau efficace, fil narratif cohérent. | Angle présent mais peu précis. | Angle absent ou article descriptif sans question directrice. |
| Présentation des données | Source, variables, limites et choix de sous-ensemble clairement expliqués. | Présentation partielle. | Source ou limites absentes. |
| Nettoyage des données | Variables utiles nettoyées correctement, dont les amendes et les catégories d’établissement. | Nettoyage présent mais incomplet ou peu expliqué. | Nettoyage absent, erroné ou non reproductible. |
| Chiffres narratifs | Au moins deux chiffres pertinents, calculés correctement et interprétés. | Chiffres présents mais peu reliés au texte. | Chiffres absents, erronés ou non interprétés. |
| Visualisations | Au moins deux graphiques lisibles, titrés et utiles pour l’article. | Graphiques présents mais lisibilité ou pertinence limitée. | Graphiques absents, incorrects ou difficiles à comprendre. |
| Discussion | Résultats nuancés, limites reconnues, lien clair avec la question. | Discussion présente mais surtout descriptive. | Discussion absente ou sans lien avec les résultats. |
| Conclusion | Messages d’action clairs et citation d’Alexandre cohérente avec les résultats. | Conclusion présente mais générale. | Conclusion absente ou non appuyée par les analyses. |
| Reproductibilité | `.qmd` et HTML fonctionnels, chemins et packages corrects, dépôt GitHub complet. | Rendu possible avec quelques ajustements mineurs. | Rendu impossible, fichiers manquants ou dépôt désorganisé. |
