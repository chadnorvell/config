if status is-interactive
    set fish_greeting
end

if test -d "$HOME/.nix-profile/share/man"
    if not contains "$HOME/.nix-profile/share/man" $MANPATH
        set -gx MANPATH "$HOME/.nix-profile/share/man" $MANPATH
    end
end

if not set -q IN_FISH_SUBSHELL
    set -x EDITOR nvim
    set -x MAKEFLAGS -j20

    if test -e "$HOME/.deno/env.fish"
        source "$HOME/.deno/env.fish"
    end

    if test -e "$HOME/.cargo/env.fish"
        source "$HOME/.cargo/env.fish"
    end

    set -x GOPATH "$HOME/.pkg/go"
    if test -d "$GOPATH/bin"
        fish_add_path -Pm "$GOPATH/bin"
    end

    set -x npm_config_prefix "$HOME/.pkg/npm"
    if test -d "$npm_config_prefix/bin"
        fish_add_path -Pm "$npm_config_prefix/bin"
    end

    set -x PIPX_HOME "$HOME/.pkg/pipx"
    set -x PIPX_BIN_DIR "$HOME/.pkg/pipx/bin"
    if test -d "$PIPX_BIN_DIR"
        fish_add_path -Pm "$PIPX_BIN_DIR"
    end

    if test -d "$HOME/.local/bin"
        fish_add_path -Pm "$HOME/.local/bin"
    end

    if type -q direnv
        direnv hook fish | source
    end
end
