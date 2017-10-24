set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype off           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" Vundle setup
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My vundles
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-git'
Bundle 'godlygeek/tabular'
Bundle 'matchit.zip'
Bundle 'tomtom/tcomment_vim'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'pangloss/vim-javascript'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'ervandew/supertab'
Bundle 'jamessan/vim-gnupg'

set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

set showmode
set showcmd
set title
set ruler
set hlsearch
set incsearch
set showmatch
set ignorecase
set smartcase
set hidden
set number
set hlsearch
set history=1000
set autoread

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

set backupdir=~/.tmp   
set directory=~/.tmp "don't clutter my dirs with swp and tmp files

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.

silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

set backspace=indent,eol,start " allows backspace insert mode

" show fancy symbols for Powerline
let g:Powerline_symbols='fancy'

" Status line
set laststatus=2
set showtabline=2
set noshowmode

" set statusline=
" set statusline+=%-3.3n\                      " buffer number
" set statusline+=%f\                          " filename
" set statusline+=%h%m%r%w                     " status flags
" set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
" set statusline+=%=                           " right align remainder
" set statusline+=%-14(%l,%c%V%)               " line, character
" set statusline+=%<%P                         " file position
" set statusline+=%{fugitive#statusline()}

" use ack instead of grep
set grepprg=ag

autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete

runtime! macros/matchit.vim

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

highlight StatusLine ctermfg=yellow

let mapleader = ","

" get me outta here
command Q q

" clear highlighting
map <C-h> :nohl<CR>

" ctrl-s to save
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

" ctrl-n maps to :cn (next search result) 
" ctrl-p maps to :cp (prev search result)
map <C-n> :cn<CR>
map <C-p> :cp<CR>


"no highlight
map <C-h> :nohl<CR>

"new tab
map <C-t> <esc>:tabnew<CR>

" run a single ruby test:
" map <Leader>o ?def <CR>:nohl<CR>w"zy$:!ruby -I"test" <C-r>% -n <C-r>z<CR>
map <Leader>o :.Rake<CR>

" run a file of tests
map <Leader>t :!ruby -I"test" -I"spec" %<CR>

" run spec in documentation mode
map <Leader>rd :!bundle exec rspec % --format documentation<CR>

" run cucumber feature
map <Leader>cc :!cucumber %<CR>
 
" split vertically with <leader> v
" split horizontall with <leader> s
" nmap <leader>v :vsplit<CR> <C-w><C-w>
" nmap <leader>s :split<CR> <C-w><C-w>

" switch windows with <leader> w
nmap <leader>w <C-w><C-w>

" Edit another file in the same directory as the current file " uses
" expression to extract path from current file's path 
map <Leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>s :split <C-R>=expand("%:p:h") .  '/'<CR>
map <Leader>v :vnew <C-R>=expand("%:p:h") . '/'<CR>

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" svn blame
vmap <Leader>b :<C-U>!svn blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>

" rails.vim stuff
map <Leader>c :Rcontroller 
map <Leader>d odebugger<cr>puts 'debugger'<esc>:w<cr>
map <Leader>co :TComment<CR>
map <Leader>vc :RVcontroller 
map <Leader>sc :RScontroller 
map <Leader>f :Rfunctional 
map <Leader>vf :RVfunctional 
map <Leader>m :Rmodel 
map <Leader>vm :RVmodel 
map <Leader>sm :RSmodel 
map <Leader>r :e doc/README_FOR_APP<CR> " Edit the README_FOR_APP (makes :R commands work)
map <Leader>u :Runittest 
map <Leader>vu :RVunittest 
map <Leader>su :RSunittest 
map <Leader>vv :RVview 
map <Leader>sv :RSview 
"
" Create window splits easier. The default
" way is Ctrl-w,v and Ctrl-w,s. I remap
" this to vv and ss
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

" Display extra whitespace
" set listchars=trail:.,tab:>-
" set list

" better movement on wrapped lines
nnoremap j gj
nnoremap k gk

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv


" ctrl-p
let g:ctrlp_map = '<c-x>'
let g:ctrlp_cmd = 'CtrlP'

" colors
" colorscheme ir_black
syntax enable
set background=dark
"set t_Co=16
"let g:solarized_termcolors=16
"let g:solarized_visibility = "normal"
"let g:solarized_contrast = "high"
colorscheme solarized

" NERDTree
:noremap <leader>n :NERDTreeToggle<cr>

set tags=./tags

" let me know if i'm over 80 cols
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
