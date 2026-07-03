# Défi 6 - Revue croisée d’un rapport collaboratif

STT-1100 Introduction à la science des données

# Mission

Votre équipe a produit un rapport collaboratif dans l’aventure 6. Le défi consiste maintenant à jouer le rôle d’une équipe de revue : vous devez lire le rapport d’une autre équipe, tester sa reproductibilité et formuler une rétroaction utile dans GitHub.

L’objectif n’est pas de trouver des fautes pour le plaisir. L’objectif est de vérifier si une autre personne peut comprendre, exécuter et réutiliser le travail.

# Organisation

L’enseignant·e attribuera une équipe à examiner.

Pour l’équipe examinatrice :

- ouvrir le dépôt GitHub de l’équipe attribuée;
- lire le `README.md`;
- ouvrir le rapport HTML;
- consulter le fichier `rapport.qmd`;
- vérifier si les sections principales sont cohérentes avec l’aventure 6.

Pour l’équipe révisée :

- répondre aux issues reçues;
- corriger le rapport si une suggestion est pertinente;
- pousser les corrections dans GitHub.

# Revue attendue

Chaque membre de l’équipe examinatrice doit ouvrir au moins **une issue GitHub** dans le dépôt de l’équipe révisée.

Chaque issue doit contenir :

1.  un titre clair;
2.  un aspect réussi;
3.  une suggestion d’amélioration précise;
4.  une référence à une section, un graphique, un chunk ou une ligne de raisonnement;
5.  une courte justification.

Voici une structure possible.

``` markdown
## Aspect réussi

...

## Suggestion

...

## Pourquoi cette suggestion est utile

...
```

# Points à vérifier

Votre revue doit porter sur au moins trois dimensions parmi les suivantes.

- **Clarté** : les sections, titres et interprétations sont-ils faciles à suivre?
- **Reproductibilité** : les packages sont-ils chargés, les chunks sont-ils nommés et le rapport semble-t-il pouvoir être rendu?
- **Données** : les jointures entre `flights`, `airlines` et `weather` sont-elles compréhensibles?
- **Visualisations** : les graphiques ont-ils des titres, axes et unités utiles?
- **Interprétation** : les conclusions restent-elles descriptives et prudentes?
- **Collaboration** : les rôles, commits, branches ou pull requests sont-ils documentés?

# Livrables

Votre dépôt GitHub doit montrer :

- au moins une issue déposée par chaque membre de l’équipe examinatrice;
- des réponses de l’équipe révisée aux issues reçues;
- une mise à jour du rapport si une correction était nécessaire;
- un `rapport.html` final qui se rend correctement.

# Grille d’évaluation

| Critère | Excellent | Satisfaisant | À améliorer |
|----|----|----|----|
| Qualité des issues | Les commentaires sont précis, constructifs et appuyés sur des éléments observables | Les commentaires sont utiles, mais parfois généraux | Les commentaires sont vagues ou difficiles à utiliser |
| Reproductibilité | La revue vérifie clairement les packages, les données, les chunks et le rendu | La revue mentionne la reproductibilité sans tout vérifier | La reproductibilité est peu ou pas discutée |
| Analyse et visualisations | La revue discute les jointures, graphiques et interprétations avec prudence | La revue commente surtout la présentation | La revue ne touche pas vraiment au contenu analytique |
| Suivi | L’équipe révisée répond clairement et corrige ce qui doit l’être | L’équipe répond, mais sans beaucoup de détails | Les issues restent sans réponse |

# Checklist avant remise

- Chaque membre a ouvert au moins une issue.
- Chaque issue contient un aspect réussi et une suggestion précise.
- L’équipe révisée a répondu aux issues reçues.
- Les corrections retenues ont été poussées sur GitHub.
- Le rapport final se rend en HTML.
