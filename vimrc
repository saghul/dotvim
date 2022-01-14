""" General settings """

" fuck vi! long life vim!
set nocompatible

" use filetype plugins
filetype plugin on
filetype plugin indent on

" color!
packadd! dracula
syntax on
"" Adapted from https://vim.fandom.com/wiki/Highlight_unwanted_spaces
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
colorscheme dracula
match ExtraWhitespace /\t\+$/
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\t\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\t\+\%#\@<!$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\t\+$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

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
set tabstop=8
set shiftround
set expandtab

" number of lines to show above and below the cursor
set scrolloff=4

" toggle paste mode
set pastetoggle=<F3>

" use mouse in normal mode
" set mouse=n

" ability to open up to 50 files
set tabpagemax=50

" ignore files and folders from listings
set wildignore+=.git/*,.svn/*,.hg/*,_darcs/*,build/*,dist/*,*.o,*.so,*.pyc,node_modules/

" save OS for later checks
let os = substitute(system('uname'), "\n", "", "")

" viminfo options: http://vimdoc.sourceforge.net/htmldoc/usr_21.html#21.3
set viminfo='100,<50,s10,h,!
rviminfo

" position cursor one character after the real content: http://vimdoc.sourceforge.net/htmldoc/options.html#'virtualedit
set virtualedit=onemore

" allow to switch buffers even without saving
set hidden

" nicer autocompletion for command menu
set wildmenu

""" Custom key settings """

" <leader> key
let mapleader = ","

" no more arrows!
" map <up> <nop>
" map <down> <nop>
" map <left> <nop>
" map <right> <nop>

" move across splits with Ctrl and arrows
nnoremap <C-left> <C-w>h
nnoremap <C-down> <C-w>j
nnoremap <C-up> <C-w>k
nnoremap <C-right> <C-w>l

" new empty buffer
nmap <leader>n :enew<CR>

" next buffer
nmap <C-l> :bnext<CR>

" previous buffer
nmap <C-h> :bprevious<CR>

" close buffer and jump to previous one (aka, close tab)
nmap <leader>bq :bp <BAR> bd #<CR>

" list buffers
nmap <leader>bl :Unite buffer<CR>

" clear highlighted search
nmap <silent><leader>l :nohlsearch<CR>

" open current directory
map <silent><leader>o :op .<CR>

" toggle line numbers
map <silent><F2> :set invnumber<CR>

" open a new shell
" imap ss <Esc>:sh<CR>

" use jj same as ESC
imap jj <Esc>


" standard cut/copy/paste keys
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa


" save file with sudo if not opened as root
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!
command Wq :execute ':W' | :q
command WQ :Wq


""" Misc options """

" remember where we stopped editing a file
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
    map <Esc>OA <Up>
    map <Esc>OB <Down>
    map <Esc>OC <Right>
    map <Esc>OD <Left>
    map <Esc>OH <Home>
    map <Esc>OF <End>
    map! <Esc>OA <Up>
    map! <Esc>OB <Down>
    map! <Esc>OC <Right>
    map! <Esc>OD <Left>
    map! <Esc>OH <Home>
    map! <Esc>OF <End>
endif
