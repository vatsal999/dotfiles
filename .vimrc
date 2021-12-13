syntax on
set encoding=utf8
set mouse=a
set noruler
set nu
set relativenumber
set hidden
set noerrorbells
set tabstop=4 softtabstop=4 
set shiftwidth=4
set expandtab
set smartindent
set nowrap 
set noswapfile
set incsearch
set scrolloff=10
"set noshowmode
set cursorline

if exists('+termguicolors')
    let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

inoremap " ""<left>
inoremap ' ''<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap ( ()<left>

nnoremap H 0
nnoremap L $
inoremap jk <esc>
nnoremap n nzz
nnoremap N Nzz

let mapleader=" "

"move line up and down"
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
"move para or lines up and down"
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

autocmd vimEnter *.cpp nnoremap <F8> :w <bar>  !g++ --std=c++14 % -o %:r && ./%:r<CR>

let g:ikigai_style = 'pop'
let g:ikigai_enable_italic = '0'
let g:ikigai_transparent_background = '1'
colorscheme ikigai

""highlight Normal guibg=NONE 
