#!/usr/bin/env Rscript

command_args <- commandArgs(trailingOnly = FALSE)
file_arg <- command_args[startsWith(command_args, "--file=")]
script_path <- if (length(file_arg) > 0) {
  normalizePath(sub("^--file=", "", file_arg[1]), mustWork = TRUE)
} else {
  normalizePath(file.path("scripts", "build_mini_test_diagnostics.R"), mustWork = TRUE)
}

repo_root <- normalizePath(file.path(dirname(script_path), ".."), mustWork = TRUE)
setwd(repo_root)

expected_questions <- c(8L, rep(12L, 9L))

diagnostic_intro <- function(module_number, lang) {
  module_display <- as.integer(module_number)

  if (identical(lang, "fr")) {
    return(c(
      sprintf("Cet autodiagnostic non noté vérifie les notions du module %d. Il produit une correction détaillée, un résultat global, un bilan par compétence et un plan de révision ciblé.", module_display),
      "",
      "::: {.callout-note}",
      "## Modalités",
      "",
      "- Première tentative: sans documentation, sans exécuter le code et sans aide extérieure, afin d'obtenir un portrait honnête.",
      "- Après le bilan: consultez les ressources proposées, refaites les exercices ciblés, puis reprenez le diagnostic.",
      "- Usage: ce diagnostic n'est pas noté et ne sert ni à attribuer une note ni à décider de l'admission au cours.",
      "- Confidentialité: aucune réponse n'est transmise à l'enseignant. La progression et l'historique sont conservés uniquement dans ce navigateur.",
      ":::",
      "",
      "Les seuils sont des repères pédagogiques propres à STT-1100. Ils n'ont pas fait l'objet d'une validation psychométrique. Une réponse exacte peut aussi résulter du hasard; les exercices pratiques demeurent donc essentiels.",
      "",
      "```{=html}",
      sprintf("<div data-stt-mini-test-diagnostic data-module=\"%02d\" data-lang=\"fr\"></div>", module_display),
      "```",
      ""
    ))
  }

  c(
    sprintf("This ungraded diagnostic checks the concepts from module %d. It provides detailed correction, an overall result, a competency profile and a targeted review plan.", module_display),
    "",
    "::: {.callout-note}",
    "## How to use it",
    "",
    "- First attempt: without documentation, without running the code and without outside help, to obtain an honest profile.",
    "- After the summary: consult the suggested resources, redo the targeted exercises and then retake the diagnostic.",
    "- Purpose: this diagnostic is ungraded and is not used to assign a mark or decide admission to the course.",
    "- Privacy: no answer is sent to the instructor. Progress and attempt history are stored only in this browser.",
    ":::",
    "",
    "The thresholds are STT-1100 pedagogical guideposts. They have not undergone psychometric validation. A correct answer may also result from chance, so practical exercises remain essential.",
    "",
    "```{=html}",
    sprintf("<div data-stt-mini-test-diagnostic data-module=\"%02d\" data-lang=\"en\"></div>", module_display),
    "```",
    ""
  )
}

update_mini_test <- function(path, module_number, lang, expected_count) {
  lines <- readLines(path, warn = FALSE, encoding = "UTF-8")
  question_lines <- grep("^## Question [0-9]+$", lines)

  if (length(question_lines) != expected_count) {
    stop(
      sprintf("%s contains %d questions; expected %d.", path, length(question_lines), expected_count),
      call. = FALSE
    )
  }

  question_numbers <- as.integer(sub("^## Question ", "", lines[question_lines]))
  if (!identical(question_numbers, seq_len(expected_count))) {
    stop("Question numbering is not consecutive in ", path, call. = FALSE)
  }

  if (any(grepl("data-stt-mini-test-diagnostic", lines, fixed = TRUE))) {
    redundant_heading <- if (identical(lang, "fr")) {
      sprintf("# Autodiagnostic du module %d", as.integer(module_number))
    } else {
      sprintf("# Module %d diagnostic", as.integer(module_number))
    }
    heading_line <- which(lines == redundant_heading)

    if (length(heading_line) > 1L) {
      stop("Multiple redundant headings found in ", path, call. = FALSE)
    }

    if (length(heading_line) == 1L) {
      lines <- lines[-heading_line]
      if (heading_line <= length(lines) && !nzchar(lines[heading_line])) {
        lines <- lines[-heading_line]
      }
      writeLines(lines, path, useBytes = TRUE)
      message("Removed redundant heading: ", path)
      return(invisible(TRUE))
    }

    message("Already configured: ", path)
    return(invisible(FALSE))
  }

  title <- if (identical(lang, "fr")) {
    sprintf("title: \"Autodiagnostic - Module %d\"", as.integer(module_number))
  } else {
    sprintf("title: \"Diagnostic - Module %d\"", as.integer(module_number))
  }
  lines[grep("^title:", lines)[1]] <- title

  css_path <- if (identical(lang, "fr")) {
    "../css/mini-test-diagnostic.css"
  } else {
    "../../css/mini-test-diagnostic.css"
  }
  embed_line <- grep("^    embed-resources: true$", lines)[1]
  if (is.na(embed_line)) {
    stop("Missing embed-resources: true in ", path, call. = FALSE)
  }
  lines <- append(lines, sprintf("    css: %s", css_path), after = embed_line)

  first_heading <- grep(
    "^# (Mini-test formatif|Formative mini-test)$",
    lines,
    ignore.case = TRUE
  )[1]
  first_question <- grep("^## Question 1$", lines)[1]
  if (is.na(first_heading) || is.na(first_question) || first_heading >= first_question) {
    stop("Unexpected introductory structure in ", path, call. = FALSE)
  }

  question_bank <- lines[first_question:length(lines)]
  lines <- c(
    lines[seq_len(first_heading - 1L)],
    diagnostic_intro(module_number, lang),
    question_bank,
    "",
    "```{=html}",
    sprintf(
      "<script src=\"%s\"></script>",
      if (identical(lang, "fr")) "../assets/js/mini-test-diagnostic.js" else "../../assets/js/mini-test-diagnostic.js"
    ),
    "```"
  )

  output_question_lines <- grep("^## Question [0-9]+$", lines)
  if (length(output_question_lines) != expected_count) {
    stop("Question bank changed unexpectedly for ", path, call. = FALSE)
  }

  writeLines(lines, path, useBytes = TRUE)
  message("Updated: ", path)
  invisible(TRUE)
}

updated <- 0L
for (module_index in seq_len(10L)) {
  module_number <- sprintf("%02d", module_index)
  fr_path <- file.path(sprintf("module_%s", module_number), "mini_test.qmd")
  en_path <- file.path("en", sprintf("module_%s", module_number), "mini_test.qmd")

  updated <- updated + as.integer(update_mini_test(
    fr_path,
    module_number,
    "fr",
    expected_questions[module_index]
  ))
  updated <- updated + as.integer(update_mini_test(
    en_path,
    module_number,
    "en",
    expected_questions[module_index]
  ))
}

message("Mini-test diagnostic pages updated: ", updated)
