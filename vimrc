""" General settings """

" fuck vi! long life vim!
set nocompatible

" pathogen
filetype on
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#runtime_append_all_bundles('static_bundle')
call pathogen#helptags()

" use filetype plugins
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
set wildignore+=.git/*,.svn/*,.hg/*,_darcs/*,build/*,dist/*,*.o,*.so,*.pyc

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

" Use Q for formatting the current paragraph (or selection)
" doesn't do it very well for Python code
" vmap Q gq
" nmap Q gqap

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

" open CtrlP
nmap <Leader>t :CtrlP<CR>

" toggle line numbers
map <silent><F2> :set invnumber<CR>

" open a new shell
" imap ss <Esc>:sh<CR>

" toggle NERDtree
map <silent><F4> :NERDTreeToggle<CR>

" use jj same as ESC
imap jj <Esc>

" tagbar
map <silent><F5> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" show task list
map <silent><S-t> <Plug>TaskList

" ack
noremap <Leader>f :Ack

" gundo
map <silent><F6> :GundoToggle<CR>

" hammer
noremap <Leader>p :Hammer<CR>

" airline
"  Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
"  Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'


" standard cut/copy/paste keys
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa


" save file with sudo if not opened as root
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!
command Wq :execute ':W' | :q
command WQ :Wq


" default completion
set omnifunc=syntaxcomplete#Complete


""" skeletons """

"au BufNewFile *.py 0r ~/.vim/skeleton/python.py


""" GUI options """

if has("gui_running")
    if os == "Darwin"
	set guifont=Ubuntu\ Mono:h18,Inconsolata:h16
    else
        set guifont=UbuntuMono\ 16,Inconsolata\ 16
    endif
    " no toolbar
    set guioptions-=T
    " no menu bar
    set guioptions-=m
    " no scrollbar on the right
    set guioptions-=r
    " no scrollbar on the left
    set guioptions-=l
    " disable audible bell
    set visualbell
endif


""" Plugin options """

" AutoClose (disabled for now)
let g:autoclose_loaded = 1

" Ack plugin configuration
if os == "Darwin"
    let g:ackprg="ack -H --nocolor --nogroup --column"
elseif os == "Linux"
    let g:ackprg="ack-grep -H --nocolor --nogroup --column"
endif

" TagList plugin configuration
let Tlist_Inc_Winwidth = 0

" flake8
let g:flake8_cmd=expand("~/.vim/pymodules/bin/flake8")

" Ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" signify
let g:signify_vcs_list = [ 'git', 'darcs', 'hg' ]
let g:signify_vcs_cmds = {
    \ 'git':      'git diff --no-color --no-ext-diff -U0 -- %f',
    \ 'hg':       'hg diff --config extensions.color=! --config defaults.diff= --nodates -U0 -- %f',
    \ 'darcs':    'darcs diff --no-pause-for-gui --diff-command="diff -uNr %1 %2" -- %f',
    \ }


""" Misc options """

" remember where we stopped editing a file
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" nice colorschemes
set t_Co=256
let g:default_background_type = "dark"
let g:solarized_termcolors = 256
let g:solarized_termtrans = 0
let g:dark_colorscheme = "solarized"
let g:light_colorscheme = "solarized"
"if has("gui_running")
"    let g:dark_colorscheme = "mustang"
"    let g:light_colorscheme = "pyte"
"else
"    let g:dark_colorscheme = "mustang"
"    let g:light_colorscheme = "mayansmoke"
"endif
map <silent><F11> :ToggleBg<CR> :wviminfo<CR>

" highlight wrong spaces and tabs
autocmd ColorScheme * highlight BadWhitespace ctermbg=red guibg=red
colorscheme default " hack to force the highlight group to be created
match BadWhitespace /^\t\+/
match BadWhitespace /^\s\+/
match BadWhitespace /\t\+$/
match BadWhitespace /\s\+$/
autocmd BufWinEnter * match BadWhitespace /^\t\+/
autocmd BufWinEnter * match BadWhitespace /^\s\+/
autocmd BufWinEnter * match BadWhitespace /\t\+$/
autocmd BufWinEnter * match BadWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

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

