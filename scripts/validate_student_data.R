#!/usr/bin/env Rscript

# Validate the course dataset manifest, exercise references and ZIP workspaces.
# Run from the repository root:
#   Rscript scripts/validate_student_data.R

manifest_path <- "data_catalog/course_datasets.tsv"
inventory_path <- "data_catalog/course_datasets_inventory.csv"
archive_directory <- "downloads/donnees"

stop_with <- function(...) stop(..., call. = FALSE)

if (!file.exists(manifest_path)) {
  stop_with("Missing manifest: ", manifest_path)
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

required_columns <- c(
  "id", "module", "archive_path", "path_fr", "path_en", "title_fr", "title_en",
  "description_fr", "description_en", "source_url", "license", "format", "rows", "cols"
)
missing_columns <- setdiff(required_columns, names(manifest))
if (length(missing_columns) > 0L) {
  stop_with("Missing manifest columns: ", paste(missing_columns, collapse = ", "))
}
if (anyDuplicated(manifest$id)) {
  stop_with("Dataset ids must be unique.")
}
if (!identical(sort(unique(manifest$module)), 1:10)) {
  stop_with("The manifest must cover modules 1 through 10.")
}

for (language in c("fr", "en")) {
  source_column <- paste0("path_", language)
  missing_sources <- manifest[[source_column]][!file.exists(manifest[[source_column]])]
  if (length(missing_sources) > 0L) {
    stop_with("Missing ", language, " source files: ", paste(missing_sources, collapse = ", "))
  }

  for (module in 1:10) {
    module_label <- sprintf("%02d", module)
    exercise_path <- if (language == "fr") {
      file.path(paste0("module_", module_label), "exercices.qmd")
    } else {
      file.path("en", paste0("module_", module_label), "exercices.qmd")
    }
    exercise_text <- paste(readLines(exercise_path, warn = FALSE, encoding = "UTF-8"), collapse = "\n")
    rows <- manifest[manifest$module == module, , drop = FALSE]
    archive_paths <- if (language == "fr") {
      rows$archive_path
    } else {
      sub("^en/module_[0-9]{2}/", "", rows$path_en)
    }
    missing_references <- archive_paths[!vapply(archive_paths, grepl, logical(1), x = exercise_text, fixed = TRUE)]
    if (length(missing_references) > 0L) {
      stop_with(
        "Manifest files not referenced by ", exercise_path, ": ",
        paste(missing_references, collapse = ", ")
      )
    }

    archive_path <- file.path(
      archive_directory,
      paste0("stt1100-module-", module_label, "-", language, ".zip")
    )
    if (!file.exists(archive_path)) {
      stop_with("Missing student archive: ", archive_path)
    }
    archive_files <- utils::unzip(archive_path, list = TRUE)$Name
    expected_prefix <- paste0("stt1100-module-", module_label, "-", language, "/")
    expected_files <- paste0(expected_prefix, archive_paths)
    missing_archive_files <- setdiff(expected_files, archive_files)
    if (length(missing_archive_files) > 0L) {
      stop_with(
        "Missing files in ", archive_path, ": ",
        paste(missing_archive_files, collapse = ", ")
      )
    }
    if (!any(grepl("\\.Rproj$", archive_files))) {
      stop_with("No RStudio project in ", archive_path)
    }
  }
}

if (!file.exists(inventory_path)) {
  stop_with("Missing generated inventory: ", inventory_path)
}
inventory <- utils::read.csv(inventory_path, stringsAsFactors = FALSE, fileEncoding = "UTF-8")
if (nrow(inventory) != 2L * nrow(manifest)) {
  stop_with("The generated inventory does not cover both languages.")
}

message(
  "Validated ", nrow(manifest), " manifest records and ",
  length(list.files(archive_directory, pattern = "\\.zip$")), " student workspaces."
)
