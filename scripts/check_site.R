#!/usr/bin/env Rscript

if (!requireNamespace("xml2", quietly = TRUE)) {
  stop("The xml2 package is required for site checks.", call. = FALSE)
}

command_args <- commandArgs(trailingOnly = FALSE)
file_arg <- command_args[startsWith(command_args, "--file=")]
script_path <- if (length(file_arg) > 0) {
  normalizePath(sub("^--file=", "", file_arg[1]), mustWork = TRUE)
} else {
  normalizePath(file.path("scripts", "check_site.R"), mustWork = TRUE)
}
repo_root <- normalizePath(file.path(dirname(script_path), ".."), mustWork = TRUE)
setwd(repo_root)

docs_root <- normalizePath("docs", mustWork = TRUE)

read_html <- function(path) {
  xml2::read_html(path, options = c("RECOVER", "NOERROR", "NOWARNING"))
}

html_files <- list.files(docs_root, pattern = "\\.html$", recursive = TRUE, full.names = TRUE)

expected_pages <- c(
  "index.html", "demarrage.html", "ressources.html", "livres.html",
  "supports_classe.html", "ia.html", "boite_outils.html",
  "evaluations.html", "examen.html", "defis.html", "projet_session/index.html",
  "projet_session/enonce_projet.html", "donnees.html", "packages.html",
  "modules.html", "calendrier.html", "references.html",
  "en/index.html", "en/demarrage.html", "en/ressources.html", "en/livres.html",
  "en/supports_classe.html", "en/ia.html", "en/boite_outils.html",
  "en/evaluations.html", "en/examen.html", "en/defis.html", "en/projet_session/index.html",
  "en/projet_session/enonce_projet.html", "en/donnees.html", "en/packages.html",
  "en/modules.html", "en/calendrier.html", "en/references.html",
  file.path(sprintf("module_%02d", 1:10), "index.html"),
  file.path("en", sprintf("module_%02d", 1:10), "index.html")
)

missing_expected <- expected_pages[!file.exists(file.path(docs_root, expected_pages))]
retired_pages <- c("glossaire.html", "en/glossaire.html")
retired_present <- retired_pages[file.exists(file.path(docs_root, retired_pages))]

split_ref <- function(ref) {
  ref_no_query <- sub("\\?.*$", "", ref)
  parts <- strsplit(ref_no_query, "#", fixed = TRUE)[[1]]
  list(path = parts[1], fragment = if (length(parts) > 1) parts[2] else "")
}

is_external_ref <- function(ref) {
  grepl("^(https?:|mailto:|tel:|javascript:|data:)", ref)
}

resolve_local_ref <- function(from_file, ref) {
  ref_parts <- split_ref(ref)
  target <- utils::URLdecode(ref_parts$path)

  if (identical(target, "")) {
    resolved <- from_file
  } else {
    resolved <- file.path(dirname(from_file), target)
  }

  if (dir.exists(resolved)) {
    resolved <- file.path(resolved, "index.html")
  } else if (!file.exists(resolved) && !nzchar(tools::file_ext(resolved))) {
    html_candidate <- paste0(resolved, ".html")
    if (file.exists(html_candidate)) {
      resolved <- html_candidate
    }
  }

  list(path = resolved, fragment = ref_parts$fragment)
}

broken_refs <- character()
missing_fragments <- character()
images_without_alt <- character()

for (path in html_files) {
  doc <- read_html(path)
  refs <- c(
    xml2::xml_attr(xml2::xml_find_all(doc, ".//a[@href]"), "href"),
    xml2::xml_attr(xml2::xml_find_all(doc, ".//*[@src]"), "src")
  )
  refs <- refs[!is.na(refs) & nzchar(refs)]

  for (ref in refs) {
    if (startsWith(ref, "#") || is_external_ref(ref)) {
      next
    }

    local <- resolve_local_ref(path, ref)

    if (!file.exists(local$path)) {
      broken_refs <- c(broken_refs, sprintf("%s -> %s", path, ref))
      next
    }

    if (nzchar(local$fragment) && identical(tolower(tools::file_ext(local$path)), "html")) {
      target_doc <- read_html(local$path)
      ids <- xml2::xml_attr(xml2::xml_find_all(target_doc, ".//*[@id]"), "id")
      if (!(local$fragment %in% ids)) {
        missing_fragments <- c(missing_fragments, sprintf("%s -> %s", path, ref))
      }
    }
  }

  missing_alt <- xml2::xml_find_all(doc, ".//img[not(@alt) and not(@aria-label)]")
  if (length(missing_alt) > 0) {
    images_without_alt <- c(images_without_alt, path)
  }
}

custom_hero_pages <- c(
  "index.html", "demarrage.html", "ressources.html", "livres.html",
  "supports_classe.html", "ia.html", "boite_outils.html",
  "evaluations.html", "examen.html", "defis.html", "projet_session/index.html",
  "donnees.html", "packages.html", "calendrier.html", "references.html",
  "en/index.html", "en/demarrage.html", "en/ressources.html", "en/livres.html",
  "en/supports_classe.html", "en/ia.html", "en/boite_outils.html",
  "en/evaluations.html", "en/examen.html", "en/defis.html", "en/projet_session/index.html",
  "en/donnees.html", "en/packages.html", "en/calendrier.html", "en/references.html"
)

h1_issues <- character()
for (page in custom_hero_pages) {
  path <- file.path(docs_root, page)
  if (!file.exists(path)) {
    next
  }
  doc <- read_html(path)
  h1 <- trimws(xml2::xml_text(xml2::xml_find_all(doc, ".//h1")))
  h1 <- h1[nzchar(h1)]
  if (length(h1) != 1) {
    h1_issues <- c(h1_issues, sprintf("%s has %d h1 elements", page, length(h1)))
  }
}

extract_card_ids <- function(path) {
  doc <- read_html(path)
  xml2::xml_attr(
    xml2::xml_find_all(
      doc,
      ".//details[contains(concat(' ', normalize-space(@class), ' '), ' path-card ') and contains(concat(' ', normalize-space(@class), ' '), ' learning-plan-card ')]"
    ),
    "id"
  )
}

extract_anchor_fragments <- function(path, marker) {
  doc <- read_html(path)
  refs <- xml2::xml_attr(xml2::xml_find_all(doc, paste0(".//a[contains(@href, '", marker, "')]")), "href")
  sub("^.*#", "", refs)
}

extract_ids_with_prefix <- function(path, prefix) {
  doc <- read_html(path)
  xml2::xml_attr(xml2::xml_find_all(doc, paste0(".//*[starts-with(@id, '", prefix, "')]")), "id")
}

bilingual_parity_issues <- character()
for (module_id in sprintf("module_%02d", 1:10)) {
  fr_path <- file.path(docs_root, module_id, "index.html")
  en_path <- file.path(docs_root, "en", module_id, "index.html")

  if (!file.exists(fr_path) || !file.exists(en_path)) {
    next
  }

  fr_cards <- extract_card_ids(fr_path)
  en_cards <- extract_card_ids(en_path)
  if (!identical(fr_cards, en_cards)) {
    bilingual_parity_issues <- c(
      bilingual_parity_issues,
      sprintf("%s path cards differ: fr=%s en=%s", module_id, paste(fr_cards, collapse = ","), paste(en_cards, collapse = ","))
    )
  }

  fr_datasets <- extract_anchor_fragments(fr_path, "dataset-card-")
  en_datasets <- extract_anchor_fragments(en_path, "dataset-card-")
  if (!identical(fr_datasets, en_datasets)) {
    bilingual_parity_issues <- c(
      bilingual_parity_issues,
      sprintf("%s dataset links differ: fr=%s en=%s", module_id, paste(fr_datasets, collapse = ","), paste(en_datasets, collapse = ","))
    )
  }

  fr_packages <- extract_anchor_fragments(fr_path, "packages.html#")
  en_packages <- extract_anchor_fragments(en_path, "packages.html#")
  if (!identical(fr_packages, en_packages)) {
    bilingual_parity_issues <- c(
      bilingual_parity_issues,
      sprintf("%s package links differ: fr=%s en=%s", module_id, paste(fr_packages, collapse = ","), paste(en_packages, collapse = ","))
    )
  }
}

fr_dataset_cards <- extract_ids_with_prefix(file.path(docs_root, "donnees.html"), "dataset-card-")
en_dataset_cards <- extract_ids_with_prefix(file.path(docs_root, "en", "donnees.html"), "dataset-card-")
if (!setequal(fr_dataset_cards, en_dataset_cards)) {
  bilingual_parity_issues <- c(
    bilingual_parity_issues,
    sprintf(
      "dataset catalogue cards differ: only_fr=%s only_en=%s",
      paste(setdiff(fr_dataset_cards, en_dataset_cards), collapse = ","),
      paste(setdiff(en_dataset_cards, fr_dataset_cards), collapse = ",")
    )
  )
}

sensitive_files <- list.files(
  docs_root,
  pattern = "\\.(qmd|Rproj|Rhistory|tex|pptx)$",
  recursive = TRUE,
  full.names = TRUE,
  all.files = TRUE,
  no.. = TRUE
)

html_text <- vapply(html_files, function(path) {
  paste(xml2::xml_text(read_html(path)), collapse = " ")
}, character(1))

sensitive_patterns <- c(
  "Je suis capable de",
  "Fermer le module",
  "examen-stt1100-automne-2025\\.qmd",
  "corrige_examen_STT1100\\.pdf",
  "glossaire\\.html",
  "\\bCodex\\b"
)

sensitive_hits <- character()
for (pattern in sensitive_patterns) {
  hit_paths <- names(html_text)[grepl(pattern, html_text, ignore.case = TRUE, perl = TRUE)]
  sensitive_hits <- c(sensitive_hits, sprintf("%s -> %s", pattern, hit_paths))
}

issues <- list(
  missing_expected = missing_expected,
  retired_present = retired_present,
  broken_refs = broken_refs,
  missing_fragments = missing_fragments,
  images_without_alt = unique(images_without_alt),
  h1_issues = h1_issues,
  bilingual_parity_issues = bilingual_parity_issues,
  sensitive_files = sensitive_files,
  sensitive_hits = sensitive_hits
)

for (name in names(issues)) {
  cat(name, length(issues[[name]]), "\n")
  if (length(issues[[name]]) > 0) {
    cat(paste0("  - ", issues[[name]], collapse = "\n"), "\n")
  }
}

if (any(lengths(issues) > 0)) {
  stop("Site checks failed.", call. = FALSE)
}

cat("Site checks passed.\n")
