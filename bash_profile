# .bash_profile
source ~/.bash/aliases
source ~/.bash/config

if [ -f ~/.bash_login ]; then
	. ~/.bash_login
fi

if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

if [ -f ~/.profile ]; then
	. ~/.profile #macports
fi

if [ -f ~/bin/ruby_switcher.sh ]; then
	source ~/bin/ruby_switcher.sh
fi

PATH=$PATH:$HOME/bin

export PATH
