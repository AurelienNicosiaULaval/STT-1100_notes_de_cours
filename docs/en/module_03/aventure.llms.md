# Adventure 3 - Violations in Montreal restaurants

STT-1100 Introduction to Data Science

# 🎬 Scenario: Become a *data journalist*

You are hired as a **data journalist** by *Le Courrier Gourmand*, a fictional local media outlet that publishes interactive surveys on food in Montreal. Your editor-in-chief wants an article enlightening the public on **food offenses committed in Montreal restaurants**. She gives you some food for thought:

- What is the proportion of establishments from the city of Montreal?

- What are the most common violations?

- What types of establishments are affected?

- What amount of fines were imposed on average? Does this amount depend on the type of offense?

At the end of the adventure, you will have to submit **a Quarto article** (HTML) answering these questions and illustrated with graphics constructed in R.

> **NOTE:**
>
> **Your municipal ally**
> This is **Alexandre**, municipal councilor responsible for food hygiene at the City of Montreal. It follows your investigation step by step and will ask you, at key moments, questions to guide your analyses. It is a valuable ally for writing your article, but it also has its requirements. He expects you to provide him with clear and precise answers, accompanied by relevant graphics.

## Adventure objectives

- Import and clean a real categorical dataset (food offenses).
- Build frequency tables, descriptive statistics and visualizations
- Write a short journalistic post reproducible in Quarto.

💡 **Note for report**
Throughout the analysis, you must keep these questions in mind and answer them in an argumentative manner in your `qmd` report.

In this module, you will explore a **dataset** that describes various violations, their fines, and the type of establishments involved. Your mission: **analyze data to meet the objective of identifying offenses in restaurants in Montreal**.

------------------------------------------------------------------------

# 🎯 How to succeed in the adventure

1.  **Load data**: You can either:
    - Load the `UlavalSSD` package and call `data(listecondamnation)`.
2.  **Follow the sections**: Each section contains explanations, a demonstration, experiments to carry out, then exercises.
3.  **Document your findings**: As in the previous adventures, comment on your code, explain your choices and validate your analyses. Your findings will help you write your newspaper article.

------------------------------------------------------------------------

# 🚀 Working on Github

Before you start analyzing the data, you need to grab the GitHub repository containing the necessary files.

1️⃣ Clone the “Adventure-3-IDENTIFIANT_GITHUB” repository, to do this create a new Rstudio project and copy paste the HTTPS link of your Github repo (see help sheet).

💡 Tip: If you want to come back to this project later, you can open the project directly by double-clicking the `.Rproj` file in your file explorer.

2️⃣ Adjust the Quarto file: The journal article template is present in the repository. Go write your name.

3️⃣ First commit and push to GitHub: Once your `.qmd` file is adjusted and saved, commit and push your changes to GitHub:

Warning: remember that commit messages must be meaningful. For example “Added my name to the article”

🎯 Congratulations! You are now ready to start analyzing! 🚀

# 🏷️ Categorical variables: the basics in R with `stringr`

## ✨ Explanations

In R, a categorical variable is often represented by:

- A **factor** (`factor`) which contains a set of defined levels.

- Or a simple **character** for character strings.

**In the Tidyverse**, we often manipulate character strings via the **stringr** package; for conversion to factor, we can use `as.factor()` or the **forcats** package.

For module 3, we will focus on categorical variables of type **character**. In Module 4, we will look at the factors in more detail.

Here are examples demonstrating how to use `stringr` (part of the `Tidyverse`) to manipulate character variables in a dataset like `listecondamnation`. The examples below target common cases: pattern detection, extraction, replacement, and string cleaning.

## 🚀 Demonstration

We will use the `listecondemnation` dataset from the `UlavalSSD` library which contains the convictions of food establishments in Quebec.

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

> **Note**: Running `glimpse()` on your data will allow you to identify which columns are in `chr` (character) and which are in `factor` or even in `numeric`.

> **Note 2**: Three columns are in date format, for the moment, we will not take this into account, we will come back to the date format in a module later.

> **TIP:**
>
> What is the type of the `Fine` variable? Does this seem problematic to you?

> This information will be relevant for cleaning the `Fine` variable in the following section, so you can document it in the Methodology section of the article.

> **IMPORTANT:**
>
> *“How many offense reports appear in the raw file? »*

> **CAUTION:**
>
> **Possible answer**: Use `nrow(listecondemnation)` after import; for example we obtain **1,712** lines.
>
> Alexandre reminds you that `?listecondemnation` gives you the documentation of the dataset.

### Pattern detection (`str_detect()`)

To check if the address mentions `"MONTREAL"` (or a postal code, etc.), you can do:

``` r
# Create a Boolean column 'est_montreal'
listecondamnation <- listecondamnation %>%
  mutate(est_montreal = str_detect(Adresse_lieu_infraction, "MONTREAL"))

# Overview
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

You get `TRUE/FALSE` depending on the presence of the word **MONTREAL** in the string.

> **TIP:**
>
> What is the proportion of the number of addresses containing the word **MONTREAL**?

> **IMPORTANT:**
>
> **Message from Alexandre**: *“This is a very interesting fact to put in your article!”*

### Replacement (`str_replace()` and `str_replace_all()`)

To clean up the `Fine` column, you can remove the `$` symbol or replace commas with periods, etc.

``` r
# str_replace() replaces the 1st occurrence; str_replace_all() all occurrences
listecondamnation <- listecondamnation %>% mutate(
  # Example: remove the $ if present
  Amende_clean = str_replace_all(Amende, "\\$", ""),
  # replace any commas with a period
  Amende_clean = str_replace_all(Amende_clean, ",", ".") )

# Let's check
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

Here, the patterns are **regular expressions**.

- `\\$` literally matches the sign `$`.

- `,` is replaced by `.` (useful if your text includes `\"1,000\"`).

> **TIP:**
>
> What is the type of the `Amende_clean` variable? Is this a problem?

> **IMPORTANT:**
>
> *“Not so easy to have the Fine column in digital!”*

### Pattern extraction (`str_extract()`)

To extract a specific element. For example, if `Address_lieu_offense` contains a postal code of the form `H2X 3E4`, we can try:

``` r
listecondamnation <- listecondamnation %>%
  mutate(
    code_postal = str_extract(Adresse_lieu_infraction, "[A-Z][0-9][A-Z]\\s*[0-9][A-Z][0-9]") )

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

The pattern `[A-Z][0-9][A-Z]\\s*[0-9][A-Z][0-9]` is a simplified form of a Canadian postal code.

> **TIP:**
>
> All postal codes that start with H2X correspond to addresses in the Ville-Marie district of Montreal.
>
> How many establishments in the Ville-Marie district have received a commission?

> **IMPORTANT:**
>
> *“We have always mentioned that less than 1% of establishments in violation in Montreal come from Ville-Marie! Is this really true?”*
>
> A nice addition to your article!

### Formatting (`str_to_lower()`, `str_to_upper()`, etc.)

Sometimes it is useful to harmonize the case (`MONTREAL`, `Montréal`, etc.):

``` r
listecondamnation <- listecondamnation %>%
  mutate(Adresse_lower = str_to_lower(Adresse_lieu_infraction),
              # or str_to_upper, str_to_title ...
              # trim to remove excess spaces
              Adresse_trim = str_trim(Adresse_lieu_infraction) )
```

### Removing multiple spaces (`str_squish()`)

If the data contains unnecessary spaces:

``` r
listecondamnation <- listecondamnation %>%
  mutate(
    Adresse_squish = str_squish(Adresse_lieu_infraction)
    )
```

`str_squish()` reduces all repeated spaces to one and removes those at the start/end of the string.

> **TIP:**
>
> 1.  **Filter Montreal**: Create a new data frame `condamnation_mtl` containing **only** restaurants from Montreal. We will use the postal code here, in fact, all postal codes in Montreal start with the letter H.
>
> > **Hint**: You can use `str_sub()` to extract the first letter (or character) of a character string.
>
> 2.  **Keyword research**:
>
> - Detect the keyword (“TEMPERATURE”) in `SOC_NOM_ARTCL_INFRC`. Create a Boolean variable `est_temp`. This will allow us to see which infractions are related to temperature.
>
> - What is the proportion of violations related to temperature in the subset of Montreal?
>
> 3.  We finish cleaning the fine column.
>
> - **Complete cleaning of the `Fine` variable**: Create a variable `Amende_num` which is of type `numeric` with the amount of the fine paid by the restaurant. You will have to use the `as.numeric` function.
>
> - What is the type of the `Amende_num` variable? Is this a problem?
>
> - What is the average fine amount for temperature-related violations?

> **IMPORTANT:**
>
> *“The `SOC_NOM_ARTCL_INFRC` column gives the classification of the offense. How many different types of violations do we have related to temperature”*
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
> **Possible answer**: Use `unique()` to count the number of offense types. For example, `length(unique(listecondamnation$SOC_NOM_ARTCL_INFRC))` will give you the total number of offense types.
>
> Now we can do the same thing but for offenses related to temperature with `listecondemnation %>% filter(est_temp == TRUE) %>% unique()`
>
> And there are 5 of them:
>
>     # A tibble: 5 × 1
>       SOC_NOM_ARTCL_INFRC
>       <chr>
>     1 TEMPERATURE DE CONSERVATION
>     2 TEMPERATURE ALIMENTS ALTERABLES
>     3 TEMPERATURE CONSERVATION REFRIGERE / VENTE AU DETAIL
>     4 TEMPERATURE ALIMENTS PERISSABLES
>     5 TEMPERATURE EAU CHAUDE 60?C

Remember to generate your report, commit your changes and push to GitHub to keep track of your work! 🚀

> **IMPORTANT:**
>
> We worked on temperature-related infractions, but there are other types of infractions. Can you find one that worries you? For example, insects, rodents or unsanitary conditions!
>
> I think it could make a nice addition of key results to put in your article 😉

------------------------------------------------------------------------

# 🏗 Descriptive statistics for categorical variables

In this section, we will discover how to summarize the information contained in qualitative variables, also called categorical. We will see how to count the occurrences of each category (frequency tables), calculate proportions (or percentages) in order to better visualize the distribution, and associate several variables to better understand their interactions (contingency tables). The objective is to have a clear portrait of the distribution of categories to draw quick conclusions on trends or anomalies present in the data.

## ✨ Explanations

**Frequency tables** and **trend measures** (number of observations, percentages) are a good starting point for summarizing categorical variables.

## 🚀 Demonstration

``` r
# Number of offenses by type of establishment

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

> **Tip**: `count()` + `arrange(desc(n))` allows you to sort the categories in order of occurrence.

> **TIP:**
>
> 1.  **Proportions**: Calculate the proportion of each type of establishment (e.g. `count(Type_establishment) %>% mutate(prop = n / sum(n))`).
>
> 2.  **Average fine**: After extracting the numerical value from the `Fine` column from the exercise in the previous section, group by `Type_establishment` and calculate the average of the fine (`mean(Amende_num)`).
>
> 3.  **Infringements throughout Quebec**: Compare the distribution between “Montreal” (previously filtered) and the rest. Which category of establishments seems most affected?

> **IMPORTANT:**
>
> We always thought that Montreal was not the worst place for food offenses regardless of the type of restaurant. Can you prove it with your results?

A contingency table (or cross-tabulation) is a table which simultaneously presents the distribution of two (or more) categorical variables, thus making it possible to identify links or trends between them. For example, to cross-reference the type of establishment and the nature of the offense in your dataset:

``` r
table(
  listecondamnation$Type_etablissement,
  listecondamnation$SOC_NOM_ARTCL_INFRC
)
```

> **IMPORTANT:**
>
> Are there more restaurants that have been fined for `INSECT RODENT EXCREEMENT` or Rest. fast service who were fined for `UNSALUBRITY`?

> **CAUTION:**
>
> You can easily find the information by looking for it directly in the crosstab:
>
> ``` r
> tab <-table(
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

We will end this section with an exercise that will allow you to familiarize yourself with contingency tables and descriptive statistics, but above all allow the city to check if their coding of the offense is correct.

> **TIP:**
>
> 1.  **Contingency table**: Construct a cross-table between `Type_establishment` and the nature of the offense (`SOC_NOM_ARTCL_INFRC`), in your subset of Montreal.
>
> 2.  **Descriptive summary**: Draw up a small summary table (type of establishment, total number, average fine).
>
> 3.  **Rare categories**: Determine if any of the categorical variables (`SOC_NOM_ARTCL_INFRC` and `Type_establishment`) have rare or almost unexploited categories. Should we group it together?

Remember to generate your report, commit your changes and push to GitHub to keep track of your work! 🚀

------------------------------------------------------------------------

# 📈 Categorical data visualization

## ✨ Explanations

To visually represent categorical variables, we often use:

- **Bar charts** (`geom_bar()` or `geom_col()`),

- **Pie chart** (less recommended, except for very simple use),

- **Mosaic plots** if you want to compare several crossed categories.

## 🚀 Demonstration

``` r
library(ggplot2)

# Example: Number of offenses by type of establishment
listecondamnation %>%
  ggplot(aes(x = Type_etablissement)) +
  geom_bar(fill = "steelblue") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) + # allows you to rotate the label names on the x axis
  labs(
    title = "Offences by type of establishment in Montreal",
    x = "Type of establishment",
    y = "Number of offenses"
  )
```

![](aventure_files/figure-html/unnamed-chunk-11-1.png)

> **Idea**: Apply a `coord_flip()` if the names are too long!

Let us question **the very nature of the offenses**. Knowing the dominant categories and their distribution across different types of establishments will help formulate a clear message for the general public.

> **TIP:**
>
> 1.  **Top 5**: Focus on the 5 most frequent categories of `SOC_NOM_ARTCL_INFRC` (via sorting or `fct_lump()`).
> 2.  **Bar chart**: make a bar chart according to `SOC_NOM_ARTCL_INFRC` and the establishment type `Type_establishment`.
> 3.  **Good visualization practices**: Add a title, colors, modify the theme or the orientation of the axis for a clearer rendering.

> **IMPORTANT:**
>
> *“This graphic should speak to the reader in the blink of an eye. Make sure to indicate that 5 categories already cover X% of offenses; This is a strong message for the introduction to your article. »*

The **amount of fines** is a concrete indicator that often attracts the attention of the public and the media. Comparing these amounts between Montreal and the rest of Quebec, and between types of establishments, will support your conclusion.

> **TIP:**
>
> 1.  **Boxplots**: Represent (with boxplots) the distribution of the amount of the fine within each `Type_establishment`.
> 2.  **Comparison**: Compare Montreal versus outside Montreal (two boxplots side by side, by type of establishment). What do you notice?
> 3.  **Handling missing data**: What do you do if `Amende` is missing in a subset? Explore some trails.

> **IMPORTANT:**
>
> *“Remember to cite one or two significant figures in your text: for example, the median fines in Montreal versus outside Montreal. It will make your conclusions more impactful. »*

------------------------------------------------------------------------

# 🚀 5. Go further: map fines (optional)

To close the investigation, **Alexandre** got his hands on a piece of R code written by a colleague from the City; This script automatically geocodes zip codes and provides a latitude/longitude for each establishment. You will use it to draw up **a map of the distribution of fines**.

``` r
# ────────────────────────────── ──────────────────────────────
# Utility function: from postal code (e.g. "H2X 3X2") to lon/lat
# Uses tidygeocoder + Nominatim geocoding API (OpenStreetMap)
geocode_pc <- function(df, pc_col = "code_postal") {
  df %>%
     #1) Clean up postal codes: remove spaces, capital letters
    mutate(
      postal_tmp = str_remove_all(.data[[pc_col]], "\\s"),
      postal_tmp = str_to_upper(postal_tmp),
      #2) Re-insert the space if the string is precisely 6 characters long
      postal_std = if_else(
        nchar(postal_tmp) == 6,
        str_replace(postal_tmp, "^(.{3})(.{3})$", "\\1 \\2"),
        postal_tmp
      )
    ) %>%
    tidygeocoder::geocode(address = postal_std, method = "osm",
                          lat = latitude, long = longitude,
                          timeout = 5) %>%
    select(-postal_tmp, -postal_std) # we clean the temporary columns
}

# ────────────────────────────── ──────────────────────────────
```

> **Note**: You must install the `tidygeocoder` package to use this function. You can do this with `install.packages("tidygeocoder")`.

> **TIP:**
>
> 1.  **Geocoding**: Apply `geocode_pc()` to your dataset, making sure to keep `Fine`.
> 2.  **Aggregation**: calculate the **total amount of fines per geocoded point** (e.g. per restaurant or by coordinates rounded to the 4th decimal).
> 3.  **Static map**: use `ggplot2 + geom_point()` on a simple background (`coord_sf()`); the size or color of the point may reflect the cumulative amount.

> **IMPORTANT:**
>
> **Advice from Alexandre**: *“A visual is worth a thousand words. Choose a **zoom in on the city center** where the density of fines is highest, and cite a key figure (e.g. \$180,000 in fines within a 2km radius). Your article will gain in impact. »*

------------------------------------------------------------------------

# 🔚 Conclusion of the adventure

This third adventure allowed you to **move from the role of analyst to that of data journalist**: you cleaned a real set of food inspections, quantified major infractions, compared establishment profiles and visualized the geography of fines.

You now have:

- a **set of numerical results** (top 5 offenses, average amounts, proportion of Montreal vs. outside of Montreal, etc.);
- **impactful graphs** (bar charts, boxplots, map) to support your arguments;
- **qualitative observations** provided by Alexandre, which direct the story towards the issues of hygiene and citizen transparency.

## ✍️ Next step: write your article

1.  **Structure your Quarto article**: catchy hat ➜ context ➜ methodology ➜ key results ➜ recommendations.
2.  **Integrate at least two visuals** among those produced (a category graph and the fines map).
3.  **Cite two narrative figures** (e.g. “5 categories cover 62% of offenses”, “180,000\$ fines within a 2km radius”) to captivate the reader.
4.  **Add a summary quote from Alexander** to humanize your conclusion.

> **Expected deliverable**: a standalone HTML file exported from your `.qmd`, committed to your GitHub repository before the deadline.

Happy writing! Let the data speak and put yourself in the shoes of the journalist who informs, nuances and proposes. 🚀

> 🎯 **Congratulations**! You have practiced the concepts of categorical variables, descriptive statistics, and visualization for real categorical data. Continue like this, the next module awaits you.
