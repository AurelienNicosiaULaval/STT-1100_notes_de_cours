# Aventure 9 - Prédiction et biais algorithmiques

STT-1100 Introduction à la science des données

## Mise en situation : contrôle de la qualité en éducation

Vous travaillez comme scientifique de données junior au département de contrôle de la qualité et de l’équité au ministère de l’Éducation du Québec. Votre mandat consiste à utiliser des données réelles et fictives pour construire une première prédiction, puis pour examiner les limites et les biais possibles de cette prédiction.

Michel Dufour, directeur adjoint du département, vous confie le mandat suivant :

> Bienvenue dans l’équipe. Notre travail est de produire des analyses utiles sans donner une fausse impression de certitude. Un modèle peut aider à comprendre une situation, mais il peut aussi masquer des limites importantes.

> **NOTE:**
>
> Votre interlocuteur : Michel Dufour
>
> Il vous accompagne tout au long de cette aventure. Il pose des questions clés et vous demande d’expliquer vos résultats dans un langage accessible.

Carte de visite

Votre rôle Scientifique de données junior

Interlocuteur Michel Dufour

Organisation et contexte Ministère de l’Éducation du Québec, contrôle qualité et équité

Mission Construire une première prédiction et discuter les limites et biais possibles

Données `ecoles_primaires_qc.csv` et `eleves_fictifs.csv`

Livrable Capsule vidéo courte avec résultat, visualisation et prudence d’interprétation

### Objectifs de l’aventure

- Ajuster un modèle de régression linéaire multiple.
- Utiliser `predict()` pour produire des prédictions ciblées.
- Comparer des valeurs prédites à des valeurs observées.
- Détecter un biais descriptif dans un jeu de données fictif.
- Formuler une recommandation prudente à partir d’une analyse.

> **NOTE:**
>
> - Vous ajustez un premier modèle avec `lm()` et l’utilisez avec `predict()`.
> - Vous comparez valeurs observées et valeurs prédites en discutant les limites des données.
> - Vous analysez un biais descriptif sans confondre différence observée et preuve de discrimination.
> - Vous préparez une explication courte, claire et accessible en format vidéo.

## Mission 1 : modèle prédictif à l’échelle des écoles

Michel vous remet le fichier `ecoles_primaires_qc.csv`. Il contient des informations sur les indices de défavorisation dans des écoles primaires du Québec.

> **IMPORTANT:**
>
> Les noms de colonnes ne sont pas toujours intuitifs. Avant de modéliser, inspectez les variables et vérifiez quelles lignes sont utilisables.

### Étape 1 : exploration et nettoyage

Commencez par charger les données et inspecter leur structure.

``` r
df_ecoles <- read_csv("ecoles_primaires_qc.csv")

glimpse(df_ecoles)

df_ecoles |>
  summarise(
    n = n(),
    imse_manquant = sum(is.na(IMSE)),
    sfr_manquant = sum(is.na(SFR)),
    effectif_manquant = sum(is.na(Nbre_Eleves))
  )
```

Pour construire le modèle, utilisez seulement les écoles dont les variables nécessaires sont disponibles.

``` r
df_modele <- df_ecoles |>
  filter(
    Diffusion == "OUI",
    !is.na(IMSE),
    !is.na(SFR),
    !is.na(Nbre_Eleves)
  )

nrow(df_modele)
```

> **NOTE:**
>
> Les lignes où `Diffusion == "NON"` ne contiennent pas `IMSE`, `SFR` ni `Nbre_Eleves` dans le fichier local. On ne peut donc pas utiliser le modèle demandé pour prédire ces lignes sans information supplémentaire.

### Étape 2 : modèle de régression

> **IMPORTANT:**
>
> Construisez un modèle de régression linéaire pour prédire `IMSE` à partir de `SFR` et de `Nbre_Eleves`. Ensuite, expliquez les coefficients en langage simple.

``` r
modele <- lm(IMSE ~ SFR + Nbre_Eleves, data = df_modele)

summary(modele)
```

Questions à traiter :

- Que signifie le coefficient associé à `SFR`, si `Nbre_Eleves` reste constant?
- Que signifie le coefficient associé à `Nbre_Eleves`, si `SFR` reste constant?
- Est-ce qu’une association statistique permet de conclure à une relation causale?

### Étape 3 : prédictions ciblées

Utilisez `predict()` pour produire des prédictions sur des écoles observées.

``` r
df_predictions <- df_modele |>
  mutate(
    imse_predit = predict(modele, newdata = df_modele),
    erreur = IMSE - imse_predit
  )
```

> **NOTE:**
>
> Les écoles comparées ici ont aussi servi à ajuster le modèle. Les erreurs aident donc à repérer des cas mal décrits ou des limites visibles dans les données d’ajustement. Elles ne mesurent pas la performance du modèle sur de nouvelles écoles.

Michel vous demande deux comparaisons ciblées.

``` r
df_predictions |>
  slice_max(Nbre_Eleves, n = 10) |>
  select(Nom_Org, IMSE, imse_predit, erreur, SFR, Nbre_Eleves)
```

``` r
df_predictions |>
  slice_max(SFR, n = 10) |>
  select(Nom_Org, IMSE, imse_predit, erreur, SFR, Nbre_Eleves)
```

> **IMPORTANT:**
>
> Le modèle semble-t-il aussi fiable pour toutes les écoles? Quelles écoles ont les plus grandes erreurs? Qu’est-ce que cela vous apprend sur les limites du modèle?

### Étape 4 : cas non diffusés et limites du modèle

Dans le fichier, certaines lignes ont `Diffusion == "NON"`. Ces lignes n’ont pas de valeurs disponibles pour les variables nécessaires au modèle.

``` r
df_ecoles |>
  count(Diffusion)

df_ecoles |>
  filter(Diffusion == "NON") |>
  summarise(
    n = n(),
    imse_manquant = sum(is.na(IMSE)),
    sfr_manquant = sum(is.na(SFR)),
    effectif_manquant = sum(is.na(Nbre_Eleves))
  )
```

> **IMPORTANT:**
>
> Peut-on prédire l’IMSE des écoles non diffusées avec ce modèle? Si non, quelles données additionnelles faudrait-il obtenir? Et pourquoi serait-il risqué de remplacer automatiquement ces valeurs manquantes par une prédiction?

## Mission 2 : détection d’un biais descriptif

Michel vous fournit aussi un jeu de données fictif de 1000 élèves, `eleves_fictifs.csv`. À première vue, ce jeu semble neutre. Mais est-ce vraiment le cas?

``` r
df_eleves <- read_csv("eleves_fictifs.csv")

glimpse(df_eleves)
```

### Étape 1 : taux d’admission global

Commencez par calculer le taux d’admission global.

``` r
taux_global <- df_eleves |>
  count(Admission) |>
  mutate(pct = n / sum(n))

taux_global
```

### Étape 2 : taux d’admission selon le sexe

Explorez ensuite les taux d’admission selon `Sexe`.

``` r
taux_sexe <- df_eleves |>
  count(Sexe, Admission) |>
  group_by(Sexe) |>
  mutate(pct = n / sum(n)) |>
  ungroup()

taux_sexe
```

Produisez un graphique clair.

``` r
ggplot(taux_sexe, aes(x = Sexe, y = pct, fill = Admission)) +
  geom_col(position = "dodge") +
  labs(
    title = "Taux d'admission selon le sexe",
    x = "Sexe",
    y = "Proportion",
    fill = "Admission"
  ) +
  theme_minimal()
```

### Étape 3 : discussion guidée

Répondez aux questions suivantes :

- Observez-vous une différence notable entre les groupes?
- Cette différence suffit-elle à prouver une discrimination?
- Quelles autres variables devraient être examinées avant de conclure?
- Peut-on parler d’un biais descriptif dans ce jeu de données? Pourquoi?

### Étape 4 : autres variables

Répétez la même logique pour d’autres variables, par exemple `Langue_maternelle`, `Niveau_socio_economique` ou `Acces_ressources`.

``` r
df_eleves |>
  count(Acces_ressources, Admission) |>
  group_by(Acces_ressources) |>
  mutate(pct = n / sum(n)) |>
  ungroup()
```

## Défi à remettre

Le défi associé à cette aventure est décrit dans la page [Défi 9 - Capsule vidéo](../module_09/defi.llms.md).

Vous devrez produire une capsule vidéo de 180 secondes maximum. Vous pouvez présenter soit votre modèle prédictif de la Mission 1, soit votre analyse de biais de la Mission 2. Le dépôt de départ est le template GitHub `STT-1100/aventure-9`.

Trace portfolio

Votre trace doit montrer le résultat, mais aussi la prudence d’interprétation.

- un résultat de modèle ou de biais descriptif;
- une visualisation qui soutient votre explication;
- une phrase claire sur association, prédiction et causalité;
- un brouillon de formulation accessible pour la capsule vidéo.

## Conclusion de l’aventure

Vous avez construit un premier modèle prédictif, produit des prédictions ciblées et identifié un biais descriptif dans des données fictives. Le point central de l’aventure est la prudence : un modèle peut être utile, mais il doit toujours être accompagné d’une discussion sur ses limites, ses données manquantes et ses effets possibles.
