# dotvim

My ViM configuration. Its my current Python IDE.

Works on GNU/Linux and Mac OSX.

##Before you continue reading
You'll need ViM 7.3 or higher.

##Installation
In your home directory:

    git clone https://github.com/saghul/dotvim.git

    cd dotvim && ./install.sh

###Normal mode
* **Ctrl + l** => Clear search highlight
* **Ctrl + t** => Open new tab
* **Ctrl + o** => Open file in current directory
* **Alt + left** => Move across tabs, to the left
* **Alt + right** => Move across tabs, to the right
* **F2** => Toggle line numbers
* **F3** => Toggle paste mode

###Insert mode
* **jj** => Back to normal mode

###Plugin related
* **Shift + t** => Show task list
* **F4** => NERDTree
* **F5** => Toggle taglist
* **F6** => Toggle Gundo
* **F8** => flake8
* **F9** => tagbar
* **F11** => Toggle color and background
* **,cl** => Comment lines (put comment symbol on the left)
* **,f** => Ack search
* **,p** => Hammer (preview in web browser)
* **,t** => Open file (CtrlP)

##Plugins
* [Ack](https://github.com/mileszs/ack.vim)
* [AutoClose](https://github.com/vim-scripts/AutoClose)
* [ColorToggle](https://github.com/saghul/vim-colortoggle)
* [CtrlP](https://github.com/kien/ctrlp.vim.git)
* [current-func-info](https://github.com/tyru/current-func-info.vim)
* [flake8](https://github.com/nvie/vim-flake8)
* [fugitive](https://github.com/tpope/vim-fugitive)
* [gist](https://github.com/mattn/gist-vim)
* [gundo](https://github.com/sjl/gundo.vim)
* [hammer](https://github.com/matthias-guenther/hammer.vim)
* [NERDCommenter](https://github.com/scrooloose/nerdcommenter)
* [NERDTree](http://www.vim.org/scripts/script.php?script_id=1658)
* [Pathogen](https://github.com/tpope/vim-pathogen)
* [pydoc](https://github.com/fs111/pydoc.vim)
* [snipMate](https://github.com/msanders/snipmate.vim)
* [supertab](https://github.com/ervandew/supertab.git)
* [tagbar](https://github.com/majutsushi/tagbar)
* [taglist](http://www.vim.org/scripts/script.php?script_id=273)
* [tasklist](http://www.vim.org/scripts/script.php?script_id=2607)
* [webapi](https://github.com/mattn/webapi-vim)

##Colorschemes
* [mustang](http://hcalves.deviantart.com/art/Mustang-Vim-Colorscheme-98974484)
* [mayansmoke](http://www.vim.org/scripts/script.php?script_id=3065)
* [ir_black](http://blog.toddwerth.com/entries/show/8)
* [pyte](http://www.vim.org/scripts/script.php?script_id=1492)
* [solarized](https://github.com/altercation/vim-colors-solarized)

###Some considerations
* Leader is **,**
* Font is Ubuntu Mono or Inconsolata (size 16)
* Also works in GUI environments, all toolbars have been removed

