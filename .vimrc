let $GOPATH = '/Users/ross/go' " required for MacVim

let mapleader = ','

" plugins
let g:plug_window = 'vertical botright new'
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'altercation/vim-colors-solarized'
Plug 'fatih/vim-go'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'valloric/youcompleteme'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/syntastic'
"Plug 'benmills/vimux'
"Plug 'christoomey/vim-tmux-navigator'
call plug#end()
" /plugins


" vim
" <leader>
let mapleader = ','
" UTF-8 support
set encoding=utf-8
" highlight cursor line
set cursorline
" vimux-golang DISABLED
" map <Leader>ra :wa<CR> :GolangTestCurrentPackage<CR>
" map <Leader>rf :wa<CR> :GolangTestFocused<CR>
" enable mouse
set mouse=a
" enable line numbers
set number
" case insensitive searching
set ignorecase
" use case sensitive searching when caps present
set smartcase
" show unwanted whitespace
set list listchars=tab:→\ ,trail:·
" better pane navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" better split openning
set splitbelow
set splitright
" folding
" set foldmethod=syntax
" set foldnestmax=1
" /vim


" NERDTree Config
" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowBookmarks = 1
let g:NERDTreeChDirMode = 2
"
" DISABLED
" open NERDTree automatically when vim starts up on opening a directory 
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" let NERDTreeShowHidden=1


" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" disable active mode for go files
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
" /syntastic


" solarized
syntax enable
set background=dark
colorscheme solarized
" /solarized


" vim-go
let g:go_gocode_unimported_packages = 1
" By default syntax-highlighting for Functions, Methods and Structs is disabled. To change it:
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
" Enable goimports to automatically insert import paths instead of gofmt:
let g:go_fmt_command = "goimports"
" fix conflict with syntastic
let g:go_list_type = "quickfix"
" /vim-go


" crtlp
let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = 'rw'
" /crtlp


function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

