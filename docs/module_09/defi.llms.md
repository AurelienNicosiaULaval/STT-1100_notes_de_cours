# Défi 9 - Capsule vidéo

STT-1100 Introduction à la science des données

# Mission

Dans l’aventure 9, vous avez construit un modèle prédictif simple et examiné un jeu de données fictif où les taux d’admission varient selon certains groupes. Le défi consiste à communiquer clairement une analyse en capsule vidéo.

Vous devez utiliser le dépôt GitHub créé à partir du template `STT-1100/aventure-9`.

# Choix du sujet

Choisissez une seule option.

Option A : modèle prédictif

- Présentez le modèle `IMSE ~ SFR + Nbre_Eleves`.
- Expliquez ce que signifient les coefficients.
- Comparez les valeurs prédites et les valeurs observées pour quelques écoles.
- Expliquez une limite importante du modèle, notamment les lignes où `Diffusion == "NON"`.

Option B : biais descriptif

- Présentez le jeu `eleves_fictifs.csv`.
- Comparez les taux d’admission selon `Sexe`.
- Ajoutez au moins une autre variable, par exemple `Acces_ressources`, `Langue_maternelle` ou `Niveau_socio_economique`.
- Expliquez pourquoi une différence observée doit être interprétée avec prudence.

# Livrable

Vous devez remettre une capsule vidéo de 180 secondes maximum.

Le dépôt doit contenir au choix :

- un fichier vidéo dans le dossier `video/`;
- ou un fichier `LIEN_VIDEO.md` contenant un lien accessible vers la capsule, si le fichier est trop volumineux pour GitHub.

Votre dépôt doit aussi contenir les données fournies dans le template.

# Structure attendue

Votre capsule doit inclure :

1.  une courte mise en contexte;
2.  une question d’analyse claire;
3.  une méthodologie brève;
4.  au moins un résultat visuel;
5.  une interprétation prudente;
6.  une recommandation ou une limite importante.

# Critères d’évaluation

| Critère | Attente |
|----|----|
| Clarté | La question, les données et le résultat principal sont faciles à comprendre. |
| Exactitude | Les calculs ou le modèle correspondent aux variables utilisées. |
| Visualisation | Au moins un graphique ou tableau soutient l’argument. |
| Prudence | La capsule distingue une association, une prédiction et une conclusion causale. |
| Éthique | Les limites, les valeurs manquantes ou les biais possibles sont discutés. |
| Respect du format | La capsule dure 180 secondes maximum et le lien ou fichier est accessible. |

# Conseils

- Préparez un plan avant d’enregistrer.
- Ne montrez pas trop de résultats.
- Expliquez un résultat important plutôt que plusieurs résultats trop rapidement.
- Évitez de dire qu’un modèle est juste parce qu’il produit une prédiction.
- Terminez par une recommandation concrète et prudente.

# Ressources

- ModernDive, Simple Linear Regression : <https://moderndive.com/v2/regression.html>
- ModernDive, Multiple Regression : <https://moderndive.com/v2/multiple-regression.html>
- Documentation R de `lm()` : <https://stat.ethz.ch/R-manual/R-devel/library/stats/html/lm.html>
- Documentation R de `predict.lm()` : <https://stat.ethz.ch/R-manual/R-devel/library/stats/html/predict.lm.html>
