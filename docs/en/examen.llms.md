Assessment

# Exam

As in the course adventures, you will analyze a dataset in a Quarto report. You will use the methods from modules 1 to 4 and explain your choices.

[Preparation](#exam-prep-title) [Exam conditions](#exam-conditions-title) [Reference bundle](#exam-resources-title) [During the exam](#exam-day-title) [Past exams](#old-exams-title) [Assessments](evaluations.llms.md)

01

R, RStudio and Quarto

02

GitHub, dplyr and ggplot2

03

Categories and factors

04

Import and cleaning

## General format

You will import and analyze data, then present your results in a reproducible report. The individual exam is worth 25% and takes place on October 19, 2026, from 8:30 to 11:20 a.m. in PLT-2325. You will work on an exam account without Internet or AI. Files will be collected automatically; no manual submission is required.

### Assignment

You receive a mission or mandate, as in the course adventures.

### Provided data

You import, check, transform and summarize a dataset.

### Quarto report

Answers, code, graphs and interpretations are integrated into a reproducible document.

### Interpretation

Results must be explained briefly, carefully and in the language of the context.

## Exam accounts and authorized material

You will work on an exam account. Personal reference material is permitted on paper only; digital material is limited to what the instructor makes available on these accounts.

### Exam account

Complete and save your work on the exam account used during the session.

### Paper documents

Bring your paper references. Do not rely on your personal digital files.

### Provided material

The common reference bundle below will be available on the exam accounts. Download the same bundle to prepare before the exam.

### Automatic collection

No manual submission to Brio or GitHub. Save your work regularly; files will be collected automatically.

## The same bundle for preparation and for the exam

This common bundle will be available offline on the exam accounts. It contains French course materials for modules 1 to 4, a short working guide and English official readings. Already published course exercises and solutions are included.

### Quick guide

Code examples to import, check types, clean, summarize, calculate proportions, choose a graph, reshape and render a report.

### Modules 1 to 4

Learning plans, adventures, challenges, exercises, quizzes, already published solutions and practice files.

### Readings and reference sheets

Local copies of the module readings: R4DS, Introduction to Modern Statistics, the style guide, package documentation and a Quarto tutorial; Posit reference sheets and the course reference sheet.

### Quarto practice

An RStudio project, a Quarto template to complete and fictional data for practice. The exam template will be provided at the start of the exam.

[Download the common bundleLocal references and practice for modules 1 to 4, October 5, 2026 version.](../downloads/examen/references-stt1100-examen-2026-10-19.zip)

Extract the entire archive, then open `references-stt1100/ACCUEIL.html`. Keep its subfolders together. The welcome page organizes resources by task and module. Use Ctrl+F to search within an open document.

Personal documents remain permitted on paper only. Course activities requiring GitHub, installation or a Web service serve as references; practise the analyses and rendering with local files.

## Internet and AI during the exam

Internet access and AI use are not allowed during the exam. Practise completing the essential tasks independently and explaining your choices, using paper references.

## Expected approach

Use the methods covered in class to analyze the provided data. Aim for a correct, readable and clearly explained solution.

### Adapt the methods

Questions do not ask you to reproduce a challenge word for word.

### Keep the solution simple

A simple, readable and complete solution is better than an overly ambitious one.

### Explain your choices

Interpretations and choices must be understandable in context.

### Work individually

The goal is to show your individual autonomy with the course foundations.

## Skills used

The exam combines the operations practised in the adventures, challenges and exercises from modules 1 to 4.

1

### Import

Read a file, understand variables and check types.

2

### Transform

Filter, create variables, recode, group and summarize with `dplyr`.

3

### Visualize

Choose an appropriate graph and make it readable with `ggplot2`.

4

### Explain

Write short interpretations that answer the question.

## What matters

The criteria cover whether the report works, the analysis choices and the explanations of the results.

### Reproducibility

The document renders, packages are loaded and the objects used are created in the code.

### Technical choices

Transformations are relevant to the question and basic checks are visible.

### Readable graphs

Visualizations have a clear purpose, useful titles, named axes and an understandable scale.

### Careful interpretation

Sentences answer the question without going beyond what the data support.

### Organization

The report follows a readable progression: preparation, analysis, results and conclusion.

### Simplicity

A clear solution using course tools is better than a complicated and fragile solution.

## Prepare well

During the weeks of October 5 and October 12, review modules 1 to 4 and continue selecting data with your project and poster team. There is no class on these two Mondays. We meet again at the October 19 exam.

1.  Download and extract the common bundle, then open `ACCUEIL.html`. Locate the guide, modules and reference sheets.
2.  Use modules 1 and 2 to practise R objects, conditions, missing values, Quarto, numerical summaries, `dplyr` and `ggplot2`.
3.  Use modules 3 and 4 to practise strings, categories, factor order, import types, duplicate rows and long/wide formats.
4.  Open the practice project and complete its template; then adapt the workflow to an adventure or course exercise with other data. Work without Internet or AI, using the common bundle and your paper references.
5.  Explain your results, graphs and cleaning decisions. Consult published solutions after your attempt to revisit difficult steps.
6.  Save, restart R, render the complete document and open its HTML output. Check that your code creates every object it uses.

[Module 1R and Quarto](module_01/exercices.llms.md) [Module 2Summaries and graphics](module_02/exercices.llms.md) [Module 3Strings and categories](module_03/exercices.llms.md) [Module 4Import and cleaning](module_04/exercices.llms.md)

### Paper references

Prepare printed notes to find functions and their uses quickly.

### Common digital references

Prepare using the same bundle version that will be available on the exam accounts.

### Interpretation

Specify units, counts and denominators. Explain what the data support.

## During the exam

Start by producing a report that works, then complete your answers and interpretations.

1.  Read the whole mission before coding.
2.  Import the data and check the structure with short outputs.
3.  Create the minimal transformations needed to answer the questions.
4.  Produce the requested graphs or tables.
5.  Render the document and fix errors before refining the writing.

### Name clearly

Simple object names help reread code and find errors.

### Test often

Running chunks progressively avoids discovering every error at the final render.

### Write briefly

One precise sentence that answers the question is better than a vague paragraph.

## Final check

Before leaving, save your latest changes on the exam account and check the final rendered document. Files are collected automatically; you do not need to upload anything to Brio or GitHub.

1.  The Quarto document renders without error.
2.  The data used are imported by the document code.
3.  Each question has a visible answer.
4.  Graphs and tables have a title or clear context.
5.  Interpretations answer the mission rather than an R function.

### Final render

Open the rendered file, not only the source file.

### Created objects

Check that the document works in a fresh session.

### Short text

Add one precise sentence when the result alone is not enough.

## Past exams

These exams are provided to practise the format and level of integration expected. The official requirements for a given session always remain those posted on Brio.

### Fall 2025 - UN mission

Read these corrections before using the 2025 archive. Its exam-day rules do not define the 2026 rules. The CSV imports categories as text: create factors explicitly. The meaning and units of `gdp` are not reliably documented in the supplied file, so do not interpret it as GDP per capita or make economic claims from it. The Internet category is repeated unchanged across years for each country; it must not be used to infer historical Internet trends. Use the archive for technical practice, and prioritize the course adventures and exercises for substantive interpretation.

For question 5, use `aes(x = gdp)` with `scale_x_log10()` to practise a log scale, without also computing `log(gdp)`. Document missing values, restrict the plot to positive available values, and use explicit shapes for the ordered Internet categories. The archive does not by itself cover all module 4 cleaning skills.

A complete example of an applied exam: narrative context, dataset and guided questions on modules 1 to 4.

[PDF statementPrintable version of the past exam.](../anciens_examens/automne-2025/examen-stt1100-automne-2025.pdf) [DataDataset used in the exam.](../anciens_examens/automne-2025/gapminder_rich.csv)

### How to use it

Start with the PDF to understand the mission, then use the provided data to redo the analysis in your own practice document.

[ToolboxFind useful functions before starting.](boite_outils.llms.md) [AssessmentsReturn to the assessment overview.](evaluations.llms.md)
