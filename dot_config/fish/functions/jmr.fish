function jmr --description "jj bookmark create -r [REVISION] [NAME]"
    set -l revision $argv[-1]
    set -l name $argv[-2]
    set -l args $argv[1..-3]
    jj bookmark create $args -r $revision $name
end
