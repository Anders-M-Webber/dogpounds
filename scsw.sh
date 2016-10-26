#!/bin/bash

#### this file is to install some sw for view sc
#### @copyLeft, no guarantee!!!

LINUX_DIS="$(uname -a | awk -F " " '{print $2}')"

if [ "archlinux" == "$LINUX_DIS" ];then
    INSTALLCOM="sudo pacman -Syyu"
elif [[ "ubuntu" == "$LINUX_DIS" || "debian" == "$LINUX_DIS" ]];then
    INSTALLCOM="sudo apt-get install"
    INSTALLUPDATE="sudo apt-get update"
    INSTALLREP="sudo add-apt-repository"
else  # for fedora/redhat
    INSTALLCOM="yum install"
if

VIBUNDLEDIR="$HOME/.vim/bundle/vundle"
LIVELATEXPREVIEW="$HOME/.vim/plugin/livelatexpreview"




## install vim

if [ -z "$(echo `which vim`)" ];then
    echo "(1) vim is not installed in the system, install it (YES)?"
    read viminstall

    if [ "YES" == "$viminstall" ];then
        #sudo apt-get install vim
        $INSTALLCOM vim
    fi
else
    echo "VIM has been installed!\n"
fi

if [ ! -d $VIBUNDLEDIR ];then
    echo "(2) bundle is not installed in the system, install it (YES)?"
    read bundleinstall

    if [ "YES" == "$bundleinstall" ];then
#otherwise you can not use plugin management in vim
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    fi
else
    echo "bundle has been cloned!\n"
fi


if [ -z "$(echo `which ctags`)" ];then
    echo "(3) ctags is not installed in the system, install it (YES)?"
    read ctagsinstall

    if [ "YES" == "$ctaginstall" ];then
        #sudo apt-get install ctags 
        $INSTALLCOM ctags
    fi
else
    echo "ctags has been installed!\n"
fi


if [ -z "$(echo `which cscope`)" ];then
    echo "(4) cscope is not installed in the system, install it (YES)?"
    read cscopeinstall

    if [ "YES" == "$ctaginstall" ];then
        #sudo apt-get install cscope 
        $INSTALLCOM cscope
    fi
else
    echo "cscope has been installed!\n"
fi



if [ -z "$(echo `which ag`)" ];then
    echo "(5) silver search ag is not installed in the system, install it (YES)?"
    read aginstall

    if [ "YES" == "$aginstall" ];then
        #sudo apt-get install silversearcher-ag
        $INSTALLCOM silversearcher-ag
    fi
else
    echo "ag has been installed!\n"
fi


if [ -z "$(echo `which tig`)" ];then
    echo "(6) tig is not installed in the system, install it (YES)?"
    read tiginstall

    if [ "YES" == "$tiginstall" ];then
        #sudo apt-get install tig 
        $INSTALLCOM tig
    fi
else
    echo "tig has been installed!\n"
fi


if [ -z "$(echo `which terminator`)" ];then
    echo "(7) terminator is not installed in the system, install it (YES)?"
    read terminatorinstall

    if [ "YES" == "$terminatorinstall" ];then
        $INSTALLCOM terminator
    fi
else
    echo "terminator has been installed!\n"
fi


if [ -z "$(echo `which notepadqq`)" ];then
    echo "(8) notepadqq is not installed in the system, install it (YES)?"
    read notepadqqinstall

    if [ "YES" == "$notepadqqinstall" ];then
        if [ "archlinux" == "$LINUX_DIS" ];then
            $INSTALLCOM notepadqq
        else #ubuntu
            $INSTALLREP pppa:notepadqq-team/notepadqq
            $INSTALLUPDATE
            $INSTALLCOM notepadqq 
        fi
    fi
else
    echo "notepadqq has been installed!\n"
fi


if [ -z "$(echo `which git`)" ];then
    echo "(9) git is not installed in the system, install it (YES)?"
    read gitinstall

    if [ "YES" == "$gitinstall" ];then
        if [ "archlinux" == "$LINUX_DIS" ];then
            $INSTALLCOM git tk tcl
        else #ubuntu
            $INSTALLREP ppa:git-core/ppa
            $INSTALLUPDATE
            $INSTALLCOM git-all
        fi
    fi
else
    echo "git all has been installed!\n"
fi

if [ ! -d $LIVELATEXPREVIEW ];then
    echo "(10) live-preivew-of-latex-in-vim is not installed in the system, install it (YES)?"
    read livelatexinstall

    if [ "YES" == "$livelatexinstall" ];then
        git clone https://github.com/xuhdev/vim-latex-live-preview.git ~/.vim/plugin/livelatexpreview
    fi
else
    echo "live latex preview has been cloned!\n"
fi

if [ -z "$(echo `which pdflatex`)" ];then
    echo "(11) latex live is not installed in the system, install it (YES)?"
    read latexinstall

    if [ "YES" == "$latexinstall" ];then
        if [ "ArchLinux" == "LINUX_DIS" ];then
            echo " download it from "https://www.tug.org/texlive/acquire-netinstall.html""
            wget -o $HOME/Downloads/install-tl-unx.tar.gz http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
            tar xvzf $HOME/Downloads/install-tl-unx.tar.gz
            echo " go to the unzipped directory and install it manually, process will take more than 2 hours!"
            ################ ArchLinux
            # add path after installed, add below to /etc/bash.bashrc 
            #These 3 lines below are related to TEXLIVE (added by YOU on dd/mm/yy)
            #PATH=/usr/local/texlive/2016/bin/x86_64-linux:$PATH; export PATH
            #MANPATH=/usr/local/texlive/2016/texmf-dist/doc/man:$MANPATH; export MANPATH
            #INFOPATH=/usr/local/texlive//2016/texmf-dist/doc/info:$INFOPATH; export INFOPATH 
            # create /etc/manpath.config if it is not exist and add 
            #MANPATH_MAP /usr/local/texlive/2015/bin/x86_64-linux /usr/local/texlive/2016/texmf-dist/doc/man 
            ############## Ubuntu
        else # ubuntu
            $INSTALLCOM texlive-full
        fi
    fi
else
    echo "latex live has been installed!\n"
fi



if [ -z "$(echo `which java`)" ];then
    echo "(12) Java  is not installed in the system, install it (YES)?"
    read javainstall

    if [ "YES" == "$javainstall" ];then

        if [ "archlinux" == "$LINUX_DIS" ];then
            $INSTALLCOM jdk8-openjdk
            $INSTALLCOM jre8-openjdk
        else 
            echo "no installation find for ubuntu"
        fi
    fi
else
    echo "yed has been installed!\n"
fi


if [ -z "$(echo `which yEd`)" ];then
    echo "(13) yed graphic editor is not installed in the system, install it (YES)?"
    read yedinstall

    if [ "YES" == "$yedinstall" ];then
        echo " download it from http://www.yworks.com/,32 or 64 bits\n"
    fi
else
    echo "yed has been installed!\n"
fi


if [ "ArchLinux" == "LINUX_DIS" ];then
    echo "steps to change behavior of alt+tab"
    echo "1. terminal-> open "dconf-editor",
        2. go to org/gnome/desktop/wm/keybindings
        3. move '<Alt>Tab' from switch-applications to switch-windows
        4. [optional] move '<Shift><Alt>Tab' from switch-applications-backward to switch-windows-backward
        5. close "dconf-editor"
        6. alt+f2, r   to restart gnome" 
fi






echo "All set!!!"
