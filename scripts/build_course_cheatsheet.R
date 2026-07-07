#!/usr/bin/env Rscript

command_args <- commandArgs(trailingOnly = FALSE)
file_arg <- command_args[startsWith(command_args, "--file=")]
script_path <- if (length(file_arg) > 0) {
  normalizePath(sub("^--file=", "", file_arg[1]), mustWork = TRUE)
} else {
  normalizePath(file.path("scripts", "build_course_cheatsheet.R"), mustWork = TRUE)
}
repo_root <- normalizePath(file.path(dirname(script_path), ".."), mustWork = TRUE)
setwd(repo_root)

pdfunite <- Sys.which("pdfunite")
if (!nzchar(pdfunite)) {
  stop("The pdfunite command is required to build the course cheat sheet.", call. = FALSE)
}

cheatsheets <- data.frame(
  file = c(
    "rstudio-ide.pdf",
    "quarto.pdf",
    "data-transformation.pdf",
    "data-visualization.pdf",
    "data-import.pdf",
    "strings.pdf",
    "factors.pdf",
    "tidyr.pdf",
    "lubridate.pdf",
    "purrr.pdf",
    "rmarkdown.pdf",
    "shiny.pdf"
  ),
  title = c(
    "RStudio IDE",
    "Publish and Share with Quarto",
    "Data transformation with dplyr",
    "Data visualization with ggplot2",
    "Data import with the tidyverse",
    "String manipulation with stringr",
    "Factors with forcats",
    "Data tidying with tidyr",
    "Dates and times with lubridate",
    "Apply functions with purrr",
    "rmarkdown",
    "Shiny for R"
  ),
  stringsAsFactors = FALSE
)

base_url <- "https://rstudio.github.io/cheatsheets"
download_dir <- file.path(tempdir(), "stt1100-posit-cheatsheets")
if (dir.exists(download_dir)) {
  unlink(download_dir, recursive = TRUE, force = TRUE)
}
dir.create(download_dir, recursive = TRUE, showWarnings = FALSE)

downloaded <- file.path(download_dir, cheatsheets$file)
for (i in seq_along(downloaded)) {
  url <- paste(base_url, cheatsheets$file[i], sep = "/")
  message("Downloading: ", cheatsheets$title[i], " -> ", url)
  status <- try(
    utils::download.file(url, downloaded[i], mode = "wb", quiet = TRUE),
    silent = TRUE
  )
  if (inherits(status, "try-error") || !file.exists(downloaded[i]) || file.size(downloaded[i]) == 0) {
    stop("Failed to download Posit cheat sheet: ", url, call. = FALSE)
  }
}

tmp_output <- tempfile("stt1100-cheatsheet-", fileext = ".pdf")
exit_code <- system2(pdfunite, c(downloaded, tmp_output))
if (!identical(exit_code, 0L) || !file.exists(tmp_output) || file.size(tmp_output) == 0) {
  stop("Failed to concatenate Posit cheat sheets with pdfunite.", call. = FALSE)
}

output_paths <- c(
  file.path("docs", "autre_materiel", "Cheat sheet", "stt1100_cheatsheet_mod.pdf"),
  file.path("docs", "en", "autre_materiel", "Cheat sheet", "stt1100_cheatsheet_mod.pdf")
)

for (output_path in output_paths) {
  dir.create(dirname(output_path), recursive = TRUE, showWarnings = FALSE)
  copied <- file.copy(tmp_output, output_path, overwrite = TRUE)
  if (!copied) {
    stop("Failed to write course cheat sheet: ", output_path, call. = FALSE)
  }
  message("Wrote: ", output_path)
}
