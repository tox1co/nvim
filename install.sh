#!/usr/bin/env bash

#usuario
echo "Usuario actual: `whoami`"
#variables
    programs="nodejs curl neovim git python"
    extra="s"
echo "actualizando paquetes..."
    pkg update -y
echo "instalando programas..."
  sleep 0.5
    pkg install $programs -y
    python3 -m pip install --user --upgrade pynvim
    python3 -m pip install --upgrade pip
    npm i -g yarn
    yarn global add vim-language-server

if [ -d "$HOME/.config/nvim/" ];then
    rm -rf ~/.config/nvim/
else
mkdir -p ~/.config/nvim/
fi
git clone https://github.com/tox1co/nvim ~/.config/nvim/

    mkdir -p ~/.local/share/nvim/backup ~/.local/share/nvim/swaps/

    echo "\" BACKUP" >> ~/.config/nvim/init.vim
    echo "set writebackup" >> ~/.config/nvim/init.vim
    echo "set backupdir=.,~/.local/share/nvim/backup" >> ~/.config/nvim/init.vim
    echo "set dir=.,~/.local/share/nvim/swaps" >> ~/.config/nvim/init.vim
clear
echo "Listo! Ahora ejecute neovim escribiendo 'nvim' y escriba :PlugInstall"

