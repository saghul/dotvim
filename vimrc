""" General settings """

" fuck vi! long life vim!
set nocompatible

" pathogen
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
set tabstop=8
set shiftround
set expandtab

" number of lines to show above and below the cursor
set scrolloff=4

" toggle paste mode
set pastetoggle=<F3>

" use mouse in normal mode
" set mouse=n

" ignore files and folders from listings
set wildignore+=.git/*,.svn/*,.hg/*,_darcs/*,build/*,dist/*,*.o,*.so,*.pyc

" save OS for later checks
let os = substitute(system('uname'), "\n", "", "")


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

if os == "Darwin"
    map <silent><S-Right> :tabnext<CR>
    map <silent><S-Left> :tabprevious<CR>
elseif os == "Linux"
    map <silent><A-Right> :tabnext<CR>
    map <silent><A-Left> :tabprevious<CR>
endif

" toggle line numbers 
map <silent><F2> :set invnumber<CR>

" open a new shell
" imap ss <Esc>:sh<CR>

" toggle NERDtree
map <silent><F4> :NERDTreeToggle<CR>

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
if has("gui_running")
    inoremap <C-Space> <C-x><C-o>
else
    inoremap <Nul> <C-x><C-o>
endif
" <C-Space> might be needed in GUI environments instead of <Nul>

" ack
noremap <Leader>f :Ack

" conque shell
command SH :ConqueTerm bash

" preview
let g:PreviewBrowsers = 'chromium-browser,google-chrome,firefox,safari'

" gundo
map <silent><F6> :GundoToggle<CR>


""" skeletons """

"au BufNewFile *.py 0r ~/.vim/skeleton/python.py


""" GUI options """

if has("gui_running")
    if os == "Darwin"
	set guifont=Inconsolata:h16
    else
        set guifont=Inconsolata\ 16
    endif
    " no toolbar
    set guioptions-=T
    " no menu bar
    set guioptions-=m
    " no scrollbar on the right
    set guioptions-=r
    " no scrollbar on the left
    set guioptions-=l
endif


""" Plugin options """

" Ack plugin configuration
if os == "Darwin"
    let g:ackprg="ack -H --nocolor --nogroup --column"
elseif os == "Linux"
    let g:ackprg="ack-grep -H --nocolor --nogroup --column"
endif

" TagList plugin configuration
if os == "Darwin"
    let Tlist_Ctags_Cmd = '~/.homebrew/bin/ctags'
elseif os == "Linux"
    let Tlist_Ctags_Cmd = '/usr/bin/ctags-exuberant'
endif
let Tlist_Inc_Winwidth = 0


""" Misc options """

" remember where we stopped editing a file
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" nice colorscheme
" OLD
"if &t_Co >= 256 || has("gui_running")
"    colorscheme mustang
"endif
set t_Co=256
colorscheme mustang

" highlight wrong spaces and tabs
highlight BadWhitespace ctermbg=red guibg=red
match BadWhitespace /^\t\+/
match BadWhitespace /^\s\+$/

