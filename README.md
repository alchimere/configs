# configs
To backup my configs

## Bulk

git

```shell
# True readable log -> git lg
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

git log -L 15,23:filename.txt # simili deep blame: history of some lines

# Usefull for diff and status commands
git config --global status.submoduleSummary true
git config --global diff.submodule log
git config --global fetch.recurseSubmodules on-demand

# Remove submodule
git submodule deinit path/to/module
git rm path/to/module
```


## Translate subtree

```shell
# Tranlate separate project with subtree

# I - In a branch

git pull
nano config/i18n/fr.yml # do some modifs
git add config/i18n/fr.yml
git commit -m "My translation update"
# modifs locale uniquement

# II - In a special branch ($BRANCH=(master|preprod|production|recette))

# Local: édition normale
# CI:
#  à la fin
git subtree push --prefix=config/i18n locales $BRANCH

# TODO test conflicts
```
