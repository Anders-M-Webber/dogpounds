#!/bin/bash

TOP=$HOME
echo "install vim-gnome to enable copy-clipboard function"
sudo apt-get install vim-gnome

echo "clone vundle ......"
git clone https://github.com/VundleVim/Vundle.vim.git  $TOP/.vim/bundle/Vundle.vim
echo "copy vimrc ......"
cp $PWD/vimrc $HOME/.vimrc
echo "done!"
