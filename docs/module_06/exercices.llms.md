# Module 6 - Exercices

STT-1100 Introduction à la science des données

# Exercices de consolidation

Ces exercices sont indépendants de l’aventure et du défi. Ils servent à consolider les gestes techniques du module 6: joindre plusieurs tables, vérifier les clés, repérer les lignes sans correspondance, résumer une activité collaborative et formuler une revue constructive.

Les données utilisées ici sont fictives et ne représentent aucun dépôt GitHub réel.

``` r
library(tidyverse)
```

# Lectures à revoir

- [GitHub Docs - Hello World](https://docs.github.com/en/get-started/quickstart/hello-world)
- [GitHub Docs - About issues](https://docs.github.com/en/issues/tracking-your-work-with-issues/about-issues)
- [GitHub Docs - Creating an issue](https://docs.github.com/en/issues/tracking-your-work-with-issues/using-issues/creating-an-issue)
- [GitHub Docs - About pull requests](https://docs.github.com/en/pull-requests)
- [GitHub Docs - About merge conflicts](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/addressing-merge-conflicts/about-merge-conflicts)
- [Quarto Docs - Inline code](https://quarto.org/docs/computations/inline-code.html)
- [Quarto Docs - Execution options](https://quarto.org/docs/computations/execution-options.html)
- [R for Data Science - Joins](https://r4ds.hadley.nz/joins.html)

Après les lectures, faites aussi le [mini-test formatif](../module_06/mini_test.llms.md). Il n’est pas noté.

# Bloc A - Comprendre les clés de jointure

## Exercice 1 - Importer les tables de collaboration

Importez `membres_equipe_fictif.csv` et `contributions_git_fictif.csv`, puis inspectez leurs dimensions.

> **NOTE:**
>
> ``` r
> membres <- read_csv(
>   "data/membres_equipe_fictif.csv",
>   show_col_types = FALSE
> )
>
> contributions <- read_csv(
>   "data/contributions_git_fictif.csv",
>   show_col_types = FALSE
> )
>
> glimpse(membres)
> ```
>
>     Rows: 8
>     Columns: 4
>     $ membre_id <chr> "M01", "M02", "M03", "M04", "M05", "M06", "M07", "M08"
>     $ nom       <chr> "Amina", "Leo", "Noah", "Emma", "Zoe", "Thomas", "Ines", "Ma…
>     $ role      <chr> "Responsable depot", "Analyste donnees", "Responsable reprod…
>     $ equipe    <chr> "Equipe A", "Equipe A", "Equipe A", "Equipe A", "Equipe B", …
>
> ``` r
> glimpse(contributions)
> ```
>
>     Rows: 12
>     Columns: 6
>     $ commit_id         <chr> "C001", "C002", "C003", "C004", "C005", "C006", "C00…
>     $ membre_id         <chr> "M01", "M02", "M03", "M04", "M02", "M03", "M09", "M0…
>     $ date_commit       <date> 2026-02-10, 2026-02-10, 2026-02-11, 2026-02-11, 202…
>     $ type_contribution <chr> "structure", "donnees", "reproductibilite", "interpr…
>     $ fichier           <chr> "README.md", "rapport.qmd", "rapport.qmd", "rapport.…
>     $ lignes_modifiees  <dbl> 32, 48, 21, 36, 44, 10, 7, 12, 51, 26, 33, 29
>
> ``` r
> tibble(
>   table = c("membres", "contributions"),
>   lignes = c(nrow(membres), nrow(contributions)),
>   colonnes = c(ncol(membres), ncol(contributions))
> )
> ```
>
>     # A tibble: 2 × 3
>       table         lignes colonnes
>       <chr>          <int>    <int>
>     1 membres            8        4
>     2 contributions     12        6

## Exercice 2 - Ajouter l’information sur les membres

Utilisez `left_join()` pour ajouter le nom, le rôle et l’équipe à chaque contribution.

> **NOTE:**
>
> ``` r
> contributions_detail <- contributions |>
>   left_join(membres, by = "membre_id")
>
> contributions_detail |>
>   select(commit_id, membre_id, nom, role, equipe, type_contribution, fichier) |>
>   arrange(commit_id)
> ```
>
>     # A tibble: 12 × 7
>        commit_id membre_id nom    role              equipe type_contribution fichier
>        <chr>     <chr>     <chr>  <chr>             <chr>  <chr>             <chr>
>      1 C001      M01       Amina  Responsable depot Equip… structure         README…
>      2 C002      M02       Leo    Analyste donnees  Equip… donnees           rappor…
>      3 C003      M03       Noah   Responsable repr… Equip… reproductibilite  rappor…
>      4 C004      M04       Emma   Communicatrice    Equip… interpretation    rappor…
>      5 C005      M02       Leo    Analyste donnees  Equip… visualisation     rappor…
>      6 C006      M03       Noah   Responsable repr… Equip… rendu             rappor…
>      7 C007      M09       <NA>   <NA>              <NA>   donnees           notes_…
>      8 C008      M01       Amina  Responsable depot Equip… merge             README…
>      9 C009      M06       Thomas Analyste donnees  Equip… donnees           rappor…
>     10 C010      M07       Ines   Responsable repr… Equip… reproductibilite  rappor…
>     11 C011      M08       Malik  Communicateur     Equip… interpretation    rappor…
>     12 C012      M05       Zoe    Responsable depot Equip… structure         README…

## Exercice 3 - Repérer les contributions sans membre connu

Utilisez `anti_join()` pour repérer les contributions dont `membre_id` n’apparaît pas dans la table des membres.

> **NOTE:**
>
> ``` r
> contributions |>
>   anti_join(membres, by = "membre_id")
> ```
>
>     # A tibble: 1 × 6
>       commit_id membre_id date_commit type_contribution fichier     lignes_modifiees
>       <chr>     <chr>     <date>      <chr>             <chr>                  <dbl>
>     1 C007      M09       2026-02-12  donnees           notes_temp…                7
>
> Cette vérification est utile avant de résumer le travail par personne. Une clé absente peut indiquer une erreur de saisie ou un membre non documenté.

## Exercice 4 - Identifier les membres qui ont contribué

Utilisez `semi_join()` pour obtenir la liste des membres qui ont au moins une contribution.

> **NOTE:**
>
> ``` r
> membres |>
>   semi_join(contributions, by = "membre_id") |>
>   arrange(equipe, role)
> ```
>
>     # A tibble: 8 × 4
>       membre_id nom    role                         equipe
>       <chr>     <chr>  <chr>                        <chr>
>     1 M02       Leo    Analyste donnees             Equipe A
>     2 M04       Emma   Communicatrice               Equipe A
>     3 M01       Amina  Responsable depot            Equipe A
>     4 M03       Noah   Responsable reproductibilite Equipe A
>     5 M06       Thomas Analyste donnees             Equipe B
>     6 M08       Malik  Communicateur                Equipe B
>     7 M05       Zoe    Responsable depot            Equipe B
>     8 M07       Ines   Responsable reproductibilite Equipe B

# Bloc B - Résumer un travail collaboratif

## Exercice 5 - Résumer les contributions par membre

Créez un tableau qui donne, pour chaque membre connu, le nombre de commits et le nombre total de lignes modifiées.

> **NOTE:**
>
> ``` r
> resume_membres <- contributions_detail |>
>   filter(!is.na(nom)) |>
>   group_by(equipe, nom, role) |>
>   summarise(
>     n_commits = n(),
>     lignes_modifiees = sum(lignes_modifiees),
>     .groups = "drop"
>   ) |>
>   arrange(equipe, desc(n_commits))
>
> resume_membres
> ```
>
>     # A tibble: 8 × 5
>       equipe   nom    role                         n_commits lignes_modifiees
>       <chr>    <chr>  <chr>                            <int>            <dbl>
>     1 Equipe A Amina  Responsable depot                    2               44
>     2 Equipe A Leo    Analyste donnees                     2               92
>     3 Equipe A Noah   Responsable reproductibilite         2               31
>     4 Equipe A Emma   Communicatrice                       1               36
>     5 Equipe B Ines   Responsable reproductibilite         1               26
>     6 Equipe B Malik  Communicateur                        1               33
>     7 Equipe B Thomas Analyste donnees                     1               51
>     8 Equipe B Zoe    Responsable depot                    1               29

## Exercice 6 - Visualiser l’activité de l’équipe

Produisez un graphique du nombre de commits par rôle.

> **NOTE:**
>
> ``` r
> resume_membres |>
>   ggplot(aes(x = role, y = n_commits, fill = equipe)) +
>   geom_col(position = "dodge") +
>   coord_flip() +
>   labs(
>     title = "Nombre de commits par rôle",
>     x = "Rôle",
>     y = "Nombre de commits",
>     fill = "Équipe"
>   )
> ```
>
> ![](exercices_files/figure-html/unnamed-chunk-6-1.png)

## Exercice 7 - Vérifier les fichiers attendus

Importez `fichiers_rapport_fictif.csv`. Pour chaque équipe, calculez le nombre de fichiers attendus présents et le nombre de fichiers manquants.

> **NOTE:**
>
> ``` r
> fichiers <- read_csv(
>   "data/fichiers_rapport_fictif.csv",
>   show_col_types = FALSE
> )
>
> resume_fichiers <- fichiers |>
>   mutate(present_logique = present == "oui") |>
>   group_by(equipe) |>
>   summarise(
>     fichiers_presents = sum(present_logique),
>     fichiers_manquants = sum(!present_logique),
>     taille_totale_ko = sum(taille_ko),
>     .groups = "drop"
>   )
>
> resume_fichiers
> ```
>
>     # A tibble: 3 × 4
>       equipe   fichiers_presents fichiers_manquants taille_totale_ko
>       <chr>                <int>              <int>            <dbl>
>     1 Equipe A                 3                  1              870
>     2 Equipe B                 3                  1              586
>     3 Equipe C                 2                  2              515

## Exercice 8 - Trouver les équipes avec un rapport HTML manquant

Filtrez les lignes où `fichier_attendu == "rapport.html"` et où le fichier est absent.

> **NOTE:**
>
> ``` r
> fichiers |>
>   filter(fichier_attendu == "rapport.html", present == "non")
> ```
>
>     # A tibble: 2 × 4
>       equipe   fichier_attendu present taille_ko
>       <chr>    <chr>           <chr>       <dbl>
>     1 Equipe B rapport.html    non             0
>     2 Equipe C rapport.html    non             0

# Bloc C - Issues et revue constructive

## Exercice 9 - Joindre les issues aux membres

Importez `issues_revue_fictif.csv`, puis ajoutez le nom et l’équipe de l’auteur de chaque issue.

> **NOTE:**
>
> ``` r
> issues <- read_csv(
>   "data/issues_revue_fictif.csv",
>   show_col_types = FALSE
> )
>
> issues_detail <- issues |>
>   left_join(membres, by = c("auteur_id" = "membre_id"))
>
> issues_detail |>
>   select(issue_id, equipe_revisee, auteur_id, nom, equipe, dimension, statut, priorite)
> ```
>
>     # A tibble: 7 × 8
>       issue_id equipe_revisee auteur_id nom    equipe   dimension    statut priorite
>       <chr>    <chr>          <chr>     <chr>  <chr>    <chr>        <chr>  <chr>
>     1 I001     Equipe A       M05       Zoe    Equipe B Reproductib… ouver… elevee
>     2 I002     Equipe A       M06       Thomas Equipe B Jointures    fermee elevee
>     3 I003     Equipe A       M07       Ines   Equipe B Visualisati… ouver… normale
>     4 I004     Equipe B       M01       Amina  Equipe A Clarte       fermee normale
>     5 I005     Equipe B       M02       Leo    Equipe A Interpretat… ouver… elevee
>     6 I006     Equipe B       M03       Noah   Equipe A GitHub       fermee basse
>     7 I007     Equipe C       M04       Emma   Equipe A Reproductib… ouver… normale

## Exercice 10 - Résumer les issues par équipe révisée

Calculez le nombre d’issues ouvertes, fermées et de priorité élevée pour chaque équipe révisée.

> **NOTE:**
>
> ``` r
> issues_detail |>
>   group_by(equipe_revisee) |>
>   summarise(
>     n_issues = n(),
>     n_ouvertes = sum(statut == "ouverte"),
>     n_fermees = sum(statut == "fermee"),
>     n_priorite_elevee = sum(priorite == "elevee"),
>     .groups = "drop"
>   ) |>
>   arrange(desc(n_ouvertes))
> ```
>
>     # A tibble: 3 × 5
>       equipe_revisee n_issues n_ouvertes n_fermees n_priorite_elevee
>       <chr>             <int>      <int>     <int>             <int>
>     1 Equipe A              3          2         1                 2
>     2 Equipe B              3          1         2                 1
>     3 Equipe C              1          1         0                 0

## Exercice 11 - Repérer les issues sans équipe connue

Les équipes A et B sont dans la table des membres. Utilisez une jointure ou une logique équivalente pour repérer les issues qui visent une équipe absente de la liste des équipes connues.

> **NOTE:**
>
> ``` r
> equipes_connues <- membres |>
>   distinct(equipe)
>
> issues |>
>   anti_join(equipes_connues, by = c("equipe_revisee" = "equipe"))
> ```
>
>     # A tibble: 1 × 7
>       issue_id equipe_revisee auteur_id date_issue dimension        statut  priorite
>       <chr>    <chr>          <chr>     <date>     <chr>            <chr>   <chr>
>     1 I007     Equipe C       M04       2026-02-16 Reproductibilite ouverte normale

## Exercice 12 - Rédiger une issue utile

Choisissez une issue ouverte et rédigez une version améliorée avec trois sections: aspect réussi, suggestion, justification.

> **NOTE:**
>
> ``` markdown
> ## Aspect réussi
>
> Le rapport indique clairement les packages utilisés et les principales étapes de préparation.
>
> ## Suggestion
>
> Ajouter une phrase qui explique la clé de jointure utilisée entre les contributions et les membres.
>
> ## Pourquoi cette suggestion est utile
>
> La revue devient plus facile à reproduire, car une autre équipe peut comprendre pourquoi `membre_id` est la bonne clé.
> ```

# Études de cas

## Étude de cas 1 - Audit fictif d’un dépôt de projet

Utilisez `membres_equipe_fictif.csv`, `contributions_git_fictif.csv`, `issues_revue_fictif.csv` et `fichiers_rapport_fictif.csv`.

Réalisez les tâches suivantes:

1.  joindre les contributions aux membres;
2.  repérer les contributions sans membre connu;
3.  produire un résumé par équipe;
4.  joindre les issues aux auteurs;
5.  repérer les équipes qui ont un `rapport.html` manquant;
6.  écrire une conclusion prudente sur la reproductibilité du dépôt.

> **NOTE:**
>
> ``` r
> audit_contributions <- contributions |>
>   left_join(membres, by = "membre_id")
>
> contributions_sans_membre <- contributions |>
>   anti_join(membres, by = "membre_id")
>
> resume_equipes <- audit_contributions |>
>   filter(!is.na(equipe)) |>
>   group_by(equipe) |>
>   summarise(
>     n_commits = n(),
>     n_membres_actifs = n_distinct(membre_id),
>     lignes_modifiees = sum(lignes_modifiees),
>     .groups = "drop"
>   )
>
> audit_issues <- issues |>
>   left_join(membres, by = c("auteur_id" = "membre_id"))
>
> rapports_manquants <- fichiers |>
>   filter(fichier_attendu == "rapport.html", present == "non")
>
> contributions_sans_membre
> ```
>
>     # A tibble: 1 × 6
>       commit_id membre_id date_commit type_contribution fichier     lignes_modifiees
>       <chr>     <chr>     <date>      <chr>             <chr>                  <dbl>
>     1 C007      M09       2026-02-12  donnees           notes_temp…                7
>
> ``` r
> resume_equipes
> ```
>
>     # A tibble: 2 × 4
>       equipe   n_commits n_membres_actifs lignes_modifiees
>       <chr>        <int>            <int>            <dbl>
>     1 Equipe A         7                4              203
>     2 Equipe B         4                4              139
>
> ``` r
> audit_issues
> ```
>
>     # A tibble: 7 × 10
>       issue_id equipe_revisee auteur_id date_issue dimension   statut priorite nom
>       <chr>    <chr>          <chr>     <date>     <chr>       <chr>  <chr>    <chr>
>     1 I001     Equipe A       M05       2026-02-15 Reproducti… ouver… elevee   Zoe
>     2 I002     Equipe A       M06       2026-02-15 Jointures   fermee elevee   Thom…
>     3 I003     Equipe A       M07       2026-02-15 Visualisat… ouver… normale  Ines
>     4 I004     Equipe B       M01       2026-02-15 Clarte      fermee normale  Amina
>     5 I005     Equipe B       M02       2026-02-16 Interpreta… ouver… elevee   Leo
>     6 I006     Equipe B       M03       2026-02-16 GitHub      fermee basse    Noah
>     7 I007     Equipe C       M04       2026-02-16 Reproducti… ouver… normale  Emma
>     # ℹ 2 more variables: role <chr>, equipe <chr>
>
> ``` r
> rapports_manquants
> ```
>
>     # A tibble: 2 × 4
>       equipe   fichier_attendu present taille_ko
>       <chr>    <chr>           <chr>       <dbl>
>     1 Equipe B rapport.html    non             0
>     2 Equipe C rapport.html    non             0
>
> Une conclusion prudente pourrait indiquer que l’équipe B semble avoir une trace de données présente, mais un rapport HTML manquant. Cette observation ne suffit pas à juger tout le projet; il faudrait aussi tenter de rendre le fichier `rapport.qmd`.

## Étude de cas 2 - Revue fictive d’un portail de données

Utilisez `portail_donnees_fictif.csv`, `producteurs_fictif.csv` et `commentaires_revue_fictif.csv`.

Réalisez les tâches suivantes:

1.  joindre les jeux de données aux producteurs;
2.  repérer les jeux de données sans producteur connu;
3.  joindre les commentaires aux jeux de données;
4.  compter les commentaires par dimension et sévérité;
5.  repérer les jeux de données avec licence inconnue;
6.  rédiger une issue de revue constructive pour un problème prioritaire.

> **NOTE:**
>
> ``` r
> portail <- read_csv(
>   "data/portail_donnees_fictif.csv",
>   show_col_types = FALSE
> )
>
> producteurs <- read_csv(
>   "data/producteurs_fictif.csv",
>   show_col_types = FALSE
> )
>
> commentaires <- read_csv(
>   "data/commentaires_revue_fictif.csv",
>   show_col_types = FALSE
> )
>
> portail_producteurs <- portail |>
>   left_join(producteurs, by = "producteur_id")
>
> jeux_sans_producteur <- portail |>
>   anti_join(producteurs, by = "producteur_id")
>
> commentaires_detail <- commentaires |>
>   left_join(portail, by = "jeu_id")
>
> resume_commentaires <- commentaires_detail |>
>   count(dimension, severite, sort = TRUE)
>
> licences_inconnues <- portail_producteurs |>
>   filter(licence == "Inconnue" | is.na(organisation))
>
> jeux_sans_producteur
> ```
>
>     # A tibble: 1 × 5
>       jeu_id titre         producteur_id licence mis_a_jour
>       <chr>  <chr>         <chr>         <chr>   <date>
>     1 D006   Supports velo P99           Ouverte 2026-02-06
>
> ``` r
> resume_commentaires
> ```
>
>     # A tibble: 6 × 3
>       dimension        severite     n
>       <chr>            <chr>    <int>
>     1 Documentation    basse        1
>     2 Interpretation   basse        1
>     3 Licence          elevee       1
>     4 Licence          normale      1
>     5 Producteur       elevee       1
>     6 Reproductibilite normale      1
>
> ``` r
> licences_inconnues
> ```
>
>     # A tibble: 2 × 8
>       jeu_id titre   producteur_id licence mis_a_jour organisation type_organisation
>       <chr>  <chr>   <chr>         <chr>   <date>     <chr>        <chr>
>     1 D004   Travau… P03           Inconn… 2025-12-18 Service tra… Municipal
>     2 D006   Suppor… P99           Ouverte 2026-02-06 <NA>         <NA>
>     # ℹ 1 more variable: contact_public <chr>
>
> Une issue prioritaire pourrait demander de clarifier la licence du jeu `Travaux routiers` avant diffusion. La justification est que la réutilisation des données dépend directement de la licence annoncée.
