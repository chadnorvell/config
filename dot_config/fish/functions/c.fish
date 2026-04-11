function c --description 'cd ~/Δ/main'
    set -l dest ~/Δ/main
    type -q z; and z $dest; or cd $dest
end
