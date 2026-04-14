not test -d "$HOME/.pkg/go"; or set -q GOPATH; and return
set -x GOPATH "$HOME/.pkg/go"
fish_add_path -Pm "$HOME/.pkg/go/bin"
