# Aventure 1 - Plongée en science des données

STT-1100 Introduction à la science des données

# Comment réussir ce module

Bienvenue dans cette première aventure en sciences des données ! Ce module est conçu pour vous offrir une introduction complète aux outils et concepts fondamentaux qui vous accompagneront tout au long de votre parcours en science des données.

Votre mission est de préparer les bases d’un premier rapport reproductible sur les données météorologiques du Québec. À la fin de l’aventure, vous devriez avoir exécuté du code R, créé un court document Quarto, chargé les données `MeteoQuebec`, puis extrait quelques informations simples de ce tableau.

- **Lisez attentivement chaque section** avant de passer à l’expérimentation. Les explications théoriques fournissent les bases pour comprendre les exemples pratiques.

- **Expérimentez activement** en exécutant le code proposé et en explorant les résultats. N’hésitez pas à modifier les exemples pour tester vos idées.

- **Posez des questions** si vous rencontrez des difficultés ou si certains concepts restent flous.

Ce module est une porte d’entrée vers le vaste monde des sciences des données. Prenez le temps de bien explorer chaque étape, et amusez-vous à apprendre !

# Outils informatiques

Dans ce cours, nous utiliserons des outils informatiques professionnels qui sont essentiels en science des données. Ces outils permettent de manipuler, analyser et visualiser des données de manière efficace et reproductible. Voici un aperçu des principaux outils que vous allez découvrir :

**RStudio** : un environnement de développement intégré (IDE pour *Integrated Development Environment*) pour R qui facilite la rédaction de scripts, l’exécution de code et la gestion de projets. Il propose une interface intuitive et de nombreuses fonctionnalités professionnelles pour vous aider à structurer vos analyses.

**Quarto** : un outil puissant pour produire des documents reproductibles qui combinent texte explicatif, code et résultats. Avec Quarto, vous pourrez générer des rapports professionnels, des présentations et même des sites web.

Ces outils ne se limitent pas à leur aspect technique ; ils favorisent aussi les bonnes pratiques en science des données, comme l’organisation rigoureuse des projets, la documentation claire et la reproductibilité des analyses. Ils seront vos alliés tout au long de ce cours et de vos futures expériences en science des données.

## Découverte de RStudio

RStudio est un environnement de développement intégré (IDE) pour R. Il facilite la rédaction, l’exécution, et la gestion de projets en R, tout en intégrant de nombreuses fonctionnalités professionnelles. Voici un aperçu de ses principales fenêtres et fonctionnalités :

### Les fenêtres principales de RStudio

RStudio est composé de quatre panneaux principaux :

- **Console** : située généralement en bas à gauche, elle permet d’exécuter directement des commandes en R.

- **Script** : en haut à gauche, c’est l’endroit où vous rédigez et sauvegardez vos scripts (fichiers `.R` ou `.qmd`). Vous pouvez remarquer que la présente aventure est bien un `.qmd` dans la fenêtre de script.

- **Environnement** : en haut à droite, il affiche les objets actuellement disponibles en mémoire (*datasets*, variables, fonctions).

- **Graphique (*Plots*), fichiers et aide** : en bas à droite, ce panneau vous permet de visualiser vos graphiques, d’explorer les fichiers du projet, ou d’accéder à la documentation.

> **NOTE:**
>
> - **Testez la console** : ouvrez la console et tapez la commande suivante :
>
>   ``` r
>   print("Bonjour, RStudio!")
>   ```
>
>   Observez le résultat affiché directement dans la console.
>
> - **Créez un script** : Cliquez sur `File > New File > R Script`, écrivez le code suivant et exécutez-le avec `Ctrl + Enter` (Windows/Linux) ou `Cmd + Enter` (Mac) :
>
>   ``` r
>   message("Vous travaillez dans un script R!")
>   ```
>
>   Sauvegardez le fichier sous le nom `test_script.R`.

### Fonctionnalités importantes

- **Projets** : RStudio organise votre travail en projets, ce qui est idéal pour structurer vos fichiers et données. Nous travaillerons dans des projet dès le prochain module.

- **Terminal intégré** : pour exécuter des commandes système sans quitter RStudio. On ne l’utilisera pas pour l’instant mais sachez qu’il existe.

- **Packages** : l’onglet “Packages” permet d’installer et de charger facilement des librairies.

> **TIP:**
>
> Installez le package `dplyr` à l’aide de l’interface graphique ou via la commande suivante dans la console :
>
> ``` r
> install.packages("dplyr")
> ```
>
> Une fois installé, chargez-le avec :
>
> ``` r
> library(dplyr)
> ```

### Configurer votre environnement

Pour démarrer efficacement, personnalisez les préférences (`Tools > Global Options`) pour ajuster l’apparence et les paramètres selon vos besoins.

> **TIP:**
>
> - **Exploration des options** : Accédez à `Tools > Global Options` et explorez les différentes configurations possibles. Essayez de changer le thème de l’interface (ex. : thème sombre) et observez la différence.

## Bases de la programmation en R

La programmation en R est essentielle pour manipuler, analyser et visualiser des données. Cette section vous introduit aux bases de la programmation et vous propose des exercices pour vous entraîner.

### Créer et manipuler des objets

En R, tout est un objet. Voici les bases pour créer des objets et les manipuler :

> **TIP:**
>
> - **Créer un objet** :
>
>   ``` r
>   x <- 42  # Assigne la valeur 42 à l'objet x
>   print(x)  # Affiche la valeur de x
>   x # Affiche aussi la valeur de x
>   ```
>
> - **Manipuler un vecteur** :
>
>   ``` r
>   vecteur <- c(1, 2, 3, 4, 5)  # Crée un vecteur
>   somme <- sum(vecteur)  # Calcule la somme des éléments
>   moyenne <- somme / length(vecteur)  # Calcule la moyenne
>   moyenne
>   ```
>
> - Créez un vecteur contenant les chiffres de 1 à 10 et calculez sa moyenne en utilisant `sum()` et `length()`.

### Écrire des conditions

Les conditions permettent de rendre vos scripts dynamiques.

> **NOTE:**
>
> - **Condition simple** :
>
>   ``` r
>   nombre <- 10
>   if (nombre > 5) {
>     print("Le nombre est supérieur à 5")
>   } else {
>     print("Le nombre est inférieur ou égal à 5")
>   }
>   ```

> **TIP:**
>
> - Écrivez une condition qui affiche si un nombre est pair ou impair.
>
> Indice: la fonction `%%` en R permet de donner le reste de la division euclidienne. Par exemple, `10 %% 2` vaut 0 car \\10=5\times2\\.

### Fonctions de base intégrées

R dispose de nombreuses fonctions intégrées pour effectuer des calculs simples ou avancés. Par exemple, il existe la fonction `mean` qui, comme son nom l’indique, permet de calculer une moyenne.

Le bloc de code suivant nous permet de calculer la moyenne du vecteur `(1, 3, 5, 7)`.

``` r
x <- c(1, 3, 5, 7) # Définit le vecteur x
mean(x) # Appelle la fonction mean sur x
```

    [1] 4

Lorsque vous souhaitez avoir de l’aide sur une fonction, vous pouvez simplement taper le nom de celle-ci dans l’onglet d’aide dans le cadran en bas à droite.

### Définir une nouvelle fonction

R nous permet aussi de définir nos propres fonctions. Nous le ferons à plusieurs reprises dans le cours. Voici un petit exemple simple.

> **NOTE:**
>
> - **Calcul de base** :
>
>   ``` r
>   carre <- function(x) {
>     return(x^2)
>   }
>   print(carre(4))
>   ```

> **TIP:**
>
> - Créez une fonction `cube` qui calcule le cube d’un nombre, puis testez-la avec les valeurs 2, 3 et 4.

### Bonnes pratiques en programmation

Voici quelques conseils pour écrire un code propre et facile à maintenir :

#### Règles d’or

1.  **Nommer vos objets de manière descriptive** :

    ``` r
    moyenne_notes <- mean(c(80, 85, 90))
    ```

2.  **Organiser votre script avec des commentaires** :

    ``` r
    # Calcul de la somme
    somme <- sum(vecteur)
    ```

Dans le cours, vous devez suivre les [bonnes pratiques de codage du tidyverse](https://style.tidyverse.org/). Pour ce module, on portera une attention particulière à certaines parties de ce guide : chapitre 1 Files, chapitre 2 Syntax et section 3.1 Functions/Naming. La table ci-dessous résume les critères importants de ces sections et servira de grille d’évaluation pour vos codes. Notez que cette grille sera amenée à évoluer au fil des modules.

| Critère | Explication |
|:---|:---|
| Syntaxe et indentation | Respect de l’indentation et de la structure du code (2 espaces par niveau d’imbrication, pas de tabulation). |
| Espaces et lisibilité | Espaces cohérents autour des opérateurs (`<-`, `=`, `+`, etc.) et après les virgules pour améliorer la lisibilité. |
| Longueur des lignes | Les lignes de code ne dépassent pas 80 caractères (sauf exceptions justifiées). |
| Assignation | Utilisation de `<-` au lieu de `=` pour l’assignation de valeurs. |
| Nommage des objets | Utilisation de noms explicites et en `snake_case` Ex: `ma_variable` plutôt que `MaVariable` ou `maVariable`. |
| Style des fonctions | Espaces après les virgules, pas d’espace avant l’ouverture des parenthèses. Ex: `mean(x, na.rm = TRUE)`. |
| Cohérence et clarté | Le code est écrit de manière claire et compréhensible, en évitant la complexité inutile. |
| Commentaires utiles | Les commentaires sont concis et utiles, sans être redondants. Utilisation de `#` avec un espace après. |

Grille d’évaluation du code R selon le style tidyverse. {.caption-top .table .table-sm .table-striped .small}

> **TIP:**
>
> - Identifiez les erreurs de style dans le code.
>
> - Corrigez-les en appliquant les bonnes pratiques du style tidyverse.
>
>   ``` r
>   MyFunction = function(x,y){
>   result=x+y
>   return(result) }
>
>   df=data.frame(id=1:5,name=c("Alice","Bob","Charlie","David","Eva"))
>   df_filtered = subset(df, id>2)
>   df_selected = df_filtered[,c("name")]
>   df_selected$Upper = toupper(df_selected$name)
>   mean(c(1,2, 3,4,5),na.rm=TRUE)
>   ```

## Introduction à Quarto

Quarto est un outil puissant pour créer des documents reproductibles combinant texte, code, et résultats. Il prend en charge différents formats, tels que HTML, PDF et Word.

### Qu’est-ce que Quarto ?

Quarto vous permet de combiner du code R, Python ou Julia avec des explications textuelles, tout en générant des rapports professionnels. Bien sûr, dans ce cours nous l’utiliserons avec R. Ses principaux atouts incluent :

- La **reproductibilité** : le code et les résultats sont directement intégrés dans le même document.

- La **polyvalence** : possibilité de générer divers types de fichiers (rapports, présentations, sites web).

- La **simplicité d’utilisation**.

### Structure d’un document Quarto

Un fichier Quarto commence toujours par un en-tête YAML, suivi de contenu en Markdown et de blocs de code (chunks).

#### Exemple de fichier Quarto de base

``` yaml
---
title: "Mon premier document Quarto"
format: html
editor: visual
---
```

#### Insérer un *chunk* (bloc de code) R

Pour insérer un *chunk* (bloc de code) dans un document Quarto, vous pouvez cliquer sur le symbole suivant :

![Bouton pour ajouter un bloc de code dans RStudio](resources/bouton_chunck.png)

Bouton pour ajouter un bloc de code dans RStudio

``` r
# Ceci est un bloc de code
2 + 2
```

    [1] 4

Vous pouvez facilement exécuter un bloc de code soit ligne par ligne avec `Ctrl + Enter` (Windows/Linux) ou `Cmd + Enter` (Mac), soit en cliquant sur la petite flèche verte dans le coin supérieur droit du bloc de code. Vous remarquerez que vos résultats s’affichent sous la boîte de code.

Une fois que votre rapport est final, vous pouvez générer le rapport en cliquant sur le bouton Render: ![Bouton pour générer le rapport](resources/bouton_render.png)

> **NOTE:**
>
> - **Créez un document Quarto** :
>   1.  Cliquez sur `File > New File > Quarto Document`.
>   2.  Choisissez le format souhaité (HTML, PDF, Word) et générez un document de base.
>   3.  Insérez un bloc de code avec le raccourci `Ctrl + Alt + I` (ou le symbole) et ajoutez une commande R simple.
> - **Générez le document** : Utilisez `Ctrl + Shift + K` (ou le bouton render) pour générer le rapport final.

> **TIP:**
>
> 1.  Créez un document Quarto au format HTML.
> 2.  Ajoutez un bloc de code R qui calcule la moyenne du vecteur `c(1, 3, 5, 7)`.
> 3.  Personnalisez l’en-tête YAML pour inclure votre nom et une date.

# Librairie et données

Nous avons vu plus haut que vous pouvez améliorer votre expérience de R en utilisant des librairies. Dans le cadre du cours, nous allons utiliser une librairie appelée `UlavalSSD`. Il s’agit d’une librairie développée pour le cours.

## `UlavalSSD`

Premièrement, vous allez installer la librairie `UlavalSSD` et la charger dans votre environnement de travail.

``` r
# Installer le package remotes si nécessaire
install.packages("remotes")

# Installer UlavalSSD depuis GitHub
remotes::install_github("AurelienNicosiaULaval/UlavalSSD")
```

``` r
library(UlavalSSD)
```

Le fait de charger la librairie va nous permettre d’accéder à tout son contenu. Vous pouvez voir les fichiers d’aide de la librairie avec le code suivant (ou en cherchant dans l’onglet Packages à droite).

``` r
help(package = "UlavalSSD")
```

> **TIP:**
>
> - Fouillez dans le contenu de la librairie. Que remarquez-vous?

## Données `MeteoQuebec`

Dans cette aventure, nous allons travailler avec le jeu de données appelé `MeteoQuebec` disponible dans la librairie `UlavalSSD`. Il est important de noter que si la librairie n’est pas chargée (`library(UlavalSSD)`), alors vous ne pourrez pas accéder à ce jeu de données.

> **TIP:**
>
> - `MeteoQuebec` est un nom d’objet dans l’environnement. Affichez la base de données en créant un bloc de code.
> - Combien de lignes et de colonnes possède ce jeu de données?
> - Explorez l’aide pour vous assurer de bien comprendre ce que représente chaque colonne.

# Données propres et données rangées

## Qu’est-ce que des données propres ?

Dans le cadre de la science des données, des données propres désignent un ensemble de données qui est prêt à être utilisé pour des analyses. Cela signifie que les données sont organisées, cohérentes et que les problèmes connus ont été repérés ou corrigés. Travailler avec des données propres est essentiel pour garantir la qualité des résultats d’analyse et des modèles.

On distingue aussi les données rangées, ou *tidy data* en anglais. Selon cette convention, chaque variable forme une colonne, chaque observation forme une ligne et chaque cellule contient une seule valeur. Un tableau peut être rangé tout en contenant encore des valeurs manquantes; il est alors bien structuré, mais il reste à vérifier sa qualité.

### Caractéristiques des données propres

Les données propres doivent respecter les critères suivants :

- **Valeurs manquantes comprises** : Les données nécessaires pour l’analyse sont présentes, ou les valeurs manquantes sont repérées et justifiées.
- **Uniformité des formats** : Les formats des dates, des nombres et des chaînes de caractères sont cohérents.
- **Absence de doublons** : Les entrées en double ont été identifiées et supprimées si nécessaire.
- **Suppression des erreurs** : Les données incohérentes ou incorrectes ont été corrigées.
- **Colonnes bien définies** : Chaque colonne a une signification claire et unique.
- **Une ligne par observation** : Les données sont structurées de manière tabulaire, avec une ligne représentant une seule observation.

### Exemple de données non propres

Un tableau contenant les données suivantes :

| Nom     | Date Naissance | Score |
|---------|----------------|-------|
| Alice   | 01/01/1990     | 85.5  |
| Bob     | 1990-02-15     | 90    |
| Charlie |                | 87.5  |
| Alice   | 01/01/1990     | 85.5  |

Problèmes :

- Le format des dates n’est pas cohérent.
- Une ligne contient une valeur manquante (Date Naissance pour Charlie).
- Les données contiennent un doublon pour Alice.

### Exemple de données propres

Après nettoyage, les données deviennent :

| Nom     | Date Naissance | Score |
|---------|----------------|-------|
| Alice   | 1990-01-01     | 85.5  |
| Bob     | 1990-02-15     | 90.0  |
| Charlie | 1992-03-20     | 87.5  |

- Le format des dates est uniforme (AAAA-MM-JJ).
- Les doublons ont été supprimés.
- Les valeurs manquantes ont été complétées ou supprimées.

Dans les prochaines semaines, nous aurons un module complet sur le nettoyage des données. Il s’agit ici de vous introduire simplement au concept de données propres afin que vous soyez attentif à cet aspect à chaque fois que vous rencontrerez des données.

> **TIP:**
>
> - Dans le jeu de données `MeteoQuebec`, vérifiez s’il y a des données manquantes. Vous pouvez utiliser pour cela la fonction `summary`. Quand on applique la fonction `summary` sur un jeu de données, celle-ci donne des statistiques descriptives (nous y reviendrons), mais elle indique aussi le nombre de données manquantes par colonne.
>
> - Les données `MeteoQuebec` sont-elles prêtes pour toutes les analyses? Justifiez votre réponse en nommant au moins une variable qui contient des valeurs manquantes.

# Manipulation de données

Dans cette section, nous allons apprendre à manipuler des tableaux de données simples en R. Vous découvrirez comment extraire une ligne, une colonne et créer une nouvelle colonne en utilisant les crochets `[]` et l’opérateur `$`.

## Exemple de tableau de données

Nous allons utiliser les données `MeteoQuebec`. La fonction `head` est très pratique, car comme son nom l’indique, elle permet d’afficher le haut (la tête) de la base de données. Cela permet d’avoir un accès rapide aux informations contenues dans les variables.

``` r
# Affichage du haut du jeu de données
head(MeteoQuebec)
```

      ...1 year month day max_temp mean_temp min_temp total_precip total_rain
    1    1 1970    01  01    -12.8     -16.1    -19.4          0.0          0
    2    2 1970    01  02    -12.8     -16.1    -19.4          0.0          0
    3    3 1970    01  03    -13.3     -16.1    -18.9          0.0          0
    4    4 1970    01  04    -13.3     -17.0    -20.6          0.0          0
    5    5 1970    01  05    -12.8     -17.0    -21.1          0.3          0
    6    6 1970    01  06    -10.0     -14.2    -18.3          0.0          0
      total_snow snow_grnd
    1        0.0        18
    2        0.0        18
    3        0.0        18
    4        0.0        18
    5        0.5        15
    6        0.0        15

### Extraire une ligne avec des crochets `[]`

Pour extraire une ligne spécifique, utilisez le format `nom_donnees[numéro_de_ligne, ]`.

Exemple : Obtenons la 2e ligne :

``` r
# Extraire la 2ᵉ ligne
ligne_2 <- MeteoQuebec[2, ]
print(ligne_2)
```

      ...1 year month day max_temp mean_temp min_temp total_precip total_rain
    2    2 1970    01  02    -12.8     -16.1    -19.4            0          0
      total_snow snow_grnd
    2          0        18

### Extraire une colonne avec des crochets `[]`

Pour extraire une colonne, vous pouvez utiliser `nom_donnees[, numéro_de_colonne]` ou `nom_donnees[["nom_de_colonne"]]`.

**Attention**, habituellement on préfère extraire une colonne par son nom que par son numéro. Tout d’abord, si votre ensemble de données contient de nombreuses colonnes, cela va devenir fastidieux de trouver le bon numéro. Aussi, pour être reproductible, il vaut mieux travailler avec le nom, puisque même si l’ordre des colonnes change, votre analyse restera valide.

Exemple : Obtenons la colonne **total_precip** :

``` r
# Méthode 1 : Par numéro de colonne.
# Ici, total_precip est la 8e colonne.
colonne_precip <- MeteoQuebec[, 8]
print(colonne_precip)

# Méthode 2 : Par nom de colonne
colonne_precip_2 <- MeteoQuebec[["total_precip"]]
print(colonne_precip_2)
```

### Extraire une colonne avec l’opérateur `$`

Une méthode plus simple pour extraire une colonne consiste à utiliser l’opérateur `$`.

Exemple : Obtenons la colonne **mean_temp** :

``` r
# Extraire la colonne "mean_temp"
colonne_mean_temp <- MeteoQuebec$mean_temp
print(colonne_mean_temp)
```

> **NOTE:**
>
> - Dans la console, tapez le nom de la base de données `MeteoQuebec`, ajoutez un `$` à la fin. Que se passe-t-il?

### Ajouter une nouvelle colonne avec `$`

Pour créer une nouvelle colonne, utilisez l’opérateur `$` et assignez-y une valeur.

Exemple : Ajoutons une colonne **etendue_temp**, égale à **max_temp - min_temp** :

``` r
# Ajouter une nouvelle colonne
MeteoQuebec$etendue_temp <- MeteoQuebec$max_temp - MeteoQuebec$min_temp
head(MeteoQuebec)
```

      ...1 year month day max_temp mean_temp min_temp total_precip total_rain
    1    1 1970    01  01    -12.8     -16.1    -19.4          0.0          0
    2    2 1970    01  02    -12.8     -16.1    -19.4          0.0          0
    3    3 1970    01  03    -13.3     -16.1    -18.9          0.0          0
    4    4 1970    01  04    -13.3     -17.0    -20.6          0.0          0
    5    5 1970    01  05    -12.8     -17.0    -21.1          0.3          0
    6    6 1970    01  06    -10.0     -14.2    -18.3          0.0          0
      total_snow snow_grnd etendue_temp
    1        0.0        18          6.6
    2        0.0        18          6.6
    3        0.0        18          5.6
    4        0.0        18          7.3
    5        0.5        15          8.3
    6        0.0        15          8.3

> **TIP:**
>
> - Créez une nouvelle colonne **mean_temp_F** qui correspond à la température moyenne par jour en degrés Fahrenheit. Utilisez la formule \\F = C \times 9 / 5 + 32\\.

### Filtrer des lignes selon des conditions logiques

Vous pouvez utiliser des conditions logiques avec les crochets `[]` pour extraire des lignes spécifiques.

Exemple : Obtenons les lignes où la température moyenne **mean_temp** est supérieure à 25. On ajoute `!is.na(MeteoQuebec$mean_temp)` pour retirer les valeurs manquantes avant de filtrer.

``` r
# Extraire les lignes avec une température moyenne supérieure à 25
lignes_mean_temp_25 <- MeteoQuebec[
  !is.na(MeteoQuebec$mean_temp) & MeteoQuebec$mean_temp > 25,
]
print(lignes_mean_temp_25)
```

> **TIP:**
>
> - Obtenez les lignes où le total de précipitation **total_precip** est nul. Pensez à exclure les valeurs manquantes.
> - Obtenez le sous-ensemble des données pour le mois de juin seulement. Attention: la variable `month` est écrite avec deux caractères, donc juin correspond à `"06"`.

**Combiner plusieurs conditions avec** `&` ou `|` :

- **ET (`&`)** : Toutes les conditions doivent être vraies pour inclure une ligne.
- **OU (`|`)** : Au moins une des conditions doit être vraie pour inclure une ligne.

Voici un exemple où on va chercher le sous-ensemble des données correspondant aux journées de l’année 2000 pour lesquelles il n’y avait aucune précipitation.

``` r
head(
  MeteoQuebec[
    MeteoQuebec$year == 2000 & MeteoQuebec$total_precip == 0,
  ]
)
```

           ...1 year month day max_temp mean_temp min_temp total_precip total_rain
    10962 10962 2000    01  05     -3.1     -10.1    -17.0            0         NA
    10963 10963 2000    01  06     -7.7     -13.5    -19.2            0         NA
    10969 10969 2000    01  12     -1.6      -8.4    -15.2            0         NA
    10970 10970 2000    01  13    -13.6     -17.2    -20.7            0         NA
    10971 10971 2000    01  14    -18.2     -21.3    -24.3            0         NA
    10972 10972 2000    01  15    -20.1     -23.9    -27.6            0         NA
          total_snow snow_grnd etendue_temp
    10962         NA        NA         13.9
    10963         NA        NA         11.5
    10969         NA        NA         13.6
    10970         NA        NA          7.1
    10971         NA        NA          6.1
    10972         NA        NA          7.5

> **NOTE:**
>
> Vous devriez maintenant être capable de créer un document Quarto, de charger `UlavalSSD`, d’afficher `MeteoQuebec`, de vérifier les valeurs manquantes avec `summary()`, puis d’extraire des lignes ou des colonnes à partir de conditions simples.

### Résumé

| Action | Commande |
|----|----|
| Extraire une ligne | `data[numéro_de_ligne, ]` |
| Extraire une colonne (crochets) | `data[, numéro_de_colonne]` ou `data[["nom_de_colonne"]]` |
| Extraire une colonne (`$`) | `data$nom_de_colonne` |
| Ajouter une nouvelle colonne | `data$nouvelle_colonne <- ...` |
