function git-del-worktrees --description "delete git worktrees"
    argparse b f D dry-run -- $argv; or return

    set -l worktrees (git worktree list --porcelain | grep '^worktree' | awk '{print $2}' | tail -n +2)

    if test -z "$worktrees"
        echo "no worktrees"
        return
    end

    set -l worktrees_to_remove (gum choose --no-limit --selected='*' $worktrees)

    set -ql _flag_f; and set -l worktree_flag -f
    set -ql _flag_D; and set -l branch_flag -D; or set -l branch_flag -d
    set -ql _flag_dry_run; and echo "Dry run:"

    for wt in $worktrees_to_remove
        set -l wt_cmd "git worktree remove $worktree_flag $wt"
        set -ql _flag_dry_run; and echo "> $wt_cmd"; or eval $wt_cmd

        if set -ql _flag_b
            set -l branch_name (basename "$wt")
            set -l branch_cmd "git branch $branch_flag $branch_name"
            set -ql _flag_dry_run; and echo "> $branch_cmd"; or eval $branch_cmd
        end
    end
end
