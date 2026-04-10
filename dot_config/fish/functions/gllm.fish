function gllm --description 'git log <$1 or main>..HEAD --oneline'
    set -l p $argv main
    git log $p..HEAD --oneline $argv
end
