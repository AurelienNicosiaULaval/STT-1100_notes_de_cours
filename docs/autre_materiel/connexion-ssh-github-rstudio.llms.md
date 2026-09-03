Configuration à faire une seule fois

# Connecter GitHub à RStudio avec SSH

Cette procédure utilise surtout les menus et les boutons de RStudio et de GitHub. À la fin, votre ordinateur pourra ouvrir et synchroniser les dépôts GitHub du cours.

[Commencer](#verifier-git) [Tester la connexion](#tester-connexion) [Cloner un projet](#cloner-projet) [Dépanner](#depannage-ssh)

01

Vérifier Git dans RStudio

02

Créer une clé SSH

03

Ajouter la clé à GitHub

04

Tester puis cloner

> **NOTE:**
>
> Vous n’entrez pas votre mot de passe GitHub dans RStudio. Une clé SSH permet plutôt à GitHub de reconnaître votre ordinateur. Cette configuration est normalement faite une seule fois sur chaque ordinateur utilisé.

## Avant de commencer

Vous devez avoir :

- un [compte GitHub](https://github.com/) dont l’adresse courriel est vérifiée;
- [Git](https://git-scm.com/downloads) installé;
- RStudio Desktop ouvert;
- votre navigateur Web ouvert et connecté au bon compte GitHub.

## 1. Vérifier que RStudio trouve Git

1.  Dans RStudio, cliquez sur `Tools`.
2.  Cliquez sur `Global Options`.
3.  Dans la colonne de gauche, cliquez sur `Git/SVN`.
4.  Vérifiez qu’un chemin est affiché dans la case `Git executable`.

Si un chemin est affiché, passez à l’étape suivante.

Si la case est vide, installez [Git](https://git-scm.com/downloads), fermez complètement RStudio, puis ouvrez-le de nouveau. Revenez ensuite à `Tools > Global Options > Git/SVN`.

## 2. Créer ou afficher la clé SSH

Toujours dans `Tools > Global Options > Git/SVN` :

1.  Regardez la section `SSH key`.
2.  Si le bouton `View public key` est disponible, une clé existe déjà. Ne créez pas une autre clé. Cliquez sur `View public key` et passez à l’étape 4 ci-dessous.
3.  Si aucune clé n’existe, cliquez sur `Create SSH Key`. Dans une ancienne version de RStudio, le bouton peut s’appeler `Create RSA Key`.
4.  Conservez le type proposé par RStudio. Si une phrase secrète est demandée, choisissez-en une que vous pourrez retrouver.
5.  Après la création, cliquez sur `View public key`.
6.  Sélectionnez toute la ligne affichée, puis copiez-la.

La clé publique commence généralement par `ssh-ed25519` ou `ssh-rsa`. Elle peut être copiée dans GitHub.

> **WARNING:**
>
> Copiez seulement le texte montré par le bouton `View public key`. Ne transmettez jamais un fichier de clé privée, un mot de passe ou un jeton d’accès dans Brio, un courriel ou une demande d’aide.

## 3. Ajouter la clé dans GitHub

1.  Dans votre navigateur, ouvrez [GitHub](https://github.com/) et vérifiez que vous êtes connecté au bon compte.
2.  Cliquez sur votre photo de profil, en haut à droite.
3.  Cliquez sur `Settings`.
4.  Dans la section `Access`, cliquez sur `SSH and GPG keys`.
5.  Cliquez sur `New SSH key`.
6.  Dans `Title`, écrivez un nom qui permet de reconnaître l’ordinateur, par exemple `Mon ordinateur portable`.
7.  Dans `Key type`, choisissez `Authentication Key`.
8.  Dans `Key`, collez la clé publique copiée depuis RStudio.
9.  Cliquez sur `Add SSH key`, puis confirmez votre identité si GitHub le demande.

## 4. Tester la connexion

Cette vérification est la seule étape qui nécessite une courte commande.

1.  Revenez dans RStudio.
2.  Cliquez sur `Tools > Terminal > New Terminal`. Vous pouvez aussi ouvrir l’onglet `Terminal` situé près de la Console.
3.  Copiez la ligne suivante, collez-la dans le terminal, puis appuyez sur Entrée :

``` text
ssh -T git@github.com
```

Lors de la première connexion, une question peut vous demander de confirmer GitHub. Vérifiez que le message concerne bien `github.com`, écrivez `yes`, puis appuyez sur Entrée.

La connexion fonctionne si le message contient votre identifiant GitHub et les mots suivants :

``` text
Hi VOTRE-IDENTIFIANT! You've successfully authenticated...
```

Le message précisant que GitHub ne fournit pas d’accès au terminal est normal.

> **IMPORTANT:**
>
> Ne poursuivez pas tant que le message de réussite n’affiche pas votre propre identifiant GitHub.

## 5. Cloner le dépôt du cours

Lorsque votre dépôt du cours est disponible :

1.  Ouvrez sa page dans GitHub.
2.  Cliquez sur le bouton vert `<> Code`.
3.  Cliquez sur l’onglet `SSH`.
4.  Cliquez sur le bouton de copie situé à droite du lien.
5.  Dans RStudio, cliquez sur `File > New Project`.
6.  Cliquez sur `Version Control`, puis sur `Git`.
7.  Collez le lien dans `Repository URL`.
8.  Choisissez l’endroit où enregistrer le projet.
9.  Cliquez sur `Create Project`.

RStudio ouvre alors le projet et affiche normalement un onglet `Git`.

## Dépannage très court

| Ce que vous voyez | Ce que vous devez faire |
|----|----|
| La case `Git executable` est vide | Installez Git, fermez complètement RStudio, puis ouvrez-le de nouveau. |
| `View public key` n’est pas disponible | Cliquez d’abord sur `Create SSH Key`. |
| GitHub refuse la clé | Retournez dans `View public key`, recopiez toute la ligne et remplacez la clé enregistrée dans GitHub. |
| Le test affiche `Permission denied (publickey)` | Vérifiez que la clé publique affichée par RStudio se trouve dans le compte GitHub actuellement ouvert. |
| Le test affiche le mauvais identifiant | La clé est liée à un autre compte GitHub. Demandez de l’aide avant de supprimer ou de remplacer une clé. |
| Le clonage est refusé malgré un test réussi | Vérifiez que vous avez accepté l’invitation au dépôt ou à l’organisation du cours. |

Si le problème persiste, envoyez une capture de `Tools > Global Options > Git/SVN` et le message d’erreur complet. Masquez tout renseignement personnel inutile et ne joignez jamais une clé privée.

## Sources officielles

- [Contrôle de version et SSH dans RStudio, Posit](https://docs.posit.co/ide/user/ide/guide/tools/version-control.html)
- [Connexion à GitHub avec SSH](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)
- [Ajout d’une clé SSH dans GitHub](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)
- [Test d’une connexion SSH à GitHub](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/testing-your-ssh-connection)
