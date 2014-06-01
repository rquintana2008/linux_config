# -*- mode: ksh -*-
################################################################################
#
# File:         .bashrc
# RCS:          $Header: /net/easystreet/vol/homes/kgr/templates/bash/RCS/.bashrc,v 1.9 2010/01/28 21:35:35 kgr Exp $
# Locker:       $Locker:  $
# What:         $Revision: 1.9 $
# Date:         $Date: 2010/01/28 21:35:35 $
# Description:  Bash shell environment file
# Language:     ksh
# File Author:  $Author: kgr $
# Status:       $State: Exp $
#
################################################################################

   # Set the default umask
   umask 002
  # Set Console to show path in active line
  export PS1='<\u@\h> [\w] $ '
   # Only execute if interactive
   test "${-#*i}" != "$-" || return 0

   # Print a message
   echo "-> bashrc"

   # Do profile if asked.  Used when invoking a shell via remsh, since
   # this isnt a bona fide login
   test "${DO_PROFILE}" != "" && . ${HOME}/.bash_profile

   # Set information about the history files
   export HISTCONTROL=ignoreboth
   export histchars='!^'  # Get comments saved in history
   HISTDIR=${HOME}/.hist
   HISTFILE_BASH="${HISTDIR}/bash/hist_xxxxxx"
   export CBHISTFILE="${HISTDIR}/cb/hist_xxxxxx"
   export IEDHISTFILE="${HISTDIR}/ied/hist_xxxxxx"
   export HISTFILE="${HISTFILE_BASH}"
   export HISTSIZE=1024
   export HISTFILESIZE=${HISTSIZE}
   shopt -s histappend
   export histchars="!^"
   shopt -s histappend
   export RLWRAP_EDITOR="vi +%L"

   # Create the needed history directories
   if ! test -d $(dirname ${CBHISTFILE}); then
       mkdir -p $(dirname ${CBHISTFILE})
   fi
   if ! test -d $(dirname ${IEDHISTFILE}); then
       mkdir -p $(dirname ${IEDHISTFILE})
   fi
   if ! test -d $(dirname ${HISTFILE}); then
       mkdir -p $(dirname ${HISTFILE})
   fi

    #Set up options
   set -o monitor          # enable job control
   set -o vi               # vi command-line editing
   export VISUAL=vim
   export EDITOR=vim
   set -o ignoreeof        # do not let CNTL-D exit the shell
   shopt -s checkwinsize   # Reset LINES and COLUMNS after each command

   # Fix backspace problems in vi when remotely logged into HP-UX
   if test "$(uname)x" = "HP-UXx"; then
      stty erase "^?"
   fi

   # Set the prompt
   case $TERM in
       xterm*)
           #PS1='\h<\u> \!>\[\e]0;\H:\w\a\]'
           ;;
       hpterm*)
           #PS1='\h<\u> \!> \[\033&f0k$(expr length \H:\w)D\H:\w\]'
           ;;
       *)
           PS1='\h<\u> \!>'
           ;;
   esac

   # Uncomment the following line to share history in all windows.
#   PROMPT_COMMAND="history -a;history -c;history -r"


   # Load aliases
   if [ -f ${HOME}/.aliases ]; then
      . ${HOME}/.aliases
      . ${HOME}/.alias
      
      echo "->.aliases"
    fi

   # Set the default printer
#   export PRINTER=daylight
#   export LPDEST=daylight

   # Set the DISPLAY variable
   if [[ -z ${DISPLAY} ]]; then
      case $(uname) in
         HP-UX )
            TERMINAL=$(who am i -R 2>/dev/null)
            TERMINAL=${TERMINAL#*\(}
            TERMINAL=${TERMINAL%\)*}
            export TERMINAL=${TERMINAL%:*}
            export DISPLAY=${TERMINAL}:0.0
            echo "INFO:  Setting DISPLAY to ${DISPLAY}" >&2
         ;;
         Linux )
            TERMINAL=$(last -n 1 -a ${LOGNAME} 2> /dev/null | head -n 1)
            NON_TERMINAL=$(last -n 1 -R ${LOGNAME} 2> /dev/null | head -n 1)
            if [[ "${TERMINAL}" != "${NON_TERMINAL} " ]]
            then
               export TERMINAL=$(echo ${TERMINAL} | awk '{print $NF}')
               export DISPLAY=${TERMINAL}:0.0
            else
               unset TERMINAL
               unset DISPLAY
            fi
            unset NON_TERMINAL
         ;;
#         SunOS )
#            machinePath=$(last -1 ${LOGNAME})
#         ;;
      esac
   fi

   # unset LANG so that some command may run faster
   # Reference: /etc/rc.config.d/LANG
   unset LANG

    # Make less display colors and not clear the screen
   export LESS="-R"

   # Load completion function
   if [ ${BASH_VERSINFO[0]} -eq 2 ] && [[ ${BASH_VERSINFO[1]} > 04 ]] || [ ${BASH_VERSINFO[0]} -gt 2 ]; then
       if [ -r /etc/bash_completion ]; then
           . /etc/bash_completion
       fi
   fi

   # Load functions
   if [[ -f ${HOME}/.bash_functions ]]
   then
      . ${HOME}/.bash_functions
    fi
export http_proxy=web-proxy:8088
   # Print a message
  # echo "<- bashrc"
 . ${HOME}/.bash_profile
# . ${HOME}/.profile
 . ${HOME}/.alias
/usr/bin/xbindkeys
