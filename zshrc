# ===============================================================
# File:                 $HOME/.zshrc
# Purpose:              Setup file for "zsh" shell
# written by:           Nicolas Cavigneaux <nico@bounga.org>
# Latest change:        Mon Jul  7 22:33:43 CEST 2003
# Latest user version:  zsh-4.0.7
# ===============================================================
#
# ===============================================================
# SEE ALSO:
# ===============================================================
# ZSH Pages:
# http://zsh.sunsite.dk/
# http://www.zshwiki.org/cgi-bin/wiki.pl
#
# MailingList:
# http://zsh.sunsite.dk/Arc/mlist.html
#
# ===============================================================

# My functions (don't forget to modify fpath before call compinit !!)
fpath=($HOME/.zsh/functions $fpath)

# in order to have many completion function run compinstall !

# I like colors in term
eval `dircolors $HOME/.zsh/colors`

autoload -U zutil
autoload -U compinit
autoload -U complist

# Activation
compinit

# Resource files
for file in $HOME/.zsh/rc/*.rc; do
	source $file
done

if [ -f ~/TODO ]
then
	echo "Don't forget : "
	echo 
	cat ~/TODO
fi

umask 027