"""""""""""""""""""""""""""""""""""""""""""
""""""""" Configuration generale """"""""""
"""""""""""""""""""""""""""""""""""""""""""
set nocp
syntax on

set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

set number

" :0 case at same level than switch
" g0 public, protected, private at same level than calss
" (0 when we jump next line in parameter we will be at same level than opened (
" N-s we are at same level than { in a namespace.
set cinoptions=:0g0(0N-s

set backspace=indent,eol,start


" Souris dans vim
set mouse=a

" Autocompletion  pour filename
set wildmode=longest,full
set wildmenu

" Couleur pour les templates
hi def link Todo TODO
syn keyword Todo TODO FIXME XXX DEBUG

" Recherche
set hlsearch
set incsearch
set ignorecase
set smartcase

" Afficher tabulation et espaces
set list
set listchars=tab:>⋅,trail:⋅,nbsp:⋅

" Ajout dictionnaires francais anglais.
set spelllang=fr,en
set spellfile=~/.vim/spellfile.add

" Verifier l'orthographe pour les mails.

" Supporter 256 couleurs.
set t_Co=256

" Ligne status.
" always visible
set laststatus=2
" %f relative path
" %m modified flag ([+] modified file)
" %= following command are put to right
" %y file type
" %r readonly
set statusline=\ %{HasPaste()}\ %<%r%f%m\ [%{Tlist_Get_Tagname_By_Line()}]\ %=%y\ Line:\ %l\/%L


" Autocommand
autocmd FileType mail,txt set spell
autocmd FileType cpp call FT_cpp()
" Foldmethod depent du type de fichier
autocmd FileType rst set foldmethod=manual

" Persistence fold
autocmd BufWinLeave *.ac,*.am,*.cpp,*.h,*.hxx,*.hpp,*.c,*.rst mkview
autocmd BufWinEnter *.ac,*.am,*.cpp,*.h,*.hxx,*.hpp,*.c,*.rst silent loadview


"""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""" Plugins """""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""

set rtp+=~/.vim/bundle/vundle
call vundle#begin()

" Plugin pour gerer les Plugins
Bundle 'gmarik/vundle'

" Plugin pour etre plus efficace en rst
" Bundle 'Rykka/riv.vim'

" Plugin pour avoir un undo persistent
Bundle 'sjl/gundo.vim'

" Plugin pour ajouter automatiquement une en tete a des fichiers
Bundle 'fardke/headers.vim'

" Plugin pour transformer vim en ide c++
Bundle 'fardke/Project-Compil.vim'

" Plugin pour afficher des infos git dans vim
Bundle 'tpope/vim-fugitive'

" Theme molokai
Bundle 'tomasr/molokai'

" Theme seoul
Bundle 'szw/seoul256.vim'

" Theme wombat 256
Bundle 'vim-scripts/wombat256.vim'

" Theme skittles_berry
Bundle 'shawncplus/skittles_berry'

" Plugin pour reconnaitre la syntax python
Bundle 'hdima/python-syntax'

" Plugin pour reconnaitre la syntax dokuwiki
Bundle 'nblock/vim-dokuwiki'

" Plugin pour reconnaitre la syntax tmux
Bundle 'tejr/vim-tmux'

" Plugin pour la gestion snipets
Bundle 'SirVer/ultisnips'

" Repo pour les snipets
Bundle 'fardke/vim-snippets'

" Plugin pour afficher la lists des tags
Bundle 'vim-scripts/taglist.vim'

" Plugin pour afficher un explorateur de fichier dans vim
Bundle 'scrooloose/nerdtree'

" Plugin pour switcher des .h aux .cpp.
Bundle 'vim-scripts/a.vim'

" Plugin pour avoir l'autocompletion via clang.
Bundle 'Valloric/YouCompleteMe'

" Plugin pour faire des diff all
Bundle 'vim-scripts/DirDiff.vim'

call vundle#end()            " required

"""""""""""""""""""""""""""""""""""""""""""
"""""""" Configuration Plugins """"""""""""
"""""""""""""""""""""""""""""""""""""""""""

filetype plugin on

" NerdTree
let NERDTreeIgnore=['\.o$']

" Gundo
let g:gundo_width = 40
let g:gundo_preview_height = 20
let g:gundo_left = 1

" Associer .seqdiag et .blockdiag au bon type de fichier.
au BufRead,BufNewFile *.seqdiag setfiletype seqdiag
au BufRead,BufNewFile *.blockdiag setfiletype seqdiag

" Undo persistant
set undodir=~/.vim/temp_dirs/undodir
set undofile

" Configure theme
colorscheme wombat256mod

" Tag list
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_Process_File_Always = 1
let Tlist_Show_One_File = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Use_Right_Window = 1
let Tlist_Highlight_Tag_On_BufEnter = 1
let Tlist_Display_Prototype = 1
let Tlist_Exit_OnlyWindow = 1

" Plugin a-vim.
" Pour changer entre le .c/.h, on spécifie nos dossiers d'inclusions persos
let g:alternateSearchPath = 'inc/:include/:/usr/targets/current/root/usr/include/'
let g:alernateExtensions_cpp = "h,inc,H,HPP,hpp"

" Plugin dir diff
let g:DirDiffDynamicDiffText = 1

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir="/home/kewin/.vim/bundle/vim-snippets/UltiSnips/"

let g:ycm_global_ycm_extra_conf = '/home/kewin/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0


"""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""" Bindings """""""""""""""
"""""""""""""""""""""""""""""""""""""""""""

" Switcher .h/.c F4
nnoremap <F4> :A<CR>
inoremap <F4> <ESC>:A<CR>

" Lancer gundo
nnoremap <F5> :GundoToggle<CR>
inoremap <F5> <ESC>:GundoToggle<CR>

" Lancer tlist F6
nnoremap <F6> :TlistToggle<CR>
inoremap <F6> <ESC>:TlistToggle<CR>

" Lancer nerdtree F8
nnoremap <F8> :NERDTreeToggle<CR>
inoremap <F8> <ESC>:NERDTreeToggle<CR>

" Lancer snippet edition
nnoremap <F11> :UltiSnipsEdit<CR>
inoremap <F11> <ESC>:UltiSnipsEdit<CR>

" Bind ctrl +n
map <C-n> :cn <CR>

" Bind ctrl +p
map <C-p> :cn <CR>

" Bind ctrl n et ctrl p pour passer a la prochaine diff dans le cas ou c est
" un diff.
au FilterWritePre * if &diff | map <C-n> :DirDiffNext <CR> | endif
au FilterWritePre * if &diff | map <C-p> :DirDiffPrev <CR> | endif
au FilterWritePre * if &diff | colorscheme desert | endif

" Aller a l'onglet precedent
nnoremap <C-Left> :tabprevious<CR>

" Aller a l'onglet suivant
nnoremap <C-Right> :tabnext<CR>

" Fermer l'onglet courant
nnoremap <C-c> :tabclose<CR> 

" Ouvrir un nouvel onglet
nnoremap <C-t> :tabnew<CR>

" leader touch ,
let mapleader = ","

" raccourci pour ouvrir vimrc dans un nouvel onglet
nmap <leader>v :tabedit /home/kewin/.vimrc<CR>

"""""""""""""""""""""""""""""""""""""""""""
""""""""""""""" Functions """""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""

"auto sourcing when save vimrc
if has("autocmd")
        autocmd bufwritepost .vimrc source /home/kewin/.vimrc
endif

" Returns string if paste mode
function! HasPaste()
    if &paste
        return 'COLLAGE'
    end
    return ''
endfunction

function! FT_cpp()
    set foldmethod=syntax
    set shiftwidth=4
    set tabstop=4
    " the textwidth is used for formatting the comments
    set textwidth=80
    set colorcolumn=80
    set autoindent
    set cindent
    set nospell
endfunction
