function cdlt --description "cd && eza --tree --level=2" --wraps cd
    cd $argv && eza --tree --level=2
end
