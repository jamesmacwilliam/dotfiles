#enter paths here

export PATH=/usr/local/bin:/bin:/opt/local/sbin:/usr/local/git/bin:/Applications/Xcode.app/Contents/Developer/usr/bin:/Library/Java/JavaVirtualMachines/jdk1.7.0_10.jdk/Contents/Home:$PATH

# Homebrew stuff.
export PATH=`brew --prefix`/bin:`brew --prefix`/sbin:~/bin:$PATH

#export PS1='[\u[$(~/.rvm/bin/rvm-prompt)]:  \W$(__git_ps1 " (%s)")]\$ '
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


#git stuff
#git config --global color.ui true
source ~/.git-completion.bash

#enter functions here

function path(){
    old=$IFS
    IFS=:
    printf "%s\n" $PATH
    IFS=$old
}

function parse_git_branch {
 git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

#alias spec="spec --backtrace --format profile"

function proml(){
 local        BLUE="\[\033[0;34m\]"
 local         RED="\[\033[0;31m\]"
 local   LIGHT_RED="\[\033[1;31m\]"
 local       GREEN="\[\033[0;32m\]"
 local LIGHT_GREEN="\[\033[1;32m\]"
 local       WHITE="\[\033[1;37m\]"
 local  LIGHT_GRAY="\[\033[0;37m\]"
 local       RESET="\[\033[0;39m\]"

 case $TERM in
  xterm*)
  TITLEBAR='\[\033]0;\W\007\]'
  ;;
  *)
  TITLEBAR=""
  ;;
 esac

 DATE="$BLUE[$RED\$(date +%H:%M)$BLUE]"
 WD="$BLUE[$RED\W$BLUE]"
 GIT="$GREEN\$(parse_git_branch)$RESET"

 export PS1="${WD}${GIT}\$ "
 export PS2='> '
 export PS4='+ '
}

export PS1='\[\033[00;35m\]\w\[\033[00m\]\[\033[01;33m\]`git branch 2>/dev/null|cut -f2 -d\* -s`\[\033[00m\]\$ '







#enter aliases here
alias subl="/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl"

alias cc="cd ~/dev/contacts-core"
alias cu="cd ~/dev/contacts-utilities"

alias rc="bundle exec rails console"
alias rs="bundle exec rails server"

alias be="bundle exec"

alias gs='git status'
alias gl='git log -p --raw --summary --color -B -M --ignore-space-at-eol -b --ignore-space-change -w --ignore-all-space'
alias gld='git log --decorate'
alias show_most_recent='for k in `git branch|perl -pe s/^..//`;do echo -e `git show --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $k|head -n 1`\\t$k;done|sort -r'

alias 193="rvm use ruby-1.9.3-p194@contacts-core"
alias jruby="rvm use jruby-1.6.7@contacts-core"

