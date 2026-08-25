Préparation technique du cours

# Préparer votre ordinateur pour STT-1100

La préparation se fait en deux étapes. Avant la première séance, installez R, RStudio Desktop, Quarto et les packages R de départ, puis vérifiez un premier rapport. La configuration de Git, GitHub et SSH est prévue dans la préparation du module 2.

[Commencer l'installation](#ordre-installation) [Faire le test final](#test-final) [Dépanner](#depannage) [Voir les packages R](packages.llms.md)

01

Installer R, RStudio et Quarto

02

Installer les packages R

03

Rendre un fichier Quarto

04

Préparer Git et GitHub au module 2

> **IMPORTANT:**
>
> Chaque personne doit apporter à chaque séance un ordinateur portable Windows, macOS ou Linux sur lequel les outils nécessaires au module courant sont installés et fonctionnels. Pour la première séance, seuls R, RStudio Desktop, Quarto et les packages R de départ sont requis. Un navigateur ou une tablette seuls ne remplacent pas les applications locales utilisées dans le cours.
>
> Une connexion Internet stable est nécessaire. Une mémoire vive de 8 Go est fortement recommandée; 16 Go offrent davantage de confort. Si l’ordinateur est administré par une organisation, vérifiez avant le cours que vous avez le droit d’installer des logiciels.

## Ce qui doit fonctionner

Avant la première séance, vous devez pouvoir confirmer les quatre points suivants:

- R démarre dans RStudio et exécute `1 + 1`.
- RStudio Desktop ouvre un projet et un fichier `.qmd`.
- Quarto répond à `quarto check`.
- un document Quarto contenant du code R produit un fichier HTML sans erreur.

Avant le module 2, vous compléterez les trois vérifications suivantes:

- Git répond à `git --version`;
- votre compte GitHub existe et son adresse courriel est vérifiée;
- la commande `ssh -T git@github.com` reconnaît votre compte.

> **NOTE:**
>
> Les commandes R vont dans l’onglet Console de RStudio. Les commandes `git`, `quarto`, `ssh` et `ls` vont dans un terminal. Sous Windows, utilisez Git Bash après l’installation de Git. Sous macOS ou Linux, utilisez Terminal. Le panneau Terminal de RStudio convient aussi lorsqu’il est disponible.

## Ordre d’installation

Pour préparer le module 1, installez R, RStudio et Quarto, puis passez directement aux packages R de départ et au test Quarto. Les étapes Git, GitHub et SSH seront complétées pendant la préparation du module 2.

### 1. Installer R

Téléchargez R depuis le [Comprehensive R Archive Network](https://cran.r-project.org/), puis choisissez votre système:

- [R pour Windows](https://cran.r-project.org/bin/windows/base/)
- [R pour macOS](https://cran.r-project.org/bin/macosx/)
- [R pour Linux](https://cran.r-project.org/bin/linux/)

Acceptez les options d’installation proposées par défaut. Sous macOS, choisissez le fichier correspondant au processeur de l’ordinateur lorsque plusieurs installateurs sont offerts.

La vérification de R se fera dans RStudio après l’étape suivante.

### 2. Installer RStudio Desktop

Téléchargez la version gratuite de [RStudio Desktop depuis Posit](https://posit.co/download/rstudio-desktop/). Fermez puis rouvrez RStudio après l’installation.

Dans l’onglet Console, exécutez:

``` r
R.version.string
1 + 1
```

Le premier résultat doit afficher une version de R et le second doit afficher `2`.

### 3. Installer Quarto

Téléchargez l’installateur adapté à votre système depuis la [page officielle de Quarto](https://quarto.org/docs/download/). Fermez complètement RStudio, rouvrez-le, puis exécutez dans le terminal:

``` bash
quarto --version
quarto check
```

La première commande doit afficher un numéro de version. La seconde doit détecter Quarto et une installation de R sans erreur bloquante.

### 4. Installer Git

#### Windows

Téléchargez [Git for Windows](https://git-scm.com/download/win), lancez l’installateur et conservez les choix proposés par défaut. Ouvrez ensuite Git Bash et exécutez:

``` bash
git --version
```

#### macOS

Ouvrez Terminal et exécutez:

``` bash
git --version
```

Si macOS propose d’installer les outils de ligne de commande, acceptez et laissez l’installation se terminer. Vous pouvez aussi utiliser l’[installateur Git pour macOS](https://git-scm.com/download/mac). Exécutez de nouveau `git --version` après l’installation.

#### Linux

Utilisez le gestionnaire de paquets de votre distribution. Pour Debian ou Ubuntu:

``` bash
sudo apt update
sudo apt install git
git --version
```

Pour Fedora:

``` bash
sudo dnf install git
git --version
```

La documentation officielle présente les [autres options Linux](https://git-scm.com/download/linux).

## Configurer Git et GitHub

### 5. Créer et vérifier le compte GitHub

Créez un compte personnel gratuit à partir de la [procédure officielle GitHub](https://docs.github.com/en/get-started/start-your-journey/creating-an-account-on-github). Utilisez une adresse courriel que vous consultez et terminez la vérification envoyée par GitHub.

Notez exactement votre nom d’utilisateur GitHub. Il sera utilisé dans plusieurs activités du cours.

### 6. Enregistrer votre identité Git

Dans le terminal, remplacez les deux valeurs par votre nom et par l’adresse associée à votre compte GitHub:

``` bash
git config --global user.name "Prénom Nom"
git config --global user.email "adresse-associee-a-github@example.com"
git config --global init.defaultBranch main
git config --global --list
```

Vérifiez que les lignes `user.name`, `user.email` et `init.defaultbranch=main` contiennent les bonnes valeurs. Ces renseignements seront associés à vos commits.

### 7. Configurer l’accès SSH à GitHub

SSH permet à Git de communiquer avec GitHub sans demander votre mot de passe à chaque opération. La procédure officielle complète se trouve dans [Connecting to GitHub with SSH](https://docs.github.com/en/authentication/connecting-to-github-with-ssh).

Dans le terminal, vérifiez d’abord si une clé existe déjà:

``` bash
ls -al ~/.ssh
```

Si un fichier comme `id_ed25519.pub` existe déjà et est rattaché à votre compte GitHub, ne créez pas une seconde clé. Sinon, générez-en une en remplaçant l’adresse:

``` bash
ssh-keygen -t ed25519 -C "adresse-associee-a-github@example.com"
```

Appuyez sur Entrée pour accepter l’emplacement proposé. Une phrase secrète est recommandée. Chargez ensuite la clé pour la session active:

``` bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

Copiez uniquement la clé publique:

#### Windows, Git Bash

``` bash
clip < ~/.ssh/id_ed25519.pub
```

#### macOS

``` bash
pbcopy < ~/.ssh/id_ed25519.pub
```

#### Linux

``` bash
cat ~/.ssh/id_ed25519.pub
```

Copiez toute la ligne affichée.

Dans GitHub, ouvrez `Settings > SSH and GPG keys > New SSH key`, donnez un titre reconnaissable à l’ordinateur, collez la clé publique et enregistrez-la. Testez ensuite:

``` bash
ssh -T git@github.com
```

Lors de la première connexion, confirmez l’empreinte de l’hôte si GitHub vous le demande. Le résultat attendu contient `successfully authenticated` et votre nom d’utilisateur. Le message précisant que GitHub ne fournit pas d’accès shell est normal.

> **WARNING:**
>
> Le fichier `~/.ssh/id_ed25519` est privé. Ne le copiez pas dans GitHub, Brio, un courriel ou une demande d’aide. Seul le fichier qui se termine par `.pub` peut être partagé.

## Installer les packages R de départ

Dans la Console de RStudio, exécutez ce bloc complet. Il installe seulement les packages manquants nécessaires au démarrage du cours, puis le package de données `UlavalSSD` utilisé au module 1.

``` r
# Packages de base pour les premiers travaux
packages_requis <- c("tidyverse", "knitr", "rmarkdown", "remotes")

packages_installes <- rownames(installed.packages())
packages_manquants <- setdiff(packages_requis, packages_installes)

if (length(packages_manquants) > 0) {
  install.packages(packages_manquants)
}

# Package de données du cours
if (!requireNamespace("UlavalSSD", quietly = TRUE)) {
  remotes::install_github("AurelienNicosiaULaval/UlavalSSD")
}
```

Vérifiez ensuite:

``` r
library(tidyverse)
library(UlavalSSD)

dim(UlavalSSD::MeteoQuebec)
```

Le résultat doit afficher deux nombres, soit le nombre de lignes et le nombre de colonnes. Les autres packages seront installés au moment où les modules les utilisent; la page [Packages R](packages.llms.md) les répertorie.

## Test final avec un document Quarto

Dans RStudio, choisissez `File > New File > Quarto Document`. Créez un document HTML, remplacez son contenu par le texte suivant et enregistrez-le sous `test-installation.qmd`:

    ---
    title: "Test d'installation STT-1100"
    format:
      html:
        embed-resources: true
    ---

    Ce document confirme que R, RStudio, Quarto et les packages fonctionnent ensemble.

    ```{r}
    library(tidyverse)

    resultats <- tibble(
      valeur = 1:3,
      carre = valeur^2
    )

    resultats
    ```

Cliquez sur `Render`. L’installation est prête lorsque:

1.  aucune erreur rouge n’interrompt le rendu;
2.  un fichier `test-installation.html` est créé et s’ouvre;
3.  le tableau contient les valeurs 1, 4 et 9 dans la colonne `carre`;
4.  les deux commandes suivantes donnent les résultats attendus dans le terminal.

``` bash
quarto --version
quarto check
```

## Vérification avant le module 2

Lorsque la préparation du module 2 sera demandée, terminez les étapes Git, GitHub et SSH de cette page, puis vérifiez:

``` bash
git --version
ssh -T git@github.com
```

## Dépannage

| Symptôme | Vérification | Correction la plus probable |
|----|----|----|
| RStudio ouvre, mais R ne démarre pas | Exécuter `R.version.string` dans la Console | Installer R avant RStudio, puis redémarrer RStudio. |
| `quarto: command not found` | Exécuter `quarto --version` dans un nouveau terminal | Installer Quarto, puis fermer et rouvrir le terminal et RStudio. |
| `git: command not found` | Exécuter `git --version` | Installer Git et ouvrir un nouveau terminal. Sous Windows, utiliser Git Bash. |
| `Permission denied (publickey)` | Exécuter `ssh -T git@github.com` | Vérifier que la clé publique `.pub` a été ajoutée au bon compte GitHub et que la clé privée est chargée. |
| `there is no package called ...` | Exécuter `installed.packages()` dans R | Installer le package dans la Console, puis ajouter le bon `library()` dans le fichier `.qmd`. |
| Le document fonctionne par lignes, mais pas avec `Render` | Redémarrer R, puis rendre de nouveau | Ajouter au document tous les `library()` et toutes les étapes nécessaires à la création des objets. |

Si le problème persiste, conservez:

- le système utilisé et sa version;
- la sortie de `R.version.string`;
- la sortie de `quarto check`;
- la sortie de `git --version`;
- le message d’erreur complet;
- une capture montrant l’étape où le problème apparaît.

Ne transmettez jamais un mot de passe, un jeton d’accès ou une clé SSH privée.

## Sources officielles

- [R et téléchargements CRAN](https://cran.r-project.org/)
- [RStudio Desktop, Posit](https://posit.co/download/rstudio-desktop/)
- [Installation et démarrage avec Quarto](https://quarto.org/docs/get-started/)
- [Installation de Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
- [Première configuration de Git](https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup)
- [Connexion à GitHub avec SSH](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)
