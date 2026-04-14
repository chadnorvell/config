not test -e "$HOME/.deno/env.fish"; or set -q fish_sourced_deno; and return
source "$HOME/.deno/env.fish"
set -x fish_sourced_deno
