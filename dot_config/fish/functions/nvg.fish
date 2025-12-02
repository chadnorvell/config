function nvg --wraps='nohup neovide $argv > /dev/null 2>&1 &'
  if set -q argv
    set launch_path $argv
  else
    set launch_path .
  end

  nohup neovide $launch_path > /dev/null 2>&1 &
end
