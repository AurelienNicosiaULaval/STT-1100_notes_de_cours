# Challenge 1 - Dive into data science

STT-1100 Introduction to Data Science

# Presentation of the challenge

You must create a Quarto report in HTML format. Your report must include:

- a meaningful header (title, date and author);
- three sections: introduction, analysis and conclusion.

The report must answer the following question: **“*Was I born in the right year?***”. We can answer this question by looking at the average temperature observed on the day of your birth, comparing it to those of previous or following years.

In the *introduction*\*\* you will need to name the objective of your analysis, the chosen date and the database you will use to answer it.

In the ***analysis*** section, you will need to carry out a simple analysis of the `MeteoQuebec` database from the `UlavalSSD` library. Here are the steps to follow:

1.  Give the average temperature on your day of birth.

2.  Analyze average temperatures by comparing your day of birth with data from 5 consecutive years before and 5 years after your year of birth. This will allow you to determine if the average temperature on the day you were born was more favorable.

In the ***conclusion*** section, you must answer the challenge question with text.

Important note **:**
If the data for your day of birth contains missing values, for example for average temperature, you can choose another symbolic date, such as the birthday of a family member, friend or pet.

# Expected deliverables

- An HTML report;

- Your source file `.qmd`.

- Your `.qmd` report must respect tidyverse good coding practices (chapter 1 and 2)

# Evaluation grid

## Important note

> For this **first rendering of a Quarto report**, you will receive **formative feedback** from the teacher.
> It will be based on the following grid in order to help you progress and improve your next deliverables.

| Criterion | Great | Satisfactory | To improve |
|----|----|----|----|
| **Presentation of the report** | Complete header (title, author, date). Three clearly identified sections. | Some elements are missing or unclear sections. | Absent structure or missing essential elements. |
| **Introduction** | Clear objective, chosen date justified, data source named. | Unclear objective or date. Source not mentioned. | Lack of introduction or off-topic. |
| **Analysis of the temperature of the chosen day** | Correct extraction, interpreted value. | Partial extraction or limited commentary. | Data missing or incorrect. |
| **Comparison over 11 years (±5)** | Complete analysis, relevant interpretation, good use of graphics if present. | Existing analysis but simplistic or unclear. | Absent or incorrect analysis. |
| **Conclusion** | Logical answer, well justified with a return to the initial question. | Answer present but not well argued. | Answer missing or off topic. |
| **Code quality (`.qmd`)** | Clear style, consistent indentation, respect for tidyverse conventions. | Acceptable style with some deviations. | Messy or poorly readable style. |
| **Reproducibility (`.html`)** | Report rendered complete, HTML functional. | Partial report or with minor errors. | HTML file non-functional or missing. |
