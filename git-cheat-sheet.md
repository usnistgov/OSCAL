
# Keeping your fork up-to-date

## Track the upstream

Show remotes:
```
git remote -v
```

If you have not configured the upstream, it will not appear in this list.

To add the OSCAL repo as a remote named "upstream":

```
git remote add upstream https://github.com/usnistgov/OSCAL.git
```

## Update local "main" branch

```
git checkout main
git pull
git fetch upstream
git rebase upstream/main
```

## Updating a feature branch

First make sure that your local "main" branch is up-to-date with the "upstream" as described above.

Switch to the feature branch.

```
git checkout <feature-branch-name>
```
