function git-sync --description "git checkout, pull, and return to branch"
    set -l current_branch (git branch | cut -c 3-)
    set -l pull_branch $argv main
    git checkout $pull_branch[1] && git pull && git checkout $current_branch
end
