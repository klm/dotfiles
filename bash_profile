# .bash_profile
if [ -f ~/.bash_login ]; then
	. ~/.bash_login
fi

if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

source ~/.bash/aliases
source ~/.bash/config
source ~/.bash/completions


[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
