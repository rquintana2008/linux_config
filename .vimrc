
" begin .vimrc
" first clear any existing autocommands:
:autocmd!


"   Xterm initialization.
"
if &term =~ "xterm" || &term =~ "vt100"|| &term =~ "dtterm"
    if has("terminfo")
	:set t_Co=8
	:set t_Sf=[3%p1%dm
	:set t_Sb=[4%p1%dm
	":set t_so=[47m
	":set t_Co=16
	":set t_AB=[%?%p1%{8}%<%p1%{40}%+%e%p1%{92}%+%;%dm
	":set t_AF=[%?%p1%{8}%<%p1%{30}%+%e%p1%{82}%+%;%dm
        :hi statuslinenc cterm=bold gui=bold term=bold
        ":hi statuslinenc cterm=standout gui=standout term=standout
        :hi statusline cterm=reverse gui=reverse term=reverse
	:set t_md=[4m
    else
	:set t_Co=8
	:set t_Sf=[3%dm
	:set t_Sb=[4%dm
    endif
    syntax on
endif

filetype on
filetype indent on
filetype plugin on
syntax on

set background=dark
" colorscheme darkblue2
colorscheme john

" normally don't automatically format `text' as it is typed, IE only do this
" with comments, at 79 characters:
set formatoptions+=t
set textwidth=78

" don't have files trying to override this .vimrc:
set modeline
set modelines=0

" don't make it look like there are line breaks where there aren't:
set nowrap

" make searches case-insensitive, unless they contain upper-case letters:
set ignorecase
set smartcase

" show the `best match so far' as search strings are typed:
set incsearch

"set title titlestring=%<%F titlelen=70
"set title
set notitle
set shiftwidth=4
set laststatus=2
set shiftround
set expandtab
set autoindent         
set wildmode=longest:list

"make stuff...
autocmd BufNewFile,BufReadPost *.gmake    set ft=make 
autocmd BufNewFile,BufReadPost *.cbm      set ft=cbm 
autocmd BufNewFile,BufReadPost *.CBM      set ft=cbm 
autocmd BufNewFile,BufReadPost *.ph       set ft=sh 

autocmd BufNewFile,BufReadPost *.t2t    set syntax=txt2tags 
autocmd BufNewFile,BufReadPost *.lib    set ft= 

"mutt stuff...
autocmd BufRead *tmp/mutt* set tw=72
autocmd BufRead *tmp/mutt* set fo-=o
autocmd BufRead *tmp/mutt* set fo-=r
au BufRead *tmp/mutt* normal :g/^> --[ ]$/,/^$/-1d/^$

" set up a command for doc/txt/text extention files....
autocmd BufRead *.mtxt,*.txt,*.doc,*.text,*.tex set formatoptions+=t
autocmd BufRead *.mtxt,*.txt,*.doc,*.text,*.tex set formatoptions+=v
autocmd BufRead *.mtxt,*.txt,*.doc,*.text,*.tex set formatoptions+=2
autocmd BufRead *.mtxt,*.txt,*.doc,*.text,*.tex set formatoptions-=o
autocmd BufRead *.mtxt,*.txt,*.doc,*.text,*.tex,*.html set formatoptions-=c
autocmd BufRead *.mtxt,*.txt,*.doc,*.text,*.tex set formatoptions+=q
autocmd BufRead *.mtxt,*.txt,*.doc,*.text,*.tex set formatoptions-=l

" set up a command for doc/txt/text extention files....
autocmd FileType mtxt set formatoptions+=t
autocmd FileType mtxt set formatoptions+=v
autocmd FileType mtxt set formatoptions+=2
autocmd FileType mtxt set formatoptions-=c
autocmd FileType mtxt set formatoptions-=l
autocmd FileType mtxt set formatoptions-=o

autocmd FileType tex set formatoptions+=t
autocmd FileType tex set formatoptions+=v
autocmd FileType tex set formatoptions+=2
autocmd FileType tex set formatoptions-=c
autocmd FileType tex set formatoptions-=l
autocmd FileType tex set formatoptions-=o

autocmd FileType txt set formatoptions+=t
autocmd FileType txt set formatoptions+=v
autocmd FileType txt set formatoptions+=2
autocmd FileType txt set formatoptions+=q
autocmd FileType txt set formatoptions-=c
autocmd FileType txt set formatoptions-=l
autocmd FileType txt set formatoptions-=o
"autocmd FileType txt,doc,text set formatoptions+=n

autocmd FileType html set formatoptions-=t

autocmd FileType mail set formatoptions+=q
autocmd FileType mail set formatoptions+=t
autocmd FileType mail set formatoptions+=v
autocmd FileType mail set formatoptions+=2 
autocmd FileType mail set formatoptions-=o
autocmd FileType mail set formatoptions-=l
autocmd FileType mail set formatoptions-=c
autocmd FileType mail set formatoptions-=r
autocmd FileType mail set textwidth=72
"autocmd FileType mail set formatoptions+=n
"
autocmd FileType c,cpp,slang set cindent
autocmd FileType c,perl,sh set formatoptions-=t
autocmd FileType c,perl,sh set formatoptions+=l
autocmd FileType c,perl,sh set formatoptions+=r
autocmd FileType perl set smartindent
autocmd FileType con set filetype=tcl
autocmd FileType ruby,tcl,con,verilog,lib,scm set formatoptions+=l
autocmd FileType ruby,tcl,con,verilog,lib,scm set formatoptions-=t
autocmd FileType ruby,tcl,con,verilog,lib,scm set formatoptions+=r
autocmd FileType ruby,tcl,con,verilog,lib,scm set formatoptions-=2
autocmd FileType ruby,tcl,con,verilog,lib,scm set formatoptions-=o
autocmd FileType scm set formatoptions-=f
autocmd FileType make set noexpandtab shiftwidth=8

au BufNewFile *.pl,*.pm 0put='#!/usr/bin/perl -w'|put='use strict ;'

autocmd BufRead,BufNewFile *.log            call EnableCbmakeFolding()
autocmd BufRead,BufNewFile make_any.log     call EnableCbmakeFolding()

source $VIMRUNTIME/macros/matchit.vim

" set history size
set history=50

" set mouse options
set mouse=c
"set mouse=nv
"set mouse=nvi
 
"for horizontal split open to the right
set splitright
 
"turn off hilight searches
set nohls

"turn off all bells
:set vb t_vb=
 
set showmode
set showcmd
set ruler
set t_kb=
fixdel

" remove line mapping
" removes any line that contains the contents of the "0 buffer
" If you highlight a line in visual mode and hit "y", you yank into the "0 buffer
map ,rl :g/0/normal dd

" from Brett
" smartindent is dumb, it puts # in column 0 when it is the first
" non-whitespace char.  This map fixes it (vimtip #644) -- except it
" doesn't (brettw)
inoremap # a#<Left><BS><Right>
 
" from Brett
" set up so that searches appear in the middle of the screen
" reserve z mark for last search result
noremap n nmzz.`z
noremap N Nmzz.`z
noremap * *mzz.`z
noremap # #mzz.`z

" from Brett for insert tab completion
inoremap <tab> <c-p>
" from Brett for normal mode tab completion
noremap <tab> ==
" Bitkeeper mappings, from Brett
"map bke :!bk edit %:t:e!
map bke :!bk edit %:t<CR><CR>:e!<CR>
map bku :!bk unedit %:t<CR><CR>:e!<CR>
map bkc :!bk citool<CR><CR>
map bkr :!bk revtool %:t<CR><CR>
map bkh :!bk helptool<CR><CR>
" Chmod shortcuts, from Brett
map chmow :!chmod ug+w %:t<CR><CR>:e!<CR>
map chmox :!chmod a+x %:t<CR><CR>:e!<CR>
"turn of <F1> to access help, from Brett
"inoremap <F1> <NOP>
"noremap <F1> <NOP>

"setting backspace for linux
:let op=system("uname")
if "op" == "Linux"
  set t_kb=
  fixdel
endif

"remap of keys for backspace
nnoremap <C-?> <BS>
nnoremap  <BS>

"move around veritcal horizontal splits
nnoremap ,w <C-W>w
nnoremap ,k <C-W>k
nnoremap ,j <C-W>j
nnoremap ,l <C-W>l
nnoremap ,h <C-W>h
nnoremap ,n ]c     " next diff
nnoremap ,p [c     " prev diff

"make all windows equal
nnoremap ,e <C-W>=

nnoremap ,du :diffupdate

"more unusual mappings
map _var A <= #1 1'b1;  //variable<Esc>
map _vfunc :'y,'zs/\(\<[A-Z_]\+\)\([,);]\+\)/<C-V><C-M>     .\1(\1)\2        \/\/IO \1/g<CR>
map _sfunc :'y,'zs/\(\<[a-zA-Z_]\+\)\([,);]\+\)/<C-V><C-M>right  rl_port \1/g<CR>
map ,tst :%s/$/<C-V><C-M> gp tst  /<CR>
map ,wrp :/^$/,/^-- $/-1normal gqq
map ,2wrp gg/^$<CR>V/^-- $<CR>{gq`^

"source your vimrc
map ,vrc :so ~/.vimrc<CR>

"visual block mode shortcut
map vv <C-V>

"unusual search replace commands
" change for pins directly tied off in verilog that make the def pins section
" wrong
"  :'a,'bs/- \([^ ]*\) + NET VSS /- \1 + NET \1 /
"
" change for flow.gmakes
" :%s/\(LOG_DIR)\/[^\/]*\)\//\1\/logs\//
"
" change specific words to uppercase
" :g/LIB_AUTO_SETUP(/normal /LIB_AUTO_SETUP(^Mvf)gU
" {act like a tail -f command}
"
"non greedy search and replace s/^.\{-}pdf/new.pdf, find first occurance of pdf in a line
 
"vim tail command
map ,tl :e<CR>G:sleep 10<CR>,tl
 
"insert abbreviation 
iab ttlxpnd <C-R>=expand("%:r")<CR>
iab dtxpnd <C-R>=strftime("%y/%m/%d %H:%M")<cr>

"insert incrementing numbers
"let index=1
"                   col#
"map ,inc 'a,'b:norm 1|i^V^R=index^V^M^V^]:let index=index+1^V^M

set keywordprg=ispell\ -a
set autowrite
set nobackup
set writebackup

"spell check with ispell
map ,sp :!ispell %
"map K :!echo <cword> \| ispell -a

"spell check with engspchk
map ,K :so $CVIMSYN/engspchk.vim 

"tetris inside of vim
map TTRS :so $CVIMSYN/Tetris.vim 

"These are for bitkeeper
map bke :!bk edit %:p<CR><CR>:e!<CR>
map bku :!bk unedit %:p<CR><CR>:e!<CR>
map bkc :!bk citool<CR><CR>
map bkr :!bk revtool %:t<CR><CR>
map bkh :!bk helptool<CR><CR>

"print stuff
set popt=paper:letter
set printdevice="icecream2"
 
"print function
:function! PrintFile(fname)
: call system('lp -dwiggum ' . a:fname)
: call delete(a:fname)
: return v:shell_error
:endfunc

"print expression
set printexpr=PrintFile(v:fname_in)

" 13. Cbmake folding and sytnax functions {{{
" 
" There are a lot of folding commands.  Here are one I think
" are useful
"   zM  - close all folds
"   zm  - close one more level of folds
"   zR  - open all folds
"   zr  - open one more level of folds
"   zc  - close current fold
"   za  - toggle fold open/close
"------------------------------------------------------------
" This allows cb-logging/folding to be enabled 
" by typing :Cblog while in command mode
command Cblog call EnableCbmakeFolding()

" This is the actual function to enable cb-folding
" and syntax hi-lighting
function EnableCbmakeFolding()
 set foldtext=CbmakeFoldText()
 set foldmarker=>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>,<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
 set fillchars=fold:\  " There is a space after the \
 set ft=cblog
 "%foldclose
endfunction

" This is a custom fold text function.  It displays
" the name of the target being run rather than just
">>[00]>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
"TARGET BEGIN: /net/hesston/mnt/ios40/designers/ryan/jt_bidir_a0/make_any=lconn.all/expand_cbm_TasksTargets

function CbmakeFoldText()
  let line = getline(v:foldstart)
  let num = substitute(line, '>', '', 'g')
  let num = substitute(num, '|', '', '')
  let inum = substitute(num, '[', '', '')
  let inum = substitute(inum, ']', '', '')
  let i = repeat(' ', inum*2)
  let num = i . num
  let target_line = getline(v:foldstart+1)
  let target_line = substitute(target_line, '|', '', '')
  let target_line = substitute(target_line, 'TARGET BEGIN:', num, '')
  let text = target_line
  return text
endfunction

" Custom key binding for making quicker work of cbmake logfiles

" Search for an error and display it in the center of the terminal
map ;e /^ERROR<CR>mzz.`z

" toggle fold
map ;ff za
" open all folds
map ;fO zR
" open one more level of folds
map ;fo zr
" close all folds
map ;fC zM
" close one more level of folds
map ;fc zm   
"}}}
""""""""""""""""""" wizard settings
if exists("$WD_LOCAL_SOURCE_DIR")
  let tagsfile = $WD_LOCAL_SOURCE_DIR . "/tags"
  execute "set tags=".tagsfile
  if exists("$WD_TOOL_NAME")
    autocmd BufEnter * let &titlestring = substitute($WD_LOCAL_WORK_DIR,"^.*/","","") . "/" .$WD_TOOL_NAME . ":   " . expand("%")
  endif
endif


map <silent> <F6> :if &number <Bar>
    \set nonumber <Bar>
        \else <Bar>
    \set number <Bar>
        \endif<cr>

map <F5> :w<CR>
map ,6 1G=G<CR>
set clipboard+=autoselect
set guioptions+=a
set pastetoggle=<F10>
set hlsearch
" end .vimrc
