# STT-1100 : Introduction à la science des données

Ce dépôt contient le site Quarto bilingue du cours STT-1100. Il regroupe les notes de cours, les plans d'apprentissage, les aventures, les exercices, le projet de session et les ressources complémentaires.

## Structure du cours

Le cours conserve une approche immersive, mais le matériel doit rester clair, sobre et professionnel.

- Plan d'apprentissage : objectifs, lectures, exercices préparatoires et livrables.
- Aventure : mise en situation professionnelle guidée.
- Défi ou exercice : tâche autonome permettant de consolider les apprentissages.
- Projet de session : intégration des compétences en analyse reproductible.

## Organisation du dépôt

```text
.
├── _quarto.yml              # Configuration du site français
├── index.qmd                # Accueil français
├── module_01/ ... module_10/# Modules français
├── projet_session/          # Projet de session français
├── autre_materiel/          # Ressources complémentaires françaises
├── en/                      # Site anglais complet
├── css/                     # Feuilles de style
├── docs/                    # Site publié par GitHub Pages
└── scripts/                 # Validation locale avant publication
```

La version anglaise est un site Quarto distinct situé dans `en/`, avec sa propre configuration `en/_quarto.yml`. Les fichiers rendus sont publiés dans `docs/en/`.

## Conventions de maintenance

- Garder les versions française et anglaise synchronisées.
- Utiliser des chemins web sans espaces ni accents pour les pages publiées.
- Écrire `GitHub`, `RStudio`, `Quarto`, `tidyverse` et `repository` de manière uniforme.
- Conserver un ton pédagogique professionnel: l'approche immersive est encouragée, mais les consignes doivent rester précises.
- Indiquer les dates de remise dans MonPortail ou dans un endroit centralisé, pas en dur dans plusieurs pages.
- Ne pas committer d'artefacts générés hors de `docs/`, ni de fichiers locaux comme `.Rhistory`.

## Rendu local

Prérequis:

- R
- RStudio ou un terminal
- Quarto CLI
- Les packages R utilisés dans les modules concernés

Rendre le site français:

```bash
quarto render
```

Rendre le site anglais:

```bash
quarto render en
```

Valider le site rendu:

```bash
python3 scripts/validate_site.py
```

La validation doit être exécutée après les deux rendus et avant toute publication.

## Publication GitHub Pages

GitHub Pages publie le contenu de `docs/` depuis la branche `main`.

Procédure recommandée:

```bash
git status
quarto render
quarto render en
python3 scripts/validate_site.py
git status
git add .
git commit -m "Improve bilingual course site quality"
git push origin main
```

Après le déploiement, vérifier au minimum:

- page d'accueil française
- page d'accueil anglaise
- une page de module en français
- la page correspondante en anglais
- le projet de session
- le bouton FR/EN

## Contribution

Les corrections doivent améliorer la clarté pédagogique, la reproductibilité, la cohérence bilingue ou la robustesse du site. Pour les changements importants, privilégier une branche dédiée et une vérification complète avant publication.

Université Laval - Département de mathématiques et de statistique
