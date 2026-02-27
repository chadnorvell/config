if status is-interactive
    set fish_greeting
end

set -x EDITOR nvim
set -x GOPATH "$HOME/.pkg/go"
set -x MAKEFLAGS "-j20"
set -x npm_config_prefix "$HOME/.local"

source "$HOME/.cargo/env.fish"

fish_add_path -Pm "$HOME/.local/bin"
