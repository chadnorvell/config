# Enable appending ' ! <new command>' to replace original command
function _magic_space
    set -l buf (commandline -b)

    # Match (original command) (args) ! (new command)
    if string match -qr '^\S+\s+(?<a>.+)\s+!\s+(?<b>\S+)$' -- "$buf"
        set -l match (string match -r '^\S+\s+(?<a>.+)\s+!\s+(?<b>\S+)$' -- "$buf")
        commandline -r "$match[3] $match[2]"
    else
        commandline -i " "
    end
end

bind " " _magic_space
