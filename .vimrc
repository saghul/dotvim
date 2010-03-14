" fuck vi! long life vim!
set nocompatible

" mode filetype
filetype on
filetype plugin on

" indentation plugin
filetype plugin indent on

" color!
syntax on

" lines and cols in status line
set ruler

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

" number of commandline history lines
set history=50

" do incremental searching
set incsearch

" highlight search
set hlsearch

" highlight mode for hlsearch
set hl=l:Incsearch 

" don't wrap lines if they are too large
set nowrap

" enable auto-indenting
set autoindent

" tab width spaces
set shiftwidth=4
set softtabstop=4
set expandtab

" number of lines to show above and below the cursor
set scrolloff=4

" remember where we stopped editing a file
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" fix makefile tabs
autocmd FileType make set noexpandtab

" TagList plugin configuration
if has("mac")
    let Tlist_Ctags_Cmd = '/opt/local/bin/ctags'
elseif has("unix")
    let Tlist_Ctags_Cmd = '/usr/bin/ctags-exuberant'
endif
let Tlist_Inc_Winwidth = 0

" Toggle TagLIst on/off
map <silent><F5> :TlistToggle<CR>

" Managing tabs:
" CTRL-t opens a new tab
" ALT-left moves left
" ALT-right moves right
" CTRL-o opens current directory
map <silent><C-t> :tabnew<CR>
map <silent><C-o> :op .<CR>
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
map <silent><F3> :NERDTreeToggle<CR>

" use jj same as ESC 
imap jj <Esc>

" fast write and quit
imap qq <Esc>:q!<CR>
imap ww <Esc>:wq<CR>

" use mouse in normal mode
" set mouse=n

" python specific
au BufRead,BufNewFile *.py,*pyw set ts=8 sts=4 sw=4
"au BufRead,BufNewFile *.py,*pyw set textwidth=79
au BufRead,BufNewFile *.py,*pyw highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*pyw match BadWhitespace /^\t\+/
au BufRead,BufNewFile *.py,*pyw match BadWhitespace /^\s\+$/
"au BufRead,BufNewFile *.py,*pyw set foldmethod=indent
"au BufRead,BufNewFile *.py,*pyw set foldlevel=0
"au BufNewFile *.py 0r ~/.vim/skeleton/python.py

" show task list
map <silent><S-t> <Plug>TaskList

" GUI options
if has("gui")
    set guifont=Inconsolata:h16
    colorscheme kib_darktango
endif

