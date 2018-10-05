# dotvim

My ViM configuration. Its my current Python IDE.

Works on GNU/Linux and macOS.

## Before you continue reading
You'll need ViM 7.3 or higher.

## Installation
In your home directory:

    git clone https://github.com/saghul/dotvim.git

    cd dotvim && ./install.sh

### Normal mode
* **,l** => Clear search highlight
* **,n** => Open new empty buffer
* **,o** => Open file in current directory
* **,t** => Open file (CtrlP)
* **Ctrl + h** => Move to the previous buffer
* **Ctrl + l** => Move to the next buffer
* **,bq** => Close buffer and go to the previous one
* **,bl** => List buffers
* **F2** => Toggle line numbers
* **F3** => Toggle paste mode

### Insert mode
* **jj** => Back to normal mode
* **Ctrl + j** => Togge snippet

### Plugin related
* **Shift + t** => Show task list
* **F4** => NERDTree
* **F5** => Toggle tagbar
* **F6** => Toggle Gundo
* **F8** => flake8
* **F11** => Toggle color and background
* **,cl** => Comment lines (put comment symbol on the left)
* **,f** => Ack search

## Plugins
* [Ack](https://github.com/mileszs/ack.vim)
* [airline](https://github.com/bling/vim-airline.git)
* [AutoClose](https://github.com/vim-scripts/AutoClose)
* [ColorToggle](https://github.com/saghul/vim-colortoggle)
* [CtrlP](https://github.com/ctrlpvim/ctrlp.vim)
* [current-func-info](https://github.com/tyru/current-func-info.vim)
* [cython](https://github.com/tshirtman/vim-cython)
* [EditorConfig](https://github.com/editorconfig/editorconfig-vim)
* [flake8](https://github.com/nvie/vim-flake8)
* [fugitive](https://github.com/tpope/vim-fugitive)
* [gist](https://github.com/mattn/gist-vim)
* [go](https://github.com/fatih/vim-go)
* [gundo](https://github.com/sjl/gundo.vim)
* [NERDCommenter](https://github.com/scrooloose/nerdcommenter)
* [NERDTree](http://www.vim.org/scripts/script.php?script_id=1658)
* [Pathogen](https://github.com/tpope/vim-pathogen)
* [pydoc](https://github.com/fs111/pydoc.vim)
* [python-combined](https://github.com/mitsuhiko/vim-python-combined.git)
* [rust.vim](https://github.com/wting/rust.vim.git)
* [signify](https://github.com/mhinz/vim-signify.git)
* [snippets](https://github.com/honza/vim-snippets.git)
* [swift](https://github.com/keith/swift.vim.git)
* [tagbar](https://github.com/majutsushi/tagbar)
* [tasklist](http://www.vim.org/scripts/script.php?script_id=2607)
* [toml](https://github.com/cespare/vim-toml.git)
* [ultisnips](https://github.com/SirVer/ultisnips.git)
* [unimparired](https://github.com/tpope/vim-unimpaired.git)
* [unite](https://github.com/Shougo/unite.vim.git)
* [webapi](https://github.com/mattn/webapi-vim)
* [ycm](https://github.com/Valloric/YouCompleteMe)

## Colorschemes
* [mustang](http://hcalves.deviantart.com/art/Mustang-Vim-Colorscheme-98974484)
* [mayansmoke](http://www.vim.org/scripts/script.php?script_id=3065)
* [ir_black](http://blog.toddwerth.com/entries/show/8)
* [pyte](http://www.vim.org/scripts/script.php?script_id=1492)
* [solarized](https://github.com/altercation/vim-colors-solarized)

### Some considerations
* Leader is **,**
* Font is Ubuntu Mono or Inconsolata (size 16)
* Also works in GUI environments, all toolbars have been removed

