# Memo - Clone a GitHub project in RStudio

Code

## Preparation

You must have installed:

- R
- RStudio
- Git (check with `git --version` in terminal)
- A GitHub account

Recommended for the course: connect RStudio to your GitHub account with an SSH key.

Never use your GitHub password directly to clone, push or pull a repository.

------------------------------------------------------------------------

## Find the GitHub project link

1.  Go to the page of the GitHub repository you want to clone.
2.  Click on the green `<> Code` button.
3.  Choose the SSH tab when possible, then copy the displayed link.
4.  Use HTTPS only if SSH is not available on your computer.

Examples:

- SSH: `git@github.com:UserName/project-name.git`
- HTTPS: `https://github.com/UserName/project-name.git`

------------------------------------------------------------------------

## Clone in RStudio

1.  Open RStudio.
2.  Go to `File > New Project`.
3.  Choose `Version Control`.
4.  Select `Git`.
5.  Paste the copied link into the `Repository URL` field.
6.  Choose a local folder to save the project
7.  Click on `Create Project`.

It’s done! You can start working in your new RStudio project.

------------------------------------------------------------------------

## Tip: GitHub Authentication Error

If you get this error:

    fatal: Authentication failed
    remote: Support for password authentication was removed...

This usually means that you used HTTPS without a personal access token or credential manager.

### Two solutions

- Configure SSH, which is the recommended approach for the course.
- If you must use HTTPS, generate a Personal Access Token on GitHub and use it instead of a password.

------------------------------------------------------------------------

## Bonus: Configure SSH with GitHub (recommended)

``` bash
# 1. Generate an SSH key (if not already done)
ssh-keygen -t ed25519 -C "your.email@example.com"

# 2. Add your SSH key to the agent
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# 3. Copy your public key
cat ~/.ssh/id_ed25519.pub
```

Then paste this key into `GitHub > Settings > SSH and GPG keys > New SSH key`.

Details: <https://docs.github.com/en/authentication/connecting-to-github-with-ssh>

------------------------------------------------------------------------

## Useful resources

- [RStudio GitHub Guide (RStudio Support)](https://support.posit.co/hc/en-us/articles/200532077)
- [Create a GitHub token (PAT)](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token)
- [Configure SSH GitHub (Official)](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)

------------------------------------------------------------------------

Happy programming!
