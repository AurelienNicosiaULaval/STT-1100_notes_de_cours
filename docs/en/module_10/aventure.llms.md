# Adventure 10 — Beyond data: text and dashboard

STT-1100 • Introduction to Data Science

## Context

This week, you were **hired as a junior business analyst** by the **Faculty of Science and Engineering at Laval University**. As part of the reform of the bachelor’s program in statistics and data science, management wishes to evaluate **how student feedback evolves throughout the session**.

Each week, students answered a questionnaire about their learning experience in the STT-1100 course. Your analysis will help document strengths and areas for improvement in the new program.

You are guided by **Anne-Sophie**, the program director, who supports you in structuring your dashboard and helps you interpret the results.

> “The idea is to have an honest, but constructive portrait. We want to see the underlying trends and draw inspiration from them to continue to improve our program.”

Character card

Your role Junior business analyst

Main contact Anne-Sophie

Organization and context Faculty of Science and Engineering, Université Laval

Mission Turn anonymized feedback into a useful dashboard

Data `data/sentiments_cours.csv` or non-real example file

Deliverable Reproducible local dashboard, or shared according to course instructions

## Mission

Build an interactive dashboard with `flexdashboard` and `shiny` that allows you to:

- visualize sentiment expressed by week,
- identify the most frequent and distinctive words,
- explore lexical trends over time,
- offer dynamic filters to refine the analysis.

> **NOTE:**
>
> - You treat free text as analyzable data.
> - You apply a sentiment lexicon while stating its limits.
> - You combine text analysis, numerical variables and an interactive dashboard.
> - You protect feedback confidentiality before any publication or sharing.

## Data

The main working file is `data/sentiments_cours.csv`. It is built progressively during the session from anonymized student feedback.

At the beginning of the adventure, this file may not yet be complete. The module repository therefore also provides a small non-real example file so you can test the dashboard before the final feedback data are available.

The expected final file contains:

- `id`: anonymous identifier
- `semaine`: week or module number
- `commentaire`: free text about the course experience
- `difficulte`: perceived level of difficulty (1 to 5)
- `engagement`: engagement level (1 to 5)
- `plaisir`: enjoyment level (1 to 5)

The column names are kept in French to match the R template. If a variable is not collected exactly in this form, clearly document the recoding used in your dashboard.

## Recommended tools

- `tidytext`, `stringr`, `dplyr`: text cleaning and analysis
- `ggplot2`, `wordcloud`, `plotly`: visualization
- `flexdashboard`, `shiny`: interactive interface
- a custom French lexicon for sentiment analysis

## Guided steps

### Step 1 — Text Cleanup

> **IMPORTANT:**
>
> “Could you show me an example with some comments and how you would clean them step by step?”

> **TIP:**
>
> Text cleaning is essential before any analysis. You want every word to have a relevant meaning. Try to remove punctuation, common words, and make sure everything is in lowercase.

> **NOTE:**
>
> - **Tokenization**: process which consists of cutting the text into basic units (words, n‑grams). Each token becomes a row in your table.
> - **Stopwords**: very frequent words (“the”, “of”, “and”, etc.) which generally do not provide useful semantic information for analysis.
> - **Cleaning**: lowercase, removal of punctuation, numbers and special characters to standardize tokens.

#### Example of a simulated dataset

This example is only used to understand the steps. The final dashboard must be connected to `data/sentiments_cours.csv` when anonymized feedback is available.

``` downlit
# Fictitious dataset in French with comments
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

#### Text preprocessing

``` downlit
library(tidytext)
library(dplyr)
library(stringr)
library(tibble)
library(ggplot2)
library(stopwords)

# Load French stopwords
stop_fr <- stopwords::stopwords("fr", source = "snowball")

texte_nettoye <- exemple %>%
  unnest_tokens(word, commentaire) %>%
  filter(!word %in% stop_fr, # Remove frequent words
         str_detect(word, "^[a-zéèêàâîôûùçäëïöü]+$")) # Keep words valid in French

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
> Then apply the same type of cleaning to `data/sentiments_cours.csv` or to the example file provided in the repository.

Anne-Sophie asks you to apply a classic cleaning workflow:

- remove punctuation, numbers and frequent words (stopwords),

- transform the text into lowercase,

- **tokenize** the text (cut into words).

### Step 2 — Sentiment Analysis

We are interested here in the **emotional valence** of the words in the comments. Sentiment analysis allows you to quantify whether a text is rather positive or negative.

> **NOTE:**
>
> - **Sentiment of a word**: label (positive, negative) or numerical score indicating the emotional valence of the word.
> - **Sentiment score of a text**: sum or difference of the scores/labels of the words it contains, often aggregated by document or, here, by week.

#### Sentiment analysis in French

Currently, there **does not exist a lexicon integrated into [`tidytext::get_sentiments()`](https://juliasilge.github.io/tidytext/reference/get_sentiments.html) for French** (unlike English, where the lexicons `bing`, `afinn`, and `nrc` are directly accessible). Here is an educational approach: create a small personalized glossary to enrich in class.

> **IMPORTANT:**
>
> “For this step, I recommend that you build a small custom lexicon. You can start with words that come up often and classify them subjectively. The goal here is to understand the principle of sentiment analysis, even with simple tools.”

``` downlit
# Basic custom lexicon to adapt
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

#### Viewing scores per week

Let’s make a graph to visualize the evolution of the sentiment score per week:

``` downlit
ggplot(sentiment_fr, aes(x = semaine, y = score)) +
  geom_col(fill = "steelblue") +
  labs(title = "Sentiment score by week",
       y = "Net score (positive - negative)", x = "Week")
```

![](aventure_files/figure-html/unnamed-chunk-4-1.png)

> **NOTE:**
>
> “As the lexicons integrated into [`get_sentiments()`](https://juliasilge.github.io/tidytext/reference/get_sentiments.html) are only available in English, I suggest you build a small custom lexicon for French. It will be imperfect, but it will help you understand the principle. We can then discuss it together to enrich it. What interests me is that you are able to interpret the evolution of sentiment from one week to the next, even with simple tools.”

#### Final collaboration

At the end of the course, an in-class activity will allow each student/team to **share their own French sentiment lexicon** built during the analysis.

**The teacher will collect and merge these lexicons**, checking them to obtain a common enriched version. This new version will be shared with the whole class as a collective resource for future projects.

### Step 3 — Distinctive words

In this step, we will identify the words that stand out the most each week. To do this, we will use the **TF-IDF** (Term Frequency-Inverse Document Frequency) approach, which allows us to highlight words that are both frequent in a document and rare in all documents.

> **TIP:**
>
> “A good indicator of how students feel is the words that stand out the most in their comments. You can try a TF-IDF analysis or even create a word cloud.”

> **NOTE:**
>
> - **TF (Term Frequency)**: frequency of appearance of a word in a document.
> - **IDF (Inverse Document Frequency)**: inverse importance of a word in all documents – rare words have a high IDF.
> - **TF‑IDF**: TF × IDF product which highlights words that are both frequent in a document and rare in others (“distinctive” words).

#### TF-IDF calculation

Let’s calculate the TF-IDF for each word per week:

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

#### Visualization for a given week

Let’s make a chart to visualize the most distinctive words for a specific week. For example, week 2:

``` downlit
# Choose week 2 as an example
library(forcats)

tfidf %>%
  filter(semaine == 2) %>%
  slice_max(tf_idf, n = 8) %>%
  mutate(word = fct_reorder(word, tf_idf)) %>%
  ggplot(aes(x = word, y = tf_idf)) +
  geom_col(fill = "darkorange") +
  coord_flip() +
  labs(title = "Most Distinctive Words — Week 2",
       x = NULL, y = "TF-IDF")
```

![](aventure_files/figure-html/unnamed-chunk-6-1.png)

A visualization like this allows you to see which words are most representative of that week’s comments. There is also the possibility of creating a **word cloud** for a more visual representation. A word cloud is a graphical representation of the most frequent words, where the size of each word is proportional to its frequency of occurrence.

To create a word cloud in French:

- use the `wordcloud()` function from the `wordcloud` package, or `ggwordcloud` for more customization;
- use this complete example as inspiration: <https://cran.r-project.org/web/packages/wordcloud2/vignettes/wordcloud.html>.

> **IMPORTANT:**
>
> “Can you spot the words that stand out the most each week? You could try a TF-IDF approach and make me a graph or even a word cloud.”

### Step 4 — Creating the dashboard

Now that we’ve cleaned the data and performed the sentiment and distinguishing words analyses, it’s time to create an interactive dashboard. This will allow Anne-Sophie to visualize the results in a clear and dynamic way.

> **NOTE:**
>
> The final dashboard should be **clear, interactive and useful**. A **ready-to-use template (`modele_dashboard.Rmd`)** can be found in the module’s GitHub repository. Customize it: connect the anonymized feedback data, adjust filters, and add at least two visualizations.

### Step 5 — Recommendations and final analysis

At the end of the dashboard, write a summary of your **key observations**:

- evolution of the sentiment score,
- critical weeks,
- recommendations for action to improve the student experience,
- **analysis of numerical variables** `difficulte`, `engagement`, `plaisir`: average and trend per week, comparison with the sentiment score (e.g. simple correlations or combined graphs).

> **IMPORTANT:**
>
> “Don’t forget to explore the numerical scores. How does text sentiment compare to perceived enjoyment or difficulty? Present at least one visualization that cross-references this information.”

## Bonus — Personalization

Here are some ideas to go further in customizing your dashboard:

- Add the **logo of the Faculty of Science and Engineering** or Laval University,
- Customize the **color palette** so that it is consistent with the ULaval visual identity,
- Add a discreet **background photo** in the header,
- Add an inspirational quote or greeting in the sidebar.

You can also integrate a progress bar or visual indicator of overall sentiment per week.

## Delivery expected

- A GitHub repository containing:
  - the `.Rmd` of the dashboard,
  - the final HTML rendering or the instructions needed to run the dashboard locally,
  - the cleaned data file (if modified).
- The minimal deliverable is a reproducible dashboard that works locally.
- Public deployment (for example via shinyapps.io or Posit Cloud) is required only if that instruction is given in class.

Completed work

At the end of the adventure, check that your work includes the following elements. This is not a separate portfolio.

- a cleaned token table or aggregated excerpt;
- a note about the limits of the sentiment lexicon;
- a screenshot, rendered file or local link to the dashboard;
- one confidentiality sentence stating what must not be published.

## Advice from Anne-Sophie

> “A good dashboard is like a good pitch: **clear, readable and targeted**. Put yourself in your end user’s shoes.”
