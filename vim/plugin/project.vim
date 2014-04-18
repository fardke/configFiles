""
"" Copyright (C) 2011 Fargier Sylvain <fargier.sylvain@free.fr>
""
"" This software is provided 'as-is', without any express or implied
"" warranty.  In no event will the authors be held liable for any damages
"" arising from the use of this software.
""
"" Permission is granted to anyone to use this software for any purpose,
"" including commercial applications, and to alter it and redistribute it
"" freely, subject to the following restrictions:
""
"" 1. The origin of this software must not be misrepresented; you must not
""    claim that you wrote the original software. If you use this software
""    in a product, an acknowledgment in the product documentation would be
""    appreciated but is not required.
"" 2. Altered source versions must be plainly marked as such, and must not be
""    misrepresented as being the original software.
"" 3. This notice may not be removed or altered from any source distribution.
""
"" project.vim
""
""        Created on: Mar 18, 2011
""   Orignial Author: fargie_s
""
""

""
"" The following variable in a .vproject file will configure autotools for
"" your project :
"" - g:makeprg: program to call to run 'make'
"" - g:build_dir: the directory to build the project (relative to the
""                directory where .vproject is)
"" - g:confprg: program to call to run configure
"" - g:confopts: configure options
""

let s:project_file = ".vproject"

function! s:FindDir()
  let l:dir = fnamemodify(getcwd(), ':p') . '.'
  while dir != fnamemodify(dir, ':h')
    let dir = fnamemodify(dir, ':h')
    if filereadable(dir . '/' . s:project_file)
      return dir . '/' . s:project_file
    endif
  endwhile
  return ''
endfunc

function! s:initVariable(var, value)
  if !exists(a:var)
    exec 'let ' . a:var . ' = ' . "'" . a:value . "'"
      return 1
  endif
  return 0
endfunction

function! s:Init(proj_file)
  if !empty(a:proj_file)
    let l:proj_vars = [ 'g:build_dir', 'g:makeprg', 'g:confprg', 'g:confopts', 'g:makedocprg', 'g:makedocarg']

    let l:proj_dir = fnamemodify(a:proj_file, ':h')

    exec 'source ' . a:proj_file

    call s:initVariable('g:build_dir', '@PROJECT_DIR@/build')
    call s:initVariable('g:makeprg', 'make')
    call s:initVariable('g:confprg', '@PROJECT_DIR@/configure')
    call s:initVariable('g:confopts', '')
    call s:initVariable('g:makedocprg', '')
    call s:initVariable('g:makedocarg', '')

    for var in l:proj_vars
      exec "let " . var . " = substitute(" . var . ", '@PROJECT_DIR@', l:proj_dir, '')"
    endfor

    execute 'set makeprg=' . escape('cd ' . g:build_dir . '; ' . g:makeprg, ' ')
    execute 'com! -nargs=* Configure !' . 'mkdir -p ' . g:build_dir . ';cd ' . g:build_dir . '; ' . g:confprg . ' <args> ' . g:confopts
    execute 'com! -nargs=* MakeDoc !' . g:makedocprg . ' <args> ' . g:makedocarg
    
    for var in l:proj_vars
      exec "unlet " . var
    endfor
  endif
endfunc

:com! LoadProject :call s:Init(s:FindDir())
:autocmd BufNewFile .vproject 0r ~/.vim/skel/vproject

" vim:set sts=2 sw=2:

