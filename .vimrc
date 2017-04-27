
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
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
"Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
"Plug 'embear/vim-localvimrc'
Plug 'scrooloose/nerdcommenter'
"Plug 'ternjs/tern_for_vim'
Plug 'tpope/vim-abolish'
Plug 'janko-m/vim-test'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'skywind3000/asyncrun.vim'
Plug 'mhinz/vim-grepper'
Plug 'ecomba/vim-ruby-refactoring'
Plug 'tmhedberg/matchit'
Plug '907th/vim-auto-save'
Plug 'craigemery/vim-autotag'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'
Plug 'w0rp/ale'
Plug 'terryma/vim-expand-region'
Plug 'sickill/vim-pasta'
Plug 'yssl/QFEnter'
Plug 'maralla/completor.vim'
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
"Plug 'ngmy/vim-rubocop'
"Plug 'jiangmiao/auto-pairs'
"Plug 'chiel92/vim-autoformat'
"Plug 'Townk/vim-autoclose'
"Plug 'astashov/vim-ruby-debugger'
"Plug 'benmills/vimux'
"Plug 'christoomey/vim-tmux-navigator'
"Plug 'fatih/vim-go'
Plug 'bling/vim-airline' " must run last
call plug#end()
" /plugins


" vim
set nocompatible      " We're running Vim, not Vi!
set undofile
set undodir=~/.vim/undodir
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
let mapleader = ' '   " <leader>
set clipboard=unnamed " clipboard integration
set encoding=utf-8    " utf8 support
set mouse=a           " enable mouse
set number            " enable line numbers
set ignorecase        " case insensitive searching
set list listchars=tab:→\ ,trail:·  " show unwanted whitespace
set formatoptions-=t  " disable wrapping
set nowrap            " disable word wrapping
set splitbelow        " avoid overwriting NERDTree Window
set splitright        " avoid overwriting NERDTree Window"
set expandtab         " spaces, not tabs
set shiftwidth=2      " spaces, not tabs
set softtabstop=2     " spaces, not tabs
set spell spelllang=en_us
set hlsearch
set relativenumber
set number
set smartcase " disabled so ctrP will search for ClassNames that match class_names
set cursorline        " highlight cursor line [causes slowdown in ruby files]
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <Leader>f zfat
nnoremap <Leader>= gg=G<CR>
nnoremap <Leader><CR> o<Esc>
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//gI<Left><Left><Left>
nnoremap <C-c> :AsyncStop<CR>
nnoremap <Leader>f :Grepper<CR>
nnoremap <Leader>F :Grepper -cword -noprompt<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gb :Gbrowse<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>ge :Gedit<CR>
nnoremap <Leader>gp :Gpush<CR>
nnoremap <Leader>r :!rubocop -a %:p<CR>
nnoremap <Leader>R :!rubocop<CR>
nnoremap <Leader>qo :botright cwindow 20<CR>
nnoremap <Leader>qc :cclose<CR>
nnoremap <Leader>pw viwp
nnoremap <Leader>h :noh<CR>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
nmap f <Plug>(easymotion-overwin-f2)
nnoremap <Leader>u i_<Esc>
map <Leader>id :put =strftime('%b %d, %Y')<Esc>
nnoremap <silent> <Leader>t :TestNearest<CR>
nnoremap <silent> <Leader>T :TestFile<CR>
nnoremap <silent> <Leader>a :TestSuite<CR>
nnoremap <silent> <Leader>l :TestLast<CR>
nnoremap <silent> <Leader>v :TestVisit<CR>
nnoremap <Leader>d :!rspec -P %:p:h/*_spec.rb<CR>
nnoremap <C-]> g<C-]>
filetype plugin indent on
" set foldmethod=syntax
" set foldnestmax=1
" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
  let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
  let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif
"autocmd BufWritePre * %s/\s\+$//e "remove trailing whitespace
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd QuickFixCmdPost *grep* cwindow
if has('mouse_sgr')
  set ttymouse=sgr
endif
" /vim


" nerdtree
" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" close vim if the only window left open is a NERDTree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" open NERDTree automatically when vim starts up on opening a directory
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
let NERDTreeShowBookmarks = 1
let g:NERDTreeChDirMode = 2
let g:NERDTreeMapJumpPrevSibling = ''
let g:NERDTreeMapJumpNextSibling = ''
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.swp$', '.DS_Store']
let NERDTreeMapOpenVSplit = 'v'
" /nerdtree


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
let g:ctrlp_custom_ignore = { 'dir': 'node_modules\|bower_components', 'file': '\.swp$' }
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
" /vim-test


" grepper
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
" /grepper


" vim-ruby
"let ruby_fold = 1
let ruby_foldable_groups = 'def it'
" /vim-ruby

" ale
let g:ale_sign_column_always = 1
" /ale


" editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
"

" airline
let g:airline_powerline_fonts = 1
let g:airline_detect_spell = 0
let g:airline_section_error = airline#section#create_right(['%{g:asyncrun_status}'])
let g:airline_inactive_collapse = 1
let g:airline#extensions#tabline#fnamecollapse = 1
let g:airline#extensions#branch#enabled = 0
" /airline

