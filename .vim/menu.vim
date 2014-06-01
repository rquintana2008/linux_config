" These menu commands create the default Vim menus.
" You can also use this as a start for your own set of menus.
" Note that ":amenu" is often used to make a menu work in all modes.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	1999 Feb 23

" Make sure the '<' flag is not included in 'cpoptions', otherwise <CR> would
" not be recognized.  See ":help 'cpoptions'".
let menu_cpo_save = &cpo
let &cpo = ""

" Avoid installing the menus twice
"if !exists("did_install_default_menus")
"let did_install_default_menus = 1

" Help menu
amenu 9999.10 &Help.&Overview<Tab><F1>      :help<CR>
amenu 9999.20 &Help.&How-to\ links          :help how-to<CR>
amenu 9999.30 &Help.&GUI                    :help gui<CR>
amenu 9999.40 &Help.&Credits                :help credits<CR>
amenu 9999.50 &Help.Co&pying                :help uganda<CR>
amenu 9999.55 &Help.-sep-                   <nul>
amenu 9999.60 &Help.&Version                :version<CR>
amenu 9999.70 &Help.&About                  :intro<CR>

" File menu
amenu 10.310 &File.&Open\.\.\.<Tab>:e		:browse confirm e<CR>
amenu 10.311 &File.new                          :new<CR>
amenu 10.312 &File.new\ File.Basic\ Latex       :new<CR>:r $HOME/.vim/latex1.example<CR> :source $HOME/.vim/latex.vim<CR>
amenu 10.312 &File.new\ File.Basic\ Latex       :new<CR>:r $HOME/.vim/latex1.example<CR> :source $HOME/.vim/latex.vim<CR>
amenu 10.312 &File.new\ File.Paper\ Latex       :new<CR>:r $HOME/.vim/latex2.example<CR> :source $HOME/.vim/latex.vim<CR>
amenu 10.312 &File.new\ File.Slides\ Latex      :new<CR>:r $HOME/.vim/latex3.example<CR> :source $HOME/.vim/latex.vim<CR>
amenu 10.312 &File.new\ File.CPP                :new<CR>:r $HOME/.vim/cpp.example<CR> :source $HOME/.vim/cpp.vim : source $VIM/syntax/cpp.vim<CR>
amenu 10.312 &File.new\ File.h                  :new<CR>:r $HOME/.vim/h.example<CR> :source $HOME/.vim/cpp.vim : source $VIM/syntax/cpp.vim<CR>
amenu 10.360 &File.&Print			        :w !enscript --margins=75:40:50:65 --header="" -o /tmp/vim.prn.ps; lp -dicecream vim.prn.ps; rm vim.prn.ps; <CR>
amenu 10.320 &File.Sp&lit-Open\.\.\.<Tab>:sp	:browse sp<CR>
amenu 10.330 &File.&Close<Tab>:q		     :confirm q<CR>
amenu 10.335 &File.-SEP1-  	    	    	:
amenu 10.340 &File.&Save<Tab>:w			     :confirm w<CR>
amenu 10.350 &File.Save\ &As\.\.\.<Tab>:w	:browse confirm w<CR>
amenu 10.355 &File.-SEP2-  	    	    	:
vunmenu &File.&Print
vmenu &File.&Print				            :w !enscript --margins=75:40:50:65 --header=""<CR>
amenu 10.365 &File.-SEP4-       	    	:
amenu 10.370 &File.Sa&ve-Exit<Tab>:wqa		:confirm wqa<CR>
amenu 10.380 &File.E&xit<Tab>:qa		:confirm qa<CR>


" Edit menu
amenu 20.310 &Edit.&Undo<Tab>u			u
amenu 20.320 &Edit.&Redo<Tab>Ctrl+R		<C-R>
amenu 20.330 &Edit.&Repeat<Tab>\.		.
amenu 20.335 &Edit.-SEP1-       	    	:
vmenu 20.340 &Edit.Cu&t<Tab>"*x			"*x
vmenu 20.350 &Edit.&Copy<Tab>"*y		"*y
nmenu 20.360 &Edit.&Paste<Tab>"*p		"*p
vmenu	     &Edit.&Paste<Tab>"*p		"*P`]:if col(".")!=1<Bar>exe "norm l"<Bar>endif<CR>
imenu	     &Edit.&Paste<Tab>"*p		<Esc>:if col(".")!=1<Bar>exe 'norm "*p'<Bar>else<Bar>exe 'norm "*P'<Bar>endif<CR>`]a
cmenu	     &Edit.&Paste<Tab>"*p		<C-R>*
nmenu 20.370 &Edit.Put\ &Before<Tab>[p		[p
imenu	     &Edit.Put\ &Before<Tab>[p		<C-O>[p
nmenu 20.380 &Edit.Put\ &After<Tab>]p		]p
imenu	     &Edit.Put\ &After<Tab>]p		<C-O>]p
if has("win32")
  vmenu 20.390 &Edit.&Delete<Tab>x		x
endif
amenu 20.400 &Edit.&Select\ all<Tab>ggvG	:if &slm != ""<Bar>exe ":norm gggH<C-O>G"<Bar>else<Bar>exe ":norm ggVG"<Bar>endif<CR>
amenu 20.405 &Edit.-SEP2-       	    	:
if has("win32") || has("gui_gtk")
  amenu 20.410 &Edit.&Find\.\.\.		:promptfind<CR>
  amenu 20.420 &Edit.Find\ and\ R&eplace\.\.\.	:promptrepl<CR>
  vunmenu      &Edit.Find\ and\ R&eplace\.\.\.
  vmenu	       &Edit.Find\ and\ R&eplace\.\.\.	y:promptrepl <C-R>"<CR>
  if has("gui_gtk")
    amenu 20.425 &Edit.-SEP3-			:
    amenu 20.430 &Edit.Options\.\.\.		:browse set<CR>
  endif
else
  amenu 20.410 &Edit.&Find<Tab>/			/
  amenu 20.420 &Edit.Find\ and\ R&eplace<Tab>:%s	:%s/
  vunmenu      &Edit.Find\ and\ R&eplace
  vmenu	       &Edit.Find\ and\ R&eplace<Tab>:s		:s/
endif

" Window menu
amenu 30.300 &Window.&New		<C-W>n
amenu 30.310 &Window.S&plit		<C-W>s
amenu 30.320 &Window.Sp&lit\ To\ #	<C-W><C-^>
amenu 30.325 &Window.-SEP1-       	    	:
amenu 30.330 &Window.&Close		<C-W>c
amenu 30.340 &Window.Close\ &Other(s)	<C-W>o
amenu 30.345 &Window.-SEP2-       	    	:
amenu 30.350 &Window.Ne&xt		<C-W>w
amenu 30.360 &Window.P&revious		<C-W>W
amenu 30.365 &Window.-SEP3-       	    	:
amenu 30.370 &Window.&Equal\ Height	<C-W>=
amenu 30.380 &Window.Rotate\ &Up	<C-W>R
amenu 30.390 &Window.Rotate\ &Down	<C-W>r
if has("win32") || has("gui_gtk")
  amenu 30.395 &Window.-SEP4-     	:
  amenu 30.400 &Window.Select\ &Font\.\.\.	:set guifont=*<CR>
  if has("gui_gtk")
    amenu 30.405 &Window.-SEP5-     	:
    amenu 30.410 &Window.Buffer\ &List\.\.\.	:browse ls<CR>
  endif
endif

" Programming menu
amenu 40.300 &Tools.&Spelling.&Ispell\ document\ ;V ;V
amenu 40.300 &Tools.&Spelling.&Highlight\ misspellings\ <F8> <F8>
amenu 40.300 &Tools.&Spelling.&Unhighlight\ misspellings\ <F7> <F7>

amenu 40.305 &Tools.&Format.&format\ paragraph\ ;v ;v
vmenu        &Tools.&Format.&format\ highlighted\ text\ ;v ;v
amenu 40.305 &Tools.&Format.&format\ code\ = =
vmenu        &Tools.&Format.&format\ code\ = =

amenu 40.310 &Tools.&Tags.&Jump\ to\ this\ tag	g<C-]>
vunmenu      &Tools.&Tags.&Jump\ to\ this\ tag
vmenu        &Tools.&Tags.&Jump\ to\ this\ tag	g<C-]>
amenu 40.310 &Tools.&Tags.Jump\ &back			<C-T>
amenu 40.310 &Tools.&Tags.Build\ &Tags\ File		:!ctags -R .<CR>
amenu 40.310 &Tools.-SEP1-			:

amenu 40.340 &Tools.Compile.&Make			    :make<CR>
amenu 40.340 &Tools.Compile.&List\ Errors		:cl<CR>
amenu 40.340 &Tools.Compile.L&ist\ Messages		:cl!<CR>
amenu 40.340 &Tools.Compile.&Next\ Error		:cn<CR>
amenu 40.340 &Tools.Compile.&Previous\ Error    :cp<CR>
amenu 40.340 &Tools.Compile.&Older\ List		:colder<CR>
amenu 40.340 &Tools.Compile.N&ewer\ List		:cnewer<CR>

" Buffer list menu -- Setup functions & actions
fun BufMenuAdd(bufno, name)
    let cmd = "amenu 60." . a:bufno . " &Buffers."
    let cmd = cmd . BufMenuName(a:bufno, a:name) 
    let cmd = cmd . " :buffer " . a:bufno . "<CR>"
    execute cmd
endfun

fun BufMenuDel(bufno, name)
    execute "aunmenu  &Buffers." . BufMenuName(a:bufno, a:name)
endfun

fun BufMenuName(bufno, name)
    let name = a:name
    if name == ""
        let name = '[No File]'
    endif
    if exists("g:bufmenu_fullpath")
        if g:bufmenu_fullpath != 0
            let name =  fnamemodify(name, ":p")
        endif
    endif
    let name = fnamemodify(name, ":~")

    let maxlen = 50
    if exists("g:bufmenu_maxlen")
        let maxlen = g:bufmenu_maxlen
    endif

    let disp = name
    " Remove middle parts if too long
    if strlen(disp) > maxlen 
        let disp1 = matchstr(name, '^/\=[^/]*/') . "..." 
        let disp = disp1 . matchstr(name, '/[^/]*/[^/]*$')
        if strlen(disp) > strlen(name) || disp1 == ""
            let disp = name
        endif
    endif

    " Only hint about path if too long
    if strlen(disp) > maxlen 
        let disp1 = matchstr(name, '../[^/]*$')
        let disp = matchstr(name, '^/\=..') . " ... " . disp1
        if strlen(disp) > strlen(name) || disp1 == ""
            let disp = name
        endif
    endif

    " Only trailing name if too long
    if strlen(disp) > maxlen 
        let disp = matchstr(name, '[^/]*$')
    endif
    return a:bufno . '\ ' . substitute(disp, "[ .'\"|]", '\\&', "g")
endfun

if has("vim_starting")
    " Handling for gvim -- first buffer is special:
    " menu.vim is called before files are loaded, but after buffer 1 is created
    augroup HandleFirstBufLoad
    autocmd BufEnter * if bufnr(1) == 1 | call BufMenuAdd(1, bufname(1)) | endif
    autocmd BufEnter * autocmd! HandleFirstBufLoad
    augroup NONE
else
    " Put all existing buffers in the buffer menu
    let ix = 1
    let max = bufnr("$")
    while ix <= max
	if bufnr(ix) == ix
	    call BufMenuAdd(ix, bufname(ix))
	endif
    let ix = ix + 1
    endwhile
    unlet ix max
endif

" Setup for future buffer loads & unloads
augroup BufferMenu
    autocmd BufFilePre  * call BufMenuDel(expand("<abuf>"), expand("<afile>"))
    autocmd BufFilePost * call BufMenuAdd(expand("<abuf>"), expand("<afile>"))
    autocmd BufDelete   * call BufMenuDel(expand("<abuf>"), expand("<afile>"))
    autocmd BufCreate   * call BufMenuAdd(expand("<abuf>"), expand("<afile>"))
augroup NONE

" The popup menu
amenu 1.10 PopUp.&Undo		u
amenu 1.15 PopUp.-SEP1-     	:
vmenu 1.20 PopUp.Cu&t		"*x
vmenu 1.30 PopUp.&Copy		"*y
nmenu 1.40 PopUp.&Paste		"*P`]:if col(".")!=1<Bar>exe "norm l"<Bar>endif<CR>
vmenu      PopUp.&Paste		"-x"*P`]
imenu      PopUp.&Paste		<Esc>:if col(".")!=1<Bar>exe 'norm "*p'<Bar>else<Bar>exe 'norm "*P'<Bar>endif<CR>`]a
cmenu      PopUp.&Paste		<C-R>*
vmenu 1.50 PopUp.&Delete	x
amenu 1.55 PopUp.-SEP2-     	:
amenu 1.60 PopUp.Select\ &Word	vaw
amenu 1.70 PopUp.Select\ &Line	V
amenu 1.80 PopUp.Select\ &All	ggVG

" The GUI toolbar (for Win32 or GTK)
if has("win32") || has("gui_gtk")
  amenu 1.10 ToolBar.Open	:browse e<CR>
  tmenu ToolBar.Open		Open file
  amenu 1.20 ToolBar.Save	:w<CR>
  tmenu ToolBar.Save		Save current file
  amenu 1.30 ToolBar.SaveAll	:wa<CR>
  tmenu ToolBar.SaveAll		Save all files
  amenu 1.40 ToolBar.Print	:w !enscript --margins=75:40:50:65 --header=""<CR>

  amenu 1.65 ToolBar.-sep2-	<nul>
  vmenu 1.70 ToolBar.Cut	"*x
  tmenu ToolBar.Cut		Cut to clipboard
  vmenu 1.80 ToolBar.Copy	"*y
  tmenu ToolBar.Copy		Copy to clipboard
  nmenu 1.90 ToolBar.Paste	i<C-R>*<Esc>
  vmenu ToolBar.Paste		"-xi<C-R>*<Esc>
  menu! ToolBar.Paste		<C-R>*
  tmenu ToolBar.Paste		Paste from Clipboard

  amenu 1.95 ToolBar.-sep3-	<nul>
  amenu 1.100 ToolBar.Find	:promptfind<CR>
  tmenu ToolBar.Find		Find...
  amenu 1.110 ToolBar.FindNext	n
  tmenu ToolBar.FindNext	Find Next
  amenu 1.120 ToolBar.FindPrev	N
  tmenu ToolBar.FindPrev	Find Previous
  amenu 1.130 ToolBar.Replace	:promptrepl<CR>
  vunmenu ToolBar.Replace
  vmenu ToolBar.Replace		y:promptrepl <C-R>"<CR>
  tmenu ToolBar.Replace		Find && Replace...

  amenu 1.135 ToolBar.-sep4-	<nul>
  amenu 1.140 ToolBar.New	<C-W>n
  tmenu ToolBar.New		New Window
  amenu 1.150 ToolBar.WinSplit	<C-W>s
  tmenu ToolBar.WinSplit	Split Window
  amenu 1.160 ToolBar.WinMax	:resize 200<CR>
  tmenu ToolBar.WinMax		Maximise Window
  amenu 1.170 ToolBar.WinMin	:resize 1<CR>
  tmenu ToolBar.WinMin		Minimise Window
  amenu 1.180 ToolBar.WinClose	:close<CR>
  tmenu ToolBar.WinClose	Close Window

"  amenu 1.185 ToolBar.-sep5-	<nul>
"  amenu 1.190 ToolBar.LoadSesn :browse so $vim/session<CR>
"  tmenu ToolBar.LoadSesn	Load session
"  amenu 1.200 ToolBar.SaveSesn	:execute ("mksession " . this_session)
"  tmenu ToolBar.SaveSesn	Save current session
" amenu 1.210 ToolBar.RunScript	:browse so<CR>
"  tmenu ToolBar.RunScript	Run a Vim Script

"  amenu 1.215 ToolBar.-sep6-	<nul>
"  amenu 1.220 ToolBar.Make	:make<CR>
"  tmenu ToolBar.Make		Make current project
"  amenu 1.230 ToolBar.Shell	:sh<CR>
"  tmenu ToolBar.Shell		Open a command shell
"  amenu 1.240 ToolBar.RunCtags	:!ctags -R .<CR>
"  tmenu ToolBar.RunCtags	Build tags in current directory tree
"  amenu 1.250 ToolBar.TagJump	g]
"  tmenu ToolBar.TagJump		Jump to tag under cursor

"  amenu 1.265 ToolBar.-sep7-	<nul>
"  amenu 1.270 ToolBar.Help	:help<CR>
"  tmenu ToolBar.Help		Vim Help
"  if has("gui_gtk")
"    amenu 1.280 ToolBar.FindHelp :helpfind<CR>
"  else
"    amenu 1.280 ToolBar.FindHelp :help 
"  endif
"  tmenu ToolBar.FindHelp	Search Vim Help
endif " has("win32") || has("gui_gtk")

"endif " !exists("did_install_default_menus")

" Install the Syntax menu only when filetype.vim has been loaded or when
" manual syntax highlighting is enabled.
" Avoid installing the Syntax menu twice.
if (exists("did_load_filetypes") || exists("syntax_on")) && !exists("did_install_syntax_menu")
let did_install_syntax_menu = 1

" Define the SetSyn function, used for the Syntax menu entries.
" Set 'filetype' and also 'syntax' if it is manually selected.
fun! SetSyn(name)
  if !exists("g:syntax_menu_synonly")
    exe "set ft=" . a:name
    if exists("g:syntax_manual")
      exe "set syn=" . a:name
    endif
  else
    exe "set syn=" . a:name
  endif
endfun

" Use the SynMenu command and function to define all menu entries
command -nargs=* SynMenu call SynMenu(<q-args>)

let current_menu_name = ""
let current_menu_nr = 0
let current_menu_item = 0

fun SynMenu(arg)
  " isolate menu name: until the first dot
  let i = match(a:arg, '\.')
  let menu_name = strpart(a:arg, 0, i)
  let r = strpart(a:arg, i + 1, 999)
  " isolate submenu name: until the colon
  let i = match(r, ":")
  let submenu_name = strpart(r, 0, i)
  " after the colon is the syntax name
  let syntax_name = strpart(r, i + 1, 999)
  if g:current_menu_name != menu_name
    let g:current_menu_name = menu_name
    let g:current_menu_nr = g:current_menu_nr + 10
    let g:current_menu_item = 100
  endif
  exe 'am 50.' . g:current_menu_nr . '.' . g:current_menu_item . ' &Syntax.' . menu_name . "." . submenu_name . ' :cal SetSyn("' . syntax_name . '")<CR>'
  let g:current_menu_item = g:current_menu_item + 10
endfun

SynMenu &ABCD.Ada:ada
SynMenu &ABCD.AHDL:ahdl
SynMenu &ABCD.Amiga\ DOS:amiga
SynMenu &ABCD.assembly\ (GNU):asm
SynMenu &ABCD.assembly\ (H8300):asm8300
SynMenu &ABCD.ASN\.1:asn
SynMenu &ABCD.Atlas:atlas
SynMenu &ABCD.Avenue:ave
SynMenu &ABCD.Awk:awk
SynMenu &ABCD.BASIC:basic
SynMenu &ABCD.BibFile:bib
SynMenu &ABCD.C:c
SynMenu &ABCD.C++:cpp
SynMenu &ABCD.Cascading\ Style\ Sheets:css
SynMenu &ABCD.Century\ Term:cterm
SynMenu &ABCD.Clean:clean
SynMenu &ABCD.Clipper:clipper
SynMenu &ABCD.Csh\ shell\ script:csh
SynMenu &ABCD.Cobol:cobol
SynMenu &ABCD.Diff:diff
SynMenu &ABCD.Diva\ (with\ SKILL):diva
SynMenu &ABCD.Dracula:dracula
SynMenu &ABCD.DTD:dtd

SynMenu &EFGHIJ.Eiffel:eiffel
SynMenu &EFGHIJ.Elm\ Filter:elmfilt
SynMenu &EFGHIJ.ESQL-C:esqlc
SynMenu &EFGHIJ.Expect:expect
SynMenu &EFGHIJ.Exports:exports
SynMenu &EFGHIJ.Fortran:fortran
SynMenu &EFGHIJ.Fvwm\ configuration:fvwm
SynMenu &EFGHIJ.GDB\ command\ file:gdb
SynMenu &EFGHIJ.GP:gp
SynMenu &EFGHIJ.GNUplot:gnuplot
SynMenu &EFGHIJ.Haskell:haskell
SynMenu &EFGHIJ.Haskell-literal:lhaskell
SynMenu &EFGHIJ.HTML:html
SynMenu &EFGHIJ.IDL:idl
SynMenu &EFGHIJ.Inform:inform
SynMenu &EFGHIJ.Java:java
SynMenu &EFGHIJ.JavaCC:javacc
SynMenu &EFGHIJ.JavaScript:javascript
SynMenu &EFGHIJ.Jgraph:jgraph

SynMenu &KLM.Lace:lace
SynMenu &KLM.Lex:lex
SynMenu &KLM.Lilo:lilo
SynMenu &KLM.Lisp:lisp
SynMenu &KLM.Lite:lite
SynMenu &KLM.LOTOS:lotos
SynMenu &KLM.Lua:lua
SynMenu &KLM.Lynx\ Style:lss
SynMenu &KLM.M4:m4
SynMenu &KLM.Mail:mail
SynMenu &KLM.Makefile:make
SynMenu &KLM.Man\ page:man
SynMenu &KLM.Maple:maple
SynMenu &KLM.Matlab:matlab
SynMenu &KLM.Metafont:mf
SynMenu &KLM.MetaPost:mp
SynMenu &KLM.Model:model
SynMenu &KLM.Modula\ 2:modula2
SynMenu &KLM.Msql:msql
SynMenu &KLM.MS-DOS\ \.bat\ file:dosbatch
SynMenu &KLM.4DOS\ \.bat\ file:btm
SynMenu &KLM.MS-DOS\ \.ini\ file:dosini
SynMenu &KLM.MS\ Resource\ file:rc
SynMenu &KLM.Muttrc:muttrc

SynMenu &NOPQ.NASM:nasm
SynMenu &NOPQ.Novell\ batch:ncf
SynMenu &NOPQ.Nroff:nroff
SynMenu &NOPQ.Objective\ C:objc
SynMenu &NOPQ.OCAML:ocaml
SynMenu &NOPQ.Pascal:pascal
SynMenu &NOPQ.PCCTS:pccts
SynMenu &NOPQ.Perl:perl
SynMenu &NOPQ.Perl\ POD:pod
SynMenu &NOPQ.PHP\ 3:php3
SynMenu &NOPQ.Phtml:phtml
SynMenu &NOPQ.Pike:pike
SynMenu &NOPQ.PL/SQL:plsql
SynMenu &NOPQ.PO\ (GNU\ gettext):po
SynMenu &NOPQ.PostScript:postscr
SynMenu &NOPQ.Povray:pov
SynMenu &NOPQ.Printcap:ptcap
SynMenu &NOPQ.Procmail:procmail
SynMenu &NOPQ.Prolog:prolog
SynMenu &NOPQ.Purify\ log:purifylog
SynMenu &NOPQ.Python:python

SynMenu &RS.Radiance:radiance
SynMenu &RS.Rebol:rebol
SynMenu &RS.Rexx:rexx
SynMenu &RS.S-lang:slang
SynMenu &RS.Sather:sather
SynMenu &RS.Scheme:scheme
SynMenu &RS.SDL:sdl
SynMenu &RS.sed:sed
SynMenu &RS.Sendmail\.cf:sm
SynMenu &RS.SGML:sgml
SynMenu &RS.Sh\ shell\ script:sh
SynMenu &RS.SiCAD:sicad
SynMenu &RS.Simula:simula
SynMenu &RS.SKILL:skill
SynMenu &RS.SLRN\ rc:slrnrc
SynMenu &RS.SLRN\ score:slrnsc
SynMenu &RS.SmallTalk:st
SynMenu &RS.SMIL:smil
SynMenu &RS.SNMP\ MIB:mib
SynMenu &RS.SPEC\ (Linux\ RPM):spec
SynMenu &RS.Squid:squid
SynMenu &RS.SQL:sql

SynMenu &TU.Tags:tags
SynMenu &TU.Tcl/Tk:tcl
SynMenu &TU.Telix\ Salt:tsalt
SynMenu &TU.Termcap:ptcap
SynMenu &TU.Tex:tex
SynMenu &TU.TF\ mud\ client:tf
SynMenu &TU.UIT/UIL:uil

SynMenu &VWXYZ.Verilog\ HDL:verilog
SynMenu &VWXYZ.vgrindefs:vgrindefs
SynMenu &VWXYZ.VHDL:vhdl
SynMenu &VWXYZ.Vim\ help\ file:help
SynMenu &VWXYZ.Vim\ script:vim
SynMenu &VWXYZ.Viminfo\ file:viminfo
SynMenu &VWXYZ.Visual\ Basic:vb
SynMenu &VWXYZ.VRML:vrml
SynMenu &VWXYZ.whitespace:whitespace
SynMenu &VWXYZ.X\ Pixmap:xpm
SynMenu &VWXYZ.X\ resources:xdefaults
SynMenu &VWXYZ.Xmath:xmath
SynMenu &VWXYZ.XML:xml
SynMenu &VWXYZ.Yacc:yacc
SynMenu &VWXYZ.Z-80\ assember:z8a
SynMenu &VWXYZ.Zsh\ shell\ script:zsh

unlet current_menu_nr
unlet current_menu_item
delcommand SynMenu
delfun SynMenu

am 50.75 &Syntax.-SEP1-				:

am 50.80 &Syntax.Set\ 'syntax'\ only		:let syntax_menu_synonly=1<CR>
am 50.81 &Syntax.Set\ 'filetype'\ too		:if exists("syntax_menu_synonly")<Bar>unlet syntax_menu_synonly<Bar>endif<CR>

am 50.90 &Syntax.&off			:syn off<CR>
am 50.92 &Syntax.&manual		:syn manual<CR>
am 50.94 &Syntax.auto&matic		:syn on<CR>

am 50.96 &Syntax.&on\ (this\ file)	:if !exists("syntax_on")<Bar>syn manual<Bar>endif<Bar>set syn=ON<CR>
am 50.98 &Syntax.o&ff\ (this\ file)	:syn clear<CR>

am 50.700 &Syntax.-SEP3-		:
am 50.710 &Syntax.color\ &test		:sp $VIMRUNTIME/syntax/colortest.vim<Bar>so %<CR>
am 50.720 &Syntax.&highlight\ test	:new<Bar>so $VIMRUNTIME/syntax/hitest.vim<CR>
am 50.730 &Syntax.&convert\ to\ HTML	:so $VIMRUNTIME/syntax/2html.vim<CR>

endif " !exists("did_install_syntax_menu")

" Restore the previous value of 'cpoptions'.
let &cpo = menu_cpo_save
unlet menu_cpo_save
