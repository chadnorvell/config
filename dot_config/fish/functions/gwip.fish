function gwip --description 'git save changes as WIP commit'
    git add -A && git commit --no-verify -m '~~WIP~~'
end
