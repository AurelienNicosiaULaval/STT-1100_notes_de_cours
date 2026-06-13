# Aventure 9 - Prédiction et biais algorithmiques

STT-1100 Introduction à la science des données

# 🎬 Mise en situation : Contrôle de la qualité en éducation

Vous travaillez comme **scientifique de données junior** au département de contrôle de la qualité et de l’équité au Ministère de l’Éducation du Québec. Votre mandat : utiliser des données réelles et fictives pour identifier, évaluer et atténuer des biais algorithmiques dans les décisions éducatives.

Votre supérieur, **Michel Dufour**, directeur adjoint du département, vous accueille avec ces mots :

> « Bienvenue dans l’équipe ! Notre travail est crucial : assurer que chaque enfant ait des chances égales de réussite. Pour cela, nous devons non seulement prédire efficacement certains indicateurs, mais aussi comprendre et éviter les biais dans nos modèles. »

> **NOTE:**
>
> **Votre interlocuteur : Michel Dufour**
> Il vous accompagne dans cette aventure : il posera des questions clés et attendra vos résultats et analyses détaillées.

## Objectifs de l’aventure

- Construire un modèle prédictif clair à partir de données réelles.
- Identifier et expliquer des biais potentiels sur des données fictives.
- Présenter clairement vos analyses et réflexions sur ces biais.
- Proposer des recommandations concrètes pour atténuer ces biais.

------------------------------------------------------------------------

# 📚 Mission 1 : Modèle prédictif à l’échelle des écoles

Michel vous remet un [fichier de données issues du portail Données Québec](https://www.donneesquebec.ca/recherche/dataset/indices-de-defavorisation/resource/6c5d4a5d-ba3b-40a6-b570-916f43ab622c). Ces données contiennent des informations de défavorisation sur les écoles primaires du Québec.

> **IMPORTANT:**
>
> « Je vous invite à explorer les données. Mais attention : les noms des colonnes ne sont pas toujours intuitifs. Commencez par visiter la page de documentation sur Données Québec pour bien comprendre leur signification. »

## Étape 1 : Exploration et nettoyage

- Identifiez les variables pertinentes.
- Faites un nettoyage sommaire si nécessaire (valeurs manquantes, types de données, etc.).
- Réalisez une analyse descriptive complète de ces données (référez-vous aux modules 2 à 4).

``` r
df_ecoles <- read_csv("ecoles_primaires_qc.csv")
glimpse(df_ecoles)
```

## Étape 2 : Modèle de régression

> **IMPORTANT:**
>
> « J’aimerais que vous construisiez un modèle de régression linéaire pour prédire l’**IMSE** (Indice de Milieu Socio-Économique), à partir de deux variables : la proportion d’élèves à faible revenu (**SFR**) et le **nombre total d’élèves** dans l’école. »

``` r
modele <- lm( ... , data = ...)
summary(modele)
```

> **IMPORTANT:**
>
> « Une fois le modèle construit, pouvez-vous m’expliquer, en langage simple, ce que signifient les deux coefficients ? »

## Étape 3 : Prédictions ciblées

Vous utiliserez ensuite la fonction `predict()` pour générer des prédictions d’IMSE à partir de votre modèle.

``` r
predict(modele, newdata = df_ecoles)
```

> **IMPORTANT:**
>
> « J’aimerais que vous utilisiez votre modèle pour : »
>
> \- prédire l’IMSE pour les **10 écoles les plus grandes** (en nombre d’élèves);
>
> \- prédire l’IMSE pour les **10 écoles ayant les SFR les plus élevés**.
>
> Comparer les valeurs prédites aux valeurs réelles. Votre modèle est-il bon?

## Étape 4 : Prédictions sur écoles manquantes

> **IMPORTANT:**
>
> « Dernière chose : dans les données, certaines écoles ont la variable **Diffusion** à “NON”. Ces écoles n’ont pas d’IMSE mesuré — souvent parce qu’elles comptent moins de 30 élèves. »
>
> « Pouvez-vous utiliser votre modèle pour **prédire l’IMSE de toutes les écoles ayant moins de 30 élèves** ? Ensuite, j’aimerais savoir : que pensez-vous de la validité de ces prédictions ? Peut-on s’y fier ? »

------------------------------------------------------------------------

# 📊 Mission 2 : Détection des biais individuels

Michel vous fournit également un jeu de données fictif de 1000 élèves. À première vue, ce jeu semble neutre. Mais est-ce vraiment le cas ?

Chargez les données :

``` r
df_eleves <- read_csv("eleves_fictifs.csv")
glimpse(df_eleves)
```

### Étape 1 : Analyse globale

Commencez par calculer et visualiser le **taux d’admission global**.

``` r
df_eleves %>%
  count(Admission) %>%
  mutate(pct = n / sum(n))
```

Discutez de ce que vous observez : est-ce équilibré ? Surprenant ?

### Étape 2 : Analyse par groupe

Maintenant, explorez les taux d’admission **selon le sexe**.

``` r
# code a modifier
df_eleves %>%
  count(Admission) %>%
  group_by(Sexe) %>%
  mutate(pct = n / sum(n))
```

Produisez un graphique clair pour illustrer les différences potentielles.

### Étape 3 : Discussion guidée

- Voyez-vous une différence notable entre les groupes ?
- Cette différence est-elle justifiée ? Quelles hypothèses pouvez-vous faire ?
- Peut-on parler de **biais** ici ? Pourquoi ?

### Étape 4 : Exploration d’autres variables

Poursuivez ensuite avec l’analyse selon d’autres variables (langue maternelle, niveau socio-économique, accès aux ressources).

Vous pouvez reproduire la même logique : tableau croisé + graphique + interprétation.

**À rendre :** une brève synthèse présentant le ou les biais détectés, avec un appui visuel clair et des recommandations ou pistes d’amélioration.

------------------------------------------------------------------------

# 📹 Défi à remettre

Vous devrez réaliser une **capsule vidéo de 180 secondes maximum** dans laquelle vous présentez :

- Soit votre modèle prédictif à partir des données réelles (Mission 1).
- Soit votre analyse du biais détecté à partir des données fictives (Mission 2).

Votre capsule doit inclure :

- Une courte introduction (mise en contexte).
- Votre méthodologie brièvement expliquée.
- Vos résultats présentés de manière visuelle (tableaux, graphiques).
- Une conclusion claire avec des recommandations ou pistes d’amélioration.

Votre capsule vidéo devra être déposée sur le dépôt GitHub indiqué.

> **TIP:**
>
> 🎯 **Conseils pour réussir votre vidéo :**
>
> - Soyez concis et clair.
> - Appuyez-vous sur des graphiques lisibles.
> - Parlez lentement, distinctement, et soyez dynamique !

------------------------------------------------------------------------

# ✅ Conclusion de l’aventure

Vous avez construit un modèle prédictif utile pour la prise de décision et appris à détecter des biais critiques dans des données individuelles.

Bravo pour votre rigueur, votre sens de l’observation et votre posture éthique ! 🎉📊
