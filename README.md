# configs
To backup my configs

## Bulk

git

```shell
# True readable log -> git lg
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# Usefull for diff and status commands
git config --global status.submoduleSummary true
git config --global diff.submodule log
git config --global fetch.recurseSubmodules on-demand

# Remove submodule
git submodule deinit path/to/module
git rm path/to/module
```
