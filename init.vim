set nocompatible              " be iMproved, required
syntax enable
filetype off                  " required

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'lifepillar/vim-mucomplete'
Plug 'vim-scripts/delimitMate.vim'

call plug#end()

set nu
set relativenumber
set tabstop=8
set smarttab
set softtabstop=0
set autoindent
set smartindent
set expandtab
set shiftwidth=4
set showmatch
set showcmd

autocmd Filetype ruby setlocal ts=2 sw=2 expandtab

set incsearch
set hlsearch
set ruler

" File search
set path+=**
set wildmenu

" Fix for slowing down in ruby files
set re=1

" space as leader
let mapleader = "\<Space>"
" save
nnoremap <Leader>w :w<CR>
" exit
nnoremap <Leader>q :q<CR>
" exit and save
nnoremap <Leader>x :x<CR>
" unhighlight search
nnoremap <Leader>y :nohlsearch<CR>
" NERDTree
nnoremap tn :NERDTreeToggle<CR>

nnoremap <Leader>f :FZF<CR>
nnoremap <Leader>F :FZF

nnoremap th :tabfirst<CR>
nnoremap tj :tabprev<CR>
nnoremap tk :tabnext<CR>
nnoremap tl :tablast<CR>
nnoremap <Leader>t :tabnew<CR>
nnoremap td :tabclose<CR>

imap jj <Esc>

" Easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" No arrow keys!!!!!
nnoremap <Left> :echo "No left for you!"<CR>
vnoremap <Left> :<C-u>echo "No left for you!"<CR>
inoremap <Left> <C-o>:echo "No left for you!"<CR>

nnoremap <Right> :echo "No right for you!"<CR>
vnoremap <Right> :<C-u>echo "No right for you!"<CR>
inoremap <Right> <C-o>:echo "No right for you!"<CR>

nnoremap <Up> :echo "No up for you!"<CR>
vnoremap <Up> :<C-u>echo "No up for you!"<CR>
inoremap <Up> <C-o>:echo "No up for you!"<CR>

nnoremap <Down> :echo "No down for you!"<CR>
vnoremap <Down> :<C-u>echo "No down for you!"<CR>
inoremap <Down> <C-o>:echo "No down for you!"<CR>

set splitbelow
set splitright

syntax on

let g:LanguageClient_serverCommands = {
    \ 'python': ['~/.local/bin/pyls'],
    \ 'ruby': ['/usr/local/bin/solargraph', 'stdio'],
    \ 'tex': ['~/.local/bin/texlab'],
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

set completeopt+=menuone
set completeopt+=noselect
set completeopt+=noinsert
set shortmess+=c   " Shut off completion messages
let g:mucomplete#enable_auto_at_startup = 1


let g:LanguageClient_loggingLevel = 'INFO'
let g:LanguageClient_virtualTextPrefix = ''
let g:LanguageClient_loggingFile =  expand('~/.local/share/nvim/LanguageClient.log')
let g:LanguageClient_serverStderr = expand('~/.local/share/nvim/LanguageServer.log')


let NERDTreeShowHidden=1
