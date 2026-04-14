function git-sync --description "git checkout and pull"
    set -l branch $argv main
    git checkout $branch[1] && git pull
end
