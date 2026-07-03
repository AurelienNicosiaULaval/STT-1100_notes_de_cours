# Challenge 5 - Explore flight delays

STT-1100 Introduction to Data Science

# Mission

You work with Dr Sofia Martínez at the Port Authority Data Lab. Your mission is to produce a short exploratory report on flight delays from New York airports in 2023.

The goal is not to prove a single cause. The goal is to show that you can prepare temporal variables, visualize relationships, calculate simple associations and interpret results carefully.

# Starting Data

The main file is `flights_merged_2023.rds`. It contains 435,352 flights and 50 variables.

Start your `rapport.qmd` file with a preparation block similar to this one.

``` r
library(tidyverse)
library(lubridate)

flights <- readRDS("flights_merged_2023.rds")

flights <- flights |>
  mutate(
    date = make_date(year, month, day),
    weekday = wday(date, label = TRUE, abbr = FALSE),
    moment_day = case_when(
      hour < 6 ~ "night",
      hour < 12 ~ "morning",
      hour < 18 ~ "afternoon",
      TRUE ~ "evening"
    ),
    plane_age = 2023 - plane_year
  )
```

# Questions to Answer

Your report must answer the following three questions.

1.  Which time slots seem associated with the largest departure delays?
2.  Are the available weather variables, such as `wind_gust`, `visib` or `precip`, associated with delays?
3.  Are older planes more often delayed or cancelled?

For each question, include:

- a short sentence explaining what you are comparing;
- at least one table or numerical summary;
- at least one visualization;
- a concise interpretation;
- one cautious sentence about the limits of the analysis.

# Watch Points

- Cancelled flights often have missing `dep_time` and `dep_delay`. Use `is.na(dep_time)` to measure cancellations.
- Late hours may contain few flights. Always display the number of flights by group.
- A correlation does not prove causation.
- Weather variables may be missing. Briefly state how you handle them.
- Missing manufacturing years must be excluded or flagged before analyzing plane age.

# Deliverables

Your GitHub repository must contain the following files:

- `rapport.qmd`: your reproducible report;
- `rapport.html`: the rendered version of the report;
- `flights_merged_2023.rds`: the provided data file;
- any additional file that is truly necessary for your analysis.

Your `.qmd` file must render to HTML without error.

# Suggested Structure

You may use this structure.

``` markdown
# Introduction

# Data preparation

# Question 1: time slots

# Question 2: weather and delays

# Question 3: plane age

# Conclusion
```

# Evaluation Grid

| Criterion | Excellent | Satisfactory | Needs improvement |
|----|----|----|----|
| Temporal preparation | Date, weekday and time-slot variables are correct and explained | The main variables are created | Temporal variables are missing or incorrect |
| Time-slot analysis | Delays are compared with group sizes and a clear graph | The analysis answers the question, but group sizes are weakly discussed | The analysis is vague or not connected to the question |
| Weather analysis | Associations are quantified, visualized and interpreted carefully | One weather relationship is explored, but interpretation remains limited | Weather is presented as a cause without justification |
| Plane analysis | Age and cancellations are handled with missing values | Age is analyzed, but limits are weakly discussed | Age or cancellation variables are misused |
| Communication | The report is clear, reproducible and well structured | The report is understandable but could be better organized | The report is hard to follow or does not render correctly |

# Checklist Before Submission

- `rapport.qmd` renders to HTML.
- Required packages are loaded explicitly.
- Data are read with `readRDS("flights_merged_2023.rds")`.
- Each graph has a clear title and understandable axes.
- Conclusions remain descriptive and cautious.
- The GitHub repository contains the expected files.
