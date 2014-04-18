:highlight OverLength ctermbg=red ctermfg=white guibg=#592929
:call matchadd("OverLength", '\%81v.*')
:call matchadd("OverLength", '\s\+$')

:com! -buffer Header :call InsertHeader('/*', '**', '*/')
