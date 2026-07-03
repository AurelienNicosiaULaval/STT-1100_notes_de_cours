# Challenge 6 - Peer Review of a Collaborative Report

STT-1100 Introduction to Data Science

# Mission

Your team produced a collaborative report in adventure 6. The challenge is now to act as a review team: read another team’s report, test its reproducibility and provide useful feedback in GitHub.

The goal is not to find mistakes for the sake of it. The goal is to check whether another person can understand, execute and reuse the work.

# Organization

The instructor will assign a team to review.

For the reviewing team:

- open the assigned team’s GitHub repository;
- read the `README.md`;
- open the HTML report;
- consult the `rapport.qmd` file;
- check whether the main sections are coherent with adventure 6.

For the reviewed team:

- respond to the received issues;
- correct the report if a suggestion is relevant;
- push corrections to GitHub.

# Expected Review

Each member of the reviewing team must open at least **one GitHub issue** in the reviewed team’s repository.

Each issue must contain:

1.  a clear title;
2.  one successful aspect;
3.  one specific improvement suggestion;
4.  a reference to a section, chart, chunk or line of reasoning;
5.  a short justification.

Here is a possible structure.

``` markdown
## Successful aspect

...

## Suggestion

...

## Why this suggestion is useful

...
```

# Points to Check

Your review must address at least three of the following dimensions.

- **Clarity**: are the sections, titles and interpretations easy to follow?
- **Reproducibility**: are packages loaded, chunks named and the report likely to render?
- **Data**: are the joins between `flights`, `airlines` and `weather` understandable?
- **Visualizations**: do charts have useful titles, axes and units?
- **Interpretation**: do conclusions remain descriptive and careful?
- **Collaboration**: are roles, commits, branches or pull requests documented?

# Deliverables

The GitHub traces for the challenge must make it possible to verify, across the relevant repositories:

- at least one issue submitted by each member of the reviewing team;
- responses from the reviewed team to received issues;
- an updated report if a correction was necessary;
- a final `rapport.html` that renders correctly.

# Evaluation Grid

| Criterion | Excellent | Satisfactory | Needs improvement |
|----|----|----|----|
| Issue quality | Comments are precise, constructive and supported by observable elements | Comments are useful, but sometimes general | Comments are vague or hard to use |
| Reproducibility | The review clearly checks packages, data, chunks and rendering | The review mentions reproducibility without checking everything | Reproducibility is weakly discussed or absent |
| Analysis and visualizations | The review discusses joins, charts and interpretations carefully | The review mostly comments on presentation | The review does not really address analytical content |
| Follow-up | The reviewed team responds clearly and corrects what needs to be corrected | The team responds, but without much detail | Issues remain unanswered |

# Checklist Before Submission

- Each member opened at least one issue.
- Each issue contains one successful aspect and one specific suggestion.
- The reviewed team responded to received issues.
- Accepted corrections were pushed to GitHub.
- The final report renders to HTML.
