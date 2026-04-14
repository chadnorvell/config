function jup! --description "jj git push -c @-"
    set -l args $argv[1..-2]
    jj git push $args -c @-
end

