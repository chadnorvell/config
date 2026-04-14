not test -d "$HOME/.pkg/npm/bin"; or set -q npm_config_prefix; and return
set -x npm_config_prefix "$HOME/.pkg/npm/bin"
fish_add_path -Pm "$HOME/.pkg/npm/bin"
