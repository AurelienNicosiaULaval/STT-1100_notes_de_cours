Préparation technique du cours

# Préparer votre ordinateur pour STT-1100

Installez les applications avec leurs boutons habituels, puis vérifiez le résultat directement dans RStudio. La connexion à GitHub possède sa propre page guidée.

[Commencer l'installation](#ordre-installation) [Faire le test final](#test-final) [Connecter GitHub](autre_materiel/connexion-ssh-github-rstudio.llms.md) [Dépanner](#depannage)

01

Installer R et RStudio

02

Installer les packages R

03

Rendre un fichier Quarto

04

Connecter GitHub au module 2

> **IMPORTANT:**
>
> Chaque personne doit apporter à chaque séance un ordinateur portable Windows, macOS ou Linux sur lequel les outils nécessaires au module courant sont installés et fonctionnels. Pour la première séance, seuls R, RStudio Desktop, Quarto et les packages R de départ sont requis.
>
> Une connexion Internet stable est nécessaire. Si l’ordinateur est administré par une organisation, vérifiez avant le cours que vous avez le droit d’installer des logiciels.

## Ce qui doit fonctionner

Avant la première séance :

- RStudio démarre et la Console calcule `1 + 1`;
- RStudio ouvre un fichier `.qmd`;
- le bouton `Render` produit un fichier HTML sans erreur.

Avant le module 2 :

- un chemin apparaît dans `Tools > Global Options > Git/SVN`, à côté de `Git executable`;
- votre compte GitHub existe et son adresse courriel est vérifiée;
- la [page de connexion SSH](autre_materiel/connexion-ssh-github-rstudio.llms.md) confirme votre propre identifiant GitHub.

## Ordre d’installation

### 1. Installer R

Téléchargez R depuis le [Comprehensive R Archive Network](https://cran.r-project.org/), puis choisissez votre système :

- [R pour Windows](https://cran.r-project.org/bin/windows/base/)
- [R pour macOS](https://cran.r-project.org/bin/macosx/)
- [R pour Linux](https://cran.r-project.org/bin/linux/)

Ouvrez le fichier téléchargé et acceptez les options proposées par défaut.

### 2. Installer RStudio Desktop

1.  Ouvrez la [page de téléchargement de RStudio Desktop](https://posit.co/download/rstudio-desktop/).
2.  Téléchargez la version gratuite correspondant à votre ordinateur.
3.  Ouvrez le fichier téléchargé et terminez l’installation.
4.  Ouvrez RStudio.

Dans l’onglet Console, exécutez :

``` r
R.version.string
1 + 1
```

Le premier résultat doit afficher une version de R et le second doit afficher `2`.

### 3. Vérifier Quarto avec le bouton Render

Les versions récentes de RStudio Desktop incluent Quarto. Pour vérifier qu’il fonctionne :

1.  Dans RStudio, cliquez sur `File > New File > Quarto Document`.
2.  Choisissez le format `HTML`.
3.  Cliquez sur `Create`.
4.  Enregistrez le fichier.
5.  Cliquez sur le bouton `Render` situé au-dessus du document.

Si une page HTML s’ouvre sans erreur, Quarto fonctionne. Si RStudio ne propose pas `Quarto Document`, installez Quarto depuis sa [page officielle](https://quarto.org/docs/download/), puis fermez et rouvrez RStudio.

### 4. Installer et vérifier Git

#### Windows

Téléchargez [Git for Windows](https://git-scm.com/download/win), ouvrez l’installateur et conservez les choix proposés par défaut.

#### macOS

Téléchargez Git depuis la [page officielle pour macOS](https://git-scm.com/download/mac) et suivez l’option d’installation proposée pour votre version du système.

#### Linux

Suivez la [procédure officielle correspondant à votre distribution](https://git-scm.com/download/linux). Demandez de l’aide si l’installation exige des droits d’administration.

#### Vérification dans RStudio

1.  Fermez complètement RStudio après l’installation de Git.
2.  Ouvrez RStudio de nouveau.
3.  Cliquez sur `Tools > Global Options > Git/SVN`.
4.  Vérifiez qu’un chemin apparaît dans `Git executable`.

Si le chemin est présent, RStudio reconnaît Git.

## Préparer GitHub pour le module 2

### 5. Créer et vérifier le compte GitHub

Créez un compte personnel gratuit à partir de la [procédure officielle GitHub](https://docs.github.com/en/get-started/start-your-journey/creating-an-account-on-github). Terminez la vérification de votre adresse courriel et notez exactement votre nom d’utilisateur GitHub.

### 6. Enregistrer votre nom pour les commits

Cette étape se fait une seule fois dans la Console de RStudio. Remplacez les deux exemples par votre nom et par une adresse associée à votre compte GitHub :

``` r
if (!requireNamespace("usethis", quietly = TRUE)) {
  install.packages("usethis")
}

usethis::use_git_config(
  user.name = "Prénom Nom",
  user.email = "adresse-associee-a-github@example.com"
)
```

Ces renseignements seront associés à vos commits. Vous pouvez utiliser l’adresse privée fournie par GitHub si vous ne voulez pas afficher votre adresse personnelle dans vos commits.

### 7. Connecter GitHub à RStudio avec SSH

Ouvrez la page dédiée et suivez ses boutons dans l’ordre :

[Connecter GitHub à RStudio avec SSH](autre_materiel/connexion-ssh-github-rstudio.llms.md)

Cette page explique comment créer la clé depuis `Tools > Global Options > Git/SVN`, l’ajouter à GitHub, vérifier la connexion et cloner le dépôt du cours.

## Installer les packages R de départ

Dans la Console de RStudio, exécutez le bloc suivant. Il installe uniquement les packages manquants :

``` r
packages_requis <- c(
  "tidyverse", "knitr", "rmarkdown", "remotes", "usethis"
)

packages_installes <- rownames(installed.packages())
packages_manquants <- setdiff(packages_requis, packages_installes)

if (length(packages_manquants) > 0) {
  install.packages(packages_manquants)
}

if (!requireNamespace("UlavalSSD", quietly = TRUE)) {
  remotes::install_github("AurelienNicosiaULaval/UlavalSSD")
}
```

Vérifiez ensuite :

``` r
library(tidyverse)
library(UlavalSSD)

dim(UlavalSSD::MeteoQuebec)
```

Le résultat doit afficher deux nombres, soit le nombre de lignes et le nombre de colonnes.

## Test final avec un document Quarto

1.  Dans RStudio, choisissez `File > New File > Quarto Document`.
2.  Créez un document HTML.
3.  Enregistrez-le sous `test-installation.qmd`.
4.  Dans un bloc de code R, écrivez le code suivant :

``` r
library(tidyverse)

resultats <- tibble(
  valeur = 1:3,
  carre = valeur^2
)

resultats
```

5.  Cliquez sur `Render`.

L’installation est prête lorsque le fichier HTML s’ouvre sans erreur et que la colonne `carre` contient 1, 4 et 9.

## Vérification avant le module 2

1.  Ouvrez la [page de connexion SSH](autre_materiel/connexion-ssh-github-rstudio.llms.md).
2.  Suivez les étapes jusqu’au message qui affiche votre identifiant GitHub.
3.  Acceptez l’invitation au dépôt ou à l’organisation du cours.
4.  Clonez votre dépôt avec les boutons `File > New Project > Version Control > Git`.

## Dépannage

| Symptôme | Vérification par les menus | Correction la plus probable |
|----|----|----|
| RStudio ouvre, mais R ne démarre pas | Regardez si la Console affiche une version de R au démarrage | Installez R avant RStudio, puis redémarrez RStudio. |
| Le bouton `Render` est absent | Vérifiez que le fichier ouvert se termine par `.qmd` | Installez Quarto, puis fermez et rouvrez RStudio. |
| La case `Git executable` est vide | Ouvrez `Tools > Global Options > Git/SVN` | Installez Git, puis fermez et rouvrez RStudio. |
| La connexion GitHub est refusée | Ouvrez la [page SSH](autre_materiel/connexion-ssh-github-rstudio.llms.md#depannage-ssh) | Vérifiez la clé publique et le compte GitHub utilisé. |
| Un package est introuvable | Ouvrez l’onglet `Packages` et cherchez son nom | Installez le package dans la Console, puis ajoutez le bon `library()` dans le fichier `.qmd`. |
| Le document fonctionne par lignes, mais pas avec `Render` | Cliquez sur `Session > Restart R`, puis sur `Render` | Ajoutez au document tous les `library()` et toutes les étapes nécessaires. |

Si le problème persiste, conservez le message d’erreur complet et une capture montrant l’étape où le problème apparaît. Ne transmettez jamais un mot de passe, un jeton d’accès ou une clé SSH privée.

## Sources officielles

- [R et téléchargements CRAN](https://cran.r-project.org/)
- [RStudio Desktop, Posit](https://posit.co/download/rstudio-desktop/)
- [Installation et démarrage avec Quarto](https://quarto.org/docs/get-started/)
- [Installation de Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
- [Configuration de Git avec usethis](https://usethis.r-lib.org/reference/use_git_config.html)
- [Connexion à GitHub avec SSH](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)
