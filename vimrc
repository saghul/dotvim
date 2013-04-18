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

" open CtrlP
nmap <Leader>t :CtrlP<CR>

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

" Toggle TagLIst on/off
map <silent><F5> :TlistToggle<CR>

" show task list
map <silent><S-t> <Plug>TaskList

" ack
noremap <Leader>f :Ack

" gundo
map <silent><F6> :GundoToggle<CR>

" tagbar
map <silent><F9> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" hammer
noremap <Leader>p :Hammer<CR>

" standard cut/copy/paste keys
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa


""" Omni-completion options """
" http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
set completeopt=longest,menuone


" save file with sudo if not opened as root
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!
command Wq :execute ':W' | :q
command WQ :Wq


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

" Ack plugin configuration
if os == "Darwin"
    let g:ackprg="ack -H --nocolor --nogroup --column"
elseif os == "Linux"
    let g:ackprg="ack-grep -H --nocolor --nogroup --column"
endif

" TagList plugin configuration
let Tlist_Inc_Winwidth = 0

" flake8
let g:flake8_cmd=expand("~/.vim/pymodules/flake8/bin/flake8")
let g:flake8_ignore="E501"

" powerline
let g:Powerline_stl_path_style = 'full'


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

