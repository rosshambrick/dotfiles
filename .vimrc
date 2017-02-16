" airline
let g:airline_powerline_fonts = 1
" /airline


" macvim
let $GOPATH = '/Users/ross/go' " required for MacVim
"set guifont=Hack:h11
set guifont=Source\ Code\ Pro\ for\ Powerline:h12
" /macvim


" plugins
let g:plug_window = 'vertical botright new'
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree'
Plug 'altercation/vim-colors-solarized'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'valloric/youcompleteme'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/syntastic'
Plug 'burnettk/vim-angular'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'embear/vim-localvimrc'
Plug 'scrooloose/nerdcommenter'
Plug 'ternjs/tern_for_vim'
Plug 'tpope/vim-abolish'
Plug 'janko-m/vim-test'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'skywind3000/asyncrun.vim'
Plug 'mhinz/vim-grepper'
Plug 'ecomba/vim-ruby-refactoring'
Plug 'tmhedberg/matchit'
"Plug 'chiel92/vim-autoformat'
Plug '907th/vim-auto-save'
Plug 'craigemery/vim-autotag'
Plug 'tpope/vim-bundler'
"Plug 'benmills/vimux'
"Plug 'christoomey/vim-tmux-navigator'
"Plug 'fatih/vim-go'
Plug 'bling/vim-airline' " must run last
call plug#end()
" /plugins


" vim
set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
let mapleader = ' '   " <leader>
set clipboard=unnamed " clipboard integration
set encoding=utf-8
set cursorline        " highlight cursor line
" map <Leader>ra :wa<CR> :GolangTestCurrentPackage<CR>
" map <Leader>rf :wa<CR> :GolangTestFocused<CR>
set mouse=a " enable mouse
set number  " enable line numbers
set ignorecase        " case insensitive searching
"set smartcase " disabled so ctrP will search for ClassNames that match class_names
set list listchars=tab:→\ ,trail:·  " show unwanted whitespace
set formatoptions-=t  " disable wrapping
set nowrap            " disable word wrapping
" better pane navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap ; :
"inoremap jj <Esc>
"inoremap kk <Esc>
"inoremap uu <Esc>
"inoremap ll <Esc>
set splitbelow
set splitright
" spaces, not tabs
set expandtab
set shiftwidth=2
set softtabstop=2
filetype plugin indent on
" folding
" set foldmethod=syntax
" set foldnestmax=1
map <leader>f zfat
nmap <leader>= gg=G<CR>  " format all
" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
  let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
  let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif
" /vim


" nerdtree
" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" close vim if the only window left open is a NERDTree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowBookmarks = 1
let g:NERDTreeChDirMode = 2
let g:NERDTreeMapJumpPrevSibling = ''
let g:NERDTreeMapJumpNextSibling = ''
let NERDTreeShowHidden=1
"
" DISABLED
" open NERDTree automatically when vim starts up on opening a directory
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" /nerdtree


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
let g:ctrlp_custom_ignore = 'node_modules\|bower_components'
" /crtlp


" vim-auto-save
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_in_insert_mode = 0
" /vim-auto-save


" diff buffer with saved file
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()
" /diff


" vim-test
let test#strategy = "asyncrun"
let g:airline_section_error = airline#section#create_right(['%{g:asyncrun_status}'])
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>v :TestVisit<CR> " using <leader>g for Grepper
" /vim-test


" grepper
nnoremap <leader>g :Grepper<CR>
nnoremap <leader>G :Grepper -cword -noprompt<cr>
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
" /grepper

