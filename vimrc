set nocompatible
filetype off

set number
set ruler
syntax on 

set encoding=utf-8
let g:load_doxygen_syntax=1
set modeline
" set autoindent
" set cindent
set expandtab
set ts=8
set sts=4
set sw=4
set fo+=ro
set cinoptions=N-s

" souri dans vim
set mouse=a

"autocompletion  pour filename
set wildmode=longest,full
set wildmenu


"Couleur pour les templates
hi def link Todo TODO
syn keyword Todo TODO FIXME XXX DEBUG

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" au FileType make set noexpandtab

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" Omnicpp
" autocmd BufNewFile,BufRead,BufEnter *.cpp,*.hpp,*.h set omnifunc=omni#cpp#complete#Main
" map <C-l> :!~/.vim/confVim<CR>
map <C-d> :cn <CR>
map <C-n> :DirDiffNext <CR>
map <C-p> :DirDiffPrev <CR>
" nnoremap <silent> <F8> :TlistToggle<CR>

" set tags=/tmp/tags,/tmp/tagsInc,/tmp/tagsLocalIncs

" Config taglist
"let Tlist_Process_File_Always = 1

"let OmniCpp_NamespaceSearch = 1
"let OmniCpp_GlobalScopeSearch = 1
"let OmniCpp_ShowAccess = 1
"let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
"let OmniCpp_MayCompleteDot = 1 " autocomplete after .
"let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
"let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
"let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

" associate *.foo with php filetype
au BufRead,BufNewFile *.seqdiag setfiletype seqdiag
au BufRead,BufNewFile *.blockdiag setfiletype seqdiag

let g:DirDiffDynamicDiffText = 1


"titre fenetre
" let &titlestring="Vim@" . hostname() . " [" . expand('%:t') . "] " . getfperm(expand('%'))
" set title

colorscheme mustang

set foldmethod=indent
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'Rykka/riv.vim'
Bundle 'tomasr/molokai'
Bundle 'smancill/conky-syntax.vim'
