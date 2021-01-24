#!/usr/bin/env bash

#usuario
echo "Usuario actual: `whoami`"
#variables
    programs="nodejs curl neovim git"
    extra="s"

echo "instalando os programas..."

if [ -e "~/../usr/bin/apt-get" ];then
    apt-get update 
    apt-get install $programs -y
  elif [ -e "~/../usr/bin/pkg" ];then
    pkg update
    pkg install $programs -y
fi

if [ -d "~/.config/nvim" ];then
    rm -rf ~/.config/nvim
else
    mkdir -p ~/.config/nvim
fi

git clone https://github.com/tox1co/vim ~/.config/nvim

if [ -e "~/../usr/bin/apt-get" ];then
    mkdir -p $PREFIX/var/tmp/nvim/backups $PREFIX/var/tmp/nvim/swaps/
    echo "\" BACKUP" >> ~/.config/nvim/init.vim
    echo "set writebackup" >> ~/.config/nvim/init.vim
    echo "set backupdir=.,$PREFIX/var/tmp/nvim/backups" >> ~/.config/nvim/init.vim
    echo "set dir=.,$PREFIX/var/tmp/nvim/swaps" >> ~/.config/nvim/init.vim
else
    mkdir -p ~/.local/share/nvim/backup ~/.local/share/nvim/swaps/
    echo "\" BACKUP" >> ~/.config/nvim/init.vim
    echo "set writebackup" >> ~/.config/nvim/init.vim
    echo "set backupdir=.,~/.local/share/nvim/backup" >> ~/.config/nvim/init.vim
    echo "set dir=.,~/.local/share/nvim/swaps" >> ~/.config/nvim/init.vim
fi

echo "Listo! Ahora ejecute neovim escribiendo `nvim` y escriba :PlugInstall"

