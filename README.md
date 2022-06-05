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

## Common git hooks (not tested yet)

https://github.com/git/git/blob/v2.36.1/Documentation/githooks.txt#L21

```shell
#/bin/bash

# Go project hook
GOMOD_FILE="go.mod"
if [ -f $GOMOD_FILE ];then
    echo "> Go project detected"
    
    gofmt
    # TODO execute linters here (https://golangci-lint.run/)
fi
```
