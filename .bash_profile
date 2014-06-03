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
#ROOT_PATH=/bin:\
#    /usr/bin:\
#    /usr/lib:\
#    /usr/local/bin:\
#    /usr/bin/X11:\
export  ROOT_CDPATH=.:$HOME
export  CDPATH=.:$HOME
export  SCRIPTPATH=$HOME/bin
export  MAILCHECK=20

# Set the default umask
umask 002
# Set the shell timeout to infinity
export TMOUT=0
echo "bash_profile"

# Set some varialbes so that I know that the profile has run
export BASH_PROFILE_RUN=TRUE
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
# Print a message
echo "<- bash_profile"
