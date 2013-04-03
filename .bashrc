if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    c_reset=`tput sgr0`
    c_user=`tput setaf 2; tput bold`
    c_path=`tput setaf 4; tput bold`
    c_git_clean=`tput setaf 2`
    c_git_dirty=`tput setaf 1`
else
    c_reset=
    c_user=
    c_path=
    c_git_clean=
    c_git_dirty=
fi

git_completion=`brew --prefix git`/etc/bash_completion.d/git-completion.bash
if [ -f $git_completion ] ; then source $git_completion; fi
PATH=$PATH:$HOME/bin:Downloads

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
