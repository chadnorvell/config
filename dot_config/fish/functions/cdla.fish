function cdla --description "cd && eza --long --all" --wraps cd
    cd $argv && eza -la
end

