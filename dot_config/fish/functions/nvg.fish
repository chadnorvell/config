function nvg --description 'neovide'
    set -l p $argv .
    neovide $p[1] &>/dev/null &
    disown
end
