not test -d "$HOME/.bun/bin"; or set -q BUN_INSTALL; and return
set -x BUN_INSTALL "$HOME/.bun"
fish_add_path -Pm "$BUN_INSTALL/bin"
