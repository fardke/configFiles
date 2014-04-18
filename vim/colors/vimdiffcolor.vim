set background=dark 
highlight clear 
if exists('syntax_on') 
    syntax reset 
endif 

let g:colors_name = expand('<sfile>:t:r') 

highlight Normal ctermfg=Gray ctermbg=Black guifg=Gray guibg=Black 

highlight TabLineSel cterm=NONE ctermfg=fg ctermbg=Blue gui=NONE guifg=fg guibg=Blue 
highlight TabLine cterm=NONE ctermfg=bg ctermbg=fg gui=NONE guifg=bg guibg=fg 
highlight TabLineFill cterm=NONE ctermfg=bg ctermbg=fg gui=NONE guifg=bg guibg=fg 
highlight Title cterm=NONE ctermfg=Red gui=NONE guifg=Red 

highlight MatchParen cterm=NONE ctermfg=Red ctermbg=bg gui=NONE guifg=Red guibg=bg 

highlight FoldColumn cterm=NONE ctermfg=bg ctermbg=fg gui=NONE guifg=bg guibg=fg 
highlight Folded cterm=NONE ctermfg=Cyan ctermbg=bg gui=NONE guifg=Cyan guibg=bg 

highlight StatusLine cterm=NONE ctermfg=fg ctermbg=Blue gui=NONE guifg=fg guibg=Blue 
highlight StatusLineNC cterm=NONE ctermfg=bg ctermbg=fg gui=NONE guifg=bg guibg=fg 

highlight DiffAdd cterm=NONE ctermfg=bg ctermbg=Green gui=NONE guifg=bg guibg=Green 
highlight DiffDelete cterm=NONE ctermfg=bg ctermbg=Red gui=NONE guifg=bg guibg=Red 
highlight DiffChange cterm=NONE ctermfg=bg ctermbg=Yellow gui=NONE guifg=bg guibg=Yellow 
highlight DiffText cterm=NONE ctermfg=bg ctermbg=Magenta gui=NONE guifg=bg guibg=Magenta 

highlight Pmenu cterm=NONE ctermfg=bg ctermbg=White gui=NONE guifg=bg guibg=White 
highlight PmenuSel cterm=NONE ctermfg=White ctermbg=Blue gui=NONE guifg=White guibg=Blue 
highlight PmenuSbar cterm=NONE ctermfg=Yellow ctermbg=Yellow gui=NONE guifg=Yellow guibg=Yellow 
highlight PmenuThumb cterm=NONE ctermfg=bg ctermbg=bg gui=NONE guifg=bg guibg=bg 

highlight SpellBad cterm=underline ctermfg=DarkRed ctermbg=bg gui=undercurl guisp=Red 
