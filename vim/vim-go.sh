#!/bin/bash

sudo apt-get install vim-gnome exuberant-ctags -y

mkdir -p ~/.vim/{autoload,bundle}

wget https://raw.githubusercontent.com/mauleyzaola/scripts/master/bin/pathogen.vim
mv pathogen.vim ~/.vim/autoload/

cd ~/.vim/bundle
git clone https://github.com/fatih/vim-go.git
git clone https://github.com/scrooloose/nerdtree.git
git clone git://github.com/majutsushi/tagbar
git clone https://github.com/Shougo/neocomplete.vim.git
