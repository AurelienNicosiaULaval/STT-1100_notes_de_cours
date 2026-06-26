# Collaboration et reproductibilité dans GitHub

Module 06

Passer d’un travail individuel à un flux collaboratif reproductible.

Fil principalGitHub, jointures et reproductibilité

DonnéesTables reliées et données multiples

DéfiFlux reproductible avec données fusionnées

## Produit fini du module

Produit final

### Un journal de collaboration reproductible

Le module mène à une trace de travail structurée dans GitHub, enrichie par des données jointes et des choix de collaboration explicites.

**collaboration**

jointures

issues

revue croisée

jointures issues revue croisée

## Objectifs du module

À la fin de ce module, vous devriez être capable de:

- Collaborer efficacement sur des projets de science des données en utilisant `GitHub`.
- Assurer la reproductibilité des analyses avec `Quarto`.
- Fusionner et gérer plusieurs jeux de données.
- Expliquer le cycle de vie des données et les principes de `DataOps`.

## Plan d’apprentissage

Les cartes reprennent les quatre blocs du plan: lectures, aventure, défi, exercices. Ouvrez les cartes pour voir l’action attendue et le lien utile.

1 Lectures à faire Préparer collaboration GitHub, jointures et données relationnelles. Dans la carte Ouvrir la carteRéduire

### Lectures

Dans ce module, nous allons explorer les concepts de base de la collaboration et de la reproductibilité dans GitHub, ainsi que l’utilisation de Quarto pour créer des rapports dynamiques. Voici quelques lectures initiales pour vous préparer :

- [GitHub Docs – Hello World](https://docs.github.com/en/get-started/quickstart/hello-world) Premier projet complet : dépôt, branche, pull request puis merge.
- [GitHub Docs – About pull requests](https://docs.github.com/en/pull-requests) Tout savoir sur la revue de code, les commentaires et la résolution de conflits.
- [Quarto Docs – Inline Code](https://quarto.org/docs/computations/inline-code.html) Insérer du code R directement dans le texte pour afficher dynamiquement des valeurs.
- [What is DataOps? (DataKitchen)](https://datakitchen.io/what-is-dataops/) Principes fondamentaux de DataOps : automatisation, qualité et collaboration.
- [R for Data Science (2ᵉ éd.) – Chapitre 26 : Joins](https://r4ds.hadley.nz/joins.html) Apprendre à combiner des données de différentes sources avec `dplyr`.

2 Aventure Relier plusieurs tables et documenter les décisions d’équipe. [Aventure](aventure.llms.md) Ouvrir la carteRéduire

Objectif Passer de la lecture à la pratique guidée.

Ressource [Page Aventure](aventure.llms.md)

Action Suivre les consignes, exécuter le code et garder les sorties importantes.

Résultat Un premier objet de travail que vous pouvez expliquer.

Arrêtez-vous après chaque résultat important et formulez ce qu’il montre.

3 Défi Produire une revue croisée utile des journaux de bord. Dans la carte Ouvrir la carteRéduire

### Défi — Revue croisée des journaux de bord

> Chaque équipe doit **partager son journal de bord** avec une autre équipe et fournir une **rétroaction constructive**. Cette étape simule le processus de revue par les pairs et renforce les compétences de communication critique.

#### Étapes à réaliser

1.  **Attribution des paires** : l’enseignant·e publiera un tableau listant pour chaque équipe le journal de bord à examiner.

2.  **Partage du document** :

    - Le·la responsable du dépôt ajoute l’équipe destinataire comme *Collaborator* en lecture/écriture sur GitHub.
    - L’URL du journal de bord HTML est communiqué.

3.  **Revue par les pairs** :

    - Chaque membre de l’équipe examinatrice ouvre une *Issue* dans le dépôt de l’équipe revue et dépose au moins **un commentaire détaillé** portant sur :

      1.  **Clarté** du contenu (structure, titres, lisibilité)
      2.  **Rigueur** de la méthodologie (description des rôles, reproductibilité du code)
      3.  **Pertinence** des réflexions (cycle de vie des données, leçons apprises)

    - Les commentaires doivent contenir :

      - Un énoncé d’aspect positif (« ce qui est réussi »)
      - Une suggestion d’amélioration spécifique (« ce qui pourrait être clarifié »)

4.  **Accusé de réception & révision** :

    - L’équipe réceptrice répond à chaque *Issue* et, si jugé nécessaire, pousse une mise à jour de son journal de bord.

#### Livrables

| Équipe | Livrable | Où le déposer |
|----|----|----|
| **Équipe examinatrice** | ≥ 3 *Issues* (une par membre) contenant une rétroaction complète | Dépôt GitHub de l’équipe revue |
| **Équipe révisée** | Journal de bord mis à jour (si modifications nécessaires) + réponses aux *Issues* | Même dépôt GitHub |

#### Barème (20 pts)

| Critère | Pts |
|----|----|
| Qualité des commentaires (clarté, constructivité, exemples) | 10 |
| Pertinence des suggestions vis‑à‑vis de la reproductibilité & collaboration | 5 |
| Suivi et réponses de l’équipe révisée | 5 |

------------------------------------------------------------------------

> **Conseil** : concentrez‑vous sur des rétroactions actionnables (ex. proposer un titre plus descriptif, ajouter un graphique supplémentaire, préciser un paramètre YAML) plutôt que des commentaires génériques.

4 Exercices Reprendre jointures, issues et lecture de projets partagés. [Exercices](exercices.llms.md) Ouvrir la carteRéduire

Ressource [Page Exercices](exercices.llms.md)

Pourquoi Les exercices sont gardés dans une page autonome parce qu'ils prennent plus de place.

Refaites au moins un passage sans regarder la solution immédiatement.

## Données et outils

### Bases de données

[gapminder::gapminder](../donnees.llms.md#dataset-card-gapminder) [dplyr::starwars](../donnees.llms.md#dataset-card-starwars) [Lahman::People](../donnees.llms.md#dataset-card-lahman) [weathercan](../donnees.llms.md#dataset-card-weathercan)

### Packages R

[dplyr](../packages.llms.md#dplyr) [palmerpenguins](../packages.llms.md#palmerpenguins) [gapminder](../packages.llms.md#gapminder) [countrycode](../packages.llms.md#countrycode) [tibble](../packages.llms.md#tibble) [lahman](../packages.llms.md#lahman) [babynames](../packages.llms.md#babynames) [weathercan](../packages.llms.md#weathercan) [fivethirtyeight](../packages.llms.md#fivethirtyeight) [unvotes](../packages.llms.md#unvotes) [ggplot2movies](../packages.llms.md#ggplot2movies) [ggplot2](../packages.llms.md#ggplot2) [fires](../packages.llms.md#fires)

## Révision et prolongement

### Finir le module avec l’IA du cours

Avant de passer au module suivant, utilisez l’IA du cours comme partenaire de révision: demandez-lui de questionner votre raisonnement, de repérer les lignes de code fragiles et de proposer une amélioration réaliste du défi.

- Expliquez le produit fini en trois phrases.
- Collez un extrait de code ou de sortie et demandez un diagnostic.
- Demandez une variante plus ambitieuse, puis choisissez ce qui reste raisonnable.
