#!/bin/bash


# this script is to create connection by using lftp

USERNAME="xxx"
PWD="xx"
IP="10.1.10.xxx"
FTPDIRTEST="storage/xxxxxxx"
LOCALDIRTEST="$HOME/workspace/temp"
# if lftp is installed

if [ -z "$(echo `which lftp`)" ];then
    echo "[fatal] lftp is not installed in the system, exit!"
    exit
else
    echo -e "lftp has been installed!\n"
fi

if [ ! -d "$LOCALDIRTEST" ];then
    echo "no $LOCALDIRTEST exists, create it!"
  #  mkdir -p $LOCALDIRTEST
else
    echo " found $LOCALDIRTEST"
fi

function ftploginDownload 
{
    ftppath="$1"
    ftpfile="$2"
    echo -e "Downloading the file "$ftpfile" from "$ftppath" \n"

#    command << token
#    content to be used as command's standard input
#token
# Changing the the "<<" to "<<-" causes bash to ignore the leading tabs (but not spaces)
 lftp -u $USERNAME,$PWD $IP -e "set ssl:verify-certificate no" << EOF
 cd $ftppath
 ls
 exit
EOF
echo "exit from lftp $IP" 
}

ftploginDownload $FTPDIRTEST
