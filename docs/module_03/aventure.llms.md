# Aventure 3 - Infractions dans les restaurants de Montréal

STT-1100 Introduction à la science des données

# Mise en situation : Devenez *data journalist*

Vous êtes engagés comme **journaliste de données** par *Le Courrier Gourmand*, un média local fictif qui publie des enquêtes interactives sur l’alimentation à Montréal. Votre rédactrice en chef souhaite un article éclairant le public sur **les infractions alimentaires commises dans les restaurants montréalais** . Elle vous donne quelques pistes de reflexion:

- Quelle est la proportion des établissements provenant de la ville de Montréal?

- Quelles sont les infractions les plus courantes ?

- Quels types d’établissements sont touchés ?

- Quel montant d’amendes ont été imposées en moyenne ? Ce montant dépend t-il du type d’infractions?

À la fin de l’aventure, vous devrez remettre **un article Quarto** (HTML) répondant à ces questions et illustré de graphiques construits dans R.

> **NOTE:**
>
> **Votre allié municipal**
> Voici **Alexandre**, conseiller municipal chargé de l’hygiène alimentaire à la Ville de Montréal. Il suit votre enquête pas à pas et vous posera, à des moments clés, des questions pour aiguiller vos analyses. C’est un allié précieux pour la rédaction de votre article, mais il a aussi ses exigences. Il attend de vous que vous lui fournissiez des réponses claires et précises, accompagnées de graphiques pertinents.

## Objectifs de l’aventure

- Importer et nettoyer un jeu de données catégorielles réelles (infractions alimentaires).
- Construire des tableaux de fréquence, des statistiques descriptives et des visualitions
- Rédiger un court billet journalistique reproductible dans Quarto.

**Note pour le rapport**
Tout au long de l’analyse, vous devrez garder en tête ces questions et y répondre de manière argumentée dans votre rapport `qmd`

Dans ce module, vous explorerez un **jeu de données** qui décrit diverses infractions, leurs amendes et le type d’établissements concernés. Votre mission : **analyser les données pour répondre à l’objectif d’identifier les infractions dans les restaurants à Montréal**.

------------------------------------------------------------------------

# Comment réussir l’aventure

1.  **Charger les données** : Vous pouvez soit :
    - Charger le package `UlavalSSD` et appeler `data(listecondamnation)`.
2.  **Suivre les sections** : Chaque section contient des explications, une démonstration, des expérimentations à réaliser, puis des exercices.
3.  **Documenter vos trouvailles** : Comme dans les aventures précédentes, commentez votre code, expliquez vos choix et validez vos analyses. Vos trouvailles vont vous aider a faire votre article de journal.

------------------------------------------------------------------------

# Travail sur Github

Avant de commencer l’analyse des données, vous devez récupérer le dépôt GitHub contenant les fichiers nécessaires.

1.  Clonez le dépôt “Aventure-3-IDENTIFIANT_GITHUB”, pour cela créez un nouveau projet Rstudio et copier coller le lien HTTPS de votre repo Github (voir feuille aide mémoire).

Astuce : Si vous souhaitez revenir plus tard sur ce projet, vous pouvez ouvrir directement le projet en double-cliquant sur le fichier `.Rproj` dans votre explorateur de fichiers.

2.  Ajuster le fichier Quarto: Le modèle de l’article de journal est présent dans le dépôt. Allez inscrire votre nom.

3.  Premier commit et push vers GitHub: Une fois votre fichier `.qmd` ajusté et enregistré, commitez et poussez vos modifications sur GitHub :

Attention: on se rappelle que les messages de commit doivent être parlant. Par exemple “Ajout de mon nom dans l’article”

Félicitations ! Vous êtes maintenant prêt à débuter l’analyse !

# Variables catégoriques : les bases en R avec `stringr`

## Explications

En R, une variable catégorique est souvent représentée par :

- Un **facteur** (`factor`) qui contient un ensemble de niveaux définis.

- Ou un simple **character** pour les chaînes de caractères.

**Dans le Tidyverse**, on manipule souvent des chaînes de caractères via le package **stringr** ; pour la conversion en facteur, on peut utiliser `as.factor()` ou le package **forcats**.

Pour le module 3, nous nous concentrerons sur les variables catégorique de type **character**. Dans le module 4, nous verrons plus en détail les facteurs.

Voici des exemples démontrant comment utiliser `stringr` (partie du `Tidyverse`) pour manipuler des variables de type character dans un jeu de données comme `listecondamnation`. Les exemples ci‑dessous ciblent des cas fréquents : détection de motifs, extraction, remplacement, et nettoyage de chaînes.

## Démonstration

On va utiliser le jeu de données `listecondamnation` de la librarie `UlavalSSD` qui contient les condamnations des établissements alimentaires au Québec.

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

> Cette information sera pertiennete pour le nettoyage de la variable `Amende` dans la section suivante, vous pourrez ainsi le documenter dans la section Méthodologie de l’article.

> **IMPORTANT:**
>
> *« Combien de constats d’infraction apparaissent dans le fichier brut ? »*

> **CAUTION:**
>
> **Réponse possible** : Utilisez `nrow(listecondamnation)` après l’import ; on obtient par exemple **1 712** lignes.
>
> Alexandre vous rappelle que `?listecondamnation` vous donne la documentation du jeu de données.

### Détection de motifs (`str_detect()`)

Pour vérifier si l’adresse mentionne `"MONTREAL"` (ou un code postal, etc.), on peut faire :

``` r
# Créer une colonne booléenne 'est_montreal'
listecondamnation <- listecondamnation %>%
  mutate(est_montreal = str_detect(Adresse_lieu_infraction, "MONTREAL"))

# Aperçu
listecondamnation %>%
  select(Adresse_lieu_infraction, est_montreal) %>%
  head(10)
```

    # A tibble: 10 × 2
       Adresse_lieu_infraction                                 est_montreal
       <chr>                                                   <lgl>
     1 365 RUE BERNARD OUEST MONTREAL, (QC) H2V1T6             TRUE
     2 6066 RUE SHERBROOKE OUEST MONTREAL, (QC) H4A1Y1         TRUE
     3 1450 RUE CRESCENT MONTREAL, (QC) H3G2B6                 TRUE
     4 751 BOULEVARD DE LA COTE-VERTU MONTREAL, (QC) H4L1Y6    TRUE
     5 2127 RUE SAINTE-CATHERINE OUEST MONTREAL, (QC) H3H1M6   TRUE
     6 4024B RUE SAINTE-CATHERINE OUEST WESTMOUNT, (QC) H3Z1P2 FALSE
     7 1235 AVENUE DU MONT-ROYAL EST MONTREAL, (QC) H2J1Y2     TRUE
     8 1500 AVENUE MCGILL COLLEGE A-027 MONTREAL, (QC) H3A3J5  TRUE
     9 5176 CHEMIN QUEEN-MARY MONTREAL, (QC) H3W1X5            TRUE
    10 5176 CHEMIN QUEEN-MARY MONTREAL, (QC) H3W1X5            TRUE

Vous obtenez `TRUE/FALSE` selon la présence du mot **MONTREAL** dans la chaîne.

> **TIP:**
>
> Quelle est la proportion du nombre d’adresse contenant le mot **MONTREAL**?

> **IMPORTANT:**
>
> **Message d’Alexandre** : *« C’est un fait très intéressant à mettre dans ton article!»*

### Remplacement (`str_replace()` et `str_replace_all()`)

Pour nettoyer la colonne `Amende`, on peut enlever le symbole `$` ou remplacer des virgules par des points, etc.

``` r
# str_replace() remplace la 1re occurrence ; str_replace_all() toutes les occurrences
listecondamnation <- listecondamnation %>%   mutate(
  # Exemple : retirer le $ si présent
  Amende_clean = str_replace_all(Amende, "\\$", ""),
  # remplacer éventuelles virgules par un point
  Amende_clean = str_replace_all(Amende_clean, ",", ".")   )

# Vérifions
listecondamnation %>%
  select(Amende, Amende_clean) %>%
  head(10)
```

    # A tibble: 10 × 2
       Amende  Amende_clean
       <chr>   <chr>
     1 5 000 $ "5 000 "
     2 800 $   "800 "
     3 2 300 $ "2 300 "
     4 1 100 $ "1 100 "
     5 2 200 $ "2 200 "
     6 1 200 $ "1 200 "
     7 3 000 $ "3 000 "
     8 3 000 $ "3 000 "
     9 1 000 $ "1 000 "
    10 1 000 $ "1 000 "

Ici, les motifs sont des **expressions régulières**.

- `\\$` correspond littéralement au signe `$`.

- `,` est remplacé par `.` (utile si votre texte comporte `\"1,000\"`).

> **TIP:**
>
> Quelle est le type de la variable `Amende_clean`? Est-ce un problème?

> **IMPORTANT:**
>
> *« Pas si simple d’avoir la colonne Amende en numérique!»*

### Extraction de motifs (`str_extract()`)

Pour extraire un élément précis. Par exemple, si `Adresse_lieu_infraction` contient un code postal de la forme `H2X 3E4`, on peut tenter :

``` r
listecondamnation <- listecondamnation %>%
  mutate(
    code_postal = str_extract(Adresse_lieu_infraction, "[A-Z][0-9][A-Z]\\s*[0-9][A-Z][0-9]")   )

listecondamnation %>%
  select(Adresse_lieu_infraction, code_postal) %>%
  head(10)
```

    # A tibble: 10 × 2
       Adresse_lieu_infraction                                 code_postal
       <chr>                                                   <chr>
     1 365 RUE BERNARD OUEST MONTREAL, (QC) H2V1T6             H2V1T6
     2 6066 RUE SHERBROOKE OUEST MONTREAL, (QC) H4A1Y1         H4A1Y1
     3 1450 RUE CRESCENT MONTREAL, (QC) H3G2B6                 H3G2B6
     4 751 BOULEVARD DE LA COTE-VERTU MONTREAL, (QC) H4L1Y6    H4L1Y6
     5 2127 RUE SAINTE-CATHERINE OUEST MONTREAL, (QC) H3H1M6   H3H1M6
     6 4024B RUE SAINTE-CATHERINE OUEST WESTMOUNT, (QC) H3Z1P2 H3Z1P2
     7 1235 AVENUE DU MONT-ROYAL EST MONTREAL, (QC) H2J1Y2     H2J1Y2
     8 1500 AVENUE MCGILL COLLEGE A-027 MONTREAL, (QC) H3A3J5  H3A3J5
     9 5176 CHEMIN QUEEN-MARY MONTREAL, (QC) H3W1X5            H3W1X5
    10 5176 CHEMIN QUEEN-MARY MONTREAL, (QC) H3W1X5            H3W1X5

Le motif `[A-Z][0-9][A-Z]\\s*[0-9][A-Z][0-9]` est une forme simplifiée d’un code postal canadien.

> **TIP:**
>
> Tous les codes postaux qui commencent par H2X correspondent à des adresses dans la Quartie Ville-Marie à Montréal.
>
> Combien d’établissements du quartie de Ville-Marie ont recu une comdannation?

> **IMPORTANT:**
>
> *« Nous avons toujours mentionné que moins de 1% des établissements en infractions de Montréal proviennent de Ville-Marie! Est-ce vraiment vrai?»*
>
> Un bel ajout à ton article!

### Mise en forme (`str_to_lower()`, `str_to_upper()`, etc.)

Parfois, il est utile d’harmoniser la casse (`MONTREAL`, `Montréal`, etc.) :

``` r
listecondamnation <- listecondamnation %>%
  mutate(     Adresse_lower = str_to_lower(Adresse_lieu_infraction),
              # ou str_to_upper, str_to_title ...
              # trim pour enlever espaces en trop
              Adresse_trim = str_trim(Adresse_lieu_infraction)   )
```

### Suppression d’espaces multiples (`str_squish()`)

Si les données contiennent des espaces superflus :

``` r
listecondamnation <- listecondamnation %>%
  mutate(
    Adresse_squish = str_squish(Adresse_lieu_infraction)
    )
```

`str_squish()` réduit tous les espaces répétés à un seul et supprime ceux en début/fin de chaîne.

> **TIP:**
>
> 1.  **Filtrer Montréal** : Créez un nouveau data frame `condamnation_mtl` ne contenant **que** les restaurants provenant de Montréal. On va utiliser ici le code postal, en effet, tous les codes postaux de Montréal commence par la lettre H.
>
> > **Indication** : Vous pouvez utiliser `str_sub()` pour extraire la premiere lettre (ou caractère) d’une chaîne de caractères.
>
> 2.  **Recherche de mots-clés** :
>
> - Détectez le mot-clé (“TEMPERATURE”) dans `SOC_NOM_ARTCL_INFRC`. Créez une variable booléenne `est_temp`. Cela va nous permettre de voir quelles infractions sont reliées à la température.
>
> - Quel est la proportion d’infraction reliée à la température dans le sous-ensemble de Montréal?
>
> 3.  On termine le nettoyage de la colonne amende.
>
> - **Nettoyage complet de la variable `Amende`** : Créer une variable `Amende_num` qui est de type `numeric` avec le montant de l’amende payé par le restaurant. Vous allez devoir utiliser le fonction `as.numeric`.
>
> - Quel est le type de la variable `Amende_num`? Est-ce un problème?
>
> - Quel est le montant d’amende moyen pour les infractions reliées à la température?

> **IMPORTANT:**
>
> *« La colonne `SOC_NOM_ARTCL_INFRC` donne la classification de l’infraction. Combien de type d’infractions différentes avons nous en lien avec la température »*
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
> **Réponse possible** : Utilisez `unique()` pour compter le nombre de types d’infractions. Par exemple, `length(unique(listecondamnation$SOC_NOM_ARTCL_INFRC))` vous donnera le nombre total de types d’infractions.
>
> Maintenant on peut faire la même chose mais pour les infractions reliées à la température avec `listecondamnation %>% filter(est_temp == TRUE) %>% unique()`
>
> Et on en compte 5:
>
>     # A tibble: 5 × 1
>       SOC_NOM_ARTCL_INFRC
>       <chr>
>     1 TEMPERATURE DE CONSERVATION
>     2 TEMPERATURE ALIMENTS ALTERABLES
>     3 TEMPERATURE CONSERVATION REFRIGERE / VENTE AU DETAIL
>     4 TEMPERATURE ALIMENTS PERISSABLES
>     5 TEMPERATURE EAU CHAUDE 60?C

Pensez à générer votre rapport, committer vos modifications et pousser sur GitHub pour garder une trace de votre travail !

> **IMPORTANT:**
>
> On a travailler sur les infractions reliées à la température, mais il y a d’autres types d’infraction. Est-ce que vous pouvez en trouver une qui vous inquiète? Par exemple, les insectes, les rongeurs ou l’insalubrité!
>
> Je crois que ca peut faire un bel ajout de résultat clé à mettre dans ton article

------------------------------------------------------------------------

# Statistiques descriptives pour variables catégoriques

Dans cette section, nous allons découvrir comment résumer l’information contenue dans les variables qualitatives, appelées aussi catégorielles. Nous verrons comment compter les occurrences de chaque catégorie (tableaux de fréquences), calculer des proportions (ou pourcentages) afin de mieux visualiser la répartition, et associer plusieurs variables pour mieux comprendre leurs interactions (tableaux de contingence). L’objectif est de disposer d’un portrait clair de la distribution des catégories pour en tirer des conclusions rapides sur les tendances ou anomalies présentes dans les données.

## Explications

Les **tableaux de fréquences** et les **mesures de tendance** (nombre d’observations, pourcentages) sont un bon point de départ pour résumer des variables catégoriques.

## Démonstration

``` r
# Nombre d'infractions par type d’établissement

listecondamnation %>%
  count(Type_etablissement) %>%
  arrange(desc(n))
```

    # A tibble: 4 × 2
      Type_etablissement             n
      <chr>                      <int>
    1 RESTAURANT                  1353
    2 REST. SERVICE RAPIDE         187
    3 RESTAURANT SERVICE RAPIDE    137
    4 RESTAURANT METS A EMPORTER    35

> **Astuce** : `count()` + `arrange(desc(n))` vous permet de classer les catégories par ordre d’occurrence.

> **TIP:**
>
> 1.  **Proportions** : Calculez la proportion de chaque type d’établissement (ex. `count(Type_etablissement) %>% mutate(prop = n / sum(n))`).
>
> 2.  **Amende moyenne** : Après avoir extrait la valeur numérique de la colonne `Amende` de l’exercice de la section précédente, regroupez par `Type_etablissement` et calculez la moyenne de l’amende (`mean(Amende_num)`).
>
> 3.  **Infractions sur l’ensemble du Québec** : Comparez la distribution entre “Montréal” (filtrée précédemment) et le reste. Quelle catégorie d’établissements semble la plus concernée ?

> **IMPORTANT:**
>
> On a toujours pensé que Montréal n’était pas le pire endroit pour les infractions alimentaires peut importe le type de restaurant. Est-ce que vous pouvez le prouver avec vos résultats?

Un tableau de contingence (ou tableau croisé) est un tableau qui présente simultanément la répartition de deux (ou plusieurs) variables catégoriques, permettant ainsi de repérer des liens ou des tendances entre elles. Par exemple, pour croiser le type d’établissement et la nature de l’infraction dans votre jeu de données :

``` r
table(
  listecondamnation$Type_etablissement,
  listecondamnation$SOC_NOM_ARTCL_INFRC
)
```

> **IMPORTANT:**
>
> Y a-t-il plus de restaurants qui ont eu une amende pour `INSECTES RONGEURS EXCREMENTS` ou de Rest. service rapide qui ont eu une amende pour `INSALUBRITE`?

> **CAUTION:**
>
> On peut facile trouver l’information en allant la chercher directemement dans le tableau croisé:
>
> ``` r
> tab <- table(
>   listecondamnation$Type_etablissement,
>   listecondamnation$SOC_NOM_ARTCL_INFRC
> )
>
> tab["RESTAURANT SERVICE RAPIDE", "INSALUBRITE"]
> ```
>
>     [1] 36
>
> ``` r
> tab["RESTAURANT", "INSECTES RONGEURS EXCREMENTS"]
> ```
>
>     [1] 73

On va terminer cette section avec un exercice qui vous permettra de vous familiariser avec les tableaux de contingence et les statistiques descriptives, mais surtout permettre a la ville de verifier si leur codification de l’infraction est bonne.

> **TIP:**
>
> 1.  **Tableeau de contingence** : Construisez un tableau croisé entre `Type_etablissement` et la nature de l’infraction (`SOC_NOM_ARTCL_INFRC`), dans votre sous-ensemble de Montréal.
>
> 2.  **Résumé descriptif** : Dressez un petit tableau récapitulatif (type d’établissement, nombre total, amende moyenne).
>
> 3.  **Catégories rares** : Déterminez si l’une des variables catégoriques (`SOC_NOM_ARTCL_INFRC` et `Type_etablissement`) a des catégories rare ou quasi inexploitée. Devrait-on la regrouper ?

Pensez à générer votre rapport, committer vos modifications et pousser sur GitHub pour garder une trace de votre travail !

------------------------------------------------------------------------

# Visualisation de données catégoriques

## Explications

Pour représenter visuellement des variables catégoriques, on utilise souvent :

- **Diagrammes en barres** (`geom_bar()` ou `geom_col()`),

- **Diagramme en tarte (Pie chart)** (moins recommandé, sauf usage très simple),

- **Graphique de mosaique (Mosaic plots)** si on veut comparer plusieurs catégories croisées.

## Démonstration

``` r
library(ggplot2)

# Exemple : Nombre d’infractions par type d’établissement
listecondamnation %>%
  ggplot(aes(x = Type_etablissement)) +
  geom_bar(fill = "steelblue") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) + # permet de rotationner les noms des labels sur l'axe des x
  labs(
    title = "Infractions par type d’établissement à Montréal",
    x = "Type d’établissement",
    y = "Nombre d'infractions"
  )
```

![](aventure_files/figure-html/unnamed-chunk-11-1.png)

> **Idée** : Appliquez un `coord_flip()` si les noms sont trop longs!

Interrogeons‑nous sur **la nature même des infractions**. Connaître les catégories dominantes et leur distribution dans les différents types d’établissements aidera à formuler un message clair pour le grand public.

> **TIP:**
>
> 1.  **Top 5** : Concentrez-vous sur les 5 catégories les plus fréquentes de `SOC_NOM_ARTCL_INFRC` (via un tri ou `fct_lump()`).
> 2.  **Diagramme à barre** : faites un diagramme à barre selon `SOC_NOM_ARTCL_INFRC` et le type d’établissement `Type_etablissement`.
> 3.  **Bonnes pratiques de visualisation** : Ajoutez un titre, des couleurs, modifiez le thème ou l’orientation de l’axe pour un rendu plus clair.

> **IMPORTANT:**
>
> *« Ce graphique doit parler au lecteur en un clin d’œil. Assure‑toi d’indiquer que 5 catégories couvrent déjà X % des infractions ; c’est un message fort pour l’introduction de ton article. »*

Le **montant des amendes** est un indicateur concret qui attire souvent l’attention du public et des médias. Comparer ces montants entre Montréal et le reste du Québec, et entre types d’établissements, permettra d’appuyer votre conclusion.

> **TIP:**
>
> 1.  **Boites à moustaches** : Représentez (avec des boites à moustache) la répartition ddu montant de l’amende au sein de chaque `Type_etablissement`.
> 2.  **Comparaison** : Comparez Montréal versus hors Montréal (deux boites à moustaches côte à côte, par type d’établissement). Que remarquez-vous?
> 3.  **Traitement de données manquantes** : Que faites-vous si `Amende` est manquante dans un sous-ensemble ? Explorez quelques pistes.

> **IMPORTANT:**
>
> *« Pense à citer un ou deux chiffres marquants dans ton texte : par exemple, la médiane des amendes montréalaises versus hors Montréal. Ça rendra tes conclusions plus percutantes. »*

------------------------------------------------------------------------

# 5. Aller plus loin : cartographier les amendes (optionnel)

Pour clore l’enquête, **Alexandre** a mis la main sur un bout de code R rédigé par une collègue de la Ville ; ce script géocode automatiquement les codes postaux et fournit une latitude/longitude pour chaque établissement. Vous allez l’utiliser pour dresser **une carte de la répartition des amendes**.

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
> **Conseil d’Alexandre** : *« Un visuel vaut mille mots. Choisis un **zoom sur le centre‑ville** où la densité d’amendes est la plus forte, et cite un chiffre‑clé (ex. 180 000 \$ d’amendes dans un rayon de 2 km). Ton article gagnera en impact. »*

------------------------------------------------------------------------

# Conclusion de l’aventure

Cette troisième aventure vous a permis de **passer du rôle d’analyste à celui de journaliste de données** : vous avez nettoyé un jeu réel d’inspections alimentaires, quantifié les infractions majeures, comparé les profils d’établissements et visualisé la géographie des amendes.

Vous disposez maintenant :

- d’un **ensemble de résultats chiffrés** (top 5 infractions, montants moyens, proportion Montréal vs hors‑Montréal, …etc.) ;
- de **graphiques percutants** (diagrammes en barres, boîtes à moustaches, carte) pour étayer vos arguments ;
- d’**observations qualitatives** fournies par Alexandre, qui orientent le récit vers les enjeux d’hygiène et de transparence citoyenne.

## Prochaine étape : rédigez votre article

1.  **Structurez votre article Quarto** : chapeau accrocheur -\> contexte -\> méthodologie -\> résultats clés -\> recommandations.
2.  **Intégrez au moins deux visuels** parmi ceux produits (un graphique de catégories et la carte des amendes).
3.  **Citez deux chiffres narratifs** (ex. « 5 catégories couvrent 62 % des infractions », « 180 000 \$ d’amendes dans un rayon de 2 km ») pour captiver le lecteur.
4.  **Ajoutez une citation synthétique d’Alexandre** pour humaniser votre conclusion.

> **Livrable attendu** : un fichier HTML autonome exporté depuis votre `.qmd`, commité sur votre dépôt GitHub avant la date limite.

Bonne rédaction ! Faites parler les données et mettez‑vous dans la peau du journaliste qui informe, nuance et propose.

> **Félicitations** ! Vous avez mis en pratique les concepts de variables catégoriques, de statistiques descriptives et de visualisation pour des données catégoriques réelles. Continuez ainsi, le prochain module vous attend.
