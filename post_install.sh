#!/bin/bash

# Get solarized working (https://github.com/Anthony25/gnome-terminal-colors-solarized)
if [ ! "$(command -v dconf)" ]; then
  echo "Installing dconf"
  sudo apt install dconf-cli
fi

if [ ! -d ~/gnome-terminal-colors-solarized ]; then
  cd ~
  git clone https://github.com/Anthony25/gnome-terminal-colors-solarized.git
  cd gnome-terminal-colors-solarized
  ./install.sh
fi

# Grab bash-git-prompt (https://github.com/magicmonty/bash-git-prompt)
if [ ! -d ~/.bash-git-prompt ]; then
  echo "Installing bash-git-prompt"
  cd ~
  git clone https://github.com/magicmonty/bash-git-prompt.git .bash-git-prompt --depth=1
  . ~/.bash-git-prompt/gitprompt.sh
fi

# Get Oh My Tmux! (https://github.com/gpakosz/.tmux)
if [ ! -f ~/.tmux/.tmux.conf ]; then
  echo "Installing Oh My Tmux"
  cd ~
  git clone https://github.com/gpakosz/.tmux.git
  ln -s -f .tmux/.tmux.conf
  cp .tmux/.tmux.conf.local .
  # TODO: copy .tmux.conf.local from dotfiles to this location instead
fi

# Install ag
if [ ! "$(command -v ag)" ]; then
  echo "Installing ag"
  sudo apt install silversearcher-ag
fi

# Install vundle for vim plugins (https://github.com/VundleVim/Vundle.vim)
if [ ! -f ~/.vim/bundle/Vundle.vim ]; then
  echo "Installing Vundle"
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# Re-source bashrc
. ~/.bashrc
