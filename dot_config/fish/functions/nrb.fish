function nrb --wraps='sudo nixos-rebuild $argv --flake ~/dev/nix'
  set command $argv[1]
  set args $argv[2..-1]

  if test -z "$command"
    set command 'switch'
  end

  sudo nixos-rebuild $command --impure --flake ~/cfg/nix $args
end
