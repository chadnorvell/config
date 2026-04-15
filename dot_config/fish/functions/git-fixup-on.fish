function git-fixup-on --description "git commit as a fixup on another commit"
    git log --oneline | gum choose | awk '{print $1}' | xargs git commit --fixup
end
