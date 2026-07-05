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

run_quarto <- function(args, wd = getwd()) {
  command <- paste(c("quarto", args), collapse = " ")
  message("Running: ", command)
  old_wd <- getwd()
  setwd(wd)
  on.exit(setwd(old_wd), add = TRUE)
  exit_code <- system2("quarto", args)
  if (!identical(exit_code, 0L)) {
    stop("Command failed: ", command, call. = FALSE)
  }
}

run_rsync <- function(args, error_message) {
  command <- paste(c("rsync", args), collapse = " ")
  message("Running: ", command)

  output <- system2("rsync", args, stdout = TRUE, stderr = TRUE)
  exit_code <- attr(output, "status", exact = TRUE)
  if (is.null(exit_code)) {
    exit_code <- 0L
  }

  if (!identical(as.integer(exit_code), 0L)) {
    details <- paste(output, collapse = "\n")
    if (nzchar(details)) {
      stop(paste(error_message, details, sep = "\n"), call. = FALSE)
    }
    stop(error_message, call. = FALSE)
  }

  invisible(output)
}

clean_paths <- c(
  ".quarto",
  "en/.quarto",
  "docs",
  "en/docs",
  "site_libs",
  "en/site_libs",
  "docs/site_libs 2",
  "index.html"
)

static_redirect_html <- c(
  "autre_materiel/Aide mémoire Rstudio et Github.html",
  "autre_materiel/Ou et comment chercher/ou et comment chercher.html",
  "autre_materiel/Présentation des différents rôles/roles_presentation.html",
  "autre_materiel/Présentation des différents rôles/roles_presentation_v2.html",
  "en/autre_materiel/Aide mémoire Rstudio et Github.html",
  "en/autre_materiel/Ou et comment chercher/ou et comment chercher.html",
  "en/autre_materiel/Présentation des différents rôles/roles_presentation.html",
  "en/autre_materiel/Présentation des différents rôles/roles_presentation_v2.html"
)

remove_paths <- function(paths) {
  for (path in unique(paths[file.exists(paths)])) {
    unlink(path, recursive = TRUE, force = TRUE)
    if (file.exists(path)) {
      Sys.sleep(0.2)
      unlink(path, recursive = TRUE, force = TRUE)
    }
    if (file.exists(path)) {
      stop("Failed to remove generated path: ", path, call. = FALSE)
    }
  }
}

replace_directory <- function(source, target) {
  if (!dir.exists(source)) {
    stop("Replacement source directory does not exist: ", source, call. = FALSE)
  }

  target_parent <- dirname(target)
  dir.create(target_parent, recursive = TRUE, showWarnings = FALSE)
  backup <- tempfile(paste0(basename(target), "-backup-"), tmpdir = target_parent)

  if (file.exists(target)) {
    message("Moving existing directory to backup: ", backup)
    if (!file.rename(target, backup)) {
      stop("Failed to move existing directory to backup: ", target, call. = FALSE)
    }
  }

  message("Moving rendered directory into place: ", target)
  if (!file.rename(source, target)) {
    if (file.exists(backup) && !file.exists(target)) {
      file.rename(backup, target)
    }
    stop("Failed to move rendered directory into place: ", target, call. = FALSE)
  }

  if (file.exists(backup)) {
    remove_paths(backup)
  }
}

sync_source_to_render_root <- function(source_root, render_root) {
  should_skip <- function(rel_path, is_dir) {
    parts <- strsplit(rel_path, "/", fixed = TRUE)[[1]]
    base <- tail(parts, 1)
    is_module_data_html <- !is_dir &&
      grepl("(^|/)module_08/data/[^/]+\\.html$", rel_path)
    is_static_redirect_html <- !is_dir && rel_path %in% static_redirect_html

    if (parts[1] %in% c(".git", "docs")) return(TRUE)
    if (grepl("^docs [0-9]+$", parts[1])) return(TRUE)
    if (length(parts) >= 2 && parts[1] == "en" && grepl("^docs( [0-9]+)?$", parts[2])) {
      return(TRUE)
    }
    if (any(parts %in% c(".Rproj.user", "site_libs", "en/site_libs"))) return(TRUE)
    if (any(grepl("^site_libs [0-9]+$", parts))) return(TRUE)
    if (any(grepl("^\\.quarto", parts))) return(TRUE)
    if (base %in% c(".Rhistory", ".RData", ".DS_Store")) return(TRUE)
    if (is_dir && grepl("_files$", base)) return(TRUE)
    if (!is_dir && grepl("\\.rmarkdown$", base)) return(TRUE)
    if (!is_dir && grepl("\\.llms\\.md$", base)) return(TRUE)
    if (!is_dir && identical(base, "llms.txt")) return(TRUE)
    if (!is_dir && grepl("\\.html$", base) && !identical(base, "language-switch.html") && !is_module_data_html && !is_static_redirect_html) {
      return(TRUE)
    }

    FALSE
  }

  copy_tree <- function(current_source, current_rel = "") {
    entries <- list.files(
      current_source,
      all.files = TRUE,
      no.. = TRUE,
      full.names = TRUE
    )

    for (entry in entries) {
      rel_path <- if (nzchar(current_rel)) {
        file.path(current_rel, basename(entry))
      } else {
        basename(entry)
      }
      is_dir <- dir.exists(entry)

      if (should_skip(rel_path, is_dir)) {
        next
      }

      target <- file.path(render_root, rel_path)
      if (is_dir) {
        dir.create(target, recursive = TRUE, showWarnings = FALSE)
        copy_tree(entry, rel_path)
      } else {
        dir.create(dirname(target), recursive = TRUE, showWarnings = FALSE)
        ok <- file.copy(entry, target, overwrite = TRUE, copy.mode = TRUE, copy.date = TRUE)
        if (!ok) {
          stop("Failed to copy source file: ", rel_path, call. = FALSE)
        }
      }
    }
  }

  message("Copying source files to temporary render directory.")
  copy_tree(source_root)
}

find_quarto_cache_paths <- function() {
  c(
    list.files(".", pattern = "^\\.quarto", all.files = TRUE, full.names = TRUE, recursive = FALSE),
    list.files("en", pattern = "^\\.quarto", all.files = TRUE, full.names = TRUE, recursive = FALSE)
  )
}

remove_generated_duplicates <- function() {
  duplicate_paths <- c(
    list.files("docs", pattern = " [0-9]+$", full.names = TRUE, recursive = FALSE),
    list.files(".", pattern = "^site_libs [0-9]+$", full.names = TRUE, recursive = FALSE),
    list.files("en", pattern = "^site_libs [0-9]+$", full.names = TRUE, recursive = FALSE)
  )
  remove_paths(duplicate_paths)
}

merge_directory_contents <- function(source, target) {
  dir.create(target, recursive = TRUE, showWarnings = FALSE)

  entries <- list.files(
    source,
    all.files = TRUE,
    no.. = TRUE,
    full.names = TRUE
  )

  for (entry in entries) {
    destination <- file.path(target, basename(entry))

    if (dir.exists(entry)) {
      merge_directory_contents(entry, destination)
      next
    }

    dir.create(dirname(destination), recursive = TRUE, showWarnings = FALSE)
    copied <- file.copy(
      entry,
      destination,
      overwrite = TRUE,
      copy.mode = TRUE,
      copy.date = TRUE
    )

    if (!copied) {
      stop("Failed to merge generated file: ", entry, call. = FALSE)
    }
  }

  remove_paths(source)
}

copy_static_redirects <- function(source_root, docs_root = "docs") {
  for (rel_path in static_redirect_html) {
    source <- file.path(source_root, rel_path)
    if (!file.exists(source)) {
      stop("Missing static redirect source: ", rel_path, call. = FALSE)
    }

    target <- file.path(docs_root, rel_path)
    dir.create(dirname(target), recursive = TRUE, showWarnings = FALSE)
    copied <- file.copy(
      source,
      target,
      overwrite = TRUE,
      copy.mode = TRUE,
      copy.date = TRUE
    )

    if (!copied) {
      stop("Failed to copy static redirect: ", rel_path, call. = FALSE)
    }
  }
}

normalize_numbered_directories <- function(root = "docs") {
  if (!dir.exists(root)) {
    return(invisible())
  }

  directories <- list.dirs(root, recursive = TRUE, full.names = TRUE)
  numbered_directories <- directories[grepl(" [0-9]+$", basename(directories))]

  if (length(numbered_directories) == 0) {
    return(invisible())
  }

  depths <- lengths(strsplit(numbered_directories, .Platform$file.sep, fixed = TRUE))
  numbered_directories <- numbered_directories[order(depths, decreasing = TRUE)]

  for (path in numbered_directories) {
    target <- file.path(dirname(path), sub(" [0-9]+$", "", basename(path)))

    if (dir.exists(target)) {
      merge_directory_contents(path, target)
      next
    }

    if (!file.rename(path, target)) {
      stop("Failed to normalize generated directory: ", path, call. = FALSE)
    }
  }

  invisible()
}

find_generated_source_paths <- function(root) {
  old_wd <- getwd()
  setwd(root)
  on.exit(setwd(old_wd), add = TRUE)

  args <- c(
    ".",
    "(", "-path", "./.git", "-o", "-path", "./docs", "-o", "-path", "./en/docs", ")",
    "-prune",
    "-o",
    "(",
    "-type", "d",
    "(",
    "-name", ".quarto*",
    "-o", "-name", "site_libs*",
    "-o", "-name", "*_files",
    ")",
    "-print",
    "-prune",
    ")",
    "-o",
    "(",
    "-type", "f",
    "(",
    "-name", "*.html",
    "-o", "-name", "*.llms.md",
    "-o", "-name", "llms.txt",
    "-o", "-name", "*.rmarkdown",
    ")",
    "-print",
    ")"
  )

  paths <- system2("find", shQuote(args), stdout = TRUE)
  paths <- paths[basename(paths) != "language-switch.html"]
  paths <- paths[!grepl("^\\./(en/)?module_08/data/[^/]+\\.html$", paths)]
  paths <- paths[!sub("^\\./", "", paths) %in% static_redirect_html]
  paths
}

remove_source_artifacts <- function(root) {
  old_wd <- getwd()
  setwd(root)
  on.exit(setwd(old_wd), add = TRUE)

  remove_paths(unique(c(find_quarto_cache_paths(), "site_libs", "en/site_libs", "en/docs")))
  remove_generated_duplicates()
  remove_paths(find_generated_source_paths(root))
}

strip_trailing_whitespace <- function(root = "docs") {
  text_files <- list.files(
    root,
    pattern = "\\.(html|css|js|json|md|txt|xml)$",
    recursive = TRUE,
    full.names = TRUE,
    no.. = TRUE
  )

  for (path in text_files) {
    lines <- readLines(path, warn = FALSE, encoding = "UTF-8")
    stripped <- sub("[ \t]+$", "", lines, perl = TRUE)
    if (!identical(lines, stripped)) {
      con <- file(path, open = "w", encoding = "UTF-8")
      writeLines(stripped, con = con, useBytes = FALSE)
      close(con)
    }
  }
}

ensure_nojekyll <- function(root = "docs") {
  nojekyll_path <- file.path(root, ".nojekyll")
  if (!file.exists(nojekyll_path)) {
    file.create(nojekyll_path)
  }
}

ensure_image_alt_text <- function(root = "docs") {
  if (!requireNamespace("xml2", quietly = TRUE)) {
    stop("The xml2 package is required to post-process image alt text.", call. = FALSE)
  }

  html_files <- list.files(
    root,
    pattern = "\\.html$",
    recursive = TRUE,
    full.names = TRUE,
    no.. = TRUE
  )

  for (path in html_files) {
    doc <- xml2::read_html(path, options = c("RECOVER", "NOERROR", "NOWARNING"))
    images_without_alt <- xml2::xml_find_all(doc, ".//img[not(@alt)]")

    if (length(images_without_alt) == 0) {
      next
    }

    is_english_page <- grepl("(^|/)en/", path)
    fallback_alt <- if (is_english_page) {
      "Visual output generated by the page code."
    } else {
      "Sortie visuelle générée par le code de la page."
    }

    for (image in images_without_alt) {
      xml2::xml_set_attr(image, "alt", fallback_alt)
    }

    xml2::write_html(doc, file = path)
  }
}

render_tmpdir <- Sys.getenv("STT1100_RENDER_TMPDIR", unset = tempdir())
render_tmpdir <- normalizePath(render_tmpdir, mustWork = TRUE)
render_root <- tempfile("stt1100-render-", tmpdir = render_tmpdir)
dir.create(render_root, recursive = TRUE, showWarnings = FALSE)
on.exit(remove_paths(render_root), add = TRUE)

message("Preparing clean temporary render directory: ", render_root)
sync_source_to_render_root(repo_root, render_root)
setwd(render_root)

remove_paths(unique(c(clean_paths, find_quarto_cache_paths())))
remove_generated_duplicates()
remove_source_artifacts(render_root)

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

copy_static_redirects(render_root, "docs")
normalize_numbered_directories("docs")
remove_paths(c("en/docs", "site_libs", "en/site_libs"))

duplicate_outputs <- list.files(
  "docs",
  pattern = " [0-9]+\\.",
  recursive = TRUE,
  full.names = TRUE
)
remove_paths(duplicate_outputs)
remove_generated_duplicates()
ensure_image_alt_text("docs")
ensure_nojekyll("docs")
strip_trailing_whitespace("docs")

setwd(repo_root)
replace_directory(file.path(render_root, "docs"), file.path(repo_root, "docs"))
ensure_nojekyll(file.path(repo_root, "docs"))
strip_trailing_whitespace(file.path(repo_root, "docs"))

message("Done: rendered French site to docs/ and English site to docs/en/.")
