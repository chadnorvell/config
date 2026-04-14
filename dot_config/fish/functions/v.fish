function v --description "bat file or eza directory"
    set -l args $argv .
    set -l p $args[1]

    if test -d $p
        eza --long $p
    else if test -f $p
        bat $p
    else
        echo "Error: '$p' is neither a directory nor a file"
        return 1
    end
end
