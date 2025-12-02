function gca --wraps='git commit --amend $argv'
  git commit --amend $argv
end
