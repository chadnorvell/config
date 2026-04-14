function git-squash-all --description "squash all commits in the git branch"
    git reset $(git commit-tree HEAD^{tree} \"$@\")
end
