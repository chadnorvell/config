" basic settings
syntax enable
set nocompatible
set showmatch
set hlsearch
set incsearch
set noshowmode
set number
set hidden
set backspace=indent,eol,start
set ls=2
set foldmethod=indent
set foldlevel=99
set clipboard=unnamedplus
set wildmode=longest,list
set mouse=a

" default text formatting
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=80
set expandtab
set autoindent
set formatoptions-=t
set fileformat=unix
set encoding=utf-8

" text format overrides for 2-space tab stop file formats
au BufNewFile,BufRead *.css,*.ex,*.exs,*.js,*.json,*.jsx,*.nix,*.rb,*.ts,*.tsx
\     set tabstop=2 |
\     set softtabstop=2 |
\     set shiftwidth=2

" special syntax highlighing
autocmd FileType json syntax match Comment +\/\/.\+$+

" recognize the alt key in terminals
if !has("gui_running")
let c='a'
while c <= 'z'
exec "set <A-".c.">=\e".c
exec "imap \e".c." <A-".c.">"
let c = nr2char(1+char2nr(c))
endw

set timeout ttimeoutlen=50
endif

" splits
set splitbelow
set splitright
nnoremap <S-Down> <C-w><C-j>
nnoremap <S-Up> <C-w><C-k>
nnoremap <S-Right> <C-w><C-l>
nnoremap <S-Left> <C-w><C-h>
nnoremap <C-Down> :rightbelow split<CR>
nnoremap <C-Up> :leftabove split<CR>
nnoremap <C-Right> :rightbelow vsplit<CR>
nnoremap <C-Left> :leftabove vsplit<CR>
map <A-Down> :resize -4<CR>
map <A-Up> :resize +4<CR>
map <A-Right> :vertical:resize -4<CR>
map <A-Left> :vertical:resize +4<CR>

" ui
set t_RV=
set t_Co=16
set fillchars+=vert:\│
