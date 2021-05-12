#!/bin/bash

sudo apt install vim git g++ gcc binutils build-essential ctags cscope make cmake python

#### this file is to install some sw for view sc
#### @copyLeft, no guarantee!!!

LINUX_DIS="$(uname -a | awk -F " " '{print $2}')"

if [ "archlinux" == "$LINUX_DIS" ];then
    INSTALLCOM="sudo pacman -Syyu"
    echo "the system is ArchLinux !"
elif [[ "ubuntu" == "$LINUX_DIS" || "debian" == "$LINUX_DIS" ]];then
    INSTALLCOM="sudo apt-get install"
    INSTALLUPDATE="sudo apt-get update"
    INSTALLREP="sudo add-apt-repository"
    echo "the system is Ubuntu !"
else  # for fedora/redhat
    INSTALLCOM="yum install"
    echo "the system is RH !"
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
    else
        echo "(1) is not installed !"
    fi
else
    echo "(1) VIM has been installed!\n"
fi

if [ ! -d $VIBUNDLEDIR ];then
    echo "(2) bundle is not installed in the system, install it (YES)?"
    read bundleinstall

    if [ "YES" == "$bundleinstall" ];then
#otherwise 
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    else
        echo "(2) is not installed, you can not use plugin management in vim !"        
    fi
else
    echo "(2) bundle (for Vim) has been cloned!\n"
fi


if [ -z "$(echo `which ctags`)" ];then
    echo "(3) ctags is not installed in the system, install it (YES)?"
    read ctagsinstall

    if [ "YES" == "$ctaginstall" ];then
        #sudo apt-get install ctags 
        $INSTALLCOM ctags
    else
        echo "(3) is not installed !"        
    fi
else
    echo "(3) ctags has been installed!\n"
fi


if [ -z "$(echo `which cscope`)" ];then
    echo "(4) cscope is not installed in the system, install it (YES)?"
    read cscopeinstall

    if [ "YES" == "$ctaginstall" ];then
        #sudo apt-get install cscope 
        $INSTALLCOM cscope
    else
        echo "(4) is not installed !"        
    fi
else
    echo "(4) cscope has been installed!\n"
fi



if [ -z "$(echo `which ag`)" ];then
    echo "(5) silver search ag is not installed in the system, install it (YES)?"
    read aginstall

    if [ "YES" == "$aginstall" ];then
        #sudo apt-get install silversearcher-ag
        $INSTALLCOM silversearcher-ag
    else
        echo "(5) is not installed !"        
    fi
else
    echo "(5) silver search (ag) has been installed!\n"
fi


if [ -z "$(echo `which tig`)" ];then
    echo "(6) tig is not installed in the system, install it (YES) ...?"
    read tiginstall

    if [ "YES" == "$tiginstall" ];then
        #sudo apt-get install tig 
        $INSTALLCOM tig
    else
        echo "(6) is not installed !"
    fi
else
    echo "(6) tig has been installed!\n"
fi


if [ -z "$(echo `which terminator`)" ];then
    echo "(7) terminator is not installed in the system, install it (YES)  ...?"
    read terminatorinstall

    if [ "YES" == "$terminatorinstall" ];then
        $INSTALLCOM terminator
    else
        echo "(7) is not installed !"
    fi
else
    echo "(7) terminator has been installed!\n"
fi


if [ -z "$(echo `which notepadqq`)" ];then
    echo "(8) notepadqq is not installed in the system, install it (YES)  ...?"
    read notepadqqinstall

    if [ "YES" == "$notepadqqinstall" ];then
        if [ "archlinux" == "$LINUX_DIS" ];then
            $INSTALLCOM notepadqq
        else #ubuntu
            $INSTALLREP pppa:notepadqq-team/notepadqq
            $INSTALLUPDATE
            $INSTALLCOM notepadqq 
        fi
    else
        echo "(8) is not installed !"        
    fi
else
    echo "(8) notepadqq has been installed!\n"
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
    else
        echo "(9) is not installed !"        
    fi
else
    echo "(9) git all has been installed!\n"
fi

#kermit does not have GUI
# you may use gtkterm as an alternative
# sudo apt-get install gtkterm

if [ -z "$(echo `which kermit`)" ];then
    echo "(9-1) kermit is not installed in the system, install it (YES)?"
    read gitinstall

    if [ "YES" == "$gitinstall" ];then
          $INSTALLCOM ckermit
#settings, vim ~/.kermrc          
#set line          /dev/ttyUSB0   
#set speed         115200   
#set carrier-watch off   
#set handshake     none   
#set flow-control none   
#robust   
#set file type     bin   
#set file name     lit   
#set rec pack      1000   
#set send pack     1000   
#set window        5

#start, kermit -c
    else
        echo "(9-1) is not installed !"        
    fi
else
    echo "(9-1) kemit all has been installed!\n"
fi

if [ ! -d $LIVELATEXPREVIEW ];then
    echo "(10) live-preivew-of-latex-in-vim is not installed in the system, install it (YES) - manually uncommnet out it ...?"
    read livelatexinstall

    if [ "YES" == "$livelatexinstall" ];then
        git clone https://github.com/xuhdev/vim-latex-live-preview.git ~/.vim/plugin/livelatexpreview
    else
        echo "(10) is not installed !"        
    fi
else
    echo "(10) live latex preview (Vim plugin) has been cloned!\n"
fi

if [ -z "$(echo `which pdflatex`)" ];then
    echo "(11) latex live is not installed in the system, install it (YES) - it may take 2 hours - manually uncommnet out it ...?"
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
    else # select not "YES"
        echo "(11) is not installed !"        
    fi
else
    echo "(11) latex live has been installed!\n"
fi



if [ -z "$(echo `which java`)" ];then
    echo "(12) Java  is not installed in the system, install it (YES) - manually uncommnet out it ...?"
    read javainstall

    if [ "YES" == "$javainstall" ];then

        if [ "archlinux" == "$LINUX_DIS" ];then
            $INSTALLCOM jdk8-openjdk
            $INSTALLCOM jre8-openjdk
        else 
            echo "no installation find for ubuntu"
        fi
    else
        echo "(12) is not installed !"        
    fi
else
    echo "(12) Java has been installed!\n"
fi


if [ -z "$(echo `which yEd`)" ];then
    echo "(13) yed graphic editor is not installed in the system, install it (YES) - manually uncommnet out it ...?"
    read yedinstall

    if [ "YES" == "$yedinstall" ];then
        echo "Manually download it from http://www.yworks.com/,32 or 64 bits\n"
    else
        echo "(13) is not installed !"        
    fi
else
    echo "(13) yed has been installed!\n"
fi


if [ "ArchLinux" == "LINUX_DIS" ];then
    echo "(14) steps to change behavior of alt+tab - manually follow steps: "
    echo "1. terminal-> open "dconf-editor",
        2. go to org/gnome/desktop/wm/keybindings
        3. move '<Alt>Tab' from switch-applications to switch-windows
        4. [optional] move '<Shift><Alt>Tab' from switch-applications-backward to switch-windows-backward
        5. close "dconf-editor"
        6. alt+f2, r   to restart gnome" 
fi

if [ -z "$(echo `which lftp`)" ];then
    echo "(15) lftp is not installed in the system, install it (YES) - manually uncommnet out it ...?"
    read lftpinstall

    if [ "YES" == "$lftpinstall" ];then
        $INSTALLCOM lftp
    else
        echo "(15) is not installed !"        
    fi
else
    echo "(15) lftp has been installed!\n"
    echo "usage: lftp -u weining,Erl12345$ 10.1.10.105 -e "set ssl:verify-certificate no""
fi

if [ -z "$(echo `which ssh`)" ];then
    echo "(16) openssh is not installed in the system, install it (YES/NO) ?"
    read opensshinstall

    if [ "YES" == "$opensshinstall" ];then
        $INSTALLCOM openssh 
    else
        echo "(16) is not installed !"
    fi
else
    echo "(16) openssh has been installed!\n"
fi

if [ "ArchLinux" == "LINUX_DIS" ];then
    echo "(17) install bash completion"
    $INSTALLCOM bash-completion
fi

if [ "ubuntu" == "LINUX_DIS" ];then
echo "to install following sw, uncomment out them..."
    echo "(18) install gparted, which is used to change partitions size"
#    $INSTALLCOM gparted 
    
     echo "(19) install audio editor tool Audacity"
#    $INSTALLCOM audacity   

    echo "(20) install text browser tool elinks, works Vim while browsering webs"
 #   $INSTALLCOM elinks  
fi
   # to install virtualbox on ubuntu 
   # http://techapple.net/2014/05/5-best-android-emulators-linux-run-android-apps-linux-ubuntulinuxmintfedoraarchlinuxopensusemageiacentos-etc/
   sudo apt-get install dkms
   sudo apt-get install virtualbox
   sudo apt-get install progress  # man progress
 
 #install others
 sudo apt-get install shellcheck htop
 # install command line tools, not used yet
 axel  # download via mul-thread
 fpp  # pathpicker (with git)
 mosh # like ssh
 yapf  # for python format
 jp # format json
 mycli  # mysql client
 #install fzf
 git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
 ~/.fzf/install

  #install ssh
  sudo apt-get install openssh-server
  sudo service ssh status
  #sudo service ssh restart
echo "All set!!!"
