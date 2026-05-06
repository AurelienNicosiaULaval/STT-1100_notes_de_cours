#!/usr/bin/env python3
"""Validate the rendered STT-1100 bilingual Quarto site.

Run after:
  quarto render
  quarto render en
"""
from __future__ import annotations

from html.parser import HTMLParser
from pathlib import Path
from urllib.parse import unquote, urljoin, urlparse, urldefrag
import re
import sys

ROOT = Path(__file__).resolve().parents[1]
DOCS = ROOT / "docs"
SOURCE_GLOBS = ["*.qmd", "module_*/*.qmd", "projet_session/*.qmd", "autre_materiel/**/*.qmd", "en/**/*.qmd"]

SUSPICIOUS_PATTERNS = [
    r"\bGithub\b",
    r"\bRstudio\b",
    r"\btydiverse\b",
    r"\bPut in context\b",
    r"\bChecklist sheet\b",
    r"\bAnswers exercise\b",
    r"\bdeposit\b",
    r"\bdepot\b",
    r"Contenu à ajouter",
    r"Content to add",
]

ALLOWED_PATH_CHARS = re.compile(r"^[A-Za-z0-9._/\-]+$")


class LinkParser(HTMLParser):
    def __init__(self) -> None:
        super().__init__()
        self.links: list[str] = []

    def handle_starttag(self, tag: str, attrs: list[tuple[str, str | None]]) -> None:
        if tag not in {"a", "img", "script", "link"}:
            return
        data = dict(attrs)
        href = data.get("href") or data.get("src")
        if href:
            self.links.append(href)


def fail(message: str, failures: list[str]) -> None:
    failures.append(message)


def iter_sources() -> list[Path]:
    files: set[Path] = set()
    for pattern in SOURCE_GLOBS:
        files.update(ROOT.glob(pattern))
    return sorted(p for p in files if p.is_file() and "docs" not in p.parts)


def check_rendered_paths(failures: list[str]) -> None:
    if not DOCS.exists():
        fail("docs/ does not exist. Run quarto render first.", failures)
        return
    for path in DOCS.rglob("*"):
        if not path.is_file():
            continue
        rel = path.relative_to(DOCS).as_posix()
        if rel.startswith("site_libs/") or "/site_libs/" in rel:
            continue
        if not ALLOWED_PATH_CHARS.match(rel):
            fail(f"Rendered path contains spaces, accents, or unsafe characters: {rel}", failures)


def check_internal_links(failures: list[str]) -> None:
    html_files = [p for p in DOCS.rglob("*.html") if "/site_libs/" not in p.as_posix()]
    for html in html_files:
        parser = LinkParser()
        parser.feed(html.read_text(errors="ignore"))
        base_url = html.relative_to(DOCS).as_posix()
        for raw in parser.links:
            if raw.startswith(("mailto:", "tel:", "javascript:", "data:", "#")):
                continue
            parsed = urlparse(raw)
            if parsed.scheme in {"http", "https"}:
                continue
            href = urldefrag(raw)[0].split("?", 1)[0]
            if not href:
                continue
            if href.startswith("/"):
                href = href.lstrip("/")
                # GitHub Pages absolute paths include the repository slug.
                if href.startswith("STT-1100_notes_de_cours/"):
                    href = href.split("/", 1)[1]
                target = (DOCS / unquote(href)).resolve()
            else:
                target = (html.parent / unquote(href)).resolve()
            try:
                target.relative_to(DOCS.resolve())
            except ValueError:
                fail(f"Internal link escapes docs/: {html.relative_to(DOCS)} -> {raw}", failures)
                continue
            if not target.exists():
                fail(f"Broken internal link: {html.relative_to(DOCS)} -> {raw}", failures)


def check_source_terms(failures: list[str]) -> None:
    compiled = [re.compile(pattern) for pattern in SUSPICIOUS_PATTERNS]
    for path in iter_sources():
        for i, line in enumerate(path.read_text(errors="ignore").splitlines(), start=1):
            if any(pattern.search(line) for pattern in compiled):
                fail(f"Suspicious term in {path.relative_to(ROOT)}:{i}: {line.strip()}", failures)


def check_fr_en_parity(failures: list[str]) -> None:
    required = [
        "index.qmd",
        "references.qmd",
        "projet_session/enonce_projet.qmd",
        *[f"module_{i:02d}/plan_apprentissage.qmd" for i in range(1, 11)],
        *[f"module_{i:02d}/aventure.qmd" for i in range(1, 11)],
    ]
    optional_pairs = ["module_01/defi.qmd", "module_01/exercices_corriges.qmd", "module_05/exercices.qmd", "module_07/analyse_covid.qmd"]
    for rel in required + optional_pairs:
        if not (ROOT / rel).exists():
            fail(f"Missing French source: {rel}", failures)
        if not (ROOT / "en" / rel).exists():
            fail(f"Missing English source: en/{rel}", failures)


def main() -> int:
    failures: list[str] = []
    check_rendered_paths(failures)
    check_internal_links(failures)
    check_source_terms(failures)
    check_fr_en_parity(failures)
    if failures:
        print("Validation failed:")
        for item in failures:
            print(f"- {item}")
        return 1
    print("Validation passed.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
