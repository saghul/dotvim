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
* **qq** => Quit without saving (:q!)
* **ww** => Save and quit (:wq)

###Plugin related
* **Shift + t** => Show task list
* **F4** => NERDTree
* **F5** => Toggle taglist
* **F6** => Toggle Gundo
* **F7** => PEP8
* **F11** => Toggle color and background
* **,cl** => Comment lines (put comment symbol on the left)
* **,f** => Ack search
* **,t** => Open file (Command-T)

##Plugins
* [Ack](https://github.com/mileszs/ack.vim)
* [AutoClose](https://github.com/vim-scripts/AutoClose)
* [Commant-T](http://www.vim.org/scripts/script.php?script_id=3025)
* [ColorToggle](https://github.com/saghul/vim-colortoggle)
* [current-func-info](https://github.com/tyru/current-func-info.vim)
* [fugitive](https://github.com/tpope/vim-fugitive)
* [Gist](https://github.com/vim-scripts/Gist.vim)
* [gundo](https://github.com/sjl/gundo.vim)
* [NERDCommenter](https://github.com/scrooloose/nerdcommenter)
* [NERDTree](http://www.vim.org/scripts/script.php?script_id=1658)
* [Pathogen](https://github.com/tpope/vim-pathogen)
* [pep8](https://github.com/saghul/vim-pep8)
* [powerline](https://github.com/Lokaltog/vim-powerline)
* [preview](https://github.com/greyblake/vim-preview)
* [pydoc](https://github.com/fs111/pydoc.vim)
* [pyflakes](https://github.com/mitechie/pyflakes-pathogen)
* [pythoncomplete](https://github.com/vim-scripts/pythoncomplete)
* [snipMate](https://github.com/msanders/snipmate.vim)
* [taglist](http://www.vim.org/scripts/script.php?script_id=273)
* [tasklist](http://www.vim.org/scripts/script.php?script_id=2607)

##Colorschemes
* [mustang](http://hcalves.deviantart.com/art/Mustang-Vim-Colorscheme-98974484)
* [mayansmoke](http://www.vim.org/scripts/script.php?script_id=3065)
* [ir_black](http://blog.toddwerth.com/entries/show/8)
* [pyte](http://www.vim.org/scripts/script.php?script_id=1492)

###Some considerations
* Leader is **,**
* Font is Inconsolata 16
* Also works in GUI environments, all toolbars have been removed

