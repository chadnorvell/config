function nxd --wraps='nix develop --command fish'
  argparse 'c/command=' -- $argv
  or return

  set -x IN_FISH_SUBSHELL 1

  if set -ql _flag_c
    nix develop $argv --command fish -c $_flag_c[1]
  else
    nix develop $argv --command fish
  end
end
