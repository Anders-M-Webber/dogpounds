#!/bin/bash
# ccsosnfs.iteye.com/blog/1661880
# -o -name *.pl -o -name *.mk -o -name *.make -o -name *.py -o -name *.rc 
# -o -name *.cmd -o -name *.min -o -name Makefile -o -name GNUmakefile -o -name *.x 
# 
# root directory of Android source
androidsrcdir=$PWD
# to search these databases, don't put all database into a single directory
cscopedb=$androidsrcdir

ignoredir="( -name .git \
        -o -name .svn \
        -o -name .ccache \
        -o -name .repo \
        -o -name build \
        -o -name cts \
        -o -name compatibility \
        -o -name docs \
        -o -name development \
        -o -name test \
        -o -name toolchain \
        -o -name tools \
        -o -name libcore \
        -o -name libnativehelper \
        -o -name pdk \
        -o -name sdk \
        -o -name platform_testing \
        -o -name out ) -prune -o"

searchfiletype="( -name *.java \
    -o -name *.cpp \
    -o -name *.cc \
    -o -name *.cxx \
    -o -name *.hpp \
    -o -name *.hh \
    -o -name *.[chsS] \
    -o -name *.xml \
    -o -name *.aidl )"
 

path="$androidsrcdir/frameworks \
    $androidsrcdir/art \
    $androidsrcdir/bionic \
    $androidsrcdir/dalvik \
    $androidsrcdir/device/renesas \
    $androidsrcdir/external \
    $androidsrcdir/hardware/renesas \
    $androidsrcdir/prebuilts/build-tools/linux-x86 \
    $androidsrcdir/packages \
    $androidsrcdir/system \
    $androidsrcdir/vendor/renesas \
    $androidsrcdir/bootable"


prepare()
{
    if [ ! -d "$androidsrcdir" ]; then
        echo "no $androidsrcdir set, exit!"
        exit 1
    else
        echo "["$0"] Android source dir:$androidsrcdir"
        clean
   fi
    echo "["$0"] searching files... (ignore symlinks !!!) "
    all_source | sort > $cscopedb/cscope.files
    lines=$(wc -l $cscopedb/cscope.files | awk '{ printf $1 }')
    echo "["$0"] found $lines files totaly in "$androidsrcdir"."
}

all_source()
{
    for src in $path
    do
#        find -L $src $ignoredir $searchfiletype -print
# only search regular files, no syslinks
        find $src $ignoredir $searchfiletype -type f -print
    done
}

docscope()
{
    echo "["$0"]Now build cscope file... may take 10 mins..."
    sleep 2
    start=`date +%s`
    cscope -b -k -q -i $cscopedb/cscope.files -f $cscopedb/cscope.out
    end=`date +%s`
    let "elapse=$end-$start"
    if [ $? -eq 0 ]; then
        echo "["$0"]make cscope database : ($elapse) seconds"
        size=$(du $cscopedb/cscope.out -h | awk '{ printf $1 }')
        echo "["$0"]($cscopedb/cscope.out):$size"
    fi
}

dotags()
{
    echo "["$0"]Now build tags file ..."
    start=`date +%s`
    ctags --fields=+afiKlmnsSzt -L $cscopedb/cscope.files -f $cscopedb/tags
    end=`date +%s`
    let "elapse=$end-$start"
    if [ $? -eq 0 ]; then
        echo "["$0"]make ctags database :  ($elapse) seconds"
        size=$(du $cscopedb/tags -h | awk '{ printf $1 }')
        echo "["$0"]($cscopedb/tags):$size"
    fi
}

usage() 
{
    echo "Usages:"
    echo "$0    cscope  : make cscope database only"
    echo "$0    tags    : make ctags database only"
    echo "$0    all     : make two databases"
    echo "$0    clean   : clean cscope ctags databases"
}

clean()
{
    echo "["$0"]Now clean databases ..."
    if [ -e $cscopedb/cscope.files ]; then
        rm -v -rf $cscopedb/cscope.files
    fi
    if [ -e $cscopedb/cscope.out ]; then
        rm -v -rf $cscopedb/cscope.out*
    fi

    if [ -e $cscopedb/tags ]; then
        rm -v -rf $cscopedb/tags
    fi
    echo "["$0"] clean done."
}

case $1 in
    "cscope")
        prepare
        docscope
        ;;

    "tags")
        prepare
        dotags
        ;;  

    "all")
        prepare
        docscope
        dotags
        ;;
    "clean")
        clean 
        ;;
    "")
        usage
        ;;
esac
