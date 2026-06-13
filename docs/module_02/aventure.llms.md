# Aventure 2 - Github et la visualisation de données numériques

STT-1100 Introduction à la science des données

## 🧊 Mission Antarctique – Dans la peau d’un·e scientifique de données

Bienvenue dans votre nouvelle mission scientifique ! Vous êtes désormais **scientifique de données** dans l’équipe de la **Dre Adélie**, une chercheuse spécialisée dans l’étude des pingouins d’Antarctique. Elle vous a confié un ensemble de données collectées sur le terrain pour l’aider à explorer certaines pistes de recherche.

Votre travail consiste à **manipuler, transformer et visualiser** les données de manière rigoureuse, afin d’en extraire des informations utiles et reproductibles. Vous devrez notamment produire des visualisations convaincantes, calculer des statistiques descriptives et documenter votre démarche dans un rapport clair.

> 🐧 Le jeu de données, qui contient des mesures physiques de plusieurs espèces de pingouins, vous servira de terrain d’enquête.

------------------------------------------------------------------------

## ✍️ Déroulement de la mission et livrables attendus

La mission se déroulera en **deux temps**, car la Dre Adélie devra bientôt repartir en expédition en Antarctique.

### 🔹 Partie 1 – Avant le départ de la Dre Adélie

Avant son départ, vous collaborerez étroitement avec elle pour explorer les premières pistes. Elle vous demandera de :

- Nettoyer et transformer les données avec `dplyr`.
- Calculer des statistiques descriptives pertinentes sur les variables numériques.
- Créer des visualisations exploratoires (`ggplot2`) pour mieux comprendre les relations entre les variables.

📘 **Livrable de la première partie** :
Vous devez rédiger un **journal de bord** dans un rapport Quarto (format HTML) qui documente vos observations, vos explorations et les pistes que vous avez soulevées avec elle. Ce journal sert à garder une trace de vos analyses avant qu’elle ne parte sur le terrain. Un modèle de journal de bord vous sera donné.

------------------------------------------------------------------------

### 🔹 Partie 2 – Au retour de la Dre Adélie

De retour de mission, la Dre Adélie reviendra avec des **questions précises** à explorer et vous demandera de l’aider à préparer un rapport solide pour accompagner sa **demande de subvention**.

📘 **Livrable de la deuxième partie** :
Un **rapport structuré et complet** répondant à ses nouvelles demandes précises, incluant : - Des visualisations ciblées. - Des analyses précises basées sur vos découvertes antérieures. - Une mise en forme professionnelle (titre, légendes, axes lisibles, cohérence graphique). - Un suivi rigoureux via **GitHub**, incluant plusieurs commits bien commentés. - Elle vous donnera une liste de tâches claires et précises à répondre.

------------------------------------------------------------------------

> 🧑‍💼 **Note de terrain** : Pendant votre mission, un·e collègue plus expérimenté·e (Jules Tremblay) passera vous voir de temps en temps pour vérifier que tout se passe bien. Il ou elle vous posera quelques **questions rapides** pour tester votre compréhension. Répondez-y sérieusement, ces vérifications vous aideront à consolider vos apprentissages !

# Comment réussir cette aventure

Bienvenue dans cette nouvelle aventure en science des données ! Cette fois, vous allez collaborer avec une chercheuse qui étudie les manchots de la station Palmer en Antarctique. Votre mission est d’explorer et d’analyser ses données pour l’aider à répondre à ses questions scientifiques.

Pour réussir cette aventure, voici quelques conseils essentiels :

- **Lisez attentivement chaque section** avant de passer à l’expérimentation. Les explications fournies vous permettront de bien comprendre les concepts et les outils utilisés.
- **Expérimentez activement** en exécutant le code proposé et en l’adaptant à vos propres analyses. Modifier et tester différentes approches est un excellent moyen d’apprendre.
- **Réfléchissez aux questions posées par la chercheuse** et utilisez les outils adéquats pour y répondre. Pensez à justifier vos choix et interprétations.
- **Soyez rigoureux** dans votre travail en adoptant de bonnes pratiques de programmation et en documentant vos analyses.
- **N’hésitez pas à poser des questions** si vous rencontrez des difficultés ou si certains concepts restent flous.

Cette aventure vous permettra de développer vos compétences en manipulation, visualisation et analyse de données avec `dplyr` et `ggplot2`. Ce sont des compétences primordiales pour un scientifique de données. Prenez le temps d’explorer les différentes étapes et amusez-vous à apprendre !

# 🚀 Travail sur Github

La chercheuse a préparé un dépôt sur GitHub où elle souhaite que vous enregistriez tout votre travail. De son côté, elle y a déposé la base de données qu’elle a collectée ainsi qu’une description détaillée des variables. Elle souhaite notamment que vous completiez un journal de bord modèle au format Quarto.

Avant de commencer l’analyse des données, vous devez récupérer le dépôt GitHub contenant les fichiers nécessaires.

1️⃣ Clonez le dépôt “Aventure-2-IDENTIFIANT_GITHUB”, pour cela créez un nouveau projet Rstudio et copier coller le lien HTTPS de votre repo Github (voir feuille aide mémoire).

💡 Astuce : Si vous souhaitez revenir plus tard sur ce projet, vous pouvez ouvrir directement le projet en double-cliquant sur le fichier `.Rproj` dans votre explorateur de fichiers.

2️⃣ Ouvrir le fichier Quarto de journal de bord: Inscrivez votre nom et enregistrer.

3️⃣ Premier commit et push vers GitHub: Une fois votre fichier `.qmd` modifié et enregistré, commitez et poussez vos modifications sur GitHub :

Attention: on se rappelle que les messages de commit doivent être parlant. Par exemple “Initialisation du journal de bord”

🎯 Félicitations ! Vous êtes maintenant prêt à débuter l’analyse scientifique des manchots ! 🐧🚀

> 💡 Conseil : Utiliser le modèle de journal de bord pour completer l’ensemble des analyses de la première partie de cette aventure. Prenez donc quelques minutes pour regarder la structure du document.

# 📂 Lecture des données

La chercheuse vous a fourni un fichier Excel contenant les données des manchots qu’elle a collectées. Votre première mission consiste à **charger ces données dans R** en utilisant l’interface graphique de RStudio.

**🔹 Étapes à suivre**

1.  **Ouvrir le menu d’importation de données**

    - Dans RStudio, allez dans l’onglet **Environment** (Environnement).

    - Cliquez sur **Import Dataset** (Importer un jeu de données).

    - Sélectionnez **From Excel…** (Depuis Excel…), puisque l’extension est un `.xlsx`

![](resources/bouton_import_data.png)

Bouton pour importer des données

1.  **Sélectionner le fichier**

    - Dans la fenêtre qui s’ouvre, cliquez sur **Browse…** (Parcourir…) et sélectionnez le fichier **`.xlsx`** que vous avez téléchargé via le clonage du dépôt.

2.  **Ajuster les paramètres d’importation**

    - Assurez-vous que les en-têtes de colonnes sont bien détectées.

    - Vérifiez que toutes les variables sont correctement identifiées (ex. les nombres sont bien en format numérique).

    - On appelera le jeu de données `penguins_mission`, compléter l’information dans la fenêtre.

3.  **Importer et afficher les données**

    - Cliquez sur **Import**.

    - Vérifiez que votre jeu de données apparaît dans l’**Environment** sous le nom `penguins_mission`.

    *Remarque*: lorsque on clique sur **Import,** un code s’execute dans la console. Il s’agit du code pour importer le jeu de données.

    - Pour voir un aperçu des données, utilisez la commande suivante dans la console :

      `View(penguins_mission)`

📝 **Rappel : documentez votre importation dans votre rapport Quarto**

Une bonne pratique en science des données est de toujours **documenter** comment vous avez importé les données, même si vous avez utilisé une interface graphique.
Ajoutez le code exécuté dans la console dans votre fichier **Quarto** de journal de bord **(`.qmd`)** à la section appropriée.

Dans chaque rapport d’analyse, vous devriez avoir une première section **Lecture des données,** avec un bloc de code qui contient le code qui permet de lire les données. J’en profite pour vous rappeler les **bonnes pratiques de programmation du Tidyverse**, à savoir que dans votre bloc de code, il devrait par exemple y avoir des commentaires.

💡 **Pourquoi est-ce important ?**
Cela garantit que votre analyse est **reproductible** : si un autre chercheur veut la refaire, il pourra exécuter votre code sans avoir à utiliser l’interface graphique.

> **IMPORTANT:**
>
> Tu viens d’importer le fichier Excel. Dis-moi, dans quelle variable as-tu stocké les données pour la suite de l’analyse ?
> 1. `penguins`
> 2. `penguins_mission`
> 3. `donnees_manchots`
> 4. `mission_antarctique`

> **CAUTION:**
>
> Tu devais nommer ta base **`penguins_mission`**, comme indiqué dans l’instruction d’importation.
> 💡 Attention : tout le reste de l’analyse repose sur ce nom cohérent !

**📌 Une fois vos données chargées, vous êtes prêts à les explorer et à les analyser 🐧! Pensez à générer votre rapport, committer vos modifications et pousser sur GitHub pour garder une trace de votre travail ! 🚀**

# 🛠️ Manipulation de données

## Résumé de données avec `glimpse()`

La chercheuse veut une vue rapide des données pour vérifier leur structure. Utilisez `glimpse()` pour afficher un aperçu :

``` r
library(tidyverse)
glimpse(penguins_mission)
```

> **IMPORTANT:**
>
> Combien de **variables numériques** vois-tu dans le `glimpse()` de `penguins_mission`?
> - 3
> - 4
> - 5
> - 6

> **CAUTION:**
>
> Il y a généralement **4 variables numériques** :
> `bill_length_mm`, `bill_depth_mm`, `flipper_length_mm` et `body_mass_g`.
> 🧠 Attention : certaines versions du jeu peuvent varier selon l’importation !

#### 🔍 Aperçu rapide avec `glimpse()`

La fonction `glimpse()` du package **dplyr** permet d’obtenir **un aperçu rapide et structuré d’un jeu de données**.

Plutôt que d’afficher toutes les lignes ou une structure en arbre comme `str()`, `glimpse()` présente les variables **horizontalement**, avec :

- Le **nom de chaque variable**

- Son **type de données** (`<dbl>`, `<chr>`, `<fct>`, etc.)

- Quelques **valeurs représentatives** de chaque colonne

Cette présentation facilite l’examen rapide de la structure d’un tableau, surtout lorsqu’il comporte **de nombreuses colonnes**.

> 🧠 **Bon à savoir** : `glimpse()` est particulièrement utile pour repérer d’éventuelles erreurs de type (ex. une variable numérique encodée comme texte) ou pour déceler des valeurs manquantes.

> **TIP:**
>
> La chercheuse souhaite obtenir un premier compte rendu sur les données disponibles. Pour cela, vous devez compléter le texte suivant et l’intégrer dans votre journal de bord d’analyse Quarto : \> “Le jeu de données contient \*\*\_\_\_\*\* observations et \*\*\_\_\_\*\* variables. Les variables sont ***,*** , \*\*\_\_\_\*\*….etc”

> **NOTE:**
>
> 💡 **Question de réflexion** : Que se passe-t-il si la chercheuse modifie la base de données ? Par exemple, elle a oublié un manchot et l’ajoute sans vous prévenir, puis met à jour le dépôt GitHub. Lorsque vous réexécutez votre analyse dans votre rapport Quarto (`.qmd`), que va-t-il se passer ? 🤔

Ne vous inquiétez pas si cela vous semble complexe ! Nous reviendrons sur cet aspect plus tard dans la session. 😉

> **TIP:**
>
> Combien de variables sont de type numérique? Combien de type charactère? *to-do*: Inclure votre réponse dans votre journal de bord à la suite du texte troué.

**Pensez à générer votre rapport, committer vos modifications et pousser sur GitHub pour garder une trace de votre travail ! 🚀**

## Sélectionner des variables avec `select()`

La chercheuse veut se concentrer uniquement sur certaines variables pertinentes pour son analyse. Utilisez `select()` pour ne garder que `species`, `island`, `bill_length_mm` et `body_mass_g` :

``` r
penguins_subset <- penguins_mission %>%
  select(species, island, bill_length_mm, body_mass_g)
```

> **NOTE:**
>
> Faite un `glimpse()` de la nouvelle base de données `penguins_subset`. Pourquoi avoir choisi un nouveau nom?

> **TIP:**
>
> Sélectionnez toutes les variables sauf `flipper_length_mm` et `body_mass_g`. Attention il y a une facon rapide de le faire!

## Créer de nouvelles variables avec `mutate()`

💡 **Explication** : La chercheuse souhaite ajouter une nouvelle colonne indiquant le poids en kilogrammes au lieu de grammes. En effet, son appareil de mesure indiquait les mesures en g, mais elle croit que cela sera plus facile à interpréter en kg.

💡 **Pourquoi est-ce utile ?** Transformer les unités peut faciliter la compréhension et la communication des résultats.

La chercheuse souhaite ajouter une nouvelle colonne indiquant le poids en kilogrammes au lieu de grammes. Utilisez `mutate()` pour créer cette nouvelle variable :

``` r
penguins_mission <- penguins_mission %>%
  mutate(body_mass_kg = body_mass_g / 1000)
```

> **IMPORTANT:**
>
> Tu as transformé la masse en kilogrammes. La masse du penguin numéro 21 est plus petit que 4 kg, vrai ou faux?
> 1. Vrai
> 2. Faux

> **CAUTION:**
>
> Quand on regarde la ligne 21 de la base de données, on obtiens un nombre pour `body_mass_kg` de 4.01 kg, donc la réponse est **Faux**.
>
> ``` r
> penguins_mission[21,"body_mass_kg"]
> ```

On va maintenant continuer avec une nouvelle variable dont la chercheuse est très intéréssée:

> **TIP:**
>
> Créez une nouvelle variable appelée `bill_ratio` correspondant au rapport entre la longueur et la profondeur du bec.
>
> 🧐 **Question de la chercheuse** : un de mes collègues en antartique m’assure que le rapport **moyen** entre la longueur et la profondeur du bec est superieur à 3. De mon côté, je trouve cela étrange, car ca ne respecte pas ce qu’on peut lire dans la littérature. Peux-tu m’aider avec cela? j’aimerai que tu répondes à la question dans le journal de bord.

**Pensez à générer votre rapport, committer vos modifications et pousser sur GitHub pour garder une trace de votre travail ! 🚀**

## Filtrer les données avec `filter()`

La chercheuse veut analyser uniquement les manchots de l’île **Biscoe**. Utilisez `filter()` pour ne garder que ces observations :

``` r
penguins_biscoe <- penguins_mission %>%
  filter(island == "Biscoe")
```

> **TIP:**
>
> Filtrez les données pour ne garder que les manchots de l’espèce **Adelie** de l’île Biscoe.

## Regrouper et résumer les données avec `group_by()`

La chercheuse souhaite connaître la masse moyenne des manchots par espèce. Utilisez `group_by()` suivi de `summarise()` pour obtenir cette information :

``` r
penguins_summary <- penguins_mission %>%
  group_by(species) %>%
  summarise(mean_body_mass_g = mean(body_mass_g, na.rm = TRUE))
```

*Remarque*: on utilise l’option `na.rm=TRUE` dans les fonctions, ce qui est assez pratique, car cela permet de calculer la statistique en omettant les valeurs manquantes (`NA`).

> **TIP:**
>
> 🧐 **Question de la chercheuse** : Quelle est la combinaison île/espèce qui possède la longueur médiane de nageoire la plus faible ? j’aimerai que tu répondes à la question dans le journal de bord.

Grâce à `group_by` on peut aussi par exemple filter par groupe, ce qui peut être très pratique!

> **TIP:**
>
> 📝 **Exercice** : Faites sortir le premier manchot de la base de données pour chaque espèce et chaque île. *Indice:* on peut utiliser la fonction `slice`.

**Pensez à générer votre rapport, committer vos modifications et pousser sur GitHub pour garder une trace de votre travail ! 🚀**

# 🐧 Un appel d’urgence depuis l’Antarctique

Alors que vous avanciez bien dans votre analyse des données, vous recevez un message urgent de la chercheuse. Elle a dû partir précipitamment en Antarctique pour une mission d’urgence : aider une colonie de manchots confrontée à des conditions climatiques extrêmes.

Avant son départ, elle a pris soin de vous laisser une liste de tâches essentielles à compléter. Elle compte sur vous pour poursuivre son analyse ! Cependant, la connexion est instable là-bas, et la seule manière de communiquer avec elle est par Teams, elle vous enverra des messages mais vous ne pourrais pas communiquer avec elle.

> **Note:** ici vous êtes toujours dans la partie 1 de l’aventure, mais la chercheuse vous a laissé une liste de tâches à compléter avant son départ. Vous devez donc continuer à travailler sur le jeu de données `penguins_mission` que vous avez créé précédemment. Vous devez donc continuer a completer le journal de bord.

# 📊 Visualisation des données

La visualisation des données est une étape essentielle de l’analyse, car elle permet de mieux comprendre les tendances et les relations entre les variables. Une bonne visualisation facilite l’interprétation des données et aide à repérer des valeurs aberrantes ou des motifs intéressants.

💡 **Rappel des bonnes pratiques de codage en visualisation** :

- Toujours **étiqueter** les axes avec `labs()` pour rendre les graphiques compréhensibles.

- Utiliser des **couleurs adaptées** pour distinguer les groupes sans surcharger la visualisation.

- Vérifier que l’échelle des axes est cohérente et ne fausse pas l’interprétation des données.

- Adapter le **binwidth** des histogrammes et la **transparence** des points dans les graphiques de nuage de points pour éviter une mauvaise lisibilité.

- Tester plusieurs types de graphiques avant de conclure sur une analyse.

## Histogrammes

💡 **Explication** : Un histogramme permet de visualiser la distribution d’une variable numérique. Ici, nous allons par exemple examiner la répartition des profondeurs de bec (`bill_depth_mm`).

``` r
library(ggplot2)
ggplot(penguins_mission, aes(x = bill_depth_mm)) +
  geom_histogram(binwidth = 0.5, fill = "steelblue", color = "black") +
  labs(title = "Distribution de la longueur du bec des manchots",
       x = "Longueur du bec (mm)",
       y = "Effectif")
```

![](aventure_files/figure-html/unnamed-chunk-9-1.png)

> **NOTE:**
>
> Changez la valeur de `binwidth` dans le code ci-dessus et observez comment cela modifie l’histogramme.

> **IMPORTANT:**
>
> Quand tu regardes l’histogramme de `bill_depth_mm`, quel mot décrit le mieux la forme de la distribution ?
> 1. Uniforme
> 2. Bimodale
> 3. Asymétrique droite
> 4. Symétrique

> **CAUTION:**
>
> La distribution est généralement **symétrique**, voire légèrement étalée.
> Une bonne lecture visuelle aide à anticiper les mesures centrales et extrêmes.

**📜 Instructions laissées par la chercheuse**

Pour connaître la première demande de la chercheuse, voic son message recu :

    [1] "Je veux voir la répartition des longueurs de nageoires des manchots. En effet, quand j'ai regardé, il me semblait y avoir une erreur dans les données. J'aimerais que tu m'aides à la trouver."

> **TIP:**
>
> Créez un histogramme pour la variable `flipper_length_mm`. Vous devez ajuster l’ensemble des informations sur le graphique en respectant les bonnes pratiques de visualisation.
>
> 🧐 **Question de la chercheuse** : En regardant l’histogramme de la longueur des nageoires, remarquez-vous quelque chose de particulière dans la distribution ?

Poussons un peu plus loin la visualisation pour essayer de répondre à sa demande.

## Boite à moustache

💡 **Explication** : Une boîte à moustaches permet de visualiser la dispersion d’une variable numérique et d’identifier d’éventuelles valeurs aberrantes. Ici, nous allons examiner la distribution de la longueur des nageoires (`flipper_length_mm`).

``` r
ggplot(penguins_mission, aes(x = species, y = flipper_length_mm, fill = species)) +
  geom_boxplot() +
  labs(title = "Distribution de la longueur des nageoires par espèce",
       x = "Espèce",
       y = "Longueur des nageoires (mm)")
```

![](aventure_files/figure-html/unnamed-chunk-11-1.png)

> **NOTE:**
>
> Ajoutez une variable pour différencier les îles et observez si certaines îles présentent des valeurs plus extrêmes.

> **TIP:**
>
> Trouvez le numéro de ligne de l’observation qui semble être une valeur aberrante dans la longueur des nageoires.

> **IMPORTANT:**
>
> Quel est le **numéro de ligne** de l’observation qui a une **nageoire de 400 mm** (valeur aberrante ajoutée exprès) ?
> 1. 1
> 2. 11
> 3. 6
> 4. 113

> **CAUTION:**
>
> L’observation aberrante est **ligne 6**.
> Elle a été ajoutée exprès pour tester ta capacité à détecter visuellement les anomalies.

**Pensez à générer votre rapport, committer vos modifications et pousser sur GitHub pour garder une trace de votre travail ! 🚀**

> **TIP:**
>
> Dans le graphique précédent, le titre de la légende est “species”, en anglais, qui est par default le nom de la variable. Changez-le pour “Espèce” en français. Vous devez trouver par vous-même comment faire cela.

## Nuages de point (scatter plot)

💡 **Explication** : Un scatter plot (ou nuage de points) permet de visualiser la relation entre deux variables numériques. Ici, nous allons examiner la relation entre la longueur du bec (`bill_length_mm`) et la profondeur du bec (`bill_depth_mm`).

``` r
ggplot(penguins_mission, aes(x = bill_length_mm, y = bill_depth_mm)) +
  geom_point() +
  labs(title = "Relation entre la longueur et la profondeur du bec",
       x = "Longueur du bec (mm)",
       y = "Profondeur du bec (mm)")
```

![](aventure_files/figure-html/unnamed-chunk-12-1.png)

> **NOTE:**
>
> Ajoutez une variable de couleur pour différencier les îles et observez si certaines îles présentent des relations différentes.

Pour connaître la prochaine demande de la chercheuse, voici le message que vous venez de recevoir :

    [1] "Je veux voir la relation entre la longueur du bec et la masse corporelle sous forme d'un nuage de points. Peux-tu vérifier s'il y a des valeurs aberrantes pour ces deux variables ?"

> **TIP:**
>
> Modifiez le scatter plot pour afficher la relation souhaitée par la chercheuse. Est-ce que vous trouver qu’un point à l’air bizarre? Si oui, quel est son numéro de ligne?

**Pensez à générer votre rapport, committer vos modifications et pousser sur GitHub pour garder une trace de votre travail ! 🚀**

# 🧮 Statistiques descriptives

💡 **Explication** : Les statistiques descriptives permettent de résumer et comprendre rapidement un ensemble de données. Elles se divisent en plusieurs catégories :

- **📌 Tendance centrale** : moyenne, médiane
- **📌 Dispersion** : variance, écart-type, coefficient de variation
- **📌 Distribution** : min, max, quartiles
- **📌 Asymétrie et aplatissement** : skewness et kurtosis (optionnel)

Nous allons voir comment obtenir ces statistiques en R avec `dplyr`. En utilisant la fonction `summarise` il est très facile de calculer des statistiques descriptives sur une variable:

``` r
penguins_mission %>%
  summarise(
    mean_bill_length = mean(bill_length_mm, na.rm = TRUE), #  moyenne
    median_bill_length = median(bill_length_mm, na.rm = TRUE), # mediane
    sd_bill_length = sd(bill_length_mm, na.rm = TRUE), # écart-type
    var_bill_length = var(bill_length_mm, na.rm = TRUE), # variance
    min_bill_length = min(bill_length_mm, na.rm = TRUE), # min
    max_bill_length = max(bill_length_mm, na.rm = TRUE), # max
    q1_bill_length = quantile(bill_length_mm, 0.25, na.rm = TRUE), # Q1
    q3_bill_length = quantile(bill_length_mm, 0.75, na.rm = TRUE) #Q3
  )
```

**📜 Instructions laissées par la chercheuse**

Pour connaître la première demande de la chercheuse, elle viens de vous a envoyé ceci :

    [1] "Quelle espèce de pingouin a le bec le plus long en moyenne ? Le plus variable?"

> **TIP:**
>
> Répondez de facon précise dans votre journal de bord à la demande du Docteur Adélie.

✅ Méthode rapide avec `across()` ans `dplyr`

Tu peux appliquer toutes les fonctions statistiques sur plusieurs colonnes d’un coup :

``` r
penguins_mission %>%
  group_by(species) %>%
  summarise(across(bill_length_mm, list(
    mean = mean, median = median, sd = sd, var = var,
    min = min, max = max, q1 = ~quantile(.x, 0.25), q3 = ~quantile(.x, 0.75)
  )))
```

💡 Avantages :

- Moins de répétition de code

- Facilement extensible à plusieurs variables en changeant `bill_length_mm` par `c(bill_length_mm, flipper_length_mm)`

> **IMPORTANT:**
>
> Tu as calculé `bill_ratio` plus haut avec la fonction `mutate`. Si la moyenne est 2.94 et que ton collègue s’attend à 3.5, que peux-tu conclure ?
> 1. Le collègue a raison, 2.94 ≈ 3.5
> 2. Il faut plus d’échantillons
> 3. Tes résultats contredisent son hypothèse
> 4. Le ratio n’est pas utile

> **CAUTION:**
>
> Une moyenne de **2.94**, bien inférieure à 3.5, contredit l’hypothèse du collègue.
> Cela suggère une différence, mais tu pourrais aussi comparer les distributions, par exemple avec un histogramme ou un boxplot, pour mieux visualiser les variations.

## Visualisation avancée et statistiques descriptives (optionnel)

Nous allons maintenant créer un boxplot détaillé qui affiche :

- Les quartiles (Q1-Q3)
- La médiane
- La moyenne
- Les valeurs extrêmes

> **TIP:**
>
> Parmis les stastiques précédentes, laquelle n’est habituellement pas affichée dans une boite à moustache? 🤔

Avant de partir en antartique, la chercheuse vous as laissé un bout de code (vraisemblablement un début de travail qu’elle souhaitait faire);

``` r
ggplot(penguins_mission, aes(x = species, y = bill_length_mm, fill = species)) +
  geom_boxplot(alpha = 0.5) +
  stat_summary(fun = mean, geom = "point", shape = 23, size = 4, fill = "red") +
  labs(title = "Longueur du bec des pingouins par espèce",
       x = "Espèce",
       y = "Longueur du bec (mm)") +
  theme_minimal()
```

![](aventure_files/figure-html/unnamed-chunk-17-1.png)

**📜 Instructions laissées par la chercheuse**

Pour connaître la tâche optionnelle de la chercheuse :

    [1] "J'ai commencé à faire le ggplot, mais il resterait a ajouter une annotation indiquant la valeur moyenne de chaque espèce sur le graphique."

> **TIP:**
>
> Completer le code `ggplot2` du Dr Adélie afin de répondre à sa demande. Inclure cela dans votre journal de bord. Dites en quoi ce graphique avancé peut aider à comprendre mieux nos données.

**Pensez à générer votre rapport, committer vos modifications et pousser sur GitHub pour garder une trace de votre travail ! 🚀**

🎯 Félicitations ! Vous avez maintenant terminer la partie 1 de cette aventure, vous pouvez allez vous reposer un peu avant la prochaine partie de cette mission! 🐧🚀

> **IMPORTANT:**
>
> À quel moment devrais-tu faire un commit Git ?
> 1. Une fois à la toute fin du projet
> 2. À chaque fois que tu ajoutes un graphique
> 3. Régulièrement après chaque étape importante
> 4. Seulement après une erreur

> **CAUTION:**
>
> Tu dois faire un commit **après chaque étape significative** (import, filtre, graphique, analyse).
> 🧠 Cela assure la traçabilité, et te sauvera du stress si tu dois revenir en arrière.

# 🐧 Le retour du Dr Adélie Fortier! (2e partie de l’aventure)

🔎 Après plusieurs semaines en Antarctique à observer les manchots, notre chercheuse est de retour avec pleins de nouvelles questions en tête. Elle a remarqué que certaines espèces semblaient avoir des caractéristiques bien distinctes, mais elle aimerait une analyse plus approfondie qui va l’aider a obtenir une nouvelle subvention pour son projet de recherche.

📘 **Rappel des livrables de la deuxième partie** :
Un **rapport structuré et complet** répondant à ses nouvelles demandes précises, incluant :

- Des visualisations ciblées.

- Des analyses précises basées sur vos découvertes antérieures.

- Une mise en forme professionnelle (titre, légendes, axes lisibles, cohérence graphique).

- Un suivi rigoureux via **GitHub**, incluant plusieurs commits bien commentés.

- Elle vous donnera une liste de tâches claires et précises à répondre.

> **Note**: vous devez batir vous même votre rapport quarto pour l’aider dans sa demande de subvention. Commencer par créer un nouveau rapport QMD.

Sa question principale : 👉 Comment les caractéristiques physiques des manchots varient-elles selon les espèces ?

Pour l’aider, vous réaliserez une analyse complète, en mobilisant toutes les compétences acquises dans ce module.

> **TIP:**
>
> Existe-t-il des différences notables entre les espèces de manchots ?

➡️ Pour y répondre, vous devez explorer les différences entre les caractéristiques physiques des trois espèces.

✅ Tâches :

Calculez la moyenne et l’écart-type des variables suivantes par espèce :

- Longueur du bec (`bill_length_mm`)

- Profondeur du bec (`bill_depth_mm`)

- Longueur des nageoires (`flipper_length_mm`)

- Masse corporelle (`body_mass_g`)

Affichez les résultats sous forme de tableau clair.

💡 Indice : Utilisez `group_by()` et `summarise()` de `dplyr` pour obtenir ces statistiques.

> **TIP:**
>
> Peut-on identifier un indicateur de “*grandeur*” du manchot ?

➡️ La chercheuse aimerait une nouvelle variable qui pourrait représenter la taille globale d’un manchot.

✅ Tâches :

- Créez une nouvelle variable **`indice_grandeur`** , définie comme la somme de :

  - La longueur des nageoires (flipper_length_mm)

  - La longueur du bec (bill_length_mm)

- Ajoutez cette variable au jeu de données et affichez quelques valeurs pour vérifier son calcul.

💡 Indice : Utilisez `mutate()` pour ajouter la variable à votre data.frame.

> **TIP:**
>
> Comment ces caractéristiques sont-elles réparties entre les espèces ?

➡️ Pour mieux visualiser les différences entre les espèces, la chercheuse vous demande de créer des graphiques.

✅ Tâches :

- Un histogramme de la longueur du bec (`bill_length_mm`) par espèce.

- Un nuage de points montrant la relation entre **`indice_grandeur`** et la masse corporelle (`body_mass_g`), en colorant par espèce.

Attention, n’oubliez pas vos bonnes pratiques de visualisation.

**✍️ Conclusion**

- Que remarquez-vous ?

- Quelles sont les différences les plus marquantes entre les espèces ?

**Pensez à générer votre rapport, committer vos modifications et pousser sur GitHub pour garder une trace de votre travail ! 🚀**

------------------------------------------------------------------------

🎯 **Mission réussie !** Vous avez aidé le Dr Adélie Fortier à analyser les données des manchots avec succès ! 🚀
