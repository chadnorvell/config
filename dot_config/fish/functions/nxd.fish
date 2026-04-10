function nxd --description 'nix develop'
    argparse 'c/command=' -- $argv; or return
    nix develop $argv --command fish (set -q _flag_c; and echo -c $_flag_c)
end
