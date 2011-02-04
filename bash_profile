# .bash_profile
source ~/.bash/aliases
source ~/.bash/config
source ~/.bash/completions

if [ -f ~/.bash_login ]; then
	. ~/.bash_login
fi

if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

if [ -f ~/.profile ]; then
	. ~/.profile #macports
fi

[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
