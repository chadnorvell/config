function git-wip --description "create wip commit with staged and unstaged changes"
    set -l msg $argv '~~WIP~~'
    git add -A && git commit --no-verify -m $msg[1]
end
