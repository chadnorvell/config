function git-del-branches --description "delete git branches"
    argparse D dry-run -- $argv; or return
    set -l hidden main

    set -l merged (git branch --merged | cut -c 3- | grep -v "^*\|$hidden")
    set -l no_merged (git branch --no-merged | cut -c 3- | grep -v "^*\|$hidden" | sed 's/$/*/')

    if test \( -z "$merged" \) -a \( -z "$no_merged" \)
        echo "no branches"
        return
    end

    set -l branches_to_delete (gum choose $merged $no_merged --no-limit --selected=$merged)

    set -ql _flag_D; and set -l delete_flag -D; or set -l delete_flag -d
    set -ql _flag_dry_run; and echo "Dry run:"

    for b in $branches_to_delete
        set -l b_name (string replace -r '\*$' '' $b)
        set -l b_cmd "git branch $delete_flag $b_name"
        set -ql _flag_dry_run; and echo "> $b_cmd"; or eval $b_cmd
    end
end
