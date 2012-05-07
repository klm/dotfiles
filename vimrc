set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype off           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" Vundle setup
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My vundles
Bundle 'wincent/Command-T'
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

set autoindent
set smartindent
set showmode
set showcmd
set wildmenu
set wildmode=list:longest
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

set backupdir=~/.tmp   
set directory=~/.tmp "don't clutter my dirs with swp and tmp files

set backspace=indent,eol,start

" Status line
set laststatus=2
set statusline=
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " filename
set statusline+=%h%m%r%w                     " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
set statusline+=%=                           " right align remainder
set statusline+=%-14(%l,%c%V%)               " line, character
set statusline+=%<%P                         " file position
set statusline+=%{fugitive#statusline()}

" use ack instead of grep
set grepprg=ack

autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete

runtime! macros/matchit.vim

set ai 
set sw=2
set et

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

" Display extra whitespace
" set listchars=trail:.,tab:>-
" set list

" useful key bindings
imap uu _
imap hh =>
imap aa @

" better movement on wrapped lines
nnoremap j gj
nnoremap k gk

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv



" colors
" colorscheme ir_black
set background=dark
colorscheme solarized

" NERDTree
:noremap <leader>n :NERDTreeToggle<cr>

" fuzzyfinder textmate
map <leader>h :FuzzyFinderTextMate<cr>
let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;vendor/**;coverage/**;tmp/**;rdoc/**"

set tags=./tags
