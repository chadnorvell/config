function run-in-wine
    WINEPREFIX=$argv[1] wine $argv[1]/drive_c/$argv[2] $argv[3..-1] > /dev/null 2>&1 & disown
end
