# ===============================================================
# File:                 $HOME/.zshrc
# Purpose:              Setup file for "zsh" shell
# written by:           Nicolas Cavigneaux <nico@bounga.org>
# Latest change:        Fri Mar 21 09:53:23 CET 2014
# Latest user version:  zsh-5.0.5
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
# Oh My Zsh
# https://github.com/robbyrussell/oh-my-zsh
#
# ===============================================================

# This config file is intended for use with Oh My Zsh framework

# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="clean"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# export DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(brew rbenv bundler capistrano coffee colored-man extract gem git git-extras git-flow github gitignore history mercurial nanoc node npm osx postgres pow rails rsync ruby screen ssh-agent sublime themes thor)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export EDITOR="/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl -w"
export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/var/rbenv/shims:/usr/local/var/rbenv/bin:/usr/local/share/npm/bin:/usr/bin:/bin:/usr/sbin:/sbin

fpath=(/usr/local/share/zsh-completions $fpath)
cdpath=( ~/Code )
