#!/bin/bash

# linux installation of vim / vim-go and related plugins for golang development

sudo apt-get update --fix-missing
sudo apt-get install vim-gnome exuberant-ctags -y

mkdir -p ~/.vim/{autoload,bundle}

cd /tmp
wget https://raw.githubusercontent.com/mauleyzaola/scripts/master/vim/.vimrc
mv .vimrc ~/

wget https://raw.githubusercontent.com/mauleyzaola/scripts/master/bin/pathogen.vim
mv pathogen.vim ~/.vim/autoload/

cd ~/.vim/bundle
git clone https://github.com/fatih/vim-go.git
git clone https://github.com/scrooloose/nerdtree.git
git clone git://github.com/majutsushi/tagbar
git clone https://github.com/Shougo/neocomplete.vim.git
