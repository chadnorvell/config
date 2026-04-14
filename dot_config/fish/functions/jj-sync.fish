function jj-sync --description "jj git fetch && jj rebase -d [BRANCH | main@origin]"
    set -l branch $argv main@origin
    jj git fetch && jj rebase -d $branch[1]
end
