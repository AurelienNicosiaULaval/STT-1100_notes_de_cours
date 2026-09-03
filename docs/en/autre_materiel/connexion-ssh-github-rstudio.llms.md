One-time setup

# Connect GitHub to RStudio with SSH

This procedure mainly uses RStudio and GitHub menus and buttons. At the end, your computer will be able to open and synchronize the course GitHub repositories.

[Start](#check-git) [Test the connection](#test-connection) [Clone a project](#clone-project) [Troubleshoot](#ssh-troubleshooting)

01

Check Git in RStudio

02

Create an SSH key

03

Add the key to GitHub

04

Test and clone

> **NOTE:**
>
> You do not enter your GitHub password in RStudio. Instead, an SSH key lets GitHub recognize your computer. You normally complete this setup only once on each computer you use.

## Before you start

You need:

- a [GitHub account](https://github.com/) with a verified email address;
- [Git](https://git-scm.com/downloads) installed;
- RStudio Desktop open;
- your Web browser open and signed in to the correct GitHub account.

## 1. Check that RStudio finds Git

1.  In RStudio, click `Tools`.
2.  Click `Global Options`.
3.  In the left column, click `Git/SVN`.
4.  Confirm that a path appears in the `Git executable` field.

If a path appears, continue to the next step.

If the field is empty, install [Git](https://git-scm.com/downloads), close RStudio completely, and reopen it. Return to `Tools > Global Options > Git/SVN`.

## 2. Create or display the SSH key

While still in `Tools > Global Options > Git/SVN`:

1.  Find the `SSH key` section.
2.  If the `View public key` button is available, a key already exists. Do not create another key. Click `View public key` and continue with step 4 below.
3.  If no key exists, click `Create SSH Key`. In an older RStudio version, the button may be named `Create RSA Key`.
4.  Keep the key type proposed by RStudio. If you are asked for a passphrase, choose one you can retrieve later.
5.  After creating the key, click `View public key`.
6.  Select and copy the complete displayed line.

The public key usually begins with `ssh-ed25519` or `ssh-rsa`. It may be copied into GitHub.

> **WARNING:**
>
> Copy only the text displayed by the `View public key` button. Never send a private key file, password, or access token through the course site, email, or a help request.

## 3. Add the key to GitHub

1.  In your browser, open [GitHub](https://github.com/) and confirm that you are signed in to the correct account.
2.  Click your profile picture in the upper-right corner.
3.  Click `Settings`.
4.  Under `Access`, click `SSH and GPG keys`.
5.  Click `New SSH key`.
6.  Under `Title`, enter a name that identifies the computer, such as `My laptop`.
7.  Under `Key type`, choose `Authentication Key`.
8.  Under `Key`, paste the public key copied from RStudio.
9.  Click `Add SSH key`, then confirm your identity if GitHub asks.

## 4. Test the connection

This check is the only step that requires a short command.

1.  Return to RStudio.
2.  Click `Tools > Terminal > New Terminal`. You can also open the `Terminal` tab beside the Console.
3.  Copy the following line, paste it in the terminal, and press Enter:

``` text
ssh -T git@github.com
```

On the first connection, you may be asked to confirm GitHub. Check that the message refers to `github.com`, type `yes`, and press Enter.

The connection works if the message contains your GitHub username and these words:

``` text
Hi YOUR-USERNAME! You've successfully authenticated...
```

The message stating that GitHub does not provide shell access is normal.

> **IMPORTANT:**
>
> Do not continue until the success message displays your own GitHub username.

## 5. Clone the course repository

When your course repository is available:

1.  Open its page in GitHub.
2.  Click the green `<> Code` button.
3.  Click the `SSH` tab.
4.  Click the copy button to the right of the link.
5.  In RStudio, click `File > New Project`.
6.  Click `Version Control`, then `Git`.
7.  Paste the link under `Repository URL`.
8.  Choose where to save the project.
9.  Click `Create Project`.

RStudio then opens the project and normally displays a `Git` tab.

## Short troubleshooting guide

| What you see | What to do |
|----|----|
| The `Git executable` field is empty | Install Git, close RStudio completely, and reopen it. |
| `View public key` is unavailable | Click `Create SSH Key` first. |
| GitHub rejects the key | Return to `View public key`, recopy the complete line, and replace the key saved in GitHub. |
| The test displays `Permission denied (publickey)` | Confirm that the public key displayed by RStudio is saved in the GitHub account currently open. |
| The test displays the wrong username | The key is linked to another GitHub account. Ask for help before deleting or replacing a key. |
| Cloning is denied even though the test succeeded | Confirm that you accepted the invitation to the course repository or organization. |

If the problem continues, send a screenshot of `Tools > Global Options > Git/SVN` and the complete error message. Hide unnecessary personal information and never attach a private key.

## Official sources

- [Version control and SSH in RStudio, Posit](https://docs.posit.co/ide/user/ide/guide/tools/version-control.html)
- [Connecting to GitHub with SSH](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)
- [Adding an SSH key to GitHub](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)
- [Testing an SSH connection to GitHub](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/testing-your-ssh-connection)
