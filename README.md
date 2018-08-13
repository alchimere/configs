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
git subtree push --prefix=config/i18n locales $BRANCH --squash
# utiliser --squash évite le souk dans l'historique
# push failure should not break the ci but raise an alert

# scripts:
# - scripts/pull_trad.sh [branch]
# - scripts/push_trad.sh [branch]

# Before delivering on master
# - git rebase -i origin/master
# - ./scripts/pull_trad.sh master
# - commit updated trad
# - merge


# Test conflicts

# Conflict on push
bertho_y 08:19 PM~/dev/subtree/subtree-test-container (master)$ git subtree push --prefix=locales https://github.com/alchimere/subtree-test-part.git master
git push using:  https://github.com/alchimere/subtree-test-part.git master
Username for 'https://github.com': alchimere
Password for 'https://alchimere@github.com': 
To https://github.com/alchimere/subtree-test-part.git
 ! [rejected]        bfbdfb3b78aaa4505a57eb5baca693197e7edfb5 -> master (fetch first)
error: failed to push some refs to 'https://github.com/alchimere/subtree-test-part.git'
hint: Updates were rejected because the remote contains work that you do
hint: not have locally. This is usually caused by another repository pushing
hint: to the same ref. You may want to first integrate the remote changes
hint: (e.g., 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.

bertho_y 08:19 PM~/dev/subtree/subtree-test-container (master)$ git subtree pull --prefix=locales https://github.com/alchimere/subtree-test-part.git master
remote: Counting objects: 6, done.
remote: Compressing objects: 100% (4/4), done.
remote: Total 6 (delta 2), reused 6 (delta 2), pack-reused 0
Unpacking objects: 100% (6/6), done.
From https://github.com/alchimere/subtree-test-part
 * branch            master     -> FETCH_HEAD
Auto-merging locales/fr.yml
CONFLICT (content): Merge conflict in locales/fr.yml
Automatic merge failed; fix conflicts and then commit the result.

# Push works after resolving conflicts
```
