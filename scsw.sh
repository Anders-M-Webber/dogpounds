#!/bin/bash

#### this file is to install some sw for view sc
#### @copyLeft, no guarantee!!!
VIBUNDLEDIR="$HOME/.vim/bundle/vundle"

## install vim

if [ -z "$(echo `which vim`)" ];then
    echo "vim is not installed in the system, install it (YES)?"
    read viminstall

    if [ "YES" = $viminstall ];then
        sudo apt-get install vim
    fi
fi

if [ -z "$(echo `which ctags`)" ];then
    echo "ctags is not installed in the system, install it (YES)?"
    read ctagsinstall

    if [ "YES" = $ctaginstall ];then
        sudo apt-get install ctags 
    fi
fi


if [ -z "$(echo `which cscope`)" ];then
    echo "cscope is not installed in the system, install it (YES)?"
    read cscopeinstall

    if [ "YES" = $ctaginstall ];then
        sudo apt-get install cscope 
    fi
fi


if [ ! -d $VIBUNDLEDIR ];then
    echo "bundle is not installed in the system, install it (YES)?"
    read bundleinstall

    if [ "YES" = $bundleinstall ];then
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle
    fi
fi


if [ -z "$(echo `which ag`)" ];then
    echo "silver search ag is not installed in the system, install it (YES)?"
    read aginstall

    if [ "YES" = $aginstall ];then
        sudo apt-get install silversearcher-ag
    fi
fi


if [ -z "$(echo `which tig`)" ];then
    echo "tig is not installed in the system, install it (YES)?"
    read tiginstall

    if [ "YES" = $tiginstall ];then
        sudo apt-get install tig 
    fi
fi


if [ -z "$(echo `which terminator`)" ];then
    echo "terminator is not installed in the system, install it (YES)?"
    read terminatorinstall

    if [ "YES" = $terminatorinstall ];then
        sudo apt-get install terminator 
    fi
fi


if [ -z "$(echo `which notepadqq`)" ];then
    echo "notepadqq is not installed in the system, install it (YES)?"
    read notepadqqinstall

    if [ "YES" = $notepadqqinstall ];then
        sudo add-apt-repository ppa:notepadqq-team/notepadqq
        sudo apt-get update
        sudo apt-get install notepadqq
    fi
fi


if [ -z "$(echo `which git`)" ];then
    echo "git is not installed in the system, install it (YES)?"
    read gitinstall

    if [ "YES" = $gitinstall ];then
        sudo add-apt-repository ppa:git-core/ppa
        sudo apt-get update
        sudo apt-get install git-all
    fi
fi

echo "All set!!!"
