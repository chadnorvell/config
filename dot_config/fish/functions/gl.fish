function gl --description 'git log --oneline -<$1 or 10>'
    set -l p $argv 10
    git log --oneline -$p
end
