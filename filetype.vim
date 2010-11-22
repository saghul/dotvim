""" Custom filetypes """

" cython syntax highlighting
au BufNewFile,BufRead *.pxd,*.pxi,*.pyx set filetype=pyrex
" disable pyflakes for cython
au FileType pyrex let b:did_pyflakes_plugin = 1

