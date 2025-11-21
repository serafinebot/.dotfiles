" misc
syntax on
set relativenumber
set mouse=a
set backspace=indent,eol,start

" indentation
filetype plugin indent on
set autoindent
set smartindent

let mapleader = " "
let maplocalleader = " "

" copy/paste from clipboard
vnoremap <leader>y "+y
nnoremap <leader>y "+y
vnoremap <leader>p "+p
vnoremap <leader>P "+P
nnoremap <leader>p "+p
nnoremap <leader>P "+P

" move between pane splits
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" move between tabs
nnoremap <C-l> :tabnext<CR>
nnoremap <C-h> :tabprevious<CR>

" disable highlight
nnoremap <C-g> :noh<CR>

" jump to previous file
nnoremap <leader>fe :e#<CR>

" center cursor when cycling through search
nnoremap n nzzzv
nnoremap N Nzzzv

" indent while in visual mode
vnoremap > >gv
vnoremap < <gv

" move selected block
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv
