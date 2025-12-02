function nv
  argparse 'p/project=' 'g/gui' -- $argv
  or return

  set -l bin nvim

  # Run a GUI if the -g flag is provided, plain nvim otherwise
  if set -ql _flag_g
    set bin nvg
  end

  # If a project was provided, execute the custom procedure
  if set -ql _flag_p[1]
    set project $_flag_p[1]

    if [ $project = "cfg" ]
      cd ~/cfg
      $bin ~/cfg
      cd -
    else if [ $project = "ctrl" ]
      cd ~/ctrl/ai
      nxd -c $bin
      cd -
    else
      echo "Error: Unrecognized project '$project'"
      return 2
    end

  # Otherwise, treat this like a normal nvim invocation
  else
    $bin $argv
  end
end

