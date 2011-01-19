""" Custom filetypes """

" cython syntax highlighting
au BufNewFile,BufRead *.pxd,*.pxi,*.pyx set filetype=pyrex
" disable pyflakes for cython
au FileType pyrex let b:did_pyflakes_plugin = 1

" Makefiles and debian/rules files are indented with tabs
autocmd BufEnter ?akefile* set noexpandtab tabstop=8 shiftwidth=8
autocmd BufEnter */debian/rules set noexpandtab tabstop=8 shiftwidth=8

