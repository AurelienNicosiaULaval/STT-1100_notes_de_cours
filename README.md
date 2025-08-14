# STT-1100 Notes de cours

Ce dépôt contient un site Quarto pour les notes de cours du cours STT-1100.

## Déploiement (GitHub Pages)
Ce dépôt utilise GitHub Actions pour rendre et publier le site Quarto vers la branche `gh-pages`.
- Chaque push sur `main` déclenche la génération (`quarto render`) puis la publication.
- La branche publiée est `gh-pages` (racine).
- Si la page n’apparaît pas, vérifiez dans **Settings → Pages** que la source est **Deploy from a branch** avec **Branch: gh-pages / folder: /** (ou **GitHub Actions**, selon votre configuration).
