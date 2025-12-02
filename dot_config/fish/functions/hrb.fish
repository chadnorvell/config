function hrb --wraps='home-manager switch --impure --flake ~/dev/nix/home'
  home-manager switch --impure --flake ~/dev/nix/home $argv
end
