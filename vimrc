""" General settings """

" fuck vi! long life vim!
set nocompatible

" mode filetype
filetype on
filetype plugin on
filetype plugin indent on

" color!
syntax on

" lines and cols in status line
set ruler

" always show status line
set laststatus=2

" line numbers
set number

" show a line under the cursor
set cursorline

" show current mode in status line
set showmode

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" enhance background
set background=dark

" number of commandline history and undo lines
set history=1000
set undolevels=1000

" do incremental searching
set incsearch

" highlight search
set hlsearch

" highlight mode for hlsearch
set hl=l:Incsearch 

"ignore case when searching
set ignorecase

" ignore case if search pattern is all lowercase, case-sensitive otherwise
set smartcase

" don't wrap lines if they are too large
set nowrap

" enable auto-indenting
set autoindent
set copyindent

" tab width spaces
set shiftwidth=4
set softtabstop=4
set shiftround

" number of lines to show above and below the cursor
set scrolloff=4

" toggle paste mode
set pastetoggle=<F3>

" use mouse in normal mode
" set mouse=n

" ignore files and folders from listings
set wildignore+=.git/*,.svn/*,.hg/*,_darcs/*,build/*,dist/*,*.o,*.so,*.pyc


""" Custom key settings """

" <leader> key
let mapleader = ","

" Use Q for formatting the current paragraph (or selection)
" doesn't do it very well for Python code
" vmap Q gq
" nmap Q gqap

" no more arrows!
" map <up> <nop>
" map <down> <nop>
" map <left> <nop>
" map <right> <nop>

" clear highlighted search
nmap <silent><C-l> :nohlsearch<CR>

" Managing tabs:
" CTRL-t opens a new tab
" ALT-left moves left
" ALT-right moves right
" CTRL-o opens current directory
map <silent><C-t> :tabnew<CR>
map <silent><C-o> :op .<CR>

" open Command-T
nmap <Leader>t :CommandT<CR>

if has("mac")
    map <silent><S-Right> :tabnext<CR>
    map <silent><S-Left> :tabprevious<CR>
elseif has("unix")
    map <silent><A-Right> :tabnext<CR>
    map <silent><A-Left> :tabprevious<CR>
endif

" toggle line numbers 
map <silent><F2> :set invnumber<CR>

" open a new shell
" imap ss <Esc>:sh<CR>

" toggle NERDtree
" map <silent><F3> :NERDTreeToggle<CR>

" use jj same as ESC 
imap jj <Esc>

" fast write and quit
imap qq <Esc>:q!<CR>
imap ww <Esc>:wq<CR>

" Toggle TagLIst on/off
map <silent><F5> :TlistToggle<CR>

" show task list
map <silent><S-t> <Plug>TaskList

" omnicomplete
" <C-p> : keyword completion
if has("gui")
    inoremap <C-Space> <C-x><C-o>
else
    inoremap <Nul> <C-x><C-o>
endif
" <C-Space> might be needed in GUI environments instead of <Nul>


""" skeletons """

"au BufNewFile *.py 0r ~/.vim/skeleton/python.py


""" GUI options """

if has("gui")
    set guifont=Monaco:h16
    colorscheme kib_darktango
endif


""" Plugin options """

" TagList plugin configuration
if has("mac")
    let Tlist_Ctags_Cmd = '/opt/local/bin/ctags'
elseif has("unix")
    let Tlist_Ctags_Cmd = '/usr/bin/ctags-exuberant'
endif
let Tlist_Inc_Winwidth = 0


""" Misc options """

" remember where we stopped editing a file
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif


