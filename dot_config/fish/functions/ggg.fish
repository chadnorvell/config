function ggg --description "git clone && cd"
    if test (count $argv) -lt 1
        echo "Error: Needs a repo URL"
        return 1
    end

    set -l url $argv[1]
    set -l dir (string replace -r '.*/(.*)\.git$' '$1' $url; or string replace -r '.*/' "" $repo_url)

    if git clone $url
        cd $dir
    else return 1
    end
end
