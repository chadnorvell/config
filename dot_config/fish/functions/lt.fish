function lt --description "eza --tree --level=[LEVEL | 2]" --wraps eza
    set -q argv[1]; or set argv 2
    eza --tree --level=$argv[1] $argv[2..]
end
