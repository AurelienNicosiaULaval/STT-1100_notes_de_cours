Assessment

# Exam

The exam follows the spirit of the adventures: a concrete situation, a dataset, a Quarto document to complete and decisions to justify. It assesses autonomy with the essential skills from modules 1 to 4.

[Preparation](#exam-prep-title) [Exam conditions](#exam-conditions-title) [During the exam](#exam-day-title) [Past exams](#old-exams-title) [Assessments](evaluations.llms.md)

01

R, RStudio and Quarto

02

GitHub, dplyr and ggplot2

03

Categories and factors

04

Import and cleaning

## General format

The exam is applied. The goal is not to recite functions, but to choose the right tools to produce a reliable short report. The individual exam is worth 25% and takes place on October 19, 2026, from 8:30 to 11:20 a.m. in PLT-2325. You will work on an exam account without Internet or AI. Files will be collected automatically; no manual submission is required.

### Narrative context

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

The instructor will make material available directly on the exam accounts.

### Automatic collection

No manual submission to Brio or GitHub. Save your work regularly; files will be collected automatically.

## Internet and AI during the exam

Internet access and AI use are not allowed during the exam. Practise completing the essential tasks independently and explaining your choices, using paper references.

## What the exam is not

The exam is not designed to trick you or reward the most sophisticated code. It mainly checks whether you can recognize useful moves in a new situation and produce a clear trace.

### Not memorization

Questions do not ask you to reproduce a challenge word for word.

### Not a speed contest

A simple, readable and complete solution is better than an overly ambitious one.

### Not only code

Interpretations and choices must be understandable in context.

### Not a team project

The goal is to show your individual autonomy with the course foundations.

## Skills used

The tasks resemble the adventures, challenges and exercises from the first modules. The exam does not ask you to reproduce a challenge by heart; it asks you to recognize useful moves in a new situation.

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

A good exam shows a complete process, even if everything is not perfect. The criteria resemble those used for challenges, but in a more integrated context.

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

## How to prepare

During the weeks of October 5 and 12, revise modules 1 to 4 and continue exploring a dataset with your project/poster team. There is no class meeting on those Mondays. Our next meeting is the October 19 exam. The module 4 challenge is due October 4 at 11:55 p.m.; no additional project submission is added during the break.

1.  First, consolidate R objects, conditions, missing values, Quarto, numerical summaries, dplyr and ggplot2 using modules 1 and 2.
2.  Then revisit strings, categories, factor order, import types, duplicate rows, missing values and long/wide reshaping using modules 3 and 4.
3.  Download the practice files first, then complete an adventure or exercises from a blank Quarto document without Internet or AI, using paper references. Restart R and render the complete document.
4.  Explain every graph and cleaning decision in your own words. Revisit any step you cannot reproduce independently.

[Module 1R and Quarto](module_01/index.llms.md) [Module 2Data summaries and graphics](module_02/index.llms.md) [Module 3Strings and categories](module_03/index.llms.md) [Module 4Import and cleaning](module_04/index.llms.md)

The best preparation is to redo challenges, reread the adventures and build a personal paper reference sheet with your most useful examples.

1.  Redo the relevant module challenges without looking immediately at the solution.
2.  Reread learning plans to find the key functions.
3.  Redo a few independent exercises to vary contexts and datasets.
4.  Practise rendering a complete Quarto document.
5.  Check your graphs: titles, axes, legends, units and interpretation.

### Paper references

Organize your printed notes and examples to find functions and their uses quickly.

### Digital resources

During the exam, use only the material made available by the instructor on the exam account.

### Goal

Show a clear process, not only a numerical result.

## During the exam

The most robust strategy is to build a simple version that works, then improve it.

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
