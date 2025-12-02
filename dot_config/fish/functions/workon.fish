function workon
  if [ $argv = "ctrl" ]
    cd ~/ctrl/ai
    nxd
  else
    echo "Error: Unrecognized project '$argv'"
    return 2
  end
end

