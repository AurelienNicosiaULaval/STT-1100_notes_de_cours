Responsible Help

# AI and Help

AI can help you understand, debug, revise and test an idea. It does not replace your judgment: in STT-1100, what matters is your ability to verify, explain and take responsibility for the choices in your deliverables.

[Open STT-1100 GPT](https://chatgpt.com/g/g-682d165f32e881918633affa3fe9dfd6-gpt-stt-1100) [Challenges](defis.llms.md) [Project](projet_session/index.llms.md) [Toolkit](boite_outils.llms.md)

1

Ask for help

2

Verify yourself

3

Disclose use

## Simple Rule

AI is a working tool. It becomes a problem if it hides your understanding, invents elements or produces an answer you cannot defend.

### Allowed

Ask for an explanation, debugging lead, clearer wording, checklist or feedback on your own work.

### Control

Reuse a suggestion only after running the code, comparing it with the data and rereading the instructions.

### Avoid

Submitting code, text, sources or interpretations that you do not understand or cannot reproduce.

## Eight modes for requesting the right kind of help

Start your message with the command that matches your need. The GPT then adapts its process and limits to the activity concerned.

### Sources and instructions

`/sources` Check a course rule and find the authoritative source.

### Review

`/revision` Review a concept with a short explanation and a recall question.

### Exercises

`/exercices` Get a formative exercise distinct from an active assessment, with graduated hints.

### Feedback

`/retroaction` At the end of a module, have one element from the adventure, challenge or exercises reviewed, then decide for yourself what to improve.

### R debugging

`/debug-r` Diagnose an error using minimal code, the complete message and the expected result.

### Project

`/projet` Compare options, justify a choice and maintain a decision log.

### Exam preparation

`/examen` Build a study plan and practise with analogous questions.

### Integrity and AI

`/integrite-ia` Clarify whether a use is allowed, restricted, disclosable, prohibited or unknown.

## Allowed AI Use

In challenges and the project, AI is allowed as support for reasoning, debugging, revision, planning or checking. In the exam, only the tools explicitly authorized on Brio are allowed. In all cases, the final deliverable must remain verifiable, personal and consistent with the instructions. You must understand, test and be able to explain any submitted code, text, source, result or interpretation. When AI influences an important part of an evaluated deliverable, add a short disclosure to the deliverable: tool used, purpose of help, affected part and verification done. The official requirements posted on Brio always prevail.

1

### Adventures, mini-tests and exercises

Encouraged for understanding a concept, testing a command, fixing an error or finding another explanation.

2

### Challenges

Apply the common rule and add a disclosure when help influences the deliverable.

3

### Exam

Check the tools explicitly authorized on Brio before starting.

4

### Course Project

Apply the common rule in the team repository and submissions.

## Which source is authoritative?

The GPT cannot access Brio. For course-specific information, it must follow this hierarchy and never fill a gap with a guess.

1.  Brio for dates, deadlines, weights, administrative requirements and authorized tools.
2.  An official instruction from the teaching team.
3.  The specific page for the assessment concerned.
4.  The AI page, followed by the other official pages of the course site.
5.  The GPT knowledge snapshot, its general knowledge and cited external sources.

### Information unavailable

If the answer cannot be verified, the GPT must say exactly: “I do not know.”

### Conflicting sources

Brio and official teaching-team instructions take precedence. If the conflict remains, ask the team for clarification.

### Contextualized knowledge

The GPT files are a snapshot. For a current requirement, always check Brio and the relevant official page.

## Disclosing Help Received

When AI influences an important part of an evaluated deliverable, add a short and clear disclosure to the deliverable. This disclosure is not a portfolio; it only makes the use transparent.

### Tool Used

Name the tool or GPT used, for example STT-1100 GPT.

### Purpose of Help

Indicate whether the help was for debugging, rewriting, checking, planning or finding errors.

### Affected Part

Name the section, function, graph or passage that was influenced.

### Verification Done

Say how you checked the suggestion: code run, Quarto render, comparison with the data, rereading of instructions.

## Before Using an Answer

A useful answer must be compatible with the instructions, the data and the code you actually ran. If a suggestion looks impressive but does not render, does not match the variables or contradicts the instructions, it should not enter the deliverable.

1.  Reread the module, challenge or project instructions.
2.  Run the code in your own Quarto document.
3.  Check that variable names, filters, units and graphs match the data.
4.  Rewrite the interpretation in your own words.
5.  Keep a short note if the help influenced the final result.

### Do Not Invent

No source, data, variable, result or citation should be added without verification.

### Do Not Delegate Judgment

AI may suggest; you must decide, test and explain.

### Do Not Share Sensitive Data

Do not send personal, confidential or non-anonymized data to an external tool.

## Useful Questions to Ask

The best prompts request targeted help while keeping responsibility for the decision on your side.

### Debug

`/debug-r` Here is my full error message, minimal code and expected result. Ask me two diagnostic questions, then suggest a correction I can test.

### Understand

`/revision` Explain this R output in plain language. Separate what is directly visible in the output from what requires checking the data.

### Revise

`/retroaction` Here are the instructions, what I tried and the exact excerpt I want to improve. Give me one strength, one weakness to verify and one question that will help me revise it myself. Do not rewrite everything.

### Improve

`/retroaction` Suggest a clearer version of this paragraph without changing the result, adding a source or inventing information.

### Test

`/sources` Here are my instructions and my Quarto document. Give me a short checklist before submission: render, code, figures, interpretation and files.

### Document

`/integrite-ia` Help me write a two-sentence note naming the GPT used, the purpose of the help and the verification I performed.
