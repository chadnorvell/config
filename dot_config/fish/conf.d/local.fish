not test -d "$HOME/.local/bin"; or set -q fish_pathed_local_bin; and return
fish_add_path -Pm "$HOME/.local/bin"
set -x fish_pathed_local_bin
