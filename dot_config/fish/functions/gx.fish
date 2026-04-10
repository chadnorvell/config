function gx --description 'git delete merged branches'
    git branch --merged | grep -v "^\*\\|main" | xargs -n 1 git branch -d
end
