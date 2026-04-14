not test -d "$HOME/.pkg/pipx"; or set -q PIPX_HOME; and return
set -x PIPX_HOME "$HOME/.pkg/pipx"
set -x PIPX_BIN_DIR "$HOME/.pkg/pipx"
fish_add_path -Pm "$PIPX_BIN_DIR"
