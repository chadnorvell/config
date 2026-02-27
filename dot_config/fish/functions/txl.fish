function txl --argument-names project_name
    if test -z "$project_name"
        echo "Usage: txl <project_name>"
        return 1
    end

    set -l full_name "$project_name-logged"
    set -l today (date +%Y-%m-%d)
    set -l log_dir "$XDG_DATA_HOME/devlog/raw/$today"
    mkdir -p $log_dir

    set -l fish_path (command -v fish)

    set -l wrapper_cmd "sh -c 'TS=\$(date +%Y%m%d-%H%M%S); \
        LOG=\"$log_dir/term-$project_name-pane-\$TS.log\"; \
        script -f -q -e \"\$LOG\" -c \"$fish_path\"; \
        if [ -s \"\$LOG\" ]; then \
            ansifilter --text \"\$LOG\" > \"\$LOG.tmp\" && mv \"\$LOG.tmp\" \"\$LOG\"; \
        fi'"

    if not tmux has-session -t "$full_name" 2>/dev/null
        tmux new-session -d -s "$full_name"
        tmux set-option -t "$full_name" default-command "$wrapper_cmd"
        tmux respawn-pane -t "$full_name:1.1" -k "$wrapper_cmd"

        echo "Starting new logged tmux session for $project_name"
    else
        echo "Logged tmux session for $project_name already exists, attaching to it"
    end

    tmux attach-session -t "$full_name"
end
