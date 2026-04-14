function jm- --description "jj bookmark create -r @- [NAME]"
    set -l name $argv[-1]
    set -l args $argv[1..-2]
    jj bookmark create $args -r @- $name
end
