#!/usr/bin/env Rscript

command_args <- commandArgs(trailingOnly = FALSE)
file_arg <- command_args[startsWith(command_args, "--file=")]
script_path <- if (length(file_arg) > 0) {
  normalizePath(sub("^--file=", "", file_arg[1]), mustWork = TRUE)
} else {
  normalizePath(file.path("scripts", "render_site.R"), mustWork = TRUE)
}
repo_root <- normalizePath(file.path(dirname(script_path), ".."), mustWork = TRUE)
setwd(repo_root)

run_quarto <- function(args) {
  command <- paste(c("quarto", args), collapse = " ")
  message("Running: ", command)
  exit_code <- system2("quarto", args)
  if (!identical(exit_code, 0L)) {
    stop("Command failed: ", command, call. = FALSE)
  }
}

clean_paths <- c(
  "docs",
  "en/docs",
  "site_libs",
  "en/site_libs",
  "docs/site_libs 2",
  "index.html"
)

remove_paths <- function(paths) {
  for (path in paths[file.exists(paths)]) {
    unlink(path, recursive = TRUE, force = TRUE)
    if (file.exists(path)) {
      remove_exit <- system2("rm", c("-rf", path))
      if (!identical(remove_exit, 0L) || file.exists(path)) {
        stop("Failed to remove generated path: ", path, call. = FALSE)
      }
    }
  }
}

remove_paths(clean_paths)

module_html <- list.files(
  ".",
  pattern = "\\.html$",
  recursive = TRUE,
  full.names = TRUE,
  no.. = TRUE
)
module_html <- module_html[!startsWith(module_html, "./docs/")]
module_html <- module_html[basename(module_html) != "toggle-sidebar.html"]
if (length(module_html) > 0) {
  unlink(module_html, force = TRUE)
}

generated_dirs <- list.files(
  ".",
  pattern = "_files$",
  recursive = TRUE,
  full.names = TRUE,
  no.. = TRUE
)
generated_dirs <- generated_dirs[!startsWith(generated_dirs, "./docs/")]
if (length(generated_dirs) > 0) {
  unlink(generated_dirs, recursive = TRUE, force = TRUE)
}

run_quarto(c("render", "."))
run_quarto(c("render", "en"))

remove_paths(file.path("docs", "en"))
dir.create(file.path("docs", "en"), recursive = TRUE, showWarnings = FALSE)
english_output <- list.files(
  file.path("en", "docs"),
  all.files = TRUE,
  no.. = TRUE,
  full.names = TRUE
)
if (length(english_output) == 0) {
  stop("English render did not produce files in en/docs.", call. = FALSE)
}
copy_exit <- system2("cp", c("-R", file.path("en", "docs", "."), file.path("docs", "en")))
if (!identical(copy_exit, 0L)) {
  stop("Failed to copy English render output to docs/en.", call. = FALSE)
}

remove_paths(c("en/docs", "site_libs", "en/site_libs"))

duplicate_outputs <- list.files(
  "docs",
  pattern = " [0-9]+\\.",
  recursive = TRUE,
  full.names = TRUE
)
remove_paths(duplicate_outputs)

message("Done: rendered French site to docs/ and English site to docs/en/.")
