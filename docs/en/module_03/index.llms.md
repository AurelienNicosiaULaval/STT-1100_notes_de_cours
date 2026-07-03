# Categories in all their forms

Module 03

Understand, recode and visualize categorical variables.

Main threadCategories, strings and charts

DataPenguins, Titanic and categories

ChallengeDocumented recoding and interpreted chart

## Finished Product

Final product

### A categorical variable ready for analysis

The module produces documented recoding, a check of levels and a chart that respects the categorical structure.

**categories**

levels checked

recoding justified

chart interpreted

levels checked recoding justified chart interpreted

## Module Objectives

At the end of this module, you should be able to

- Handle character strings with `stringr`.
- Recognize patterns with regular expressions.
- Use regular expressions to select, manipulate and modify character strings.
- Calculate and interpret descriptive statistics for categorical variables (frequency tables, proportions, including by groups, cross-tabulation).
- Produce and interpret visualizations of categorical variables with `ggplot2` (bar, stacked bar, standardized stacked bar, grouped stacked bar, mosaic, pie and waffle plots).

## Learning Plan

The cards follow the four blocks of the learning plan: readings, adventure, challenge, exercises. Open the cards to see the expected action and useful link.

1 Readings Review categories, factors and suitable representations. In this card Open cardCollapse

### Initial readings

#### Readings to do before the adventure

In this module, we will explore **categorical** variables and **visualization adapted** to this type of data. Two readings are suggested to prepare you:

- [**R for Data Science – Strings**](https://r4ds.hadley.nz/strings.html)
  This chapter introduces you to the manipulation of character strings with the `stringr` package.
  \> **Note**: Although this chapter is most widely used in module 4, some useful functions like `str_detect()` or `str_to_lower()` can already help you clean or prepare categorical variables.

- [**Introduction to Modern Statistics – Chapter 6: Explore categorical data**](https://openintro-ims.netlify.app/explore-categorical)
  This chapter of **IMS** introduces statistical concepts associated with categorical data. We talk in particular about frequency tables, proportions and ways to visually represent this type of variable.

Take the time to browse these two resources. They will be useful for you to understand how to process **qualitative data**, both from a **statistical** and **practical** point of view.

2 Adventure Recode levels and compare groups without distorting them. [Adventure](aventure.llms.md) Open cardCollapse

Goal Move from reading to guided practice.

Resource [Adventure page](aventure.llms.md)

Action Follow the instructions, run the code and keep important outputs.

Result A first work object that you can explain.

Pause after each important result and state what it shows.

3 Challenge Document a recoding and defend the chart choice. [Challenge](defi.llms.md) Open cardCollapse

### Challenge

At the end of this module, **you will take on the role of data journalist** for *Le Courrier Gourmand*.
Your mission:

1.  **Explore and clean** the `listecondamnation` dataset (food offenses in Quebec).
2.  **Extract key facts** (top offenses, fine amounts, Montreal/non-Montreal comparison).
3.  **Illustrate your analyses** with at least **two visuals** (a category graph + the fines map).
4.  **Write a Quarto article (HTML)** clear and eye-catching: hat -\> context -\> methodology -\> results -\> recommendations.
5.  **Cite two narrative figures** and **integrate a short quote from Alexandre** to humanize the conclusion.

> **To be submitted**: the `.qmd` file and the generated HTML, delivered via your GitHub repository before the deadline.

The complete instructions are available on the [Challenge 3](defi.llms.md) page.

#### Evaluation grid

Your article will be evaluated according to the following criteria. Make sure you follow the template provided and the instructions given.

| Criterion | Excellent (3) | Satisfactory (2) | To improve (1) | Comment |
|----|----|----|----|----|
| \*\* Introductory hat\*\* | Punchy hook, clear angle, well-chosen key figures | Present but not very engaging or unclear | Absent or very vague |  |
| \*\* Context & presentation of data\*\* | Well identified source, relevance explained, limitations mentioned | Partial context or summary explanation | Source absent or not justified |  |
| \*\* Methodology (section without code)\*\* | Well summarized, clear and logical approach | Present but confusing or too technical | Absent or very unclear |  |
| \*\* Key result \#1 (graph + interpretation)\*\* | Clear visual, good interpretation, obvious analytical contribution | Visual or in-depth commentary | Visual or analysis absent |  |
| \*\* Key result \#2 (graph + interpretation)\*\* | Relevant visual, well-formulated insight | Correct visual but weak analysis | Result little exploited or missing |  |
| \*\* Key result \#3 (graph + interpretation)\*\* | Original or complementary result, well explained | Present but underdeveloped | Lacking or superficial |  |
| \*\* Discussion (section 4)\*\* | Critical reflection, putting results into perspective | Partial or descriptive discussion | Discussion absent or without added value |  |
| \*\* Conclusion & recommendations\*\* | Clear, useful, well-formulated action messages | Messages present but not convincing | Unclear or off-topic |  |
| \*\* Narrative figures + quote from Alexandre\*\* | Two well-chosen figures + well-integrated quote | One of the elements present only | None or poorly integrated |  |
| \*\* Render quality (Quarto + GitHub repository)\*\* | `.qmd` functional, readable HTML, clean and complete repository | Some technical problems or disorganized filing | Unable to execute or rendered partial/absent |  |

------------------------------------------------------------------------

**Total out of 30 points**: `XX / 30`

> *Don’t forget to reread the checklist at the end of the template before publishing your article.*

4 Exercises Stabilize frequency tables, factors and groupings. [Exercises](exercices.llms.md) Open cardCollapse

Resource [Exercises page](exercices.llms.md)

Why Exercises stay on a separate page because they take more space.

Redo at least one passage without looking at the solution immediately.

## Data and Tools

### Datasets

[UlavalSSD::listecondamnation](../donnees.llms.md#dataset-card-listecondamnation) [palmerpenguins::penguins_raw](../donnees.llms.md#dataset-card-penguins-raw) [titanic::titanic_train](../donnees.llms.md#dataset-card-titanic-train)

### R packages

[tidyverse](../packages.llms.md#tidyverse) [stringr](../packages.llms.md#stringr) [palmerpenguins](../packages.llms.md#palmerpenguins) [titanic](../packages.llms.md#titanic) [ulavalssd](../packages.llms.md#ulavalssd) [ggplot2](../packages.llms.md#ggplot2) [tidygeocoder](../packages.llms.md#tidygeocoder) [viridis](../packages.llms.md#viridis) [scales](../packages.llms.md#scales)

## Review and Extension

### Finish the module with the course AI assistant

Before moving to the next module, use the course AI assistant as a review partner: ask it to question your reasoning, identify fragile code and suggest one realistic improvement to the challenge.

- Explain the finished product in three sentences.
- Paste a code or output excerpt and ask for a diagnosis.
- Ask for a more ambitious variant, then choose what remains reasonable.
