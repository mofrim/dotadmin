alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias ls='ls --color=auto --hyperlink=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias cfgbash='$EDITOR ~/.bashrc'
alias cfgalias='$EDITOR ~/.bash_aliases && source ~/.bash_aliases'

## vim stuff
alias svim="sudo vim"
alias n="vim"
alias v="vim"

# bookmark-like aliases
alias cddot='cd ~/dot'

# commit -a, damit auch gelöschte Dateien erfasst und committed werden.
alias gittp='git add *; git commit -a -m "$HOSTNAME $(date +%a-%d-%b-%y-%H:%M:%S)"; git push'
alias gitt='git add *; git commit -a -m "$HOSTNAME $(date +%a-%d-%b-%y-%H:%M:%S)"'
alias pushorg='cd ~/org;gittp;cd -'
alias pullorg='cd ~/org;git pull;cd -'
alias gitusermail="git config user.name \"mofrim\" && git config user.email \"mofrim@posteo.de\" "
alias gcm='git commit -m'
alias gco='git checkout'
alias gst='git status'
alias gpl='git pull'
alias gps='git push'
alias gad='git add'
alias gcl='git clone'

# some more ls aliases
alias ll='ls -lhF'
alias la='ls -alhF'
alias l='ls -CF'
alias lsd='ls -ld'              #nice for listing .directories -> 'lsd .e*' zB

# nice to haves
alias md='mkdir'
# alias fd='fd -H'                # always also find hidden files
alias psa='ps -aux'
alias psax='ps -aux | grep'
alias less="less -F"            # quit if one screen
alias ssh="TERM=xterm-256color ssh" # ensure correct terminfo
alias mutt="mbsync -a; neomutt"
alias timechecksuspend="date && systemctl suspend && sleep 5 && date"
alias dudh="du -d1 -h"
alias cpwd="pwd | wl-copy"
alias man3="man 3"
alias ke="edit-in-kitty"

#
#      ____                 __  _
#     / __/_  ______  _____/ /_(_)___  ____  _____
#    / /_/ / / / __ \/ ___/ __/ / __ \/ __ \/ ___/
#   / __/ /_/ / / / / /__/ /_/ / /_/ / / / (__  )
#  /_/  \__,_/_/ /_/\___/\__/_/\____/_/ /_/____/
#
#

# togglelc -- toggles between current set locale and LC_ALL=C in order to
# display english command/error output
function togglelc() {
  if [ -z $LC_ALL ]
  then
    export LC_ALL=C
  else
    export LC_ALL=
  fi
}

# mkdir -p $1 and cd into it
function mkcd() {
	mkdir -p $1 && cd $1
}

# symlink 1st args recursively resolved aka very truely real path to link_name 
# useful for my MatheBibliothek files where i want to add bookmarks in okular
# f.ex.
function lns () {
  if test $# -eq 0
  then
    echo -e "usage: lns file_to_be_linked link_name"
  else
    ln -s `readlink -f $1` $2
  fi
}

function nixpath () {
  if test $# -eq 0
  then
    echo -e "usage: nixpath program"
  else
    dirname $(readlink $(which $1))
  fi
}

# open file in okular under real path
function ok () {
  if test $# -eq 0
  then
    echo -e "usage: ok file"
  else
    nohup okular `readlink -f $1` &> /dev/null & disown
  fi
}

function zat() {
  if test $# -eq 0
  then
    echo -e "usage: zat FILE"
  else
    nohup zathura $1 &> /dev/null & disown
  fi
}

# leave ranger to current dir
function ranger-cd {
  tempfile="$(mktemp -t tmp.XXXXXX)"
  env ranger --choosedir="$tempfile" "${@:-$(pwd)}"
  test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
      cd -- "$(cat "$tempfile")"
    fi
  rm -f -- "$tempfile"
}
alias r=ranger-cd

#  ${${1##*/}%.*} macht aus http://www../asdnad/asda.git -> asda
function gitvimadd () {
    cd ~/.vim/bundle
    git submodule add $1 ${${1##*/}%.*}
}

# add new topos, commit, push and pull to strato
function goewaldtopoadd (){
  cd /home/frido/Dokumente/bergkrams/goewald.de/git-repo
  git add .
  if [ -n "$1" ]
  then
    git commit -m "topo: $1"
  else
    git commit -m "topo: foobar"
  fi
  git push
  /home/frido/Dokumente/bergkrams/goewald.de/update-strato-git-pull.sh
}

# Figure out the closure size for a certain package
# ex. nix-closure-size $(which exa)
# stolen from https://github.com/NixOS/nixpkgs/issues/51368
function nix-closure-size() {
  nix-store -q --size $(nix-store -qR $(readlink -e $1) ) | \
  awk '{ a+=$1 } END { print a }' | \
  numfmt --to=iec-i
}

function qtify () {
  QT_QPA_PLATFORM=xcb "$@"
}

# the 1%%\.c removes the .c extension from the end of first c-file given as
# param
function 42cc () {
  cc -Wall -Wextra -Werror -o "${1%%\.c}" "$@" && ./${1%%\.c}
}

# see above
function EZcc () {
  cc -g -o "${1%%\.c}" "$@" && ./${1%%\.c}
}

function mofrimgit (){
	reponame=$(git remote -v | head -n1 | sed 's/\(^.*\/\)\(.*\)\(\..*$\)/\2/')
	git remote set-url origin git@github.com:mofrim/$reponame.git
} 

function nixfindstoredirs() {
	if [ -x "$(command -v fd)" ]
	then
		fd $1 /nix/store -t d -d1
	else
		find /nix/store -maxdepth 1 -name "*$1*" -type d
	fi
}
