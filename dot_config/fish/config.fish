if status is-interactive
    set fish_greeting
end

# If we're in a sub-shell, this has already run.
# Running it again will clobber whatever invoked the sub-shell.
if not set -q IN_NIX_SHELL
    set -x EDITOR nvim
    set -x MAKEFLAGS -j18

    set -l _npm_config_prefix "$HOME/.pkg/npm"
    if test -d "$_npm_config_prefix/bin"
        set -x npm_config_prefix _npm_config_prefix
        fish_add_path -Pm "$_npm_config_prefix/bin"
    end

    if test -e "$HOME/.deno/env.fish"
        source "$HOME/.deno/env.fish"
    end

    if test -d "$HOME/.bun/bin"
        set -x BUN_INSTALL "$HOME/.bun"
        fish_add_path -Pm "$BUN_INSTALL/bin"
    end

    set -l _pipx_home "$HOME/.pkg/pipx"
    if test -d "$_pipx_home/bin"
        set -x PIPX_HOME $_pipx_home
        set -x PIPX_BIN_DIR "$_pipx_home/bin"
        fish_add_path -Pm "$PIPX_BIN_DIR"
    end

    set -l _gopath "$HOME/.pkg/go"
    if test -d "$_gopath/bin"
        set -x GOPATH _gopath
        fish_add_path -Pm "$_gopath/bin"
    end

    if test -e "$HOME/.cargo/env.fish"
        source "$HOME/.cargo/env.fish"
    end

    if test -d "$HOME/.local/bin"
        fish_add_path -Pm "$HOME/.local/bin"
    end

    if type -q zoxide
        zoxide init fish | source
    end

    if type -q direnv
        direnv hook fish | source
    end
end
