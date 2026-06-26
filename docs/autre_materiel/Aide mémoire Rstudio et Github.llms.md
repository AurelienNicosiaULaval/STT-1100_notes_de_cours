# Aide-mémoire — Cloner un projet GitHub dans RStudio

Code

## Préparation

Tu dois avoir installé :

- R
- RStudio
- Git (vérifie avec `git --version` dans le terminal)
- Un compte GitHub

**Optionnel mais recommandé** : Lier RStudio à ton compte GitHub avec une clé SSH. (Rappelle-toi de **jamais** utiliser ton mot de passe GitHub directement)

------------------------------------------------------------------------

## Trouver le lien du projet GitHub

1.  Va sur la page du dépôt GitHub que tu veux cloner.
2.  Clique sur le bouton vert **`<> Code`**.
3.  Choisis l’onglet **SSH** ou **HTTPS**, puis copie le lien affiché.

> Exemple : - SSH : `git@github.com:NomUtilisateur/nom-du-projet.git` - HTTPS : `https://github.com/NomUtilisateur/nom-du-projet.git`

------------------------------------------------------------------------

## Cloner dans RStudio

1.  Ouvre **RStudio**
2.  Va dans **File \> New Project**
3.  Choisis **Version Control**
4.  Sélectionne **Git**
5.  Colle le lien copié dans le champ **Repository URL**
6.  Choisis un dossier local pour enregistrer le projet
7.  Clique sur **Create Project**

C’est fait ! Tu peux commencer à travailler dans ton nouveau projet RStudio.

------------------------------------------------------------------------

## Astuce : Erreur d’authentification GitHub

Si tu obtiens cette erreur :

    fatal: Authentication failed
    remote: Support for password authentication was removed...

C’est que tu as utilisé **HTTPS sans jeton personnel (PAT)**.

### Deux solutions :

- Générer un **Jeton d’accès personnel** (PAT) sur GitHub, puis l’utiliser comme mot de passe.
- Ou configurer **SSH**, ce qui est plus simple à long terme.

------------------------------------------------------------------------

## Bonus : Configurer SSH avec GitHub (recommandé)

``` bash
# 1. Génère une clé SSH (si ce n'est pas déjà fait)
ssh-keygen -t ed25519 -C "ton-email@example.com"

# 2. Ajoute ta clé SSH à l'agent
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# 3. Copie ta clé publique
cat ~/.ssh/id_ed25519.pub
```

Puis colle cette clé dans **GitHub \> Settings \> SSH and GPG keys \> New SSH key**.

Détails : <https://docs.github.com/en/authentication/connecting-to-github-with-ssh>

------------------------------------------------------------------------

## Ressources utiles

- [Guide GitHub RStudio (RStudio Support)](https://support.posit.co/hc/en-us/articles/200532077)
- [Créer un token GitHub (PAT)](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token)
- [Configurer SSH GitHub (Officiel)](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)

------------------------------------------------------------------------

Bonne programmation !
