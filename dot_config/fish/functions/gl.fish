function gl --description "git log"
    argparse v/verbose 'n#num' 'f/from=' 'g=!_validate_int --min 1 --max 3' -- $argv; or return

    set -f cmd "git log"
    set -ql _flag_f; and set cmd "$cmd $_flag_f..HEAD"
    set -ql _flag_n; and set cmd "$cmd -$_flag_n"

    if set -ql _flag_g
        set -f graph "--graph --abbrev-commit --decorate"

        if test $_flag_g = 1
            set graph "$graph --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)'"
        end

        if test $_flag_g = 2
            set graph "$graph --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(auto)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)'"
        end

        if test $_flag_g = 3
            set graph "$graph --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset) %C(bold cyan)(committed: %cD)%C(reset) %C(auto)%d%C(reset)%n''          %C(white)%s%C(reset)%n''          %C(dim white)- %an <%ae> %C(reset) %C(dim white)(committer: %cn <%ce>)%C(reset)'"
        end

        eval "$cmd $graph"
    else
        not set -ql _flag_v; and set -l oneline --oneline
        set cmd "$cmd $oneline"

        eval "$cmd"
    end
end
