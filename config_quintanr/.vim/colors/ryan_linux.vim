" Vim color file
" Maintainer:   Hans Fugal <hans@fugal.net>
" Last Change:  9 Jul 2002
" URL:  http://fugal.net/vim/colors/desert.vim 

" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors

set background=dark
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
 syntax reset
    endif
endif
let g:colors_name="ryan_linux"

hi Normal       guifg=White         guibg=#100033
hi Cursor       guifg=slategrey     guibg=red
hi VertSplit    guifg=grey50        guibg=#c2bfa5     gui=none
hi Folded       guifg=gold          guibg=grey30
hi FoldColumn   guifg=tan           guibg=grey30
hi IncSearch    guifg=slategrey     guibg=khaki
hi ModeMsg      guifg=goldenrod
hi MoreMsg      guifg=SeaGreen
hi NonText      guifg=LightBlue     guibg=#100033
hi Question     guifg=springgreen
hi Search       guifg=wheat         guibg=peru
hi SpecialKey   guifg=yellowgreen
hi StatusLine   guifg=black         guibg=#c2bfa5     gui=none
hi StatusLineNC guifg=grey50        guibg=#c2bfa5     gui=none
hi Title        guifg=darksalmon
hi Visual       guifg=khaki         guibg=olivedrab   gui=none
hi WarningMsg   guifg=salmon
hi Comment      guifg=skyblue
hi Constant     guifg=#ffa0a0
hi Identifier   guifg=palegreen
hi Statement    guifg=khaki
hi PreProc      guifg=sienna1
hi Type         guifg=darkkhaki
hi Special      guifg=navajowhite
hi Ignore       guifg=grey40
hi Todo         guifg=orangered     guibg=yellow2

" color terminal definitions
hi SpecialKey    ctermfg=darkgreen
hi NonText       cterm=bold ctermfg=darkblue
hi Directory     ctermfg=darkcyan
hi ErrorMsg      cterm=bold ctermfg=7 ctermbg=1
hi IncSearch     cterm=NONE ctermfg=white ctermbg=red
hi Search        cterm=NONE ctermfg=white ctermbg=blue
hi MoreMsg       ctermfg=darkgreen
hi ModeMsg       cterm=NONE ctermfg=brown
hi LineNr        ctermfg=3
hi Question      ctermfg=green
hi StatusLine    cterm=bold,reverse
hi StatusLineNC  cterm=reverse
hi VertSplit     cterm=reverse
hi Title         ctermfg=5
hi Visual        cterm=reverse
hi VisualNOS     cterm=bold,underline
hi WarningMsg    ctermfg=1
hi WildMenu      ctermfg=0 ctermbg=3
hi Folded        ctermfg=0 ctermbg=4
hi FoldColumn    ctermfg=4 ctermbg=7
hi DiffAdd       ctermbg=4
hi DiffChange    ctermbg=5
hi DiffDelete    cterm=bold ctermfg=4 ctermbg=6
hi DiffText      cterm=bold ctermfg=white ctermbg=1
hi Comment       ctermfg=4
hi Constant      ctermfg=brown
hi Special       ctermfg=5
hi Identifier    ctermfg=6
hi Statement     ctermfg=3
hi PreProc       ctermfg=5
hi Type          ctermfg=2
hi Underlined    cterm=underline ctermfg=5
hi Ignore        cterm=bold ctermfg=7
hi Error         cterm=bold ctermfg=7 ctermbg=1


"vim: sw=4
