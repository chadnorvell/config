function jup --description "jj git push -b [BOOKMARK]"
    set -l bookmark $argv[-1]
    set -l args $argv[1..-2]
    jj git push $args -b $bookmark
end
