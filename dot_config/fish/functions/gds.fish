function gds --wraps 'git diff --staged' --description 'git diff --staged'
    git diff --staged $argv
end
