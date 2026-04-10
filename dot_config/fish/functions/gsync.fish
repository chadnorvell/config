function gsync --description 'git checkout <$1 or main> && git pull'
    set -l p $argv main
    git checkout $p[1] && git pull
end
