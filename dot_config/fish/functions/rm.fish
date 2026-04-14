function rm --wraps rm --description "trash or rm with flags"
    if test (count $argv) -eq 1
        trash $argv
    else
        command rm $argv
    end
end
