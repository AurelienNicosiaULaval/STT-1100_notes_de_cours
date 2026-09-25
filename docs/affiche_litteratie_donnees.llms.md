Évaluation sommative

# Affiche de littératie des données

Cette évaluation vous demande de raconter une histoire claire à partir de données réelles. En équipe, vous choisissez une question, vous analysez les données, puis vous communiquez l'essentiel sous la forme d'une affiche scientifique A1 destinée à un large public.

[Site du concours ISLP](https://islp.ssc.ca/?lang=fr) [Template Quarto](https://github.com/STT-1100-A26/affiche) [Évaluations](evaluations.llms.md) [IA et aide](ia.llms.md) [Grille](#rubric-title)

10 %

Pondération

Équipe

Travail collaboratif

A1

Portrait ou paysage

GitHub

Remise du dépôt

## Mission

Travaillez en équipes de 3 à 4 personnes, avec la même équipe pour le projet et l’affiche. Vous pouvez utiliser le même jeu de données réel pour les deux travaux : le projet développe l’analyse complète et l’affiche communique un message ciblé.

L'objectif est de produire une affiche de vulgarisation en science des données et en statistique, inspirée de la Compétition canadienne d'affiches sur la littératie des données.

Aucun thème n'est imposé. Le sujet doit toutefois s'appuyer sur des données réelles et permettre de montrer votre capacité à analyser, interpréter et communiquer de l'information statistique.

### Type

Évaluation sommative.

### Remise

Dépôt GitHub contenant l'affiche et les fichiers demandés.

### Date limite

22 novembre à 23 h 55. La remise officielle se fait selon les modalités indiquées dans Brio.

### Concours

La participation externe est facultative.

## Template Quarto

Un dépôt template GitHub est disponible pour démarrer l'affiche dans une structure reproductible. Il contient un fichier `affiche.qmd`, un dossier `data/`, un dossier `figures/`, un dossier `scripts/` et une déclaration d'utilisation de l'IA.

Le template utilise Quarto et Typst pour produire un PDF exactement au format A1 (841 × 594 mm en paysage). Les données incluses sont fictives et servent seulement à vérifier le rendu; votre affiche finale doit utiliser des données réelles et citées.

### Créer le dépôt

Cloner le dépôt privé attribué par l’enseignant à votre équipe dans STT-1100-A26. Si le lien manque, le signaler à l’enseignant. Ouvrir `affiche-stt1100.Rproj` et exécuter `scripts/00_preparer.R` avec Source.

### Modifier

Remplacer le titre, les noms, la question, les données et les graphiques dans `affiche.qmd`.

### Rendre

Exécuter `quarto render affiche.qmd` pour produire `affiche.pdf`.

### Remettre

Pousser le dépôt GitHub selon les consignes officielles indiquées dans Brio.

[Ouvrir le template d'affichePoint de départ Quarto pour le dépôt de votre équipe.](https://github.com/STT-1100-A26/affiche)

## Ce que l'affiche doit contenir

Une bonne affiche ne montre pas seulement des résultats: elle aide le public à comprendre la question, les données et le message principal.

### Question claire

La question est compréhensible, précise et réellement reliée aux données utilisées.

### Données fiables

Citez la source; précisez la collecte, le nombre d’observations, la période et la représentativité. Expliquez les limites de qualité pertinentes.

### Graphiques pertinents

Les graphiques et tableaux aident à répondre à la question plutôt qu'à simplement remplir l'espace.

### Interprétation

Répondez à la question avec les résultats, sans dépasser ce que les données permettent. Mentionnez les limites et une amélioration ou une suite possible.

### Création originale

Le contenu, les choix visuels et la structure sont produits par votre équipe.

### Format A1

Une seule page, portrait ou paysage, compréhensible sans document complémentaire. Vérifiez la lisibilité du texte et des graphiques à 2 mètres à la taille d’impression.

## Lien avec le concours

Le règlement 2026-2027 accepte des équipes de 1 à 5 : nos équipes de 3 à 4 conviennent. L’enseignant vérifie l’admissibilité des membres à la catégorie collégiale/premier cycle et coordonne toute soumission volontaire.

Préparez une copie sans noms, établissement, logo ni coordonnées : une seule page, A1 au maximum et fichier de 10 Mo au maximum. Dans le modèle, exécutez `scripts/01_version_concours.R` avec Source pour créer `affiche-concours.pdf`. Ce script masque les champs d’identification du modèle; vérifiez aussi les textes, images, liens et propriétés du PDF.

Si l’affiche est en français, joignez une version anglaise dès la soumission canadienne. Les renseignements sur les membres sont transmis séparément. L’affiche doit être originale et ne pas avoir participé à un concours national ou international antérieur : adaptez la composition du modèle à votre propre message.

Avant toute soumission externe, l’équipe doit lire et accepter avec l’enseignant les conditions de diffusion et de propriété du règlement. La participation n’est pas automatique et ne remplace pas la remise du cours du 22 novembre.

Cette évaluation est obligatoire dans le cadre du cours. La participation à la compétition canadienne est toutefois facultative.

Les équipes qui produisent une affiche de qualité pourront, si elles le souhaitent, autoriser sa soumission à la compétition. Le concours est gratuit, des prix sont remis au niveau national et les affiches gagnantes peuvent représenter le Canada à l'international.

[Consulter le site ISLPRègles officielles, exemples et critères de jugement du concours.](https://islp.ssc.ca/?lang=fr) [Règles internationales et IAConditions de l’édition 2026-2027, vérifiées le 25 septembre 2026.](https://iase-web.org/islp-poster-competition-2026-2027)

## Utilisation de l'intelligence artificielle

Pour l’affiche, l’IA est autorisée avec déclaration selon Brio. Vous devez comprendre, vérifier et pouvoir expliquer tout élément remis. Déclarez les outils, les tâches concernées, les requêtes utilisées et vos vérifications dans `DECLARATION_IA.md`.

Le concours ISLP 2026-2027 autorise l’IA comme appui au niveau universitaire. Elle ne doit pas remplacer vos idées, votre raisonnement critique, vos analyses ni vos conclusions. Le travail doit demeurer substantiellement celui de l’équipe; un contenu assisté ne doit pas être présenté comme entièrement personnel. Pour le concours, préparez une déclaration anonyme et une brève mention de l’aide reçue sur l’affiche. La déclaration seule ne garantit pas l’admissibilité.

1

### Déclarer

Inclure dans le dépôt GitHub une déclaration indiquant les outils utilisés et les tâches concernées: idéation, recherche, programmation, rédaction, correction linguistique, création de graphiques ou autre.

2

### Vérifier

Indiquer dans quelle mesure les résultats produits par l'IA ont été modifiés, vérifiés ou adaptés par l'équipe.

3

### Assumer

L'équipe demeure responsable de l'exactitude des analyses, de la qualité de l'affiche, du respect des droits d'auteur et de toutes les informations présentées.

4

### Demander clairement

Au compagnon IA du cours, vous pouvez demander: « Vérifie si notre question est claire et si nos graphiques soutiennent vraiment notre conclusion. Signale aussi les affirmations trop fortes. »

## Grille d'évaluation

La grille s'inspire des critères de la compétition tout en restant adaptée aux objectifs du cours.

Le jury ISLP examine six dimensions : clarté du message, données, analyse et conclusions, graphiques et tableaux, présentation, créativité et importance du sujet. Notre grille regroupe ces dimensions en cinq rubriques : l’originalité et l’importance du sujet se rattachent à la question, et l’originalité de la composition à la communication visuelle. Les points ci-dessous sont ceux du cours, pas des pondérations officielles du concours. Consultez les [critères détaillés du jury](https://iase-web.org/sites/default/files/2026-02/Judging%20criteria%202026-2027_English.pdf).

### Question et objectif

15 points. Le message de l'affiche est clair, ciblé et statistiquement pertinent.

### Données utilisées

20 points. Les données sont pertinentes, fiables, citées et suffisamment comprises.

### Analyse

25 points. Les traitements, comparaisons et conclusions sont cohérents avec la question.

### Graphiques et tableaux

20 points. Les visualisations sont lisibles, bien choisies et utiles pour comprendre les résultats.

### Communication visuelle

20 points. L'affiche guide le regard, explique le contexte et communique efficacement à un large public.

### Total

100 points, convertis selon la pondération officielle de l'évaluation.

## À remettre

Incluez `affiche.qmd`, son rendu `affiche.pdf`, les données partageables et leurs sources, les scripts utilisés et la déclaration IA. Conservez `_extensions/`, nécessaire au rendu. Vérifiez que le PDF contient une seule page A1 et que les fichiers finaux apparaissent sur GitHub.

La remise attendue est un dépôt GitHub contenant l'affiche et les éléments nécessaires pour comprendre le travail. Brio demeure la référence officielle pour la date, le lieu exact de remise, les fichiers exigés et les modalités administratives de la session.

1.  Vérifier que l'affiche répond à une question claire à partir de données réelles.
2.  Utiliser le template Quarto ou une structure équivalente permettant de comprendre le travail.
3.  Citer les sources de données et les ressources externes utilisées.
4.  Inclure une déclaration d'utilisation de l'IA si des outils d'IA ont été utilisés.
5.  Remettre le dépôt GitHub selon les indications officielles de Brio.
