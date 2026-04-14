function cdl --description "cd && eza --long" --wraps cd
    cd $argv && eza -l
end
