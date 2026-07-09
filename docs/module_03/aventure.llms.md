# Aventure 3 - Infractions dans les restaurants de Montréal

STT-1100 Introduction à la science des données

## Mise en situation : devenez journaliste de données

Vous êtes engagés comme **journaliste de données** par *Le Courrier Gourmand*, un média local fictif qui publie des enquêtes interactives sur l’alimentation à Montréal. Votre rédactrice en chef souhaite un article éclairant le public sur **les infractions alimentaires commises dans les établissements alimentaires montréalais**. Elle vous donne quelques pistes de réflexion :

- Quelle est la proportion des constats qui concernent des établissements situés à Montréal ?

- Quelles sont les infractions les plus courantes ?

- Quels types d’établissements sont touchés ?

- Quel montant d’amendes a été imposé en moyenne ? Ce montant dépend-il du type d’infraction ?

À la fin de l’aventure, vous devrez remettre **un article Quarto** (HTML) répondant à ces questions et illustré de graphiques construits dans R.

> **NOTE:**
>
> **Votre allié municipal**
> Voici **Alexandre**, conseiller municipal chargé de l’hygiène alimentaire à la Ville de Montréal. Il suit votre enquête pas à pas et vous posera, à des moments clés, des questions pour aiguiller vos analyses. C’est un allié précieux pour la rédaction de votre article, mais il a aussi ses exigences. Il attend de vous que vous lui fournissiez des réponses claires et précises, accompagnées de graphiques pertinents.

Carte de visite

Votre rôle Journaliste de données

Interlocuteurs Rédaction du Courrier Gourmand et Alexandre, conseiller municipal

Organisation et contexte Média local fictif et Ville de Montréal

Mission Produire un article clair sur les infractions alimentaires montréalaises

Données `UlavalSSD::listecondamnation`

Livrable Article Quarto HTML illustré

### Objectifs de l’aventure

- Importer et nettoyer un jeu de données catégorielles réelles (infractions alimentaires).
- Construire des tableaux de fréquence, des statistiques descriptives et des visualisations.
- Rédiger un court billet journalistique reproductible dans Quarto.

**Note pour le rapport**
Tout au long de l’analyse, vous devrez garder en tête ces questions et y répondre de manière argumentée dans votre rapport Quarto.

Dans ce module, vous explorerez un **jeu de données** qui décrit diverses infractions, leurs amendes et le type d’établissements concernés. Votre mission : **analyser les constats d’infraction afin de produire un article clair sur les établissements alimentaires à Montréal**.

------------------------------------------------------------------------

## Comment réussir l’aventure

1.  **Charger les données** : chargez le package `UlavalSSD`. Le jeu `listecondamnation` sera alors disponible dans R.
2.  **Suivre les sections** : Chaque section contient des explications, une démonstration, des expérimentations à réaliser, puis des exercices.
3.  **Documenter vos trouvailles** : Comme dans les aventures précédentes, commentez votre code, expliquez vos choix et validez vos analyses. Vos trouvailles vont vous aider à rédiger votre article.

------------------------------------------------------------------------

## Travail sur GitHub

Avant de commencer l’analyse des données, vous devez récupérer le dépôt GitHub contenant les fichiers nécessaires.

1.  Clonez votre dépôt `aventure-3-IDENTIFIANT_GITHUB`. Pour cela, créez un nouveau projet RStudio et collez le lien de votre dépôt GitHub selon la méthode indiquée dans la feuille aide-mémoire.

Astuce : Si vous souhaitez revenir plus tard sur ce projet, vous pouvez ouvrir directement le projet en double-cliquant sur le fichier `.Rproj` dans votre explorateur de fichiers.

2.  Ajustez le fichier Quarto : le modèle de l’article de journal est présent dans le dépôt sous le nom `template_article.qmd`. Inscrivez votre nom et enregistrez.

3.  Faites un premier commit et un premier push vers GitHub. Une fois votre fichier `.qmd` ajusté et enregistré, commitez et poussez vos modifications sur GitHub.

Attention : les messages de commit doivent être parlants. Par exemple : “Ajout de mon nom dans l’article”.

Félicitations ! Vous êtes maintenant prêt à débuter l’analyse !

## Variables catégoriques : les bases en R avec `stringr`

### Explications

En R, une variable catégorique est souvent représentée par :

- Un **facteur** (`factor`) qui contient un ensemble de niveaux définis.

- Ou un simple **character** pour les chaînes de caractères.

**Dans le tidyverse**, on manipule souvent des chaînes de caractères avec le package **stringr** ; pour la conversion en facteur, on peut utiliser `as.factor()` ou le package **forcats**.

Pour le module 3, nous nous concentrerons sur les variables catégoriques de type **character**. Dans le module 4, nous verrons plus en détail les facteurs.

Voici des exemples montrant comment utiliser `stringr` pour manipuler des variables de type character dans un jeu de données comme `listecondamnation`. Les exemples ci-dessous ciblent des cas fréquents : détection de motifs, extraction, remplacement et nettoyage de chaînes.

### Démonstration

On va utiliser le jeu de données `listecondamnation` de la librairie `UlavalSSD`, qui contient des constats de condamnation liés à des établissements alimentaires au Québec.

``` r
library(UlavalSSD)
library(tidyverse)
glimpse(listecondamnation)
```

    Rows: 1,712
    Columns: 10
    $ Nom_exploitant          <chr> "9390-5172 QUEBEC INC.", "9255-2124 QUEBEC INC…
    $ Raison_sociale          <chr> "DELI 365", "RESTAURANT TCHANG KIANG", "DEVI",…
    $ Description_infraction  <chr> "NUL NE PEUT, SANS ETRE TITULAIRE D'UN PERMIS …
    $ Adresse_lieu_infraction <chr> "365 RUE BERNARD OUEST MONTREAL, (QC) H2V1T6",…
    $ Type_etablissement      <chr> "RESTAURANT METS A EMPORTER", "RESTAURANT", "R…
    $ Date_infraction         <dttm> 2021-11-09, 2021-11-09, 2021-11-10, 2021-11-1…
    $ Date_jugement           <dttm> 2023-03-13, 2023-04-17, 2023-02-16, 2023-03-1…
    $ Date_publication        <dttm> 2023-03-13, 2023-04-17, 2023-02-16, 2023-03-1…
    $ Amende                  <chr> "5 000 $", "800 $", "2 300 $", "1 100 $", "2 2…
    $ SOC_NOM_ARTCL_INFRC     <chr> NA, "INSALUBRITE", NA, "INSALUBRITE", "INSALUB…

> **Remarque** : Lancer `glimpse()` sur vos données vous permettra de repérer quelles colonnes sont en `chr` (character) et lesquelles sont en `factor` ou encore en `numeric`.

> **Remarque 2** : Trois colonnes sont au format date, pour l’instant, nous n’en tiendrons pas compte, nous reviendrons dans un module plus tard sur le format date.

> **TIP:**
>
> Quel est le type de la variable `Amende`? Est-ce que cela vous semble problématique?

> Cette information sera pertinente pour le nettoyage de la variable `Amende` dans la section suivante. Vous pourrez ainsi documenter ce choix dans la section Méthodologie de l’article.

> **IMPORTANT:**
>
> *« Combien de constats d’infraction apparaissent dans le fichier brut ? »*

> **CAUTION:**
>
> **Réponse possible** : Utilisez `nrow(listecondamnation)` après le chargement des données. On obtient **1 712** lignes.
>
> Alexandre vous rappelle que `?listecondamnation` vous donne la documentation du jeu de données.

#### Détection de motifs (`str_detect()`)

Pour vérifier si l’adresse mentionne `"MONTREAL"`, on peut faire :

``` r
# Créer une colonne booléenne à partir du texte de l'adresse
condamnations_demo <- listecondamnation %>%
  mutate(adresse_mentionne_montreal = str_detect(Adresse_lieu_infraction, "MONTREAL"))

# Aperçu
condamnations_demo %>%
  select(Adresse_lieu_infraction, adresse_mentionne_montreal) %>%
  head(10)
```

    # A tibble: 10 × 2
       Adresse_lieu_infraction                                adresse_mentionne_mo…¹
       <chr>                                                  <lgl>
     1 365 RUE BERNARD OUEST MONTREAL, (QC) H2V1T6            TRUE
     2 6066 RUE SHERBROOKE OUEST MONTREAL, (QC) H4A1Y1        TRUE
     3 1450 RUE CRESCENT MONTREAL, (QC) H3G2B6                TRUE
     4 751 BOULEVARD DE LA COTE-VERTU MONTREAL, (QC) H4L1Y6   TRUE
     5 2127 RUE SAINTE-CATHERINE OUEST MONTREAL, (QC) H3H1M6  TRUE
     6 4024B RUE SAINTE-CATHERINE OUEST WESTMOUNT, (QC) H3Z1… FALSE
     7 1235 AVENUE DU MONT-ROYAL EST MONTREAL, (QC) H2J1Y2    TRUE
     8 1500 AVENUE MCGILL COLLEGE A-027 MONTREAL, (QC) H3A3J5 TRUE
     9 5176 CHEMIN QUEEN-MARY MONTREAL, (QC) H3W1X5           TRUE
    10 5176 CHEMIN QUEEN-MARY MONTREAL, (QC) H3W1X5           TRUE
    # ℹ abbreviated name: ¹​adresse_mentionne_montreal

Vous obtenez `TRUE/FALSE` selon la présence du mot **MONTREAL** dans la chaîne. Cette méthode est utile pour illustrer `str_detect()`, mais elle ne sera pas notre critère principal pour filtrer Montréal dans le reste de l’aventure. Nous utiliserons plutôt les codes postaux.

> **TIP:**
>
> Quelle est la proportion d’adresses contenant le mot **MONTREAL** ?

> **IMPORTANT:**
>
> **Message d’Alexandre** : *« C’est un fait très intéressant à mettre dans ton article!»*

#### Remplacement (`str_replace()` et `str_replace_all()`)

La colonne `Amende` est une chaîne de caractères. Elle contient des montants comme `"5 000 $"`, avec des espaces et le symbole `$`. Pour l’utiliser dans des calculs, il faut créer une variable numérique.

``` r
# parse_number() extrait la valeur numérique et ignore le symbole $
condamnations_demo <- condamnations_demo %>%
  mutate(
    amende_num = parse_number(
      Amende,
      locale = locale(grouping_mark = " ", decimal_mark = ",")
    )
  )

# Vérifions
condamnations_demo %>%
  select(Amende, amende_num) %>%
  head(10)
```

    # A tibble: 10 × 2
       Amende  amende_num
       <chr>        <dbl>
     1 5 000 $       5000
     2 800 $          800
     3 2 300 $       2300
     4 1 100 $       1100
     5 2 200 $       2200
     6 1 200 $       1200
     7 3 000 $       3000
     8 3 000 $       3000
     9 1 000 $       1000
    10 1 000 $       1000

Ici, `parse_number()` vient du package `readr`, inclus dans le tidyverse. Le paramètre `grouping_mark = " "` indique que l’espace sert à grouper les milliers.

> **TIP:**
>
> Quel est le type de la variable `amende_num` ? Est-ce encore un problème ?

> **IMPORTANT:**
>
> *« Pas si simple d’avoir la colonne Amende en numérique!»*

#### Extraction de motifs (`str_extract()`)

Pour extraire un élément précis. Par exemple, si `Adresse_lieu_infraction` contient un code postal de la forme `H2X 3E4`, on peut tenter :

``` r
condamnations_demo <- condamnations_demo %>%
  mutate(
    code_postal = str_extract(Adresse_lieu_infraction, "[A-Z][0-9][A-Z]\\s*[0-9][A-Z][0-9]"),
    code_postal = str_to_upper(code_postal),
    code_postal = str_replace(code_postal, "^([A-Z][0-9][A-Z])\\s*([0-9][A-Z][0-9])$", "\\1 \\2")
  )

condamnations_demo %>%
  select(Adresse_lieu_infraction, code_postal) %>%
  head(10)
```

    # A tibble: 10 × 2
       Adresse_lieu_infraction                                 code_postal
       <chr>                                                   <chr>
     1 365 RUE BERNARD OUEST MONTREAL, (QC) H2V1T6             H2V 1T6
     2 6066 RUE SHERBROOKE OUEST MONTREAL, (QC) H4A1Y1         H4A 1Y1
     3 1450 RUE CRESCENT MONTREAL, (QC) H3G2B6                 H3G 2B6
     4 751 BOULEVARD DE LA COTE-VERTU MONTREAL, (QC) H4L1Y6    H4L 1Y6
     5 2127 RUE SAINTE-CATHERINE OUEST MONTREAL, (QC) H3H1M6   H3H 1M6
     6 4024B RUE SAINTE-CATHERINE OUEST WESTMOUNT, (QC) H3Z1P2 H3Z 1P2
     7 1235 AVENUE DU MONT-ROYAL EST MONTREAL, (QC) H2J1Y2     H2J 1Y2
     8 1500 AVENUE MCGILL COLLEGE A-027 MONTREAL, (QC) H3A3J5  H3A 3J5
     9 5176 CHEMIN QUEEN-MARY MONTREAL, (QC) H3W1X5            H3W 1X5
    10 5176 CHEMIN QUEEN-MARY MONTREAL, (QC) H3W1X5            H3W 1X5

Le motif `[A-Z][0-9][A-Z]\\s*[0-9][A-Z][0-9]` est une forme simplifiée d’un code postal canadien.

> **TIP:**
>
> Dans ce jeu de données, isolez les constats dont le code postal commence par `H2X`. Ne concluez pas que cela représente tout un quartier sans source géographique externe.
>
> Combien de constats d’infraction ont un code postal qui commence par `H2X` ?

> **IMPORTANT:**
>
> *« Nous avons souvent parlé des constats associés au secteur `H2X`. Est-ce qu’ils représentent une grande part des constats montréalais ? »*
>
> Un bel ajout à ton article!

#### Mise en forme (`str_to_lower()`, `str_to_upper()`, etc.)

Parfois, il est utile d’harmoniser la casse (`MONTREAL`, `Montréal`, etc.) :

``` r
condamnations_demo <- condamnations_demo %>%
  mutate(
    Adresse_lower = str_to_lower(Adresse_lieu_infraction),
    Adresse_trim = str_trim(Adresse_lieu_infraction)
  )
```

#### Suppression d’espaces multiples (`str_squish()`)

Si les données contiennent des espaces superflus :

``` r
condamnations_demo <- condamnations_demo %>%
  mutate(
    Adresse_squish = str_squish(Adresse_lieu_infraction)
  )
```

`str_squish()` réduit tous les espaces répétés à un seul et supprime ceux en début/fin de chaîne.

Nous allons maintenant créer une version nettoyée du jeu de données qui servira pour la suite de l’aventure.

``` r
condamnations <- listecondamnation %>%
  mutate(
    adresse = str_squish(Adresse_lieu_infraction),
    code_postal = str_extract(adresse, "[A-Z][0-9][A-Z]\\s*[0-9][A-Z][0-9]"),
    code_postal = str_to_upper(code_postal),
    code_postal = str_replace(code_postal, "^([A-Z][0-9][A-Z])\\s*([0-9][A-Z][0-9])$", "\\1 \\2"),
    est_montreal = str_sub(code_postal, 1, 1) == "H",
    est_temp = coalesce(str_detect(SOC_NOM_ARTCL_INFRC, "TEMPERATURE"), FALSE),
    amende_num = parse_number(
      Amende,
      locale = locale(grouping_mark = " ", decimal_mark = ",")
    ),
    type_etablissement = str_replace(
      Type_etablissement,
      "^REST\\. SERVICE RAPIDE$",
      "RESTAURANT SERVICE RAPIDE"
    )
  )

condamnations_mtl <- condamnations %>%
  filter(est_montreal)
```

> **TIP:**
>
> 1.  **Filtrer Montréal** : Vérifiez que `condamnations_mtl` ne contient que des constats dont le code postal commence par `H`.
>
> > **Indication** : Vous pouvez utiliser `str_sub()` pour extraire la première lettre d’une chaîne de caractères.
>
> 2.  **Recherche de mots-clés** :
>
> - Détectez le mot-clé (“TEMPERATURE”) dans `SOC_NOM_ARTCL_INFRC`. Créez une variable booléenne `est_temp`. Cela va nous permettre de voir quelles infractions sont reliées à la température.
>
> - Quelle est la proportion d’infractions reliées à la température dans le sous-ensemble de Montréal ?
>
> 3.  **Nettoyage de la colonne `Amende`** :
>
> - Vérifiez que `amende_num` est bien numérique.
>
> - Vérifiez combien de valeurs manquantes contient `amende_num`.
>
> - Quel est le montant moyen d’amende pour les infractions reliées à la température dans le sous-ensemble de Montréal ?

> **IMPORTANT:**
>
> *« La colonne `SOC_NOM_ARTCL_INFRC` donne la classification de l’infraction. Combien de types d’infractions différentes avons-nous en lien avec la température dans le sous-ensemble de Montréal ? »*
>
> - 1
>
> - 2
>
> - 3
>
> - 4
>
> - 5
>
> - 6

> **CAUTION:**
>
> **Réponse possible** : Utilisez `distinct()` pour compter les types d’infractions.
>
> Dans le sous-ensemble de Montréal, on en compte 4 :
>
>     # A tibble: 4 × 1
>       SOC_NOM_ARTCL_INFRC
>       <chr>
>     1 TEMPERATURE DE CONSERVATION
>     2 TEMPERATURE CONSERVATION REFRIGERE / VENTE AU DETAIL
>     3 TEMPERATURE ALIMENTS ALTERABLES
>     4 TEMPERATURE ALIMENTS PERISSABLES

Pensez à générer votre rapport, committer vos modifications et pousser sur GitHub pour garder une trace de votre travail !

> **IMPORTANT:**
>
> On a travaillé sur les infractions reliées à la température, mais il y a d’autres types d’infraction. Est-ce que vous pouvez en trouver une qui vous inquiète ? Par exemple, les insectes, les rongeurs ou l’insalubrité.
>
> Je crois que cela peut faire un bon résultat clé à mettre dans ton article.

------------------------------------------------------------------------

## Statistiques descriptives pour variables catégoriques

Dans cette section, nous allons découvrir comment résumer l’information contenue dans les variables qualitatives, appelées aussi catégorielles. Nous verrons comment compter les occurrences de chaque catégorie (tableaux de fréquences), calculer des proportions (ou pourcentages) afin de mieux visualiser la répartition, et associer plusieurs variables pour mieux comprendre leurs interactions (tableaux de contingence). L’objectif est de disposer d’un portrait clair de la distribution des catégories pour en tirer des conclusions rapides sur les tendances ou anomalies présentes dans les données.

### Explications

Les **tableaux de fréquences** et les **mesures de tendance** (nombre d’observations, pourcentages) sont un bon point de départ pour résumer des variables catégoriques.

### Démonstration

``` r
# Nombre d'infractions par type d’établissement

condamnations %>%
  count(type_etablissement, sort = TRUE)
```

    # A tibble: 3 × 2
      type_etablissement             n
      <chr>                      <int>
    1 RESTAURANT                  1353
    2 RESTAURANT SERVICE RAPIDE    324
    3 RESTAURANT METS A EMPORTER    35

> **Astuce** : `count()` + `arrange(desc(n))` vous permet de classer les catégories par ordre d’occurrence.

> **TIP:**
>
> 1.  **Proportions** : Calculez la proportion de chaque type d’établissement, par exemple avec `count(type_etablissement) %>% mutate(prop = n / sum(n))`.
>
> 2.  **Amende moyenne** : Regroupez par `type_etablissement` et calculez la moyenne de l’amende avec `mean(amende_num, na.rm = TRUE)`.
>
> 3.  **Montréal et reste du Québec** : Comparez la distribution entre les constats montréalais (`est_montreal == TRUE`) et les autres constats. Quelle catégorie d’établissements semble la plus concernée ?

> **IMPORTANT:**
>
> On a toujours pensé que Montréal n’était pas le pire endroit pour les infractions alimentaires, peu importe le type de restaurant. Est-ce que vos résultats appuient cette idée ?

Un tableau de contingence (ou tableau croisé) est un tableau qui présente simultanément la répartition de deux (ou plusieurs) variables catégoriques, permettant ainsi de repérer des liens ou des tendances entre elles. Par exemple, pour croiser le type d’établissement et la nature de l’infraction dans votre jeu de données :

``` r
table(
  condamnations$type_etablissement,
  condamnations$SOC_NOM_ARTCL_INFRC
)
```

> **IMPORTANT:**
>
> Y a-t-il plus de restaurants qui ont eu une amende pour `INSECTES RONGEURS EXCREMENTS` ou plus de restaurants de service rapide qui ont eu une amende pour `INSALUBRITE` ?

> **CAUTION:**
>
> On peut trouver l’information directement dans le tableau croisé :
>
> ``` r
> tab <- table(
>   condamnations$type_etablissement,
>   condamnations$SOC_NOM_ARTCL_INFRC
> )
>
> tab["RESTAURANT SERVICE RAPIDE", "INSALUBRITE"]
> ```
>
>     [1] 108
>
> ``` r
> tab["RESTAURANT", "INSECTES RONGEURS EXCREMENTS"]
> ```
>
>     [1] 73

On va terminer cette section avec un exercice qui vous permettra de vous familiariser avec les tableaux de contingence et les statistiques descriptives, mais aussi de vérifier si la codification des infractions est facile à exploiter.

> **TIP:**
>
> 1.  **Tableau de contingence** : Construisez un tableau croisé entre `type_etablissement` et la nature de l’infraction (`SOC_NOM_ARTCL_INFRC`), dans votre sous-ensemble de Montréal.
>
> 2.  **Résumé descriptif** : Dressez un petit tableau récapitulatif (type d’établissement, nombre total, amende moyenne).
>
> 3.  **Catégories rares** : Déterminez si l’une des variables catégoriques (`SOC_NOM_ARTCL_INFRC` et `type_etablissement`) a des catégories rares ou quasi inexploitées. Devrait-on les regrouper ?

Pensez à générer votre rapport, committer vos modifications et pousser sur GitHub pour garder une trace de votre travail !

------------------------------------------------------------------------

## Visualisation de données catégoriques

### Explications

Pour représenter visuellement des variables catégoriques, on utilise souvent :

- **Diagrammes en barres** (`geom_bar()` ou `geom_col()`),

- **Diagramme en tarte (Pie chart)** (moins recommandé, sauf usage très simple),

- **Diagrammes à bandes groupées ou empilées standardisées** si on veut comparer plusieurs catégories croisées.

### Démonstration

``` r
library(ggplot2)

# Exemple : nombre d’infractions à Montréal par type d’établissement
condamnations_mtl %>%
  ggplot(aes(x = type_etablissement)) +
  geom_bar(fill = "steelblue") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) + # permet de rotationner les noms des labels sur l'axe des x
  labs(
    title = "Infractions par type d’établissement à Montréal",
    x = "Type d’établissement",
    y = "Nombre d'infractions"
  )
```

![Diagramme à barres montrant le nombre d'infractions à Montréal par type d'établissement.](aventure_files/figure-html/unnamed-chunk-12-1.png)

> **Idée** : Appliquez un `coord_flip()` si les noms sont trop longs!

Interrogeons‑nous sur **la nature même des infractions**. Connaître les catégories dominantes et leur distribution dans les différents types d’établissements aidera à formuler un message clair pour le grand public.

> **TIP:**
>
> 1.  **Top 5** : Concentrez-vous sur les 5 catégories les plus fréquentes de `SOC_NOM_ARTCL_INFRC` (via un tri ou `fct_lump()`).
> 2.  **Diagramme à barres** : faites un diagramme à barres selon `SOC_NOM_ARTCL_INFRC` et le type d’établissement `type_etablissement`.
> 3.  **Bonnes pratiques de visualisation** : Ajoutez un titre, des couleurs, modifiez le thème ou l’orientation de l’axe pour un rendu plus clair.

> **IMPORTANT:**
>
> *« Ce graphique doit parler au lecteur en un clin d’œil. Assure‑toi d’indiquer que 5 catégories couvrent déjà X % des infractions ; c’est un message fort pour l’introduction de ton article. »*

Le **montant des amendes** est un indicateur concret qui attire souvent l’attention du public et des médias. Comparer ces montants entre Montréal et le reste du Québec, et entre types d’établissements, permettra d’appuyer votre conclusion.

> **TIP:**
>
> 1.  **Boîtes à moustaches** : Représentez la répartition du montant de l’amende au sein de chaque `type_etablissement`.
> 2.  **Comparaison** : Comparez Montréal versus hors Montréal avec des boîtes à moustaches côte à côte, par type d’établissement. Que remarquez-vous ?
> 3.  **Traitement de données manquantes** : Que faites-vous si `Amende` est manquante dans un sous-ensemble ? Explorez quelques pistes.

> **IMPORTANT:**
>
> *« Pense à citer un ou deux chiffres marquants dans ton texte : par exemple, la médiane des amendes montréalaises versus hors Montréal. Ça rendra tes conclusions plus percutantes. »*

------------------------------------------------------------------------

## Aller plus loin : cartographier les amendes (optionnel)

Pour clore l’enquête, **Alexandre** a mis la main sur un bout de code R rédigé par une collègue de la Ville. Ce script géocode automatiquement les codes postaux et fournit une latitude/longitude pour chaque établissement. Cette activité est optionnelle, car elle dépend du package `tidygeocoder` et d’un service web externe.

``` r
# ────────────────────────────────────────────────────────────
# Fonction utilitaire : de code postal (ex. "H2X 3X2") vers lon/lat
# Utilise tidygeocoder + l’API de géocodage Nominatim (OpenStreetMap)
geocode_pc <- function(df, pc_col = "code_postal") {
  df %>%
     # 1) Nettoyer les codes postaux : enlever espaces, majuscules
    mutate(
      postal_tmp = str_remove_all(.data[[pc_col]], "\\s"),
      postal_tmp = str_to_upper(postal_tmp),
      # 2) Ré-insérer l’espace si la chaîne fait précisément 6 caractères
      postal_std = if_else(
        nchar(postal_tmp) == 6,
        str_replace(postal_tmp, "^(.{3})(.{3})$", "\\1 \\2"),
        postal_tmp
      )
    ) %>%
    tidygeocoder::geocode(address = postal_std, method = "osm",
                          lat = latitude, long = longitude,
                          timeout = 5) %>%
    select(-postal_tmp, -postal_std)   # on nettoie les colonnes temporaires
}

# ────────────────────────────────────────────────────────────
```

> **Remarque** : Vous devez installer le package `tidygeocoder` pour utiliser cette fonction. Vous pouvez le faire avec `install.packages("tidygeocoder")`.

> **TIP:**
>
> 1.  **Géocodage** : appliquez `geocode_pc()` à votre jeu de données, en vous assurant de conserver `Amende`.
> 2.  **Agrégation** : calculez le **montant total d’amendes par point géocodé** (p. ex. par restaurant ou par coordonnées arrondies au 4ᵉ décimal).
> 3.  **Carte statique** : utilisez `ggplot2 + geom_point()` sur un fond simple (`coord_sf()`) ; la taille ou la couleur du point peut refléter le montant cumulé.

> **IMPORTANT:**
>
> **Conseil d’Alexandre** : *« Un visuel vaut mille mots. Si tu réussis la carte optionnelle, choisis un secteur où les amendes sont concentrées et cite un chiffre que tu as calculé toi-même. Ton article gagnera en impact. »*

------------------------------------------------------------------------

Trace portfolio

Conservez les éléments qui montrent la transformation d’un tableau en article.

- vos choix de nettoyage des catégories et montants;
- deux figures prêtes pour l’article;
- deux nombres clés expliqués en phrases complètes;
- une nuance importante à communiquer au public.

## Conclusion de l’aventure

Cette troisième aventure vous a permis de **passer du rôle d’analyste à celui de journaliste de données** : vous avez nettoyé un jeu réel d’inspections alimentaires, quantifié les infractions majeures, comparé les profils d’établissements et préparé des visualisations utiles pour un article.

Vous disposez maintenant :

- d’un **ensemble de résultats chiffrés** (top 5 infractions, montants moyens, proportion Montréal vs hors Montréal, etc.) ;
- de **graphiques percutants** (diagrammes en barres, boîtes à moustaches ou visualisation optionnelle) pour étayer vos arguments ;
- d’**observations qualitatives** fournies par Alexandre, qui orientent le récit vers les enjeux d’hygiène et de transparence citoyenne.

### Prochaine étape : rédigez votre article

1.  **Structurez votre article Quarto** : chapeau accrocheur -\> contexte -\> méthodologie -\> résultats clés -\> recommandations.
2.  **Intégrez au moins deux visuels** parmi ceux produits, dont au moins un graphique de catégories.
3.  **Citez deux chiffres narratifs** pour captiver le lecteur, par exemple une proportion d’infractions ou une médiane d’amendes.
4.  **Ajoutez une citation synthétique d’Alexandre** pour humaniser votre conclusion.

> **Livrable attendu** : un fichier `.qmd` et un fichier HTML rendus depuis Quarto, commités sur votre dépôt GitHub avant la date limite.

Bonne rédaction ! Faites parler les données et mettez-vous dans la peau du journaliste qui informe, nuance et propose.

> **Félicitations** ! Vous avez mis en pratique les concepts de variables catégoriques, de statistiques descriptives et de visualisation pour des données catégoriques réelles. Continuez ainsi, le prochain module vous attend.
