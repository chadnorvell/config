function v
  if test -d $argv[1]
    eza --long $argv[1]
  else if test -f $argv[1]
    bat $argv[1]
  else
    echo "Error: Path '$argv[1]' is neither a directory nor a file."
  end
end

