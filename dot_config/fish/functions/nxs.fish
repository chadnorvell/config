function nxs --wraps='nix-shell --command fish'
  nix-shell --command fish $argv
end
