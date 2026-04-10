function glm --description 'git log main..HEAD --oneline -<$1 or 10>'
    set -l p $argv 10
    git log main..HEAD --oneline -$p
end
