# Au-delà des données: texte et tableau de bord

Module 10

Communiquer une analyse avec du texte, des tableaux et des sorties interactives.

Fil principalTexte, sentiments et tableau de bord

DonnéesCommentaires et corpus de travail

DéfiAnalyse textuelle ou tableau de bord

## Produit fini du module

Produit final

### Un tableau de bord ou une analyse textuelle partageable

Le dernier module assemble exploration de texte, visualisations et communication dans un objet consultable par une autre personne.

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

## Plan d’apprentissage

Les cartes reprennent les quatre blocs du plan: lectures, aventure, défi, exercices. Ouvrez les cartes pour voir l’action attendue et le lien utile.

1 Lectures à faire Préparer texte, tableaux de bord et communication interactive. Dans la carte Ouvrir la carteRéduire

### Lectures

Pour vous préparer, consultez les ressources suivantes :

- [Tidytext Text Mining](https://www.tidytextmining.com/) – Chapitres 1 à 3 - Ce livre vous introduit aux bases du traitement de texte avec R.
- [Flexdashboard documentation (RStudio)](https://rmarkdown.rstudio.com/flexdashboard/) - ce document vous guide dans la création de tableaux de bord interactifs avec `flexdashboard`.
- [Shiny for dashboards](https://rstudio.github.io/flexdashboard/using.html#shiny_interaction) - Ce guide vous montre comment intégrer des éléments interactifs dans vos tableaux de bord avec `shiny`.

2 Aventure Transformer des textes en résultats visuels partageables. [Aventure](aventure.llms.md) Ouvrir la carteRéduire

Objectif Passer de la lecture à la pratique guidée.

Ressource [Page Aventure](aventure.llms.md)

Action Suivre les consignes, exécuter le code et garder les sorties importantes.

Résultat Un premier objet de travail que vous pouvez expliquer.

Arrêtez-vous après chaque résultat important et formulez ce qu’il montre.

3 Défi Déployer ou présenter un tableau de bord final cohérent. [Défi](defi.llms.md) Ouvrir la carteRéduire

### Défi — Tableau de bord déployé

Vous devez construire un tableau de bord interactif à partir du modèle fourni. Ce tableau de bord devra :

- Afficher un score de sentiment par semaine ;
- Identifier les mots distinctifs (TF-IDF) ou un nuage de mots ;
- Analyser les variables numériques (`plaisir`, `engagement`, `difficulte`) ;
- Être personnalisé (filtrage, couleurs, résumé) ;
- Être déployé et partagé à Anne-Sophie.

La consigne complète est disponible dans la page [Défi 10](defi.llms.md). Le dépôt de départ est `STT-1100/aventure-10`.

## Données et outils

### Bases de données

[Commentaires et textes de travail](../donnees.llms.md#dataset-card-textes-module-10)

### Packages R

[tidytext](../packages.llms.md#tidytext) [stringr](../packages.llms.md#stringr) [dplyr](../packages.llms.md#dplyr) [tibble](../packages.llms.md#tibble) [ggplot2](../packages.llms.md#ggplot2) [stopwords](../packages.llms.md#stopwords) [tidyr](../packages.llms.md#tidyr) [forcats](../packages.llms.md#forcats) [wordcloud](../packages.llms.md#wordcloud) [wordcloud2](../packages.llms.md#wordcloud2) [ggwordcloud](../packages.llms.md#ggwordcloud) [plotly](../packages.llms.md#plotly) [flexdashboard](../packages.llms.md#flexdashboard) [shiny](../packages.llms.md#shiny)

## Révision et prolongement

### Finir le module avec l’IA du cours

Avant de passer au module suivant, utilisez l’IA du cours comme partenaire de révision: demandez-lui de questionner votre raisonnement, de repérer les lignes de code fragiles et de proposer une amélioration réaliste du défi.

- Expliquez le produit fini en trois phrases.
- Collez un extrait de code ou de sortie et demandez un diagnostic.
- Demandez une variante plus ambitieuse, puis choisissez ce qui reste raisonnable.
