# Boîte à outils

Travailler dans le cours

# Boîte à outils STT-1100

Cette page rassemble les gestes pratiques à réutiliser dans les modules: démarrer un projet, importer des données, transformer un tableau, visualiser, rendre un rapport Quarto, utiliser GitHub et demander de l'aide efficacement.

[Supports de classe](#supports-de-classe) [Routines R](#routines-r) [Quarto et GitHub](#quarto-github) [Dépannage](#depannage)

R

Importer, transformer, visualiser

Q

Rédiger et rendre un rapport

Git

Suivre les versions du projet

?

Chercher et demander de l'aide

## Supports de classe

Ces documents complètent les modules. Ils sont utiles pour réviser avant un défi, préparer un projet ou retrouver rapidement une procédure présentée en classe.

### Aide-mémoire STT-1100

Une feuille synthèse pour retrouver les commandes R, les gestes Quarto et les réflexes de base du cours.

[Feuille aide-mémoire PDFSupport court à imprimer ou garder près de soi pendant les exercices.](autre_materiel/Cheat%20sheet/stt1100_cheatsheet_mod.pdf)

### RStudio et GitHub

Les étapes pour cloner un dépôt, travailler dans un projet RStudio et comprendre l'authentification GitHub.

[Aide-mémoire RStudio et GitHubGuide pas à pas pour cloner un projet et configurer GitHub.](autre_materiel/Aide%20mémoire%20Rstudio%20et%20Github.llms.md) [Présentation GitHubSupport de classe sur les dépôts, les commits et le travail versionné.](autre_materiel/Github/Présentation%20Github.pdf)

### Chercher et obtenir de l'aide

Une méthode pour formuler une question, lire un message d'erreur et utiliser les bons espaces d'aide.

[Où et comment chercherGuide pour chercher dans RStudio, sur le Web, dans la documentation et avec GPT STT-1100.](autre_materiel/Ou%20et%20comment%20chercher/ou%20et%20comment%20chercher.llms.md) [Matériel de référenceLiens utiles pour l'aide, la recherche et les questions fréquentes.](references.llms.md)

### Rôles en science des données

Une présentation pour situer le cours dans un vrai cycle de projet: importation, nettoyage, transformation, visualisation, modélisation et communication.

[Panorama des métiersSupport du module 1 sur les rôles et le cycle complet d'un projet de données.](autre_materiel/Présentation%20des%20différents%20rôles/roles_presentation_v2.llms.md)

## Routines R fréquentes

Les cartes ci-dessous résument quoi utiliser selon la tâche. Pour le détail par package, utilisez la page des packages.

### Importer

`readr::read_csv()`, `readxl::read_excel()`, `haven::read_sav()`. Toujours vérifier ensuite avec `glimpse()`, `names()` et `skimr::skim()`.

### Sélectionner et filtrer

`dplyr::select()` garde des colonnes, `dplyr::filter()` garde des lignes, `dplyr::arrange()` ordonne le tableau.

### Créer et résumer

`dplyr::mutate()` crée des variables, `dplyr::group_by()` définit les groupes, `dplyr::summarise()` calcule les indicateurs.

### Réorganiser

`tidyr::pivot_longer()` met les données au format long, `tidyr::pivot_wider()` élargit un tableau, `tidyr::separate()` découpe une colonne.

### Nettoyer du texte et des catégories

`stringr` aide à détecter, remplacer et extraire du texte. `forcats` sert à recoder et réordonner les facteurs.

### Visualiser

Commencer par `ggplot()`, définir les variables avec `aes()`, choisir un `geom_*`, puis soigner titres, axes et facettes.

[Voir les packages du cours](packages.llms.md) [Voir les jeux de données](donnees.llms.md)

## Workflow minimal

Dans STT-1100, un travail reproductible suit toujours la même logique: ouvrir le bon projet, charger les packages, importer les données, écrire le code dans un document Quarto, rendre le document, puis sauvegarder les étapes importantes avec GitHub lorsque le module le demande.

[Revoir le démarrage](demarrage.llms.md) [Cloner avec RStudio](autre_materiel/Aide%20mémoire%20Rstudio%20et%20Github.llms.md)

### Projet

Un dossier, un fichier Quarto, les données au bon endroit et des noms de fichiers explicites.

### Rapport

Un titre clair, des blocs de code lisibles, des résultats interprétés en phrases courtes.

### Version

Des commits petits et compréhensibles lorsque le travail est prêt à être sauvegardé.

## Dépannage et aide

Avant de demander de l'aide, il faut rendre le problème observable. C'est aussi ce qui permet d'utiliser l'IA du cours de façon utile.

### Lire l'erreur

Copier le message complet. Identifier le nom de la fonction, de l'objet ou du fichier mentionné.

### Réduire

Rejouer seulement le bloc qui pose problème. Vérifier que les packages sont chargés et que les données existent.

### Comparer

Comparer avec un exemple du module, de la feuille aide-mémoire ou de la documentation officielle.

### Formuler

Indiquer le but, le code minimal, le message d'erreur et ce qui était attendu.

[Ouvrir GPT STT-1100](https://chatgpt.com/g/g-682d165f32e881918633affa3fe9dfd6-stt-1100) [Guide pour chercher](autre_materiel/Ou%20et%20comment%20chercher/ou%20et%20comment%20chercher.llms.md)
