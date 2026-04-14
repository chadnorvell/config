function d --description "cd to ~/Δ/[WORKTREE | main]";
    set -l wt $argv main; cd ~/Δ/$wt[1]
end
