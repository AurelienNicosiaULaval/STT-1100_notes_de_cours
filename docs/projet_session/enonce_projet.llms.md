# Projet de session

STT-1100 Introduction à la science des données

# Mission

Votre équipe doit construire une analyse complète à partir d’un jeu de données que vous choisissez, documentez et explorez.

Le projet n’est pas un exercice où toutes les étapes sont données d’avance. Il vous demande de formuler une question, de justifier vos choix, de produire une analyse reproductible et de communiquer un résultat utile à un lectorat qui ne connaît pas votre travail.

# Objectifs

À la fin du projet, votre dépôt doit montrer que votre équipe est capable de :

- formuler une question d’analyse claire, faisable et reliée aux données;
- documenter la provenance, la structure et les limites d’un jeu de données;
- préparer les données avec un code lisible et reproductible;
- produire des visualisations et des résultats qui répondent à la question;
- interpréter les résultats avec prudence;
- communiquer le projet dans une présentation courte et un résumé final;
- collaborer dans un dépôt GitHub de façon transparente.

# Usage permis de l’IA

Dans les défis et le projet, l’IA est permise comme aide au raisonnement, au débogage, à la révision, à la planification ou à la vérification. Dans l’examen, seuls les outils explicitement autorisés sur Brio sont permis. Dans tous les cas, le livrable final doit rester vérifiable, personnel et cohérent avec la consigne. Vous devez comprendre, tester et pouvoir expliquer tout code, texte, source, résultat ou interprétation remis. Quand l’IA influence une partie importante d’un livrable évalué, ajoutez une déclaration courte dans le livrable: outil utilisé, but de l’aide, partie touchée et vérification faite. Les modalités officielles indiquées sur Brio prévalent toujours.

# Pondération et échéancier

La proposition vaut 6 % de la note du cours. Le projet final vaut 34 %. La présentation orale aura lieu le lundi 14 décembre 2026, de 8 h 30 à 11 h 20, au local PLT-2325, pendant la dernière séance du cours et la période réservée aux examens.

Le barème détaillé ci-dessous est un barème interne de 100 points. Les 15 points de la proposition sont convertis en 6 % de la note du cours. Les 85 autres points, qui couvrent la présentation, le résumé final, la reproductibilité et le travail d’équipe, sont convertis en 34 %.

# Jeu de données

Choisissez un jeu de données gérable pour une première analyse complète.

Le jeu de données doit normalement respecter les critères suivants :

- au moins 50 observations;
- entre 5 et 25 variables utiles pour l’analyse;
- au moins une variable numérique et une variable catégorielle;
- un format lisible dans R, par exemple CSV, XLSX, RDS, JSON ou données obtenues par API;
- une source identifiable et citable.

Les données vues directement dans les modules, les défis ou les exercices du cours ne doivent pas être réutilisées comme jeu de données principal, sauf approbation explicite. Vous pouvez toutefois réutiliser les mêmes gestes techniques.

Sources possibles :

- [Données Québec](https://www.donneesquebec.ca/)
- [Portail du gouvernement ouvert du Canada](https://open.canada.ca/fr/open-data)
- [Statistique Canada](https://www.statcan.gc.ca/)
- [TidyTuesday](https://github.com/rfordatascience/tidytuesday)
- [Google Dataset Search](https://datasetsearch.research.google.com/)
- [Harvard Dataverse](https://dataverse.harvard.edu/)

Avant de confirmer votre choix, vérifiez que :

- le fichier ou l’API peut être importé dans R avec les outils du cours;
- la licence ou les conditions d’utilisation permettent un travail de cours;
- les variables permettent de répondre à une question précise;
- le jeu de données ne contient pas de renseignements sensibles ou identifiants inutiles;
- la source peut être citée clairement dans le rapport et la présentation.

# Dépôt GitHub

Le projet commence dans le dépôt template `STT-1100/projet`. Le dépôt de votre équipe doit rester propre pendant toute la session.

Structure attendue :

``` text
.
|-- README.md
|-- CONSIGNES.md
|-- data/
|   |-- README.md
|   |-- raw/
|   `-- processed/
|-- scripts/
|   |-- 00_setup.R
|   |-- 01_import_clean.R
|   `-- 02_analysis.R
|-- proposition/
|   `-- proposition.qmd
|-- presentation/
|   |-- presentation.qmd
|   `-- style.css
|-- figures/
`-- outputs/
```

Le fichier `README.md` sert de résumé final du projet. Le fichier `CONSIGNES.md` sert de guide interne pour utiliser le template et vérifier les remises.

Votre dépôt doit aussi respecter quelques règles pratiques :

- une personne externe doit comprendre le projet sans explication orale;
- les scripts doivent pouvoir être exécutés dans un ordre raisonnable;
- les fichiers générés doivent rester séparés des données brutes;
- les données non partageables doivent être remplacées par une documentation claire;
- les fichiers temporaires, doublons et essais abandonnés doivent être retirés.

# Déroulement

## 1. Proposition

La proposition sert à stabiliser votre question, vos données et votre plan de travail. Elle est remise avec le fichier `proposition/proposition.qmd`, selon l’échéancier officiel indiqué sur Brio.

La proposition doit contenir :

1.  une introduction qui présente le contexte, l’objectif et la question principale;
2.  une description des données, incluant la source, l’unité d’observation, les variables importantes et les limites connues;
3.  un plan d’analyse qui explique les transformations prévues, les premiers graphiques, les comparaisons ou modèles envisagés et les risques de faisabilité.

Longueur recommandée : 2 à 4 pages rendues, hors annexes et graphiques exploratoires.

### Barème de la proposition

| Critère                                 | Points |
|-----------------------------------------|-------:|
| Question claire, pertinente et faisable |      5 |
| Description et provenance des données   |      5 |
| Plan d’analyse cohérent et réaliste     |      5 |
| Total                                   |     15 |

## 2. Développement

Après la proposition, votre équipe construit l’analyse dans le dépôt.

Le développement doit laisser des traces lisibles :

- scripts organisés dans `scripts/`;
- données brutes conservées dans `data/raw/` lorsque la licence permet le partage;
- données nettoyées ou intermédiaires dans `data/processed/`;
- dictionnaire des données dans `data/README.md`;
- figures exportées dans `figures/` lorsque pertinent;
- résultats intermédiaires dans `outputs/` lorsque pertinent.

Si les données ne peuvent pas être partagées publiquement, expliquez clairement comment les obtenir ou comment reproduire l’analyse dans les limites permises.

## 3. Présentation

La présentation est un exposé de 15 minutes maximum. Chaque membre doit parler.

Utilisez le fichier `presentation/presentation.qmd` fourni dans le template. Il produit des diapositives HTML avec Quarto et permet de présenter le projet dans un style proche des présentations `xaringan`, tout en restant dans un flux de travail `.qmd`.

La présentation doit couvrir :

- la question et son intérêt;
- la provenance et les limites des données;
- les choix de préparation ou de nettoyage importants;
- les résultats principaux;
- au moins une visualisation centrale;
- les limites de l’analyse;
- une conclusion ou une recommandation prudente.

### Barème de la présentation

| Critère                                             | Points |
|-----------------------------------------------------|-------:|
| Gestion du temps et clarté orale                    |      6 |
| Question, contexte et pertinence des données        |      7 |
| Qualité de l’analyse et des choix méthodologiques   |     12 |
| Qualité visuelle des diapositives et des graphiques |     10 |
| Interprétation, limites et esprit critique          |     10 |
| Total                                               |     45 |

## 4. Résumé final

Le résumé final est le fichier `README.md` à la racine du dépôt. Il doit permettre à une personne externe de comprendre rapidement ce que votre équipe a fait.

Le résumé final doit contenir :

- le titre du projet et les noms des membres;
- la question principale;
- une courte description des données;
- les principales étapes de l’analyse;
- les résultats les plus importants;
- une figure ou un tableau central, si pertinent;
- les limites;
- les références et la citation des données;
- un lien vers la présentation HTML rendue.

### Barème du résumé final

| Critère                                                      | Points |
|--------------------------------------------------------------|-------:|
| Synthèse claire de la question, des données et de la méthode |      6 |
| Résultats bien expliqués et reliés à la question             |      5 |
| Limites, références et lien vers la présentation             |      4 |
| Total                                                        |     15 |

# Reproductibilité et organisation

La reproductibilité est évaluée sur l’ensemble du dépôt, pas seulement sur un fichier.

| Critère | Points |
|----|---:|
| Structure du dépôt conforme et facile à naviguer | 5 |
| Code clair, scripts exécutables et objets bien nommés | 5 |
| Données documentées, provenance indiquée et fichiers inutiles retirés | 5 |
| Total | 15 |

# Travail d’équipe

Le travail d’équipe est obligatoire. Les contributions doivent être visibles dans l’historique GitHub.

Chaque équipe remettra aussi une évaluation par les pairs selon les modalités précisées sur Brio.

| Critère                                                        | Points |
|----------------------------------------------------------------|-------:|
| Contributions visibles, réparties et cohérentes avec le projet |      5 |
| Évaluation par les pairs et responsabilité d’équipe            |      5 |
| Total                                                          |     10 |

# Barème interne du projet

| Composante                                   | Points |
|----------------------------------------------|-------:|
| Proposition                                  |     15 |
| Présentation                                 |     45 |
| Résumé final dans `README.md`                |     15 |
| Reproductibilité et organisation du dépôt    |     15 |
| Travail d’équipe et évaluation par les pairs |     10 |
| Total                                        |    100 |

| Évaluation dans Brio | Points internes correspondants | Pondération du cours |
|----------------------|-------------------------------:|---------------------:|
| Proposition          |                             15 |                  6 % |
| Projet final         |                             85 |                 34 % |
| Total du projet      |                            100 |                 40 % |

# Avant la remise finale

Avant la remise finale, votre équipe devrait pouvoir répondre oui aux questions suivantes :

- Le `README.md` raconte le projet du début à la fin.
- La présentation HTML est rendue et le lien fonctionne.
- Les scripts importants sont dans `scripts/` et portent des noms clairs.
- Les données sont documentées dans `data/README.md`.
- Les fichiers inutiles ont été retirés.
- Les résultats principaux sont reliés explicitement à la question.
- Les limites et les sources sont visibles.
- Les contributions de l’équipe sont visibles dans l’historique GitHub.

# Conseils

- Commencez avec une question simple et améliorez-la progressivement.
- Testez l’importation des données avant de vous engager trop loin.
- Commitez souvent avec des messages explicites.
- Gardez les fichiers générés, les données brutes et les résultats intermédiaires bien séparés.
- Relisez votre dépôt comme si vous le découvriez pour la première fois.
- Les modalités officielles de remise, les dates et les ajustements administratifs sont toujours celles indiquées sur Brio.
