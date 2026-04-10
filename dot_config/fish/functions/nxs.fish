function nxs --description nix-shell
    argparse 'c/command=' -- $argv; or return
    nix-shell $argv --command fish (set -q _flag_c; and echo -c $_flag_c)
end
