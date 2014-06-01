" Vim syntax file
" Language:	Calibre
" Maintainer:	Alvin Santos <aas_spam@yahoo.com>
" Last change:  2003-Jun-20 12:52:35 AM    
" Extensions:   *.drc,*.lvs,*.rul,*.rules
" Comment:      Calibre is an industry-standard language created by MGC (a
"		company specializing in Electronics Design Automation), for
"		the purposes of Design Rule Checking, Layout vs. Schematic
"		verification, and Parasitic Extraction.  Many thanks to
"		the dracula syntax file and the spice syntax file.
"Version:       0.1-inital release
"               0.2-fixed capacitance and resistance statements
"                  -added plate as a keyword
"               0.3-added opc orc printimage file psmgate map mapnumber as
"                   keywords for calibre RET

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Ignore case
syn case ignore

" A bunch of useful Calibre keywords

"Need to fix resistance and capacitance
"syn keyword calibreKeyword  abut acute and angle angled area attach by capacitance capi coin coincident connect connected convex copy corner cut dev device direct directory donut drawn drc enc enclose enclosure erc exclude expand ext extend extent extents external factor flag flatten fracture fringe group grow hcell holes in include inside int interact internal intersecting label layer layout length litho lvs magnify mask measure merge net not notch obtuse offgrid opcbias opclineend opcsbar opposite or ornet out outside overlap para parallel path pathchk perimeter perp perpendicular pex pins polygon polynet port ports precision proj projecting push rectangle rectangles region resistance resolution rotate sconnect shift shrink singular size snap source space square stamp step text title topex touch trace unit variable vertex virtual with xor
syn keyword calibreKeyword  abut acute and angle angled area attach by capi coin coincident connect connected convex copy corner cut dev device direct directory donut drawn drc enc enclose enclosure erc exclude expand ext extend extent extents external factor flag flatten fracture fringe group grow hcell holes in include inside int interact internal intersecting label layer layout length litho lvs magnify mask measure merge net not notch obtuse offgrid opcbias opclineend opcsbar opposite or ornet out outside overlap para parallel path pathchk perimeter perp perpendicular pex pins plate polygon polynet port ports precision proj projecting push rectangle rectangles region resolution rotate sconnect shift shrink singular size snap source space square stamp step text title topex touch trace unit variable vertex virtual with xor opc orc printimage file psmgate map mapnumber

syn match calibreKeyword "resistance\ " 
syn match calibreKeyword "capacitance\ "
syn match calibreKeyword "resistance\ \(sheet\|connection\)"
"syn match calibreKeyword "capacitance\ \(crossover\|intrinsic\)\(\ \|plate\|fringe\)"
syn match calibreKeyword "capacitance\ \(crossover\|intrinsic\)"
syn match calibreKeyword "capacitance\ nearbody"
syn match calibreKeyword "capacitance\ order"

syn match   calibreComment "//.*"
syn match   calibreSpecialComment "@.*"
syn region  calibreBlockComment start="/\*" end="\*/"

syn match calibreRuleName "[^//].*{"he=e-1
"Match Stings
"syn match   calibreString /"[^"]*"/hs=s+1,he=e-1
syn match   calibreString /"[^"]*"/
" Numbers, all with engineering suffixes and optional units
"==========================================================
"floating point number, with dot, optional exponent
syn match calibreNumber  "\<[0-9]\+\.[0-9]*\(e[-+]\=[0-9]\+\)\=\(meg\=\|[afpnumkg]\)\="
"floating point number, starting with a dot, optional exponent
syn match calibreNumber  "\.[0-9]\+\(e[-+]\=[0-9]\+\)\=\(meg\=\|[afpnumkg]\)\="
"integer number with optional exponent
syn match calibreNumber  "\<[0-9]\+\(e[-+]\=[0-9]\+\)\=\(meg\=\|[afpnumkg]\)\="

"syn match   calibrePreProc "^#.*"
syn match   calibrePreProc "#.*"

"Modify the following as needed.  The trade-off is performance versus
"functionality.
syn sync lines=50

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_calibre_syn_inits")
  if version < 508
    let did_calibre_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink calibreIdentifier     Identifier
  HiLink calibreStatement      Statement
  HiLink calibreKeyword        Keyword
  HiLink calibreComment        Comment
  HiLink calibreBlockComment   Comment
  HiLink calibreSpecialComment SpecialComment
  HiLink calibrePreProc        PreProc
  HiLink calibreString         String
  HiLink calibreNumber         Number
  HiLink calibreRuleName       Structure

  delcommand HiLink
endif

let b:current_syntax = "calibre"

" vim: ts=8
