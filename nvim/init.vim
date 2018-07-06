set laststatus=2

"" Plugins
call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'justinmk/vim-sneak'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'martinda/Jenkinsfile-vim-syntax'
call plug#end()
"" Plugin settings
set updatetime=200 " for gitgutter
"let g:gitgutter_sign_column_always = 1
set signcolumn=yes

"" General
set backspace=2
set showcmd
set number
set relativenumber
set t_Co=256
set mouse=a
set cursorline
syntax on
filetype plugin indent on
cmap w!! w !sudo tee % > /dev/null

"" Theme + fixes
set termguicolors
colorscheme protokai
let g:airline_theme='bubblegum'
" Have matching paren highlighting not be confusing with cursor
hi MatchParen cterm=underline ctermfg=none ctermbg=none
" fix the cursor shaping commands littering q's in our terminal as root
" (workaround for konsole-specific bug...)
if expand('$USER') == 'root'
    set guicursor=
endif

"" Whitespace
set tabstop=4
set shiftwidth=4
set scrolloff=3   "Leave 3 lines of space below/above cursor when scrolling
set nowrap
"" Show invisible characters. ctermfg 0 should be a low-contrast colour
set list
set listchars=tab:»\ ,trail:·
hi SpecialKey ctermfg=0

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
nnoremap <ESC> :noh<CR>

"" Tab switching
nnoremap <F7> :tabprevious<CR>
nnoremap <F8> :tabnext<CR>
inoremap <F7> <Esc>:tabprevious<CR>
inoremap <F8> <Esc>:tabnext<CR>
tnoremap <F7> <C-\><C-n>:tabprevious<CR>
tnoremap <F8> <C-\><C-n>:tabnext<CR>

"" json prettify
com! Jsonpretty %!python -m json.tool

"" ctrl backspace
 " without ctrl-bs -> alt-bs mod
imap  <C-W>
 " with ctrl-bs -> alt-bs mod
imap <M-BS> <C-W>

"" Command for writing text rather than code
function! Writing()
	set wrap
	set linebreak
	set nolist
	set spell
endfunction
