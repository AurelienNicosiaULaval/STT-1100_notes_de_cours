#!/usr/bin/env Rscript

# Build self-contained student workspaces for the consolidation exercises.
# Run from the repository root:
#   Rscript scripts/build_student_data_kits.R

required_packages <- c("digest")
missing_packages <- required_packages[!vapply(required_packages, requireNamespace, logical(1), quietly = TRUE)]
if (length(missing_packages) > 0L) {
  stop(
    "Missing required package(s): ",
    paste(missing_packages, collapse = ", "),
    call. = FALSE
  )
}

manifest_path <- "data_catalog/course_datasets.tsv"
output_directory <- "downloads/donnees"
inventory_path <- "data_catalog/course_datasets_inventory.csv"
site_root <- "https://aureliennicosiaulaval.github.io/STT-1100_notes_de_cours"

if (!file.exists(manifest_path)) {
  stop("Run this script from the repository root.", call. = FALSE)
}

manifest <- utils::read.delim(
  manifest_path,
  sep = "\t",
  quote = "",
  stringsAsFactors = FALSE,
  check.names = FALSE,
  fileEncoding = "UTF-8",
  na.strings = c("", "NA")
)

manifest$module <- as.integer(manifest$module)
manifest$rows <- as.integer(manifest$rows)
manifest$cols <- as.integer(manifest$cols)

dir.create(output_directory, recursive = TRUE, showWarnings = FALSE)
old_archives <- list.files(output_directory, pattern = "^stt1100-module-[0-9]{2}-(fr|en)\\.zip$", full.names = TRUE)
unlink(old_archives)

write_rproj <- function(path) {
  writeLines(
    c(
      "Version: 1.0",
      "RestoreWorkspace: No",
      "SaveWorkspace: No",
      "AlwaysSaveHistory: No",
      "EnableCodeIndexing: Yes",
      "UseSpacesForTab: Yes",
      "NumSpacesForTab: 2",
      "Encoding: UTF-8",
      "RnwWeave: knitr",
      "LaTeX: pdfLaTeX"
    ),
    path,
    useBytes = TRUE
  )
}

markdown_table <- function(rows, language) {
  title_column <- paste0("title_", language)
  header <- if (language == "fr") {
    c("| Fichier | Description | Source et licence |", "|---|---|---|")
  } else {
    c("| File | Description | Source and licence |", "|---|---|---|")
  }
  description_column <- paste0("description_", language)
  lines <- vapply(seq_len(nrow(rows)), function(index) {
    row <- rows[index, ]
    source_link <- if (is.na(row$source_url) || row$source_url == "") {
      row$license
    } else {
      paste0("[", if (language == "fr") "Source" else "Source", "](", row$source_url, ") - ", row$license)
    }
    paste0(
      "| `", row$archive_path, "` | ", row[[description_column]],
      " | ", source_link, " |"
    )
  }, character(1))
  c(header, lines)
}

workspace_readme <- function(module, language, rows) {
  module_label <- sprintf("%02d", module)
  exercise_url <- paste0(
    site_root,
    if (language == "en") "/en" else "",
    "/module_", module_label, "/exercices.html"
  )
  if (language == "fr") {
    c(
      paste0("# STT-1100 - Module ", module_label),
      "",
      "Ce dossier contient tous les fichiers nécessaires aux exercices de consolidation du module.",
      "",
      "## Démarrage",
      "",
      "1. Ouvrez le fichier `.Rproj` de ce dossier.",
      "2. Ouvrez `travail_module.qmd`.",
      paste0("3. Consultez les [consignes des exercices]", "(", exercise_url, ")."),
      "4. Conservez les fichiers dans leur dossier actuel afin que les chemins relatifs fonctionnent.",
      "",
      "Les solutions ne sont pas incluses dans ce dossier de travail.",
      "",
      "## Fichiers fournis",
      "",
      markdown_table(rows, language)
    )
  } else {
    c(
      paste0("# STT-1100 - Module ", module_label),
      "",
      "This folder contains every file required for the module's consolidation exercises.",
      "",
      "## Getting started",
      "",
      "1. Open the `.Rproj` file in this folder.",
      "2. Open `module_workspace.qmd`.",
      paste0("3. Read the [exercise instructions]", "(", exercise_url, ")."),
      "4. Keep the supplied files in their current folders so that relative paths continue to work.",
      "",
      "Solutions are not included in this workspace.",
      "",
      "## Supplied files",
      "",
      markdown_table(rows, language)
    )
  }
}

workspace_qmd <- function(module, language, rows) {
  module_label <- sprintf("%02d", module)
  filenames <- paste0('  "', rows$archive_path, '"', collapse = ",\n")
  exercise_url <- paste0(
    site_root,
    if (language == "en") "/en" else "",
    "/module_", module_label, "/exercices.html"
  )
  if (language == "fr") {
    c(
      "---",
      paste0("title: \"Module ", module_label, " - Espace de travail\""),
      "lang: fr",
      "format:",
      "  html:",
      "    embed-resources: true",
      "execute:",
      "  warning: false",
      "  message: false",
      "---",
      "",
      paste0("Consultez les [consignes des exercices]", "(", exercise_url, "). Les solutions restent sur le site et sont repliées."),
      "",
      "## Vérifier les fichiers",
      "",
      "```{r}",
      "fichiers_requis <- c(",
      filenames,
      ")",
      "",
      "fichiers_manquants <- fichiers_requis[!file.exists(fichiers_requis)]",
      "",
      "if (length(fichiers_manquants) > 0) {",
      "  stop(\"Fichiers manquants: \", paste(fichiers_manquants, collapse = \", \"))",
      "}",
      "",
      "message(\"Tous les fichiers du module sont disponibles.\")",
      "```",
      "",
      "## Mon travail",
      "",
      "Ajoutez ici vos blocs de code et vos interprétations."
    )
  } else {
    c(
      "---",
      paste0("title: \"Module ", module_label, " - Workspace\""),
      "lang: en",
      "format:",
      "  html:",
      "    embed-resources: true",
      "execute:",
      "  warning: false",
      "  message: false",
      "---",
      "",
      paste0("Read the [exercise instructions]", "(", exercise_url, "). Solutions remain collapsed on the course site."),
      "",
      "## Check the files",
      "",
      "```{r}",
      "required_files <- c(",
      filenames,
      ")",
      "",
      "missing_files <- required_files[!file.exists(required_files)]",
      "",
      "if (length(missing_files) > 0) {",
      "  stop(\"Missing files: \", paste(missing_files, collapse = \", \"))",
      "}",
      "",
      "message(\"All module files are available.\")",
      "```",
      "",
      "## My work",
      "",
      "Add your code blocks and interpretations here."
    )
  }
}

inventory <- list()

for (language in c("fr", "en")) {
  source_column <- paste0("path_", language)
  for (module in sort(unique(manifest$module))) {
    rows <- manifest[manifest$module == module, , drop = FALSE]
    if (language == "en") {
      rows$archive_path <- sub(
        "^en/module_[0-9]{2}/",
        "",
        rows$path_en
      )
    }
    module_label <- sprintf("%02d", module)
    kit_name <- paste0("stt1100-module-", module_label, "-", language)
    temporary_parent <- tempfile(paste0("stt1100-kit-", module_label, "-", language, "-"))
    kit_directory <- file.path(temporary_parent, kit_name)
    dir.create(kit_directory, recursive = TRUE)

    for (index in seq_len(nrow(rows))) {
      source_path <- rows[[source_column]][index]
      destination_path <- file.path(kit_directory, rows$archive_path[index])
      if (!file.exists(source_path)) {
        stop("Missing source file: ", source_path, call. = FALSE)
      }
      dir.create(dirname(destination_path), recursive = TRUE, showWarnings = FALSE)
      if (!file.copy(source_path, destination_path, overwrite = TRUE, copy.mode = TRUE)) {
        stop("Could not copy ", source_path, call. = FALSE)
      }
      inventory[[length(inventory) + 1L]] <- data.frame(
        id = rows$id[index],
        module = module,
        language = language,
        source_path = source_path,
        archive_path = rows$archive_path[index],
        sha256 = digest::digest(file = source_path, algo = "sha256"),
        stringsAsFactors = FALSE
      )
    }

    readme_name <- if (language == "fr") "LISEZ-MOI.md" else "README.md"
    qmd_name <- if (language == "fr") "travail_module.qmd" else "module_workspace.qmd"
    writeLines(workspace_readme(module, language, rows), file.path(kit_directory, readme_name), useBytes = TRUE)
    writeLines(workspace_qmd(module, language, rows), file.path(kit_directory, qmd_name), useBytes = TRUE)
    write_rproj(file.path(kit_directory, paste0(kit_name, ".Rproj")))

    archive_path <- file.path(
      normalizePath(output_directory, mustWork = TRUE),
      paste0(kit_name, ".zip")
    )
    old_working_directory <- getwd()
    setwd(temporary_parent)
    on.exit(setwd(old_working_directory), add = TRUE)
    result <- utils::zip(archive_path, files = kit_name, flags = "-r9X")
    setwd(old_working_directory)
    if (!file.exists(archive_path) || length(result) == 0L) {
      stop("Could not create ", archive_path, call. = FALSE)
    }
    unlink(temporary_parent, recursive = TRUE)
  }
}

inventory <- do.call(rbind, inventory)
utils::write.csv(inventory, inventory_path, row.names = FALSE, na = "", fileEncoding = "UTF-8")

message(
  "Built ",
  length(list.files(output_directory, pattern = "\\.zip$")),
  " student workspaces in ",
  output_directory,
  "."
)
