# Module 6 - Exercises

STT-1100 Introduction to Data Science

# Consolidation Exercises

These exercises are independent from the adventure and challenge. They consolidate the technical moves from module 6: join several tables, check keys, find unmatched rows, summarize collaborative activity and write constructive review comments.

The data used here are fictitious and do not represent any real GitHub repository.

``` r
library(tidyverse)
```

# Readings to Review

- [GitHub Docs - Hello World](https://docs.github.com/en/get-started/quickstart/hello-world)
- [GitHub Docs - About issues](https://docs.github.com/en/issues/tracking-your-work-with-issues/about-issues)
- [GitHub Docs - Creating an issue](https://docs.github.com/en/issues/tracking-your-work-with-issues/using-issues/creating-an-issue)
- [GitHub Docs - About pull requests](https://docs.github.com/en/pull-requests)
- [GitHub Docs - About merge conflicts](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/addressing-merge-conflicts/about-merge-conflicts)
- [Quarto Docs - Inline code](https://quarto.org/docs/computations/inline-code.html)
- [Quarto Docs - Execution options](https://quarto.org/docs/computations/execution-options.html)
- [R for Data Science - Joins](https://r4ds.hadley.nz/joins.html)

After the readings, also complete the [formative mini-test](../module_06/mini_test.llms.md). It is not graded.

# Block A - Understand Join Keys

## Exercise 1 - Import Collaboration Tables

Import `fictitious_team_members.csv` and `fictitious_git_contributions.csv`, then inspect their dimensions.

> **NOTE:**
>
> ``` r
> members <- read_csv(
>   "data/fictitious_team_members.csv",
>   show_col_types = FALSE
> )
>
> contributions <- read_csv(
>   "data/fictitious_git_contributions.csv",
>   show_col_types = FALSE
> )
>
> glimpse(members)
> ```
>
>     Rows: 8
>     Columns: 4
>     $ member_id <chr> "M01", "M02", "M03", "M04", "M05", "M06", "M07", "M08"
>     $ name      <chr> "Amina", "Leo", "Noah", "Emma", "Zoe", "Thomas", "Ines", "Ma…
>     $ role      <chr> "Repository lead", "Data analyst", "Reproducibility lead", "…
>     $ team      <chr> "Team A", "Team A", "Team A", "Team A", "Team B", "Team B", …
>
> ``` r
> glimpse(contributions)
> ```
>
>     Rows: 12
>     Columns: 6
>     $ commit_id         <chr> "C001", "C002", "C003", "C004", "C005", "C006", "C00…
>     $ member_id         <chr> "M01", "M02", "M03", "M04", "M02", "M03", "M09", "M0…
>     $ commit_date       <date> 2026-02-10, 2026-02-10, 2026-02-11, 2026-02-11, 202…
>     $ contribution_type <chr> "structure", "data", "reproducibility", "interpretat…
>     $ file              <chr> "README.md", "rapport.qmd", "rapport.qmd", "rapport.…
>     $ changed_lines     <dbl> 32, 48, 21, 36, 44, 10, 7, 12, 51, 26, 33, 29
>
> ``` r
> tibble(
>   table = c("members", "contributions"),
>   rows = c(nrow(members), nrow(contributions)),
>   columns = c(ncol(members), ncol(contributions))
> )
> ```
>
>     # A tibble: 2 × 3
>       table          rows columns
>       <chr>         <int>   <int>
>     1 members           8       4
>     2 contributions    12       6

## Exercise 2 - Add Member Information

Use `left_join()` to add the name, role and team to each contribution.

> **NOTE:**
>
> ``` r
> contribution_details <- contributions |>
>   left_join(members, by = "member_id")
>
> contribution_details |>
>   select(commit_id, member_id, name, role, team, contribution_type, file) |>
>   arrange(commit_id)
> ```
>
>     # A tibble: 12 × 7
>        commit_id member_id name   role                 team  contribution_type file
>        <chr>     <chr>     <chr>  <chr>                <chr> <chr>             <chr>
>      1 C001      M01       Amina  Repository lead      Team… structure         READ…
>      2 C002      M02       Leo    Data analyst         Team… data              rapp…
>      3 C003      M03       Noah   Reproducibility lead Team… reproducibility   rapp…
>      4 C004      M04       Emma   Communicator         Team… interpretation    rapp…
>      5 C005      M02       Leo    Data analyst         Team… visualization     rapp…
>      6 C006      M03       Noah   Reproducibility lead Team… render            rapp…
>      7 C007      M09       <NA>   <NA>                 <NA>  data              note…
>      8 C008      M01       Amina  Repository lead      Team… merge             READ…
>      9 C009      M06       Thomas Data analyst         Team… data              rapp…
>     10 C010      M07       Ines   Reproducibility lead Team… reproducibility   rapp…
>     11 C011      M08       Malik  Communicator         Team… interpretation    rapp…
>     12 C012      M05       Zoe    Repository lead      Team… structure         READ…

## Exercise 3 - Find Contributions Without a Known Member

Use `anti_join()` to find contributions whose `member_id` does not appear in the member table.

> **NOTE:**
>
> ``` r
> contributions |>
>   anti_join(members, by = "member_id")
> ```
>
>     # A tibble: 1 × 6
>       commit_id member_id commit_date contribution_type file           changed_lines
>       <chr>     <chr>     <date>      <chr>             <chr>                  <dbl>
>     1 C007      M09       2026-02-12  data              notes_temp.txt             7
>
> This check is useful before summarizing work by person. A missing key may indicate a data-entry error or an undocumented member.

## Exercise 4 - Identify Members Who Contributed

Use `semi_join()` to get the list of members who have at least one contribution.

> **NOTE:**
>
> ``` r
> members |>
>   semi_join(contributions, by = "member_id") |>
>   arrange(team, role)
> ```
>
>     # A tibble: 8 × 4
>       member_id name   role                 team
>       <chr>     <chr>  <chr>                <chr>
>     1 M04       Emma   Communicator         Team A
>     2 M02       Leo    Data analyst         Team A
>     3 M01       Amina  Repository lead      Team A
>     4 M03       Noah   Reproducibility lead Team A
>     5 M08       Malik  Communicator         Team B
>     6 M06       Thomas Data analyst         Team B
>     7 M05       Zoe    Repository lead      Team B
>     8 M07       Ines   Reproducibility lead Team B

# Block B - Summarize Collaborative Work

## Exercise 5 - Summarize Contributions by Member

Create a table giving, for each known member, the number of commits and the total number of changed lines.

> **NOTE:**
>
> ``` r
> member_summary <- contribution_details |>
>   filter(!is.na(name)) |>
>   group_by(team, name, role) |>
>   summarise(
>     n_commits = n(),
>     changed_lines = sum(changed_lines),
>     .groups = "drop"
>   ) |>
>   arrange(team, desc(n_commits))
>
> member_summary
> ```
>
>     # A tibble: 8 × 5
>       team   name   role                 n_commits changed_lines
>       <chr>  <chr>  <chr>                    <int>         <dbl>
>     1 Team A Amina  Repository lead              2            44
>     2 Team A Leo    Data analyst                 2            92
>     3 Team A Noah   Reproducibility lead         2            31
>     4 Team A Emma   Communicator                 1            36
>     5 Team B Ines   Reproducibility lead         1            26
>     6 Team B Malik  Communicator                 1            33
>     7 Team B Thomas Data analyst                 1            51
>     8 Team B Zoe    Repository lead              1            29

## Exercise 6 - Visualize Team Activity

Produce a chart of the number of commits by role.

> **NOTE:**
>
> ``` r
> member_summary |>
>   ggplot(aes(x = role, y = n_commits, fill = team)) +
>   geom_col(position = "dodge") +
>   coord_flip() +
>   labs(
>     title = "Number of commits by role",
>     x = "Role",
>     y = "Number of commits",
>     fill = "Team"
>   )
> ```
>
> ![](exercices_files/figure-html/unnamed-chunk-6-1.png)

## Exercise 7 - Check Expected Files

Import `fictitious_report_files.csv`. For each team, calculate the number of expected files present and missing.

> **NOTE:**
>
> ``` r
> files <- read_csv(
>   "data/fictitious_report_files.csv",
>   show_col_types = FALSE
> )
>
> file_summary <- files |>
>   mutate(is_present = present == "yes") |>
>   group_by(team) |>
>   summarise(
>     files_present = sum(is_present),
>     files_missing = sum(!is_present),
>     total_size_kb = sum(size_kb),
>     .groups = "drop"
>   )
>
> file_summary
> ```
>
>     # A tibble: 3 × 4
>       team   files_present files_missing total_size_kb
>       <chr>          <int>         <int>         <dbl>
>     1 Team A             3             1           870
>     2 Team B             3             1           586
>     3 Team C             2             2           515

## Exercise 8 - Find Teams Missing an HTML Report

Filter rows where `expected_file == "rapport.html"` and the file is absent.

> **NOTE:**
>
> ``` r
> files |>
>   filter(expected_file == "rapport.html", present == "no")
> ```
>
>     # A tibble: 2 × 4
>       team   expected_file present size_kb
>       <chr>  <chr>         <chr>     <dbl>
>     1 Team B rapport.html  no            0
>     2 Team C rapport.html  no            0

# Block C - Issues and Constructive Review

## Exercise 9 - Join Issues to Members

Import `fictitious_review_issues.csv`, then add the name and team of the author of each issue.

> **NOTE:**
>
> ``` r
> issues <- read_csv(
>   "data/fictitious_review_issues.csv",
>   show_col_types = FALSE
> )
>
> issue_details <- issues |>
>   left_join(members, by = c("author_id" = "member_id"))
>
> issue_details |>
>   select(issue_id, reviewed_team, author_id, name, team, dimension, status, priority)
> ```
>
>     # A tibble: 7 × 8
>       issue_id reviewed_team author_id name   team   dimension       status priority
>       <chr>    <chr>         <chr>     <chr>  <chr>  <chr>           <chr>  <chr>
>     1 I001     Team A        M05       Zoe    Team B Reproducibility open   high
>     2 I002     Team A        M06       Thomas Team B Joins           closed high
>     3 I003     Team A        M07       Ines   Team B Visualizations  open   normal
>     4 I004     Team B        M01       Amina  Team A Clarity         closed normal
>     5 I005     Team B        M02       Leo    Team A Interpretation  open   high
>     6 I006     Team B        M03       Noah   Team A GitHub          closed low
>     7 I007     Team C        M04       Emma   Team A Reproducibility open   normal

## Exercise 10 - Summarize Issues by Reviewed Team

Calculate the number of open, closed and high-priority issues for each reviewed team.

> **NOTE:**
>
> ``` r
> issue_details |>
>   group_by(reviewed_team) |>
>   summarise(
>     n_issues = n(),
>     n_open = sum(status == "open"),
>     n_closed = sum(status == "closed"),
>     n_high_priority = sum(priority == "high"),
>     .groups = "drop"
>   ) |>
>   arrange(desc(n_open))
> ```
>
>     # A tibble: 3 × 5
>       reviewed_team n_issues n_open n_closed n_high_priority
>       <chr>            <int>  <int>    <int>           <int>
>     1 Team A               3      2        1               2
>     2 Team B               3      1        2               1
>     3 Team C               1      1        0               0

## Exercise 11 - Find Issues Without a Known Team

Teams A and B are in the member table. Use a join or equivalent logic to identify issues targeting a team absent from the known team list.

> **NOTE:**
>
> ``` r
> known_teams <- members |>
>   distinct(team)
>
> issues |>
>   anti_join(known_teams, by = c("reviewed_team" = "team"))
> ```
>
>     # A tibble: 1 × 7
>       issue_id reviewed_team author_id issue_date dimension       status priority
>       <chr>    <chr>         <chr>     <date>     <chr>           <chr>  <chr>
>     1 I007     Team C        M04       2026-02-16 Reproducibility open   normal

## Exercise 12 - Write a Useful Issue

Choose one open issue and rewrite it with three sections: successful aspect, suggestion, justification.

> **NOTE:**
>
> ``` markdown
> ## Successful aspect
>
> The report clearly lists the packages used and the main preparation steps.
>
> ## Suggestion
>
> Add one sentence explaining the join key used between contributions and members.
>
> ## Why this suggestion is useful
>
> The review becomes easier to reproduce because another team can understand why `member_id` is the correct key.
> ```

# Case Studies

## Case Study 1 - Fictitious Project Repository Audit

Use `fictitious_team_members.csv`, `fictitious_git_contributions.csv`, `fictitious_review_issues.csv` and `fictitious_report_files.csv`.

Complete the following tasks:

1.  join contributions to members;
2.  find contributions without a known member;
3.  produce a summary by team;
4.  join issues to authors;
5.  identify teams missing `rapport.html`;
6.  write a cautious conclusion about repository reproducibility.

> **NOTE:**
>
> ``` r
> audit_contributions <- contributions |>
>   left_join(members, by = "member_id")
>
> contributions_without_member <- contributions |>
>   anti_join(members, by = "member_id")
>
> team_summary <- audit_contributions |>
>   filter(!is.na(team)) |>
>   group_by(team) |>
>   summarise(
>     n_commits = n(),
>     n_active_members = n_distinct(member_id),
>     changed_lines = sum(changed_lines),
>     .groups = "drop"
>   )
>
> audit_issues <- issues |>
>   left_join(members, by = c("author_id" = "member_id"))
>
> missing_reports <- files |>
>   filter(expected_file == "rapport.html", present == "no")
>
> contributions_without_member
> ```
>
>     # A tibble: 1 × 6
>       commit_id member_id commit_date contribution_type file           changed_lines
>       <chr>     <chr>     <date>      <chr>             <chr>                  <dbl>
>     1 C007      M09       2026-02-12  data              notes_temp.txt             7
>
> ``` r
> team_summary
> ```
>
>     # A tibble: 2 × 4
>       team   n_commits n_active_members changed_lines
>       <chr>      <int>            <int>         <dbl>
>     1 Team A         7                4           203
>     2 Team B         4                4           139
>
> ``` r
> audit_issues
> ```
>
>     # A tibble: 7 × 10
>       issue_id reviewed_team author_id issue_date dimension    status priority name
>       <chr>    <chr>         <chr>     <date>     <chr>        <chr>  <chr>    <chr>
>     1 I001     Team A        M05       2026-02-15 Reproducibi… open   high     Zoe
>     2 I002     Team A        M06       2026-02-15 Joins        closed high     Thom…
>     3 I003     Team A        M07       2026-02-15 Visualizati… open   normal   Ines
>     4 I004     Team B        M01       2026-02-15 Clarity      closed normal   Amina
>     5 I005     Team B        M02       2026-02-16 Interpretat… open   high     Leo
>     6 I006     Team B        M03       2026-02-16 GitHub       closed low      Noah
>     7 I007     Team C        M04       2026-02-16 Reproducibi… open   normal   Emma
>     # ℹ 2 more variables: role <chr>, team <chr>
>
> ``` r
> missing_reports
> ```
>
>     # A tibble: 2 × 4
>       team   expected_file present size_kb
>       <chr>  <chr>         <chr>     <dbl>
>     1 Team B rapport.html  no            0
>     2 Team C rapport.html  no            0
>
> A cautious conclusion could state that Team B appears to have its data trace present, but an HTML report is missing. This observation is not enough to judge the whole project; the next step would be to try rendering `rapport.qmd`.

## Case Study 2 - Fictitious Data Portal Review

Use `fictitious_data_portal.csv`, `fictitious_producers.csv` and `fictitious_review_comments.csv`.

Complete the following tasks:

1.  join datasets to producers;
2.  find datasets without a known producer;
3.  join comments to datasets;
4.  count comments by dimension and severity;
5.  identify datasets with an unknown license;
6.  write a constructive review issue for a priority problem.

> **NOTE:**
>
> ``` r
> portal <- read_csv(
>   "data/fictitious_data_portal.csv",
>   show_col_types = FALSE
> )
>
> producers <- read_csv(
>   "data/fictitious_producers.csv",
>   show_col_types = FALSE
> )
>
> comments <- read_csv(
>   "data/fictitious_review_comments.csv",
>   show_col_types = FALSE
> )
>
> portal_producers <- portal |>
>   left_join(producers, by = "producer_id")
>
> datasets_without_producer <- portal |>
>   anti_join(producers, by = "producer_id")
>
> comment_details <- comments |>
>   left_join(portal, by = "dataset_id")
>
> comment_summary <- comment_details |>
>   count(dimension, severity, sort = TRUE)
>
> unknown_licenses <- portal_producers |>
>   filter(license == "Unknown" | is.na(organization))
>
> datasets_without_producer
> ```
>
>     # A tibble: 1 × 5
>       dataset_id title      producer_id license updated_at
>       <chr>      <chr>      <chr>       <chr>   <date>
>     1 D006       Bike racks P99         Open    2026-02-06
>
> ``` r
> comment_summary
> ```
>
>     # A tibble: 6 × 3
>       dimension       severity     n
>       <chr>           <chr>    <int>
>     1 Documentation   low          1
>     2 Interpretation  low          1
>     3 License         high         1
>     4 License         normal       1
>     5 Producer        high         1
>     6 Reproducibility normal       1
>
> ``` r
> unknown_licenses
> ```
>
>     # A tibble: 2 × 8
>       dataset_id title producer_id license updated_at organization organization_type
>       <chr>      <chr> <chr>       <chr>   <date>     <chr>        <chr>
>     1 D004       Road… P03         Unknown 2025-12-18 Transport s… Municipal
>     2 D006       Bike… P99         Open    2026-02-06 <NA>         <NA>
>     # ℹ 1 more variable: public_contact <chr>
>
> A priority issue could ask the team to clarify the license for the `Road work` dataset before publishing. The justification is that data reuse directly depends on the stated license.
