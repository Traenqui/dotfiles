# MacOS Setings

## GIT

From the terminal, set global name and email:
```bash
git config --global user.name "Your Name"
git config --global user.email "you@your-domain.com"
```

For a improved `git log`:
```bash
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
```

Try it out!
```bash
git lg
```

Set the default branch to main instead of master.
```bash
git config --global init.defaultBranch main
```

To see all your settings run
```bash
git config --list
# or alias
# gitconfig
```

## SSH

There are two common strategies for SSH keys:
1. "One SSH key to rule them all"
2. "One SSH key per service"

The choice is yours. I'll use the latter one.

First,  create a new SSH key in the `~/.ssh` folder:
```bash
# in case the folder is not there yet
mkdir ~/.ssh

cd ~/.ssh
# or alias
# sshhome

ssh-keygen -t ed25519 -C "github"
# follow instructions
# use file name: github
# use passphrase and store it somewhere secure
```

Confirm whether passphrase was used properly by accessing private key:

```bash
ssh-keygen -y -f gitHub
# confirm with passphrase
```

Create the SSH configuration file if it doesn't exist yet:
```bash
# in case the file is not there yet
touch ~/.ssh/config
```

In your ~/.ssh/config file, add the new SSH key, so that it can get picked up for every terminal session automatically:

```bash
Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/github
```

Add SSH key to MacOS' keychain:

```bash
ssh-add --apple-use-keychain ~/.ssh/github
```

Add the public key to your GitHub settings via the website or via the GitHub CLI (via brew install gh):

```bash
# copy public key and add it to https://github.com/
cat ~/.ssh/id_rsa.pub | pbcopy

# or use GitHub's CLI
gh auth login
# for the first login I think the SSH key gets added
# without the next command, but if not:

gh ssh-key add ~/.ssh/id_rsa.pub -t github
```

That's it. You have created an SSH key locally for one specific service, secured it via a passphrase, made it automatically available for every terminal session, and applied it to GitHub. In the case of GitHub, you are now able to interact with GitHub via SSH.