function drb --wraps='sudo darwin-rebuild switch --flake ~/cfg/nix --impure'
  sudo darwin-rebuild switch --flake ~/cfg/nix --impure $argv
end
