" File: Timestamp.vim
"
" Purpose: insert timestamp into files
"
" Author: Ralf Arens <ralf.arens@gmx.de>
" Last Modified: 2001-06-06 22:50:23 CEST
" + Terms like "Last Modified", "Last Change", or "Last Changed" are allowed.


" timestamps
" ¯¯¯¯¯¯¯¯¯¯
fun! Timestamp()
	mark z
	exe ':%s/\(.*Last Modified:\s\+\|.*Last Changed\=:\s\+\)\d\{4}-\d\{2}-\d\{2} \d\{2}:\d\{2}:\d\{2} \u\{3,4}\(.*\)$/\1'.strftime("%Y-%m-%d %T %Z").'\2/e'
	'z
endfun

" vim:set noet:tw=8:sw=8
