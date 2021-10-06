""" Custom filetypes """

" twisted tac files
au BufNewFile,BufRead *.tac set filetype=python

" Makefiles and debian/rules files are indented with tabs
autocmd BufEnter ?akefile* set noexpandtab tabstop=8 shiftwidth=8
autocmd BufEnter */debian/rules set noexpandtab tabstop=8 shiftwidth=8

" md is for Markdown, not Module-2
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
