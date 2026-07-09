# Adventure 3 - Food offences in Montreal restaurants

STT-1100 Introduction to Data Science

## Scenario: Become a *data journalist*

You are hired as a **data journalist** by *Le Courrier Gourmand*, a fictional local media outlet that publishes interactive investigations on food in Montreal. Your editor-in-chief wants an article that helps the public understand **food offences committed in Montreal restaurants**. She gives you some questions to explore:

- What is the proportion of establishments from the city of Montreal?

- What are the most common offences?

- What types of establishments are affected?

- What amount of fines were imposed on average? Does this amount depend on the type of offence?

At the end of the adventure, you will have to submit **a Quarto article** (HTML) answering these questions and illustrated with graphics constructed in R.

> **NOTE:**
>
> **Your municipal ally**
> This is **Alexandre**, municipal councillor responsible for food hygiene at the City of Montreal. He follows your investigation step by step and will ask you, at key moments, questions to guide your analyses. He is a valuable ally for writing your article, but he also has requirements. He expects clear and precise answers, accompanied by relevant graphics.

Character card

Your role Data journalist

Main contacts Le Courrier Gourmand newsroom and Alexandre, municipal councillor

Organization and context Fictional local media outlet and the City of Montreal

Mission Produce a clear article about food offences in Montreal

Data `UlavalSSD::listecondamnation`

Deliverable Illustrated Quarto HTML article

### Adventure objectives

- Import and clean a real categorical dataset about food offences.
- Build frequency tables, descriptive statistics and visualizations.
- Write a short journalistic post reproducible in Quarto.

**Note for report**
Throughout the analysis, you must keep these questions in mind and answer them in an argumentative manner in your `qmd` report.

In this module, you will explore a **dataset** that describes various offences, their fines, and the type of establishments involved. Your mission: **analyze data to identify food offences in Montreal restaurants**.

------------------------------------------------------------------------

## How to succeed in the adventure

1.  **Load data**: You can either:
    - Load the `UlavalSSD` package and call `data(listecondamnation)`.
2.  **Follow the sections**: Each section contains explanations, a demonstration, experiments to carry out, then exercises.
3.  **Document your findings**: As in the previous adventures, comment on your code, explain your choices and validate your analyses. Your findings will help you write your newspaper article.

------------------------------------------------------------------------

## Working on GitHub

Before you start analyzing the data, you need to grab the GitHub repository containing the necessary files.

1.  Clone the `"Adventure-3-IDENTIFIANT_GITHUB"` repository. Create a new RStudio project from version control and use the SSH link of your GitHub repository, as shown in the help sheet.

Tip: If you want to come back to this project later, you can open the project directly by double-clicking the `.Rproj` file in your file explorer.

2.  Adjust the Quarto file: The journal article template is present in the repository. Go write your name.

3.  First commit and push to GitHub: Once your `.qmd` file is adjusted and saved, commit and push your changes to GitHub:

Warning: remember that commit messages must be meaningful. For example “Added my name to the article”

Congratulations! You are now ready to start analyzing!

## Categorical variables: the basics in R with `stringr`

### Explanations

In R, a categorical variable is often represented by:

- A **factor** (`factor`) which contains a set of defined levels.

- Or a simple **character** for character strings.

**In the Tidyverse**, we often manipulate character strings via the **stringr** package; for conversion to factor, we can use `as.factor()` or the **forcats** package.

For module 3, we will focus on categorical variables of type **character**. In Module 4, we will look at the factors in more detail.

Here are examples demonstrating how to use `stringr` (part of the `Tidyverse`) to manipulate character variables in a dataset like `listecondamnation`. The examples below target common cases: pattern detection, extraction, replacement, and string cleaning.

### Demonstration

We will use the `listecondamnation` dataset from the `UlavalSSD` library which contains the convictions of food establishments in Quebec.

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
> What is the type of the `Amende` variable? Does this seem problematic to you?

> This information will be relevant for cleaning the `Amende` variable in the following section, so you can document it in the Methodology section of the article.

> **IMPORTANT:**
>
> *“How many offence reports appear in the raw file?”*

> **CAUTION:**
>
> **Possible answer**: Use `nrow(listecondamnation)` after import; for example, we obtain **1,712** rows.
>
> Alexandre reminds you that `?listecondamnation` gives the dataset documentation.

#### Pattern detection (`str_detect()`)

To check whether the address mentions `"MONTREAL"`, you can do:

``` r
# Create a Boolean column from the address text
convictions_demo <- listecondamnation %>%
  mutate(address_mentions_montreal = str_detect(Adresse_lieu_infraction, "MONTREAL"))

# Overview
convictions_demo %>%
  select(Adresse_lieu_infraction, address_mentions_montreal) %>%
  head(10)
```

    # A tibble: 10 × 2
       Adresse_lieu_infraction                                address_mentions_mon…¹
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
    # ℹ abbreviated name: ¹​address_mentions_montreal

You get `TRUE/FALSE` depending on the presence of the word **MONTREAL** in the string. This is useful to illustrate `str_detect()`, but it will not be our main criterion for filtering Montreal later in the adventure. We will use postal codes instead.

> **TIP:**
>
> What is the proportion of addresses containing the word **MONTREAL**?

> **IMPORTANT:**
>
> **Message from Alexandre**: *“This is a very interesting fact to put in your article!”*

#### Replacement and numeric conversion

The `Amende` column is a character string. It contains amounts such as `"5 000 $"`, with spaces and the `$` symbol. To use it in calculations, we need to create a numeric variable.

``` r
# parse_number() extracts the numeric value and ignores the $ symbol
convictions_demo <- convictions_demo %>%
  mutate(
    amende_num = parse_number(
      Amende,
      locale = locale(grouping_mark = " ", decimal_mark = ",")
    )
  )

# Check the result
convictions_demo %>%
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

Here, `parse_number()` comes from `readr`, which is included in the tidyverse. The `grouping_mark = " "` argument tells R that spaces are used to group thousands.

> **TIP:**
>
> What is the type of the `amende_num` variable? Is this still a problem?

> **IMPORTANT:**
>
> *“Not so easy to turn the Amende column into a numeric variable!”*

#### Pattern extraction (`str_extract()`)

To extract a specific element, for example if `Adresse_lieu_infraction` contains a postal code of the form `H2X 3E4`, we can try:

``` r
convictions_demo <- convictions_demo %>%
  mutate(
    code_postal = str_extract(Adresse_lieu_infraction, "[A-Z][0-9][A-Z]\\s*[0-9][A-Z][0-9]"),
    code_postal = str_to_upper(code_postal),
    code_postal = str_replace(code_postal, "^([A-Z][0-9][A-Z])\\s*([0-9][A-Z][0-9])$", "\\1 \\2")
  )

convictions_demo %>%
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

The pattern `[A-Z][0-9][A-Z]\\s*[0-9][A-Z][0-9]` is a simplified form of a Canadian postal code.

> **TIP:**
>
> In this dataset, isolate offence reports whose postal code starts with `H2X`. Do not conclude that this represents an entire neighbourhood without an external geographic source.
>
> How many offence reports have a postal code starting with `H2X`?

> **IMPORTANT:**
>
> *“We often talk about reports associated with `H2X`. Do they represent a large share of Montreal reports?”*
>
> A nice addition to your article!

#### Formatting (`str_to_lower()`, `str_to_upper()`, etc.)

Sometimes it is useful to harmonize case (`MONTREAL`, `Montréal`, etc.):

``` r
convictions_demo <- convictions_demo %>%
  mutate(
    Adresse_lower = str_to_lower(Adresse_lieu_infraction),
    Adresse_trim = str_trim(Adresse_lieu_infraction)
  )
```

#### Removing multiple spaces (`str_squish()`)

If the data contains unnecessary spaces:

``` r
convictions_demo <- convictions_demo %>%
  mutate(
    Adresse_squish = str_squish(Adresse_lieu_infraction)
  )
```

`str_squish()` reduces all repeated spaces to one and removes those at the start and end of the string.

We now create a cleaned version of the dataset that will be used in the rest of the adventure.

``` r
convictions <- listecondamnation %>%
  mutate(
    address = str_squish(Adresse_lieu_infraction),
    code_postal = str_extract(address, "[A-Z][0-9][A-Z]\\s*[0-9][A-Z][0-9]"),
    code_postal = str_to_upper(code_postal),
    code_postal = str_replace(code_postal, "^([A-Z][0-9][A-Z])\\s*([0-9][A-Z][0-9])$", "\\1 \\2"),
    is_montreal = str_sub(code_postal, 1, 1) == "H",
    is_temp = coalesce(str_detect(SOC_NOM_ARTCL_INFRC, "TEMPERATURE"), FALSE),
    amende_num = parse_number(
      Amende,
      locale = locale(grouping_mark = " ", decimal_mark = ",")
    ),
    establishment_type = str_replace(
      Type_etablissement,
      "^REST\\. SERVICE RAPIDE$",
      "RESTAURANT SERVICE RAPIDE"
    )
  )

convictions_mtl <- convictions %>%
  filter(is_montreal)
```

> **TIP:**
>
> 1.  **Filter Montreal**: Check that `convictions_mtl` contains only reports whose postal code starts with `H`.
>
> > **Hint**: You can use `str_sub()` to extract the first letter of a character string.
>
> 2.  **Keyword search**:
>
> - Detect the keyword `"TEMPERATURE"` in `SOC_NOM_ARTCL_INFRC`. Create a Boolean variable `is_temp`.
>
> - What is the proportion of temperature-related offences in the Montreal subset?
>
> 3.  **Clean the `Amende` column**:
>
> - Check that `amende_num` is numeric.
>
> - Check how many missing values `amende_num` contains.
>
> - What is the average fine amount for temperature-related offences in the Montreal subset?

> **IMPORTANT:**
>
> *“The `SOC_NOM_ARTCL_INFRC` column gives the offence classification. How many different temperature-related offence types do we have in the Montreal subset?”*
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
> **Possible answer**: Use `distinct()` or `n_distinct()` after filtering the Montreal subset and the temperature-related offences.
>
>     # A tibble: 4 × 1
>       SOC_NOM_ARTCL_INFRC
>       <chr>
>     1 TEMPERATURE DE CONSERVATION
>     2 TEMPERATURE CONSERVATION REFRIGERE / VENTE AU DETAIL
>     3 TEMPERATURE ALIMENTS ALTERABLES
>     4 TEMPERATURE ALIMENTS PERISSABLES
>
> There are four temperature-related offence types in the Montreal subset.

Remember to generate your report, commit your changes and push to GitHub to keep track of your work.

> **IMPORTANT:**
>
> We worked on temperature-related offences, but there are other types of offences. Can you find one that worries you, for example insects, rodents or unsanitary conditions?
>
> That could become a strong key result for your article.

------------------------------------------------------------------------

## Descriptive statistics for categorical variables

In this section, we will discover how to summarize the information contained in qualitative variables, also called categorical. We will see how to count the occurrences of each category (frequency tables), calculate proportions (or percentages) in order to better visualize the distribution, and associate several variables to better understand their interactions (contingency tables). The objective is to have a clear portrait of the distribution of categories to draw quick conclusions on trends or anomalies present in the data.

### Explanations

**Frequency tables** and **summary measures** such as counts and percentages are a good starting point for summarizing categorical variables.

### Demonstration

``` r
# Number of offences by type of establishment

convictions %>%
  count(establishment_type, sort = TRUE)
```

    # A tibble: 3 × 2
      establishment_type             n
      <chr>                      <int>
    1 RESTAURANT                  1353
    2 RESTAURANT SERVICE RAPIDE    324
    3 RESTAURANT METS A EMPORTER    35

> **Tip**: `count()` + `arrange(desc(n))` allows you to sort the categories in order of occurrence.

> **TIP:**
>
> 1.  **Proportions**: Calculate the proportion of each type of establishment with `establishment_type`.
>
> 2.  **Average fine**: Using `amende_num`, group by `establishment_type` and calculate the average fine.
>
> 3.  **Offences across Quebec**: Compare the distribution between Montreal and the rest of Quebec. Which establishment category seems most affected?

> **IMPORTANT:**
>
> We always thought that Montreal was not the worst place for food offences regardless of the type of restaurant. Can you check this with your results?

A contingency table, or cross-tabulation, presents the distribution of two or more categorical variables at the same time. For example, to cross-reference establishment type and offence category:

``` r
table(
  convictions$establishment_type,
  convictions$SOC_NOM_ARTCL_INFRC
)
```

> **IMPORTANT:**
>
> Are there more fast-service restaurants fined for `INSALUBRITE`, or restaurants fined for `INSECTES RONGEURS EXCREMENTS`?

> **CAUTION:**
>
> You can easily find the information by looking for it directly in the crosstab:
>
> ``` r
> tab <- table(
>   convictions$establishment_type,
>   convictions$SOC_NOM_ARTCL_INFRC
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

We will end this section with an exercise that lets you practise contingency tables and descriptive statistics, while checking whether the offence coding is informative.

> **TIP:**
>
> 1.  **Contingency table**: Construct a cross-table between `establishment_type` and the offence category (`SOC_NOM_ARTCL_INFRC`) in the Montreal subset.
>
> 2.  **Descriptive summary**: Draw up a small summary table (type of establishment, total number, average fine).
>
> 3.  **Rare categories**: Determine if any categorical variables (`SOC_NOM_ARTCL_INFRC` and `establishment_type`) have rare categories. Should they be grouped?

Remember to generate your report, commit your changes and push to GitHub to keep track of your work.

------------------------------------------------------------------------

## Categorical data visualization

### Explanations

To visually represent categorical variables, we often use:

- **Bar charts** (`geom_bar()` or `geom_col()`),

- **Grouped bars** to compare counts across another category,

- **Standardized stacked bars** to compare proportions across groups.

### Demonstration

``` r
library(ggplot2)

# Example: Number of offences by type of establishment
convictions %>%
  count(establishment_type, sort = TRUE) %>%
  ggplot(aes(x = fct_reorder(establishment_type, n), y = n)) +
  geom_col(fill = "steelblue") +
  coord_flip() +
  labs(
    title = "Offences by type of establishment in Montreal",
    x = "Type of establishment",
    y = "Number of offences"
  ) +
  theme_minimal()
```

![](aventure_files/figure-html/unnamed-chunk-12-1.png)

> **Idea**: Apply a `coord_flip()` if the names are too long!

Let us question the nature of the offences. Knowing the dominant categories and their distribution across different types of establishments will help formulate a clear message for the general public.

> **TIP:**
>
> 1.  **Top 5**: Focus on the 5 most frequent categories of `SOC_NOM_ARTCL_INFRC` (via sorting or `fct_lump()`).
> 2.  **Bar chart**: Make a bar chart using `SOC_NOM_ARTCL_INFRC` and `establishment_type`.
> 3.  **Good visualization practices**: Add a title, colors, modify the theme or the orientation of the axis for a clearer rendering.

> **IMPORTANT:**
>
> *“This graphic should speak to the reader quickly. Make sure to indicate whether five categories already cover a large share of offences; this is a strong message for the introduction to your article.”*

The **amount of fines** is a concrete indicator that often attracts the attention of the public and the media. Comparing these amounts between Montreal and the rest of Quebec, and between types of establishments, will support your conclusion.

> **TIP:**
>
> 1.  **Boxplots**: Represent the distribution of fine amounts within each `establishment_type`.
> 2.  **Comparison**: Compare Montreal versus outside Montreal (two boxplots side by side, by type of establishment). What do you notice?
> 3.  **Handling missing data**: What do you do if `Amende` is missing in a subset? Explore some trails.

> **IMPORTANT:**
>
> *“Remember to cite one or two significant figures in your text, for example the median fines in Montreal versus outside Montreal. It will make your conclusions more impactful.”*

------------------------------------------------------------------------

## 5. Go further: map fines (optional)

To close the investigation, **Alexandre** found a piece of R code written by a colleague from the City. This optional script geocodes postal codes and provides latitude and longitude for each establishment. You may use it to draw a **map of the distribution of fines**.

``` r
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
```

> **Note**: You must install the `tidygeocoder` package to use this function. You can do this with `install.packages("tidygeocoder")`.

> **TIP:**
>
> 1.  **Geocoding**: Apply `geocode_pc()` to your dataset, making sure to keep `amende_num`.
> 2.  **Aggregation**: calculate the **total amount of fines per geocoded point** (e.g. per restaurant or by coordinates rounded to the 4th decimal).
> 3.  **Static map**: use `ggplot2 + geom_point()` on a simple background (`coord_sf()`); the size or color of the point may reflect the cumulative amount.

> **IMPORTANT:**
>
> **Advice from Alexandre**: *“A visual is worth a thousand words. If you make the optional map, choose a clear zoom and explain that geocoding depends on an external web service.”*

------------------------------------------------------------------------

Portfolio trace

Keep the elements that show how a table became an article.

- your cleaning choices for categories and amounts;
- two figures ready for the article;
- two key numbers explained in complete sentences;
- one important nuance to communicate to the public.

## Conclusion of the adventure

This third adventure allowed you to **move from the role of analyst to that of data journalist**: you cleaned a real set of food inspection records, quantified major offences, compared establishment profiles and prepared graphics for an article.

You now have:

- a **set of numerical results** (top 5 offences, average amounts, proportion of Montreal vs. outside of Montreal, etc.);
- **impactful graphs** (bar charts, boxplots and, optionally, a map) to support your arguments;
- **qualitative observations** provided by Alexandre, which direct the story towards the issues of hygiene and citizen transparency.

### Next step: write your article

1.  **Structure your Quarto article**: catchy hat -\> context -\> methodology -\> key results -\> recommendations.
2.  **Integrate at least two visuals** among those produced, including one categorical chart. The fines map is optional.
3.  **Cite two narrative figures** such as “5 categories cover 62% of offences” to captivate the reader.
4.  **Add a summary quote from Alexandre** to humanize your conclusion.

> **Expected deliverable**: a standalone HTML file exported from your `.qmd`, committed to your GitHub repository before the deadline.

Happy writing! Let the data speak and put yourself in the shoes of the journalist who informs, nuances and proposes.

> **Congratulations**! You have practiced the concepts of categorical variables, descriptive statistics, and visualization for real categorical data. Continue like this, the next module awaits you.
