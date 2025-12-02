function _prompt_hostname
    if test -z "$TMUX" 
        string join '' -- (set_color -o bryellow) (prompt_hostname) (set_color normal) ' '
    end
end

function _prompt_pwd
    string join '' -- (set_color -o brcyan) (prompt_pwd) (set_color normal) ' '
end

function _prompt_git
    set -g __fish_git_prompt_showdirtystate 1
    set -g __fish_git_prompt_showstashstate 1
    set -g __fish_git_prompt_showuntrackedfiles 1
    set -g __fish_git_prompt_char_stateseparator ' '
    set -g __fish_git_prompt_char_dirtystate '•'
    set -g __fish_git_prompt_char_invalidstate '~'
    set -g __fish_git_prompt_char_stagedstate '±'
    set -g __fish_git_prompt_char_untrackedfiles '×'
    set -g __fish_git_prompt_char_stashstate '†'
    set -g __fish_git_prompt_char_upstream_ahead '›'
    set -g __fish_git_prompt_char_upstream_behind '‹'
    set -g __fish_git_prompt_char_upstream_diverged '‹›'
    set -g __fish_git_prompt_char_upstream_equal '='

    set -l git_info (fish_git_prompt)
    set git_info (string trim $git_info)
    set git_info (string replace '(' '' $git_info)
    set git_info (string replace ')' '' $git_info)

    if test -n "$git_info"
        string join '' -- (set_color -o brmagenta) $git_info (set_color normal) ' '
    end
end

function fish_prompt
    set -l last_status $status
    set -l prompt_symbol (string join '' '» ' (set_color normal))

    set -l jobs (jobs | count)

    if test "$jobs" -gt 0
        set prompt_symbol (string join '' "$jobs$prompt_symbol")
    end

    if test -n "$IN_NIX_SHELL"
        set prompt_symbol (string join '' "ƒ $prompt_symbol")
    end

    if test $last_status -ne 0
        set prompt_symbol (string join '' (set_color -o brred) "[$last_status] $prompt_symbol")
    else
        set prompt_symbol (string join '' (set_color -o brgreen) $prompt_symbol)
    end

    string join '' -- \
        (_prompt_hostname) \
        (_prompt_pwd) \
        (_prompt_git) \
        $prompt_symbol
end
