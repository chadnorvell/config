function ggg --description 'git clone and cd into repo dir'
    git clone $argv && cd $(echo $argv | grep -o '[^/]*$' | cut -d '.' -f 1) $argv
end
