# Adventure 5 - Explore and understand relationships between data

STT-1100 Introduction to Data Science

# Scenario - Adventure 5

You put on the shoes (and secure badge!) of an **airport operations statistician** newly recruited by the **Port Authority Data Lab (PADL)**, the analytics team of the **Port Authority of New York & New Jersey**.
Your mission: to help **JFK** airport (and, ultimately, **EWR** and **LGA**) to streamline departures and reduce **time lost on the ground**.

- **Your teammate**: **Dr Sofia Martínez**, senior data scientist recognized for her impactful interactive visualizations. Sofia asks the right questions, validates your hypotheses and gives you access to internal resources.
- **The dataset**: **Alex Chen**, data engineer at PADL, has prepared a file **`flights_merged_2023.rds`** for you which brings together in a single exhaustive table the 2023 flights, the weather at departure time, plane information, the full names of the companies and the geolocation of the origin and destination airports.
- **Concrete context**: the Operations Board wants to know *when* and *why* delays explode, how the weather affects connections, and which companies should review their flight plans. Your deliverables (Quarto reports + visualizations) will guide budgetary decisions for summer 2026.

> **Brief from Sofia**
> 1. Which time slots systematically display the highest delays?
> 2. Are the available weather variables associated with delays, and how far can that association be interpreted?
> 3. Are older planes (\> 20 years old) more prone to cancellations?
>
> It’s up to you!

# Adventure objectives

- Use `lubridate` functions to manipulate and enrich temporal data.
- Carry out an exploratory data analysis (EDA) to better understand their structure and identify interesting patterns.
- Visualize relationships between variables using `ggplot2`.
- Interpret simple statistical results, such as correlation.
- Answer concrete questions related to real issues (delays, weather, aircraft fleet).

# How to succeed in this adventure?

Here are some tips from Sofia to succeed in your mission:

- Start by **exploring the data** and understanding its structure. You can use `glimpse()`, `summary()`, or even an interactive table.
- Use `lubridate` functions to create useful time columns (day, month, hour, etc.).
- For each question, **structure your analysis**:
  - explain what you are looking to test;
  - show your code;
  - interpret the result.
- Favor clear and well-annotated visualizations. Don’t forget to add titles, axes, etc.
- Comment your code if necessary. Imagine working as a team with Sofia!

And above all… **ask yourself questions**! The important thing is to develop your analytical reasoning.

# GitHub and rendering

As for previous adventures:

- **Clone** the module 5 GitHub repository from the course organization. You can use the course cheat sheet if you have a memory lapse.

- Work in RStudio and **make commits regularly** to document your progress.

- Your repository must contain:

- a well-structured **`rapport.qmd`** file containing:

  - your R code;

  - commented visualizations;

  - clear interpretations for each analysis requested;

  - `callout` boxes (type `.tip`, `.warning`, etc.) to highlight your conclusions;

  - a **`rapport.html`** file generated from `.qmd` (you can use the “Render” button in RStudio);

  - all files necessary for reproducing your work (e.g.: preparation script, `flights_merged_2023.rds` dataset, etc.).

- The repository must remain **clean and well organized**:

  - do not keep unnecessary files;
  - avoid file names like `Untitled1.Rmd` or `copy report final.qmd` ;
  - comment on your commits with clear and descriptive messages.

> **Reminder**: The `.qmd` is your main document. It should allow any member of the team (or Sofia!) to understand what you did and why.

# Understand and manipulate dates with `lubridate`

Before diving into delay and performance analyses, Sofia wants to make sure that you are familiar with managing **dates and times** in R. The `lubridate` package is an essential tool for this.

Start your document by loading the packages and the data. All examples below assume that the `flights` object exists.

``` r
library(tidyverse)
library(lubridate)

flights <- readRDS("flights_merged_2023.rds")

glimpse(flights)
```

Before interpreting anything, also check the size of the table and missing values in the variables you will use.

``` r
flights %>%
  summarise(
    n_flights = n(),
    n_columns = ncol(flights),
    dep_delay_missing = sum(is.na(dep_delay)),
    dep_time_missing = sum(is.na(dep_time)),
    plane_year_missing = sum(is.na(plane_year))
  )
```

## Essential Features

Here are the main functions you will use:

| Function | Utility |
|----|----|
| `make_date()` | Creates a variable of type `Date` from `year`, `month`, `day` |
| `make_datetime()` | Creates a complete time object (`POSIXct`) with `hour` |
| `wday()` | Give the day of the week |
| `month()` | Give the month |
| `hour()` | Extract the time |
| `ymd()` | Transform a string like `"2023-01-01"` into `Date` |
| `floor_date()` | Truncates a date to day, week, month, etc. |

``` r
# Example of creating date and datetime
flights <- flights %>%
  mutate(
    date = make_date(year, month, day),
    datetime = make_datetime(year, month, day, hour)
  )
```

## Exercise 1 - What is the structure of the date?

**Sofia asks you**: *Create a `date` variable from the `year`, `month` and `day` columns, then use `class()` to check the type of this new variable.*

> **TIP:**
>
> **Reply from Sofia**
> You can use:
>
> ``` r
> flights <- flights %>% mutate(date = make_date(year, month, day))
> class(flights$date)
> ```
>
> The expected type is `"Date"`. You can now manipulate this variable with all time functions!

## Exercise 2 - Day of the week

**Sofia asks you**: *Add a `weekday` column that gives the day of the week (Monday, Tuesday, etc.) for each flight. Show the first 7 results.*

> **TIP:**
>
> **Reply from Sofia**
> Here is one way to do it:
>
> ``` r
> flights <- flights %>%
>   mutate(weekday = wday(date, label = TRUE, abbr = FALSE))
>
> head(flights$weekday, 7)
> ```
>
> This uses `label=TRUE` to get the full name (not a number).

## Exercise 3 - Time slot

**Sofia asks you**: *Create a `moment_day` variable that classifies flights as “night”, “morning”, “afternoon” or “evening” depending on the scheduled departure time.*

> **TIP:**
>
> **Reply from Sofia**
> Here is a suggestion:
>
> ``` r
> flights <- flights %>%
>   mutate(moment_day = case_when(
>     hour < 6 ~ "night",
>     hour < 12 ~ "morning",
>     hour < 18 ~ "afternoon",
>     TRUE ~ "evening"
>   ))
> ```
>
> You can then explore the delays according to these time slots.

## Exercise 4 - Is it a weekend?

**Sofia asks you**: *Add a logical variable `weekend` which is `TRUE` if the flight takes place on a Saturday or a Sunday.*

> **TIP:**
>
> **Reply from Sofia**
> Use:
>
> ``` r
> flights <- flights %>%
>   mutate(weekend = weekday %in% c("Saturday", "Sunday"))
> ```
>
> Don’t forget that `weekday` is a factor variable with labels.

# Explore and understand relationships between data

Now that you are comfortable with dates and times, Sofia wants to introduce you to a key step in any data science project: **exploratory data analysis**, often abbreviated to **EDA** (*Exploratory Data Analysis*).

The objective is simple: **understand the structure of the data, spot patterns, anomalies, or interesting correlations between variables**.

## Tools at your disposal

You can rely on:

- **Descriptive statistics**: `summary()`, `mean()`, `median()`, `sd()`, `n_distinct()`, etc.
- **Visualization** with `ggplot2`:
  - `geom_histogram()` or `geom_density()` for distributions
  - `geom_point()` to visualize relationships between two numeric variables
  - `geom_boxplot()` to compare a numeric variable according to a categorical variable
  - `geom_bar()` for categorical variables
- **Crosstabs** with `count()`, `group_by()` + `summarise()`
- **Correlations** with `cor()` or `ggcorrplot::ggcorrplot()` for a graphical matrix

Sofia now invites you to examine **concrete questions** related to flight performance and delays. You will have to analyze the data to come up with a clear interpretation.

------------------------------------------------------------------------

## Analysis 1 - What time should you avoid leaving?

> **NOTE:**
>
> **Background**: The JFK Operations Manager has observed that delays seem to be more frequent at certain times of the day. He wants to validate if there are **critical slots** to avoid for departures.

**Sofia asks you**: *Do an analysis to identify the times of day when departure delays (`dep_delay`) are highest on average. Visualize this relationship with a clear graph.*

> **TIP:**
>
> **Reply from Sofia**
> You can group flights by time and calculate the average delays:
>
> ``` r
> flights %>%
>   group_by(hour) %>%
>   summarise(
>     n_flights = n(),
>     mean_delay = mean(dep_delay, na.rm = TRUE),
>     .groups = "drop"
>   ) %>%
>   ggplot(aes(x = hour, y = mean_delay)) +
>   geom_col(fill = "steelblue") +
>   labs(title = "Average delay at departure according to time",
>        x = "Planned departure time",
>        y = "Average delay (minutes)")
> ```
>
> Warning: don’t get trapped by late hours with few flights. Use `n_flights` to spot groups that are too small.

## Analysis 2 - Is the weather really linked to delays?

> **NOTE:**
>
> **Context**: Some managers systematically blame the weather for delays. Sofia suggests that you examine this idea using the weather data attached to the flights. Your goal is to measure **associations**, without jumping too quickly to a direct cause.

**Sofia asks you**: *Choose one or two weather variables (e.g. `wind_gust`, `visib`, `precip`) and examine their relationship with delays (`dep_delay`).*

Before diving into the visualizations, a quick detour through a key concept: **correlation**.

### What is correlation?

Correlation measures the **strength and direction of a linear relationship** between two numerical variables. Its value is between:

- **-1**: perfectly **negative** correlation (when one increases, the other decreases),
- **0**: **no linear relationship** detected,
- **+1**: perfectly **positive** correlation (the two variables increase together).

For example, if wind gusts (`wind_gust`) increase and delays also increase, we should observe a **positive correlation**.

------------------------------------------------------------------------

### Step 1 - Calculate the correlation

``` r
flights %>%
  select(dep_delay, wind_gust, visib, precip) %>%
  cor(use = "complete.obs") %>%
  round(2)
```

This table gives you a quick overview of the strength of the relationship between delays (`dep_delay`) and certain weather variables.

A correlation close to 0 does not mean that weather never matters. It only indicates that there is no strong linear relationship in this global summary.

### Step 2 - Visualize a relationship

A scatter chart allows you to **see** the trend between two variables. For example, you can test:

``` r
flights %>%
  filter(!is.na(wind_gust), !is.na(dep_delay)) %>%
  slice_sample(n = 5000) %>%
  ggplot(aes(x = wind_gust, y = dep_delay)) +
  geom_point(alpha = 0.2) +
  geom_smooth(method = "lm", color = "red") +
  labs(title = "Relationship between wind gusts and departure delay",
       x = "Wind gusts (mph)",
       y = "Departure delay (min)")
```

The scatter plot shows you the overall trend, and the red line corresponds to a **linear regression** (i.e. the “best” line which represents the linear link between the two variables) which estimates this relationship.

> **TIP:**
>
> **Reply from Sofia**
> You can also test with other variables like `visib` (visibility) or `precip` (precipitation), and observe if delays are higher when the weather is bad.
>
> Caution:
>
> - Correlations do not prove a **causal** link!
>
> - Some weather delays are **indirect** (e.g. from another airport).
>
> - A more advanced analysis would need to control for other variables such as time, airport, airline and season.

## Analysis 3 - Are old planes less reliable?

> **NOTE:**
>
> **Context**: The maintenance team is wondering: are older planes more often late or canceled? Information on the year of manufacture is available in `plane_year`.

**Sofia asks you**: *Analyze the relationship between the age of the plane and delays or cancellations (`is.na(dep_time)`).*

> **TIP:**
>
> **Reply from Sofia**
> You can create a `plane_age` variable:
>
> ``` r
> flights <- flights %>%
>   mutate(plane_age = 2023 - plane_year)
> ```
>
> Then compare by age group. Age groups avoid overinterpreting ages with very few aircraft.
>
> ``` r
> flights %>%
>   filter(!is.na(plane_age)) %>%
>   mutate(age_group = cut(
>     plane_age,
>     breaks = c(-Inf, 5, 10, 15, 20, Inf),
>     labels = c("0-5", "6-10", "11-15", "16-20", "21+")
>   )) %>%
>   group_by(age_group) %>%
>   summarise(
>     n_flights = n(),
>     p_cancellation = mean(is.na(dep_time)),
>     mean_delay = mean(dep_delay, na.rm = TRUE),
>     .groups = "drop"
>   ) %>%
>   ggplot(aes(x = age_group, y = mean_delay)) +
>   geom_col(fill = "steelblue") +
>   labs(title = "Average delay by aircraft age",
>        x = "Aircraft age (years)", y = "Average delay (minutes)")
> ```
>
> You can repeat the same graph with `p_cancellation`. Do not forget to inspect `n_flights` before comparing groups.
