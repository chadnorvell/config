function gra --wraps 'git rebase --abort' --description 'git rebase --abort'
    git rebase --abort $argv
end
