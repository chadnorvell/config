function gcm --wraps 'git commit -m' --description 'git commit -m'
    git commit -m $argv
end
