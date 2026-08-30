Aide responsable

# IA et aide

L'IA peut aider à comprendre, déboguer, reformuler et tester une idée. Elle ne remplace pas votre jugement: dans STT-1100, ce qui compte est votre capacité à vérifier, expliquer et assumer les choix présents dans vos livrables.

[Ouvrir GPT STT-1100](https://chatgpt.com/g/g-682d165f32e881918633affa3fe9dfd6-gpt-stt-1100) [Défis](defis.llms.md) [Projet](projet_session/index.llms.md) [Boîte à outils](boite_outils.llms.md)

1

Demander de l'aide

2

Vérifier soi-même

3

Déclarer l'usage

## Règle simple

L'IA est un outil de travail. Elle devient un problème si elle cache votre compréhension, invente des éléments ou produit une réponse que vous ne pouvez pas défendre.

### Autorisé

Demander une explication, une piste de débogage, une reformulation, une liste de vérifications ou une rétroaction sur votre propre travail.

### À contrôler

Réutiliser une suggestion seulement après avoir exécuté le code, comparé aux données et relu la consigne.

### À éviter

Remettre du code, du texte, des sources ou une interprétation que vous ne comprenez pas ou que vous ne pouvez pas refaire.

## Huit modes pour demander la bonne aide

Commencez votre message par la commande qui correspond à votre besoin. Le GPT adapte alors sa démarche et ses limites à l'activité concernée.

### Sources et consignes

`/sources` Vérifier une règle du cours et retrouver la source qui fait foi.

### Révision

`/revision` Revoir une notion avec une explication courte et une question de rappel.

### Exercices

`/exercices` Obtenir un exercice formatif distinct d'une évaluation active, avec des indices gradués.

### Rétroaction

`/retroaction` À la fin d'un module, faire relire un seul élément de l'aventure, du défi ou des exercices, puis décider soi-même quoi améliorer.

### Débogage R

`/debug-r` Diagnostiquer une erreur à partir du code minimal, du message complet et du résultat attendu.

### Projet

`/projet` Comparer des options, justifier un choix et alimenter un journal de décision.

### Préparation à l'examen

`/examen` Construire un plan de révision et pratiquer avec des questions analogues.

### Intégrité et IA

`/integrite-ia` Clarifier un usage permis, restreint, à déclarer, interdit ou inconnu.

## Usage permis de l'IA

Dans les défis et le projet, l'IA est permise comme aide au raisonnement, au débogage, à la révision, à la planification ou à la vérification. Dans l'examen, seuls les outils explicitement autorisés sur Brio sont permis. Dans tous les cas, le livrable final doit rester vérifiable, personnel et cohérent avec la consigne. Vous devez comprendre, tester et pouvoir expliquer tout code, texte, source, résultat ou interprétation remis. Quand l'IA influence une partie importante d'un livrable évalué, ajoutez une déclaration courte dans le livrable: outil utilisé, but de l'aide, partie touchée et vérification faite. Les modalités officielles indiquées sur Brio prévalent toujours.

1

### Aventures, mini-tests et exercices

Usage encouragé pour comprendre une notion, tester une commande, corriger une erreur ou trouver une autre explication.

2

### Défis

Appliquer la règle commune et ajouter une déclaration lorsque l'aide influence le livrable.

3

### Examen

Vérifier les outils explicitement autorisés sur Brio avant de commencer.

4

### Projet de session

Appliquer la règle commune dans le dépôt d'équipe et dans les remises.

## Quelle source fait foi?

Le GPT n'a pas accès à Brio. Pour une information propre au cours, il doit respecter cette hiérarchie et ne jamais compléter une information manquante par une supposition.

1.  Brio pour les dates, remises, pondérations, modalités administratives et outils autorisés.
2.  Une consigne officielle donnée par l'équipe enseignante.
3.  La page particulière de l'évaluation concernée.
4.  La page IA, puis les autres pages officielles du site du cours.
5.  L'instantané de connaissances du GPT, ses connaissances générales et les sources externes citées.

### Information introuvable

Si la réponse ne peut pas être vérifiée, le GPT doit répondre exactement: « Je ne sais pas. »

### Sources en contradiction

Brio et les instructions officielles de l'équipe enseignante prévalent. Si le conflit demeure, demandez une clarification à l'équipe.

### Connaissances mises en contexte

Les fichiers du GPT constituent un instantané. Pour une modalité courante, vérifiez toujours Brio et la page officielle concernée.

## Déclarer l'aide reçue

Quand l'IA influence une partie importante d'un livrable évalué, ajoutez une déclaration courte et claire dans le livrable. Cette déclaration n'est pas un portfolio: elle sert seulement à rendre l'usage transparent.

### Outil utilisé

Nommer l'outil ou le GPT utilisé, par exemple GPT STT-1100.

### But de l'aide

Indiquer si l'aide portait sur le débogage, la reformulation, la vérification, la planification ou la recherche d'erreurs.

### Partie touchée

Nommer la section, la fonction, le graphique ou le passage qui a été influencé.

### Vérification faite

Dire comment vous avez vérifié la suggestion: code exécuté, rendu Quarto, comparaison aux données, relecture des consignes.

## Avant d'utiliser une réponse

Une réponse utile doit être compatible avec les consignes, les données et le code réellement exécuté. Si une suggestion semble impressionnante mais ne se rend pas, ne correspond pas aux variables ou contredit la consigne, elle ne doit pas entrer dans le livrable.

1.  Relire la consigne du module, du défi ou du projet.
2.  Exécuter le code dans votre propre document Quarto.
3.  Vérifier que les noms de variables, filtres, unités et graphiques correspondent aux données.
4.  Réécrire l'interprétation avec vos propres mots.
5.  Conserver une note courte si l'aide a influencé le résultat final.

### Ne pas inventer

Aucune source, donnée, variable, résultat ou citation ne doit être ajoutée sans vérification.

### Ne pas déléguer le jugement

L'IA peut proposer; vous devez décider, tester et expliquer.

### Ne pas partager de données sensibles

N'envoyez pas de données personnelles, confidentielles ou non anonymisées dans un outil externe.

## Questions utiles à poser

Les meilleurs prompts demandent une aide ciblée et gardent la responsabilité de la décision de votre côté.

### Déboguer

`/debug-r` Voici mon message d'erreur complet, le code minimal et ce que je voulais obtenir. Pose-moi deux questions de diagnostic, puis propose une correction que je peux tester.

### Comprendre

`/revision` Explique cette sortie R en langage simple. Sépare ce qui est directement visible dans la sortie de ce qui demande une vérification dans les données.

### Réviser

`/retroaction` Voici la consigne, ce que j'ai essayé et l'extrait précis que je veux améliorer. Donne-moi un point solide, une fragilité à vérifier et une question qui m'aidera à corriger moi-même. Ne réécris pas tout.

### Améliorer

`/retroaction` Propose une version plus claire de ce paragraphe sans changer le résultat, sans ajouter de source et sans inventer d'information.

### Tester

`/sources` Voici ma consigne et mon document Quarto. Donne-moi une liste courte de vérifications à faire avant la remise: rendu, code, figures, interprétation et fichiers.

### Documenter

`/integrite-ia` Aide-moi à écrire une note de deux phrases qui nomme le GPT utilisé, le but de l'aide et la vérification que j'ai faite.
