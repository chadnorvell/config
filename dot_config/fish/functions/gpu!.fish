function gpu! --wraps 'git pull --rebase' --description 'git pull --rebase'
    git pull --rebase $argv
end
