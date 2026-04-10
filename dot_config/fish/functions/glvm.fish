function glvm --description 'git log <$1 or main>..HEAD'
    set -q argv[1]; or set argv main
    git log $argv[1]..HEAD $argv[2..]
end
