" Plugins via vim-plug
call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go'
Plug 'christoomey/vim-tmux-navigator'

call plug#end()


" NERDTree Config
" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"open NERDTree automatically when vim starts up on opening a directory 
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
let NERDTreeShowHidden=1

" UTF-8 support
set encoding=utf-8

" highlight cursor line
set cursorline
