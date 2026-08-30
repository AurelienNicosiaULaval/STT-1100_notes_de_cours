# Aventure 10 — Au-delà des données : texte et tableau de bord

STT-1100 • Introduction à la science des données

## Mise en contexte

Cette semaine, vous avez été **engagé·e comme analyste d’affaires junior** par la **Faculté des sciences et de génie de l’Université Laval**. Dans le cadre de la réforme du baccalauréat en statistique et science des données, la direction souhaite évaluer **l’évolution du ressenti étudiant tout au long de la session**.

Chaque semaine, les étudiant·es ont répondu à un questionnaire sur leur expérience d’apprentissage dans le cours STT-1100. Vos analyses seront essentielles pour documenter les points forts et les pistes d’amélioration du nouveau programme.

Vous êtes guidé·e par **Anne-Sophie**, la directrice du programme, qui vous accompagne dans la structuration de votre tableau de bord et vous aide à interpréter les résultats.

> “L’idée, c’est d’avoir un portrait honnête, mais constructif. On veut voir les tendances de fond et s’en inspirer pour continuer d’améliorer notre programme.”

Carte de visite

Votre rôle Analyste d’affaires junior

Interlocutrice Anne-Sophie

Organisation et contexte Faculté des sciences et de génie, Université Laval

Mission Transformer des rétroactions anonymisées en tableau de bord utile

Données `data/sentiments_cours.csv` ou fichier exemple non réel

Livrable Tableau de bord local reproductible, ou partagé selon les consignes du cours

## Mission

Construire un tableau de bord interactif (avec `flexdashboard` et `shiny`) qui permet de :

- visualiser les sentiments exprimés par semaine,
- identifier les mots les plus fréquents et distinctifs,
- explorer les tendances lexicales dans le temps,
- offrir des filtres dynamiques pour affiner l’analyse.

> **NOTE:**
>
> - Vous traitez du texte libre comme une donnée analysable.
> - Vous appliquez un lexique de sentiment en explicitant ses limites.
> - Vous combinez analyse textuelle, variables numériques et tableau de bord interactif.
> - Vous protégez la confidentialité des rétroactions avant toute publication ou partage.

## Données

Le fichier de travail principal s’appelle `data/sentiments_cours.csv`. Il est construit progressivement pendant la session à partir des rétroactions anonymisées des étudiant·es.

Au début de l’aventure, ce fichier peut ne pas encore être complet. Le dépôt du module fournit donc aussi un petit fichier exemple non réel pour tester le tableau de bord avant l’arrivée des rétroactions finales.

Le format attendu du fichier final est :

- `id`: identifiant anonyme
- `semaine`: numéro de semaine
- `commentaire`: texte libre sur leur ressenti face au cours cette semaine
- `difficulte`: niveau de difficulté perçu (1 à 5)
- `engagement`: niveau d’engagement (1 à 5)
- `plaisir`: niveau de plaisir (1 à 5)

Si une variable n’est pas collectée exactement sous cette forme, documentez clairement le recodage utilisé dans votre tableau de bord.

## Outils recommandés

- `tidytext`, `stringr`, `dplyr` : nettoyage et analyse du texte
- `ggplot2`, `wordcloud`, `plotly` : visualisation
- `flexdashboard`, `shiny` : interface interactive
- un lexique maison en français pour l’analyse de sentiment

## Étapes guidées

### Étape 1 — Nettoyage de texte

> **IMPORTANT:**
>
> « Est-ce que tu pourrais me montrer un exemple avec quelques commentaires et comment tu les nettoierais étape par étape ? »

> **TIP:**
>
> Le nettoyage de texte est essentiel avant toute analyse. Tu veux que chaque mot ait un sens pertinent. Essaie de retirer la ponctuation, les mots trop courants, et assure-toi que tout est bien en minuscules.

> **NOTE:**
>
> - **Tokenisation** : procédé qui consiste à découper le texte en unités de base (mots, n‑grammes). Chaque token devient une ligne dans votre tableau.
> - **Stopwords** : mots très fréquents (“le”, “de”, “et”, etc.) qui n’apportent généralement pas d’information sémantique utile pour l’analyse.
> - **Nettoyage** : mise en minuscules, retrait de la ponctuation, chiffres et caractères spéciaux pour normaliser les tokens.

#### Exemple de jeu de données simulé

Cet exemple sert seulement à comprendre les étapes. Le tableau de bord final devra être branché au fichier `data/sentiments_cours.csv` lorsque les rétroactions anonymisées seront disponibles.

``` downlit
# Jeu de données fictif en français avec des commentaires
exemple <- tibble::tibble(
  id = 1:7,
  semaine = c(1, 1, 2, 2, 2, 3, 3),
  commentaire = c(
    "J'ai trouvé le cours très clair cette semaine, bravo au prof !",
    "Je commence à mieux comprendre, c'est motivant !",
    "Trop de matière à assimiler en peu de temps, je me sens dépassé.",
    "Pas facile cette semaine, j’ai eu du mal avec les graphiques.",
    "Ouf très difficile cette semaine, particulièrement avec les graphiques.",
    "Les outils sont puissants, mais je manque de pratique.",
    "La construction du dashboard est super intéressante."
  )
)
```

#### Prétraitement du texte

``` downlit
library(tidytext)
library(dplyr)
library(stringr)
library(tibble)
library(ggplot2)
library(stopwords)

# Charger les stopwords français
stop_fr <- stopwords::stopwords("fr", source = "snowball")

texte_nettoye <- exemple %>%
  unnest_tokens(word, commentaire) %>%
  filter(!word %in% stop_fr,             # Retirer les mots fréquents
         str_detect(word, "^[a-zéèêàâîôûùçäëïöü]+$"))  # Garder les mots valides en français

head(texte_nettoye)
```

    # A tibble: 6 × 3
         id semaine word
      <int>   <dbl> <chr>
    1     1       1 trouvé
    2     1       1 cours
    3     1       1 très
    4     1       1 clair
    5     1       1 semaine
    6     1       1 bravo

> **IMPORTANT:**
>
> Appliquez ensuite le même type de nettoyage au fichier `data/sentiments_cours.csv` ou au fichier exemple fourni dans le dépôt.

Anne-Sophie vous demande d’appliquer un nettoyage classique :

- retirer la ponctuation, les chiffres et les mots fréquents (stopwords),

- transformer le texte en minuscules,

- **tokeniser** le texte (découper en mots).

### Étape 2 — Analyse de sentiment

On s’intéresse ici à la **valence émotionnelle** des mots dans les commentaires. L’analyse de sentiment permet de quantifier si un texte est plutôt positif ou négatif.

> **NOTE:**
>
> - **Sentiment d’un mot** : étiquette (positive, négative) ou score numérique indiquant la valence émotionnelle du mot.
> - **Score de sentiment d’un texte** : somme ou différence des scores/étiquettes des mots qu’il contient, souvent agrégé par document ou, ici, par semaine.

#### Analyse de sentiment en français

Actuellement, il **n’existe pas de lexique intégré à [`tidytext::get_sentiments()`](https://juliasilge.github.io/tidytext/reference/get_sentiments.html) pour le français** (contrairement à l’anglais, où les lexiques `bing`, `afinn`, et `nrc` sont directement accessibles). Voici donc une approche pédagogique : créer un petit lexique personnalisé à enrichir en classe.

> **IMPORTANT:**
>
> « Pour cette étape, je vous recommande de construire un petit lexique maison. Vous pouvez commencer par les mots qui reviennent souvent et les classer subjectivement. Le but ici est de comprendre le principe d’une analyse de sentiment, même avec des outils simples. »

``` downlit
# Lexique maison de base à adapter
lexique_fr <- tibble::tibble(
  word = c("clair", "motivant", "bravo", "difficile", "dépassé", "mal", "intéressante", "puissants"),
  sentiment = c("positive", "positive", "positive", "negative", "negative", "negative", "positive", "positive")
)

sentiment_fr <- texte_nettoye %>%
  inner_join(lexique_fr, by = "word") %>%
  count(semaine, sentiment) %>%
  tidyr::pivot_wider(names_from = sentiment, values_from = n, values_fill = 0) %>%
  mutate(score = positive - negative)

sentiment_fr
```

    # A tibble: 3 × 4
      semaine positive negative score
        <dbl>    <int>    <int> <int>
    1       1        3        0     3
    2       2        0        3    -3
    3       3        2        0     2

#### Visualisation des scores par semaine

Faisons un graphique pour visualiser l’évolution du score de sentiment par semaine :

``` downlit
ggplot(sentiment_fr, aes(x = semaine, y = score)) +
  geom_col(fill = "steelblue") +
  labs(title = "Score de sentiment par semaine",
       y = "Score net (positif - négatif)", x = "Semaine")
```

![](aventure_files/figure-html/unnamed-chunk-4-1.png)

> **NOTE:**
>
> « Comme les lexiques intégrés à [`get_sentiments()`](https://juliasilge.github.io/tidytext/reference/get_sentiments.html) ne sont disponibles qu’en anglais, je vous propose de construire un petit lexique maison pour le français. Ce sera imparfait, mais cela vous permettra de comprendre le principe. On pourra ensuite en discuter ensemble pour l’enrichir. Ce qui m’intéresse, c’est que vous soyez capables d’interpréter l’évolution du sentiment d’une semaine à l’autre, même avec des outils simples. »

#### Collaboration finale

À la fin du cours, une activité en classe permettra à chaque étudiant·e ou équipe de **partager son propre lexique de sentiments en français** construit durant l’analyse.

**L’enseignant collectera et fusionnera ces lexiques**, en les vérifiant pour produire une version enrichie commune. Cette nouvelle version sera partagée avec toute la classe comme ressource collective pour les projets futurs.

### Étape 3 — Mots distinctifs

Dans cette étape, nous allons identifier les mots qui ressortent le plus chaque semaine. Pour cela, nous utiliserons l’approche **TF-IDF** (Term Frequency-Inverse Document Frequency), qui permet de mettre en évidence les mots à la fois fréquents dans un document et rares dans l’ensemble des documents.

> **TIP:**
>
> « Un bon indicateur de ce que ressentent les étudiant·es, ce sont les mots qui ressortent le plus dans leurs commentaires. Vous pouvez essayer une analyse TF-IDF ou même créer un nuage de mots. »

> **NOTE:**
>
> - **TF (Term Frequency)** : fréquence d’apparition d’un mot dans un document.
> - **IDF (Inverse Document Frequency)** : importance inverse d’un mot dans l’ensemble des documents – les mots rares ont un IDF élevé.
> - **TF‑IDF** : produit TF × IDF qui met en évidence les mots à la fois fréquents dans un document et rares dans les autres (mots “distinctifs”).

#### Calcul TF-IDF

Calculons le TF-IDF pour chaque mot par semaine :

``` downlit
tfidf <- texte_nettoye %>%
  count(semaine, word) %>%
  bind_tf_idf(word, semaine, n) %>%
  arrange(desc(tf_idf))

head(tfidf)
```

    # A tibble: 6 × 6
      semaine word             n    tf   idf tf_idf
        <dbl> <chr>        <int> <dbl> <dbl>  <dbl>
    1       3 construction     1 0.125  1.10  0.137
    2       3 dashboard        1 0.125  1.10  0.137
    3       3 intéressante     1 0.125  1.10  0.137
    4       3 manque           1 0.125  1.10  0.137
    5       3 outils           1 0.125  1.10  0.137
    6       3 pratique         1 0.125  1.10  0.137

#### Visualisation pour une semaine donnée

Faisons un graphique pour visualiser les mots les plus distinctifs pour une semaine spécifique. Par exemple, la semaine 2 :

``` downlit
# Choisir semaine 2 comme exemple
library(forcats)

tfidf %>%
  filter(semaine == 2) %>%
  slice_max(tf_idf, n = 8) %>%
  mutate(word = fct_reorder(word, tf_idf)) %>%
  ggplot(aes(x = word, y = tf_idf)) +
  geom_col(fill = "darkorange") +
  coord_flip() +
  labs(title = "Mots les plus distinctifs — Semaine 2",
       x = NULL, y = "TF-IDF")
```

![](aventure_files/figure-html/unnamed-chunk-6-1.png)

Une visualisation comme celle-ci permet de voir quels mots sont les plus représentatifs des commentaires de cette semaine-là. Il existe aussi la possibilité de créer un **nuage de mots** pour une représentation plus visuelle. Un nuage de mots est une représentation graphique des mots les plus fréquents, où la taille de chaque mot est proportionnelle à sa fréquence d’apparition.

Pour créer un nuage de mots en français :

- utilisez la fonction `wordcloud()` du package `wordcloud`, ou `ggwordcloud` pour plus de personnalisation ;
- inspirez-vous de cet exemple complet : <https://cran.r-project.org/web/packages/wordcloud2/vignettes/wordcloud.html>.

> **IMPORTANT:**
>
> « Peux-tu repérer les mots qui ressortent le plus chaque semaine ? Tu pourrais essayer une approche TF-IDF et me faire un graphique ou même un nuage de mots. »

### Étape 4 — Création du dashboard

Maintenant que nous avons nettoyé les données et effectué les analyses de sentiment et de mots distinctifs, il est temps de créer un tableau de bord interactif. Celui-ci permettra à Anne-Sophie de visualiser les résultats de manière claire et dynamique.

> **NOTE:**
>
> Le tableau de bord final doit être **clair, interactif et utile**. Un **modèle prêt à l’emploi (`modele_dashboard.Rmd`)** se trouve dans le dépôt GitHub du module. Personnalisez-le : branchez les rétroactions anonymisées, ajustez les filtres, et ajoutez au moins deux visualisations.

### Étape 5 — Recommandations et analyse finale

À la fin du tableau de bord, rédigez un résumé de vos **observations clés** :

- évolution du score de sentiment,
- semaines critiques,
- recommandations d’action pour améliorer l’expérience étudiante,
- **analyse des variables numériques** `difficulte`, `engagement`, `plaisir` : moyenne et tendance par semaine, comparaison avec le score de sentiment (ex. corrélations simples ou graphiques combinés).

> **IMPORTANT:**
>
> « N’oubliez pas d’explorer les scores numériques. Comment le sentiment textuel se compare‑t‑il au niveau de plaisir ou de difficulté perçue ? Présentez au moins une visualisation qui croise ces informations. »

## Bonus — Personnalisation

Voici quelques idées pour aller plus loin dans la personnalisation de votre tableau de bord :

- Ajouter le **logo de la Faculté des sciences et de génie** ou de l’Université Laval,
- Personnaliser la **palette de couleurs** pour qu’elle soit cohérente avec l’identité visuelle ULaval,
- Ajouter une **photo de fond** discrète dans l’en-tête,
- Ajouter une citation inspirante ou un message d’accueil dans la barre latérale.

Vous pouvez également intégrer une barre de progression ou un indicateur visuel du sentiment général par semaine.

## Livraison attendue

- Un dépôt GitHub contenant :
  - le `.Rmd` du tableau de bord,
  - le rendu HTML final ou les instructions nécessaires pour lancer le tableau de bord localement,
  - le fichier de données nettoyé (si modifié).
- Le livrable minimal est un tableau de bord reproductible qui fonctionne localement.
- Le déploiement public (par exemple via shinyapps.io ou Posit Cloud) est requis seulement si cette consigne est donnée en classe.

Travail réalisé

À la fin de l’aventure, vérifiez que votre travail comprend les éléments suivants. Il ne s’agit pas d’un portfolio séparé.

- une table de tokens nettoyés ou un extrait agrégé;
- une note sur les limites du lexique de sentiment;
- une capture, un rendu ou un lien local vers le tableau de bord;
- une phrase de confidentialité indiquant ce qui ne doit pas être publié.

## Conseils d’Anne-Sophie

> « Un bon tableau de bord, c’est comme un bon pitch : **clair, lisible et ciblé**. Mettez-vous à la place de votre utilisateur final. »
