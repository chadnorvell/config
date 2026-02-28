if status is-interactive
    set fish_greeting
end

set -x EDITOR nvim
set -x GOPATH "$HOME/.pkg/go"
set -x MAKEFLAGS "-j20"
set -x npm_config_prefix "$HOME/.pkg/npm"

source "$HOME/.cargo/env.fish"

if test -d "$GOPATH/bin"
    fish_add_path -Pm "$GOPATH/bin"
end

if test -d "$npm_config_prefix/bin"
    fish_add_path -Pm "$npm_config_prefix/bin"
end

if test -d "$HOME/.local/bin"
    fish_add_path -Pm "$HOME/.local/bin"
end

direnv hook fish | source
