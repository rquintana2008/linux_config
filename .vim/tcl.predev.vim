if has("gui_running")
  source $HOME/.vim/syntax/tcl.vim
" source $VIMRUNTIME/syntax/tcl.vim
endif

" map  ;v {=}                       " formats paragraph
" vmap ;v  =                        " formats higlighted text

map ;v   {WWgq}                     " formats paragraph


"map <F7> :cp<CR>                  " goto previous error in compiler output
"map <F8> :cn<CR>                  " goto next     error in compiler output
"set cindent
set tabstop=3                    " ability to read Alan's code
set showmatch                     " show a match of brackets
set comments=sr:/*,mb:**,el:*/,://,b:#,:%,n:>,fb:-,:**

if has("gui_running")
  "Adding to the menus
  " Programming menu
  60amenu Make.Make                :make<CR>
  60amenu Make.List\ Errors        :cl<CR>
  60amenu Make.List\ Messages      :cl!<CR>
  60amenu Make.Next\ Error<F8>     <F8><CR>
  60amenu Make.Previous\ Error<F7> <F7><CR>
  
  "CPP
  70amenu CPP.Re\-indent\ \ \        =
  70amenu CPP.Search\ \ \ \ \ \ [i   [i
  70amenu CPP.Search\ list\ [I       [I
  70amenu CPP.Goto\ local\ \ gd      gd
  70amenu CPP.Goto\ global\ gD       gD
  70amenu CPP.Goto\ file\ \ \ gf     gf
  70amenu CPP.Goto\ Matching()       %
 
endif 

