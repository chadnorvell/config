function nproc --wraps='sysctl -n hw.logicalcpu' --description 'alias nproc sysctl -n hw.logicalcpu'
    sysctl -n hw.logicalcpu $argv
end
