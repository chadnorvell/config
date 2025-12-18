function antigravity --wraps=antigravity --description 'launch antigravity'
    command antigravity $argv >/dev/null 2>&1 &
    disown
end
