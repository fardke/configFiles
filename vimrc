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
set smarttab
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set wrap

" cinoption for indentation
set cinoptions=N-s

" souris dans vim
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

" bind ctrl +n
map <C-n> :cn <CR>

nnoremap <F6> :TagbarToggle<CR>

" nerdtree configuration
nnoremap <F8> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.o$']

" gundo plugin configuration
nnoremap <F5> :GundoToggle<CR>
let g:gundo_width = 40
let g:gundo_preview_height = 20
let g:gundo_left = 1

" associate .seqdiag and .blockdiag to the good filetype.
au BufRead,BufNewFile *.seqdiag setfiletype seqdiag
au BufRead,BufNewFile *.blockdiag setfiletype seqdiag

" foldmethod depending of file type
" set foldmethod=indent
au FileType rst set foldmethod=manual
au FileType cpp set foldmethod=syntax

" if we use vim for diff bind ctrl+n ctrl+p
au FilterWritePre * if &diff | map <C-n> :DirDiffNext <CR> | endif
au FilterWritePre * if &diff | map <C-p> :DirDiffPrev <CR> | endif

" for dir diff
let g:DirDiffDynamicDiffText = 1

" manage plugins via vundle
set rtp+=~/.vim/bundle/vundle
call vundle#begin()

Bundle 'gmarik/vundle'
Bundle 'Rykka/riv.vim'
Bundle 'tomasr/molokai'
Bundle 'smancill/conky-syntax.vim'
Bundle 'sjl/gundo.vim'
Bundle 'fardke/headers.vim'
Bundle 'fardke/Project-Compil.vim'
Bundle 'bling/vim-airline'
Bundle 'Rip-Rip/clang_complete'
Bundle 'tpope/vim-fugitive'
Bundle 'szw/seoul256.vim'
Bundle 'hdima/python-syntax'
Bundle 'nblock/vim-dokuwiki'
call vundle#end()            " required

set spelllang=fr,en
set spellfile=~/.vim/spellfile.add

autocmd FileType mail set spell

set t_Co=256
" let g:solarized_termcolors=256

" status line
" always visible
set laststatus=2
" %f relative path
" %m modified flag ([+] modified file)
" %= following command are put to right
" %y file type
" %r readonly
" set statusline=\ %{HasPaste()}\ %<%r%f%m%=%y\ Line:\ %l\/%L

" Returns string if paste mode
function! HasPaste()
    if &paste
        return 'COLLAGE'
    end
    return ''
endfunction

"undo persistant
set undodir=~/.vim/temp_dirs/undodir
set undofile

let g:Powerline_symbols='fancy'
let g:airline_powerline_fonts=1
let g:airline_theme='luna'

" configure theme
let g:seoul256_background=233
set background=dark
colorscheme seoul256

" tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#tab_nr_type = 2 " splits and tab number

