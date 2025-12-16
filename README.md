# STT-1100 : Introduction à la science des données

Bienvenue dans le dépôt des notes de cours pour le cours **STT-1100**. Ce dépôt contient l'ensemble du matériel pédagogique, structuré sous forme de site web Quarto.

## 📚 Structure du cours

Le cours est divisé en modules, chacun conçu autour d'une approche pédagogique immersive :

-   **Plan d'apprentissage** : Les objectifs et les lectures préparatoires.
-   **Aventure** : Une mise en situation professionnelle où vous apprenez les concepts en résolvant un problème concret.
-   **Défi** : Une tâche à réaliser en autonomie pour consolider vos acquis.

## 📂 Organisation du dépôt

Le projet est structuré comme suit :

```
.
├── module_01/          # Module 1 : Plongée en science des données
├── module_02/          # Module 2 : GitHub et visualisation
...
├── module_10/          # Module 10 : Texte et tableaux de bord
├── projet_session/     # Énoncé et détails du projet de session
├── autre_materiel/     # Ressources complémentaires (aide-mémoire, présentations)
├── css/                # Feuilles de style pour le site
├── _quarto.yml         # Configuration du site Quarto
└── index.qmd           # Page d'accueil du site
```

Chaque dossier de module contient :
-   `plan_apprentissage.qmd`
-   `aventure.qmd`
-   `defi.qmd`
-   `resources/` : Fichiers de données, images et documents annexes.

## 🚀 Utilisation

Ce site est construit avec [Quarto](https://quarto.org/).

### Prérequis

-   [R](https://cran.r-project.org/)
-   [RStudio](https://posit.co/download/rstudio-desktop/)
-   [Quarto CLI](https://quarto.org/docs/get-started/)

### Générer le site localement

1.  Clonez ce dépôt.
2.  Ouvrez le projet dans RStudio ou VS Code.
3.  Exécutez la commande suivante dans le terminal :

```bash
quarto preview
```

Cela lancera un serveur local pour visualiser le site. Pour construire le site final dans le dossier `docs/` :

```bash
quarto render
```

## ✍️ Contribution

Si vous trouvez une erreur ou souhaitez proposer une amélioration, n'hésitez pas à ouvrir une *Issue* ou à soumettre une *Pull Request*.

---
*Université Laval - Département de mathématiques et de statistique*
