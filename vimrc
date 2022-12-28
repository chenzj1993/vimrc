" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

let skip_defaults_vim=1

set autoread
filetype on
filetype indent on
filetype plugin on
set encoding=utf-8

let mapleader=" "
set list
set nu
set ruler
set relativenumber
set listchars=tab:▸\ ,trail:▫
set cursorline
set scrolloff=5

set wrap
set showcmd
set wildmenu
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
map <C-s> :w<CR>
map <LEADER>w :w !sudo tee %<CR>:q!<CR>
map <C-d> :q<CR>

map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sj :set splitbelow<CR>:split<CR>
norema srm <C-w>\|<C-w>_
norema srw <C-w>\|
norema srh <C-w>_
norema sre <C-w>=
norema smh <C-w>H
norema sml <C-w>L
norema smj <C-w>J
norema smk <C-w>K
map <LEADER>l <C-w>l
map <LEADER>h <C-w>h
map <LEADER>j <C-w>j
map <LEADER>k <C-w>k

map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize -5<CR>
map <right> :vertical resize +5<CR>
map gf :vertical wincmd f<CR>

map <LEADER>r :vs ~/.vimrc<CR>
map <LEADER>R :source $MYVIMRC<CR>


map tn :tabe<CR>
map tc :tabclose<CR>
map tl :+tabnext<CR>
map th :-tabnext<CR>
map tmh :-tabmove<CR>
map tml :+tabmove<CR>

map + oconsole.log('++')<ESC>o<ESC>

noremap E $
noremap <LEADER><LEADER> :nohlsearch<CR>

map <LEADER>t :FloatermToggle<CR>

call plug#begin('~/.vim/plugged')
    Plug 'preservim/nerdtree'
    Plug 'voldikss/vim-floaterm'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'tpope/vim-surround'
    Plug 'airblade/vim-gitgutter'
    Plug 'junegunn/fzf.vim'
    Plug 'dense-analysis/ale'
call plug#end()


function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col] =# '\s'
endfunction

inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

map tt :NERDTreeToggle<CR>:set relativenumber<CR>
let NERDTreeShowHidden=1

let g:floaterm_keymap_toggle = "<C-t>"
let g:floaterm_width = 0.9
let g:floaterm_height = 0.9

set foldenable
