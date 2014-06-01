#!/bin/sh
#
# Spell a file & generate the syntax statements necessary to
# highlight in vim.  Based on a program from Krishna Gadepalli
# <krishna@stdavids.picker.com>.
#
# I use the following mappings (in .vimrc):
#
#	noremap <F8> :so `vimspell.sh %`<CR><CR>
#	noremap <F7> :syntax clear SpellErrors<CR>
#
# Neil Schemenauer <nascheme@ucalgary.ca>
# March 1999

INFILE=$1
OUTFILE=/tmp/vimspell.$$
# if you have "tempfile", use the following line
#OUTFILE=`tempfile`

#
# local spellings
#

ispell -l < $INFILE | sort -u |
awk '
      {
	printf "syntax match SpellErrors \"\\<%s\\>\"\n", $0 ;
      }

END   {
	printf "highlight link SpellErrors ErrorMsg\n\n" ;
      }
' > $OUTFILE
echo "!rm $OUTFILE" >> $OUTFILE
echo $OUTFILE
