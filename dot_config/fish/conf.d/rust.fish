not test -e "$HOME/.cargo/env.fish"; or set -q fish_sourced_cargo; and return
source "$HOME/.cargo/env.fish"
set -x fish_sourced_cargo

