# dotfiles

## Installation

Prior to the installation make sure you have set the following alias to your `.bashrc` or `.zshrc`:

```sh
alias dotgit='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

And that your source repository ignores the folder where you'll clone it, so that you don't create weird recursion problems:

```sh
echo ".dotfiles" >> .gitignore
```

Now clone `dotfiles` into a bare repository in a "dot" folder of your `$HOME`:

```sh
git clone --bare <git-repo-url> $HOME/.dotfiles
```

Ensure `dotgit` alias is defined in your current shell scope, reload your `.bashrc` or .`zshrc` if necessary.

Checkout the actual content from the bare repository to your `$HOME`:

```sh
dotgit checkout
```

The step above might fail with a message like:

```sh
error: The following untracked working tree files would be overwritten by checkout:
    .bashrc
    .gitignore
Please move or remove them before you can switch branches.
Aborting
```

This is because your `$HOME` folder might already have some stock configuration files which would be overwritten by Git. The solution is simple: back up the files if you care about them, remove them if you don't care.

Re-run the check out if you had problems:

```sh
dotgit checkout
```

Set the flag `showUntrackedFiles` to `no` on this specific (local) repository:

```sh
dotgit config --local status.showUntrackedFiles no
```

You're done, from now on you can now type `dotgit` commands to add and update your `dotfiles`:

```sh
config status
config add .config/<new-file>
config commit -m "Add <new-file>"
config push
```
