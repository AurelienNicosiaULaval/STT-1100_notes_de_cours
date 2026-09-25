Summative assessment

# Data literacy poster

This assessment asks you to tell a clear story from real data. In teams, you choose a question, analyze the data, then communicate the key message as an A1 scientific poster for a broad audience.

[ISLP competition site](https://islp.ssc.ca/?lang=en) [Quarto template](https://github.com/STT-1100-A26/affiche) [Assessments](evaluations.llms.md) [AI and help](ia.llms.md) [Rubric](#rubric-title)

10%

Weight

Team

Collaborative work

A1

Portrait or landscape

GitHub

Repository submission

## Mission

Work in teams of 3 to 4, with the same team for the project and poster. You may use the same real dataset for both; the project develops the full analysis and the poster communicates one focused message.

The objective is to produce a data science and statistics communication poster inspired by the Canadian Statistical Literacy Poster Competition.

No theme is imposed. The topic must, however, rely on real data and show your ability to analyze, interpret and communicate statistical information.

### Type

Summative assessment.

### Submission

GitHub repository containing the poster and requested files.

### Deadline

November 22 at 11:55 p.m. The official submission follows the instructions posted in Brio.

### Competition

External participation is optional.

## Quarto template

A GitHub template repository is available to start the poster in a reproducible structure. It contains an `affiche.qmd` file, a `data/` folder, a `figures/` folder, a `scripts/` folder and an AI-use statement.

The template uses Quarto and Typst to produce a PDF of exactly A1 size (841 × 594 mm in landscape). The included data are fictitious and are only meant to test rendering; your final poster must use real, cited data.

### Create the repository

Clone the private repository assigned by the instructor to your team in STT-1100-A26. If you do not have its link, contact the instructor. Open `affiche-stt1100.Rproj` and run `scripts/00_preparer.R` with Source.

### Edit

Replace the title, names, question, data and graphics in `affiche.qmd`.

### Render

Run `quarto render affiche.qmd` to produce `affiche.pdf`.

### Submit

Push the GitHub repository according to the official instructions in Brio.

[Open the poster templateQuarto starting point for your team's repository.](https://github.com/STT-1100-A26/affiche)

## What the poster must include

A strong poster does more than show results: it helps the audience understand the question, the data and the main message.

### Clear question

The question is understandable, precise and genuinely connected to the data used.

### Reliable data

Cite the source; explain collection, the number of observations, the period and representativeness. Discuss relevant data quality limitations.

### Relevant graphics

Graphs and tables help answer the question rather than simply filling space.

### Interpretation

Answer the question using the results, without overstating what the data support. Discuss limitations and a possible improvement or follow-up.

### Original creation

The content, visual choices and structure are produced by your team.

### A1 format

One page, portrait or landscape, understandable without additional documents. Check that text and graphs are readable from 2 metres at the intended print size.

## Connection with the competition

The 2026-2027 rules allow teams of 1 to 5, so our teams of 3 to 4 meet this requirement. The instructor checks each member’s eligibility for the college/undergraduate category and coordinates any voluntary submission.

Prepare a copy without names, institution, logo or contact details: one page, at most A1 and a file size of at most 10 MB. In the template, run `scripts/01_version_concours.R` with Source to create `affiche-concours.pdf`. This script hides the template’s identification fields; also check the text, images, links and PDF properties.

If the poster is in French, attach an English version when submitting to the Canadian competition. Team member details are provided separately. The poster must be original and must not have entered a previous national or international competition: adapt the template’s composition to your own message.

Before any external submission, the team must read and accept the rules on dissemination and ownership with the instructor. Participation is not automatic and does not replace the November 22 course deadline.

This assessment is mandatory for the course. Participation in the Canadian competition is optional.

Teams that produce a strong poster may, if they wish, authorize its submission to the competition. Participation is free, prizes are awarded nationally and winning posters may represent Canada internationally.

[Visit the ISLP siteOfficial rules, examples and judging criteria for the competition.](https://islp.ssc.ca/?lang=en) [International rules and AIConditions for the 2026-2027 edition, checked on September 25, 2026.](https://iase-web.org/islp-poster-competition-2026-2027)

## Use of artificial intelligence

For the poster, AI is allowed with disclosure under the Brio instructions. You must understand, check and be able to explain everything submitted. Document the tools, tasks, prompts and your checks in `DECLARATION_IA.md`.

The ISLP 2026-2027 competition allows AI as support at university level. It must not replace your ideas, critical thinking, analyses or conclusions. The work must remain substantially your team’s own; assisted content must not be presented as entirely your own. For the competition, prepare an anonymous disclosure and briefly acknowledge the assistance on the poster. Disclosure alone does not guarantee eligibility.

1

### Declare

Include an AI-use statement in the GitHub repository identifying the tools used and the tasks involved: ideation, research, programming, writing, language correction, graph creation or other tasks.

2

### Verify

State the extent to which results produced by AI tools were modified, verified or adapted by the team.

3

### Take responsibility

The team remains responsible for the accuracy of the analyses, the quality of the poster, copyright compliance and all information presented.

4

### Ask clearly

With the course AI companion, you can ask: “Check whether our question is clear and whether our graphs actually support our conclusion. Also flag claims that are too strong.”

## Rubric

The rubric is inspired by the competition criteria while remaining aligned with the course objectives.

The ISLP jury considers six dimensions: clarity of the message, data, analysis and conclusions, graphs and tables, presentation, and creativity and importance. Our rubric groups these into five categories: originality and importance of the topic belong to the question category, while originality of the composition belongs to visual communication. The points below are course weights, not official competition weights. See the [detailed judging criteria](https://iase-web.org/sites/default/files/2026-02/Judging%20criteria%202026-2027_English.pdf).

### Question and objective

15 points. The poster message is clear, focused and statistically relevant.

### Data used

20 points. The data are relevant, reliable, cited and sufficiently understood.

### Analysis

25 points. The processing, comparisons and conclusions are coherent with the question.

### Graphs and tables

20 points. Visualizations are readable, well chosen and useful for understanding the results.

### Visual communication

20 points. The poster guides the reader, explains the context and communicates effectively to a broad audience.

### Total

100 points, converted according to the official assessment weight.

## What to submit

Include `affiche.qmd`, the rendered `affiche.pdf`, shareable data and their sources, analysis scripts and the AI-use statement. Keep `_extensions/`, which is required for rendering. Confirm that the PDF has one A1 page and that the final files appear on GitHub.

The expected submission is a GitHub repository containing the poster and the elements needed to understand the work. Brio remains the official reference for the date, exact submission location, required files and administrative requirements for the session.

1.  Check that the poster answers a clear question using real data.
2.  Use the Quarto template or an equivalent structure that makes the work understandable.
3.  Cite data sources and external resources used.
4.  Include an AI-use statement if AI tools were used.
5.  Submit the GitHub repository according to the official Brio instructions.
