# -*- mode: ksh -*-
################################################################################
#
# File:         .profile
# RCS:          $Header: /net/ncc1701d/home/kgr/templates/bash/RCS/.bash_profile,v 1.3 2007/04/10 15:46:32 kgr Exp $
# Locker:       $Locker:  $
# What:         $Revision: 1.3 $
# Date:         $Date: 2007/04/10 15:46:32 $
# Description:  Korn Shell profile
# Language:     ksh
# File Author:  $Author: kgr $
# Status:       $State: Exp $
#
################################################################################

   # Print a message
   echo "-> bash_profile"
ROOT_PATH=/bin:\
/usr/bin:\
/usr/lib:\
/usr/local/bin:\
/usr/bin/X11:\
/usr/local/heroku/bin:\
$HOME/scripts:\
$HOME/scripts/env_scripts:\
/opt/ictools/gridutils/bin:\
/opt/grid-6.0u8/bin/lx24-amd64:\
/opt/ictools/vnc/bin
export  ROOT_PATH
export  PATH=$ROOT_PATH
export  ROOT_CDPATH=.:$HOME
export  CDPATH=.:$HOME
export  SCRIPTPATH=$HOME/bin
export  MAILCHECK=20

   # Set the default umask
   umask 002

   # Create a custom PATH
   if [[ -a /etc/PATH && -r /etc/PATH ]]
   then
      PATH=$(< /etc/PATH)
   fi

   # Add dt to the PATH after softbench
   if [[ "${DT}" != "" ]]
   then
      start=${PATH%:/opt/softbench/bin:/*}
      end=${PATH#*:/opt/softbench/bin:}
      if [[ "${start}" = "${end}" ]]
      then
         # softbench not found
         PATH="/usr/dt/bin:${PATH}"
      else
         # softbench found
         PATH="${start}:/opt/softbench/bin:/usr/dt/bin:${end}:$PATH"
      fi
      unset start
      unset end
   fi

   # Create a custom PATH
   if [ -f ${HOME}/.path.pre ]
   then
      PATH=$(cat ${HOME}/.path.pre):${PATH}
   fi
   if [ -f ${HOME}/.path.post ]
   then
      PATH=${PATH}:$(cat ${HOME}/.path.post)
   fi
   eval PATH=${PATH}
   export PATH

   # Create a custom MANPATH
   case $(uname) in
#      HP-UX )
#         export HISTDIR=${HOME}/.hist/HP-UX
#      ;;
      Linux )
         export MANPATH=$(manpath)
      ;;
#      SunOS )
#         MANPATH="/usr/local/man:/usr/share/man:/depot2/#tool_man/man"
#      ;;
   esac
   if [ -f ${HOME}/.manpath.pre ]
   then
      MANPATH=$(cat ${HOME}/.manpath.pre):${MANPATH}
   fi
   if [ -f ${HOME}/.manpath.post ]
   then
      MANPATH=${MANPATH}:$(cat ${HOME}/.manpath.post)
   fi
   eval MANPATH=${MANPATH}
   export MANPATH

#   # Create a custom CDPATH
#   CDPATH=.:${HOME}:${HOME}/work
#   export CDPATH

   # Set the shell timeout to infinity
   export TMOUT=0
  echo "bash_profile"
   # Get the aliases and functions
  # if [ -f ${HOME}/.bashrc ]; then
  #    . ${HOME}/.bashrc
  ## fi

   # Set up ksh stuff when ksh is run on the command line.  This is
   # here to stop my bash history file from being corrupted when I run
   # ksh interactively from bash.
   export ENV=${HOME}/.kshrc

   # Set some varialbes so that I know that the profile has run
   export BASH_PROFILE_RUN=TRUE
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
   # Print a message
   echo "<- bash_profile"
