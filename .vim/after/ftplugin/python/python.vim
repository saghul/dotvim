""" python specific"""

if exists("b:loaded_custom_py_ftplugin")
    finish
endif
let b:loaded_custom_py_ftplugin = 1

" tabs with spaces
set expandtab

"set textwidth=79
highlight BadWhitespace ctermbg=red guibg=red
match BadWhitespace /^\t\+/
match BadWhitespace /^\s\+$/
"set foldmethod=indent
"set foldlevel=0

