#!/bin/bash

####  @copyLeft  No Guaratee!!!

###created on 12-01-2015
## for general purpose

##### ctags does NOT support symbolic links, so we have to define multiple pathes
#this script is good for large project and you can define 
#different Source code pathes!!!

#######http://cscope.sourceforge.net/large_projects.html

# at least, need 3 parameter, "this_script" "path" "database_name"
usage()
{
        echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> "
        echo " usage : $0  path_1 ... path_n cscope_db_name"
        echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<\n"
}

# at least, need 3 parameter, "this_script" "path" "database_name"

if [ $# -lt 2 ]
then 
    echo "no path defined, read usage !"
    usage
    exit
fi

DBNAME=${@: -1}  #the last parameter
CSCOPE_DB_PATH="$HOME/cscope/$DBNAME"


# main() start

echo "=============================================>"
echo " creating Cscope database - directory: $CSCOPE_DB_PATH"
echo "=============================================>"

if [! -d "$CSCOPE_DB_PATH" ];then
    echo "Creating $CSCOPE_DB_PATH ..."
    mkdir -p $CSCOPE_DB_PATH
fi

cd $CSCOPE_DB_PATH

#loop in valid pathes
for var in $@
do
    if [ $var != $DBNAME ]
    then

        echo "working on Current path $var, ......find all files (c/cpp/cc/cxx/h/hxx/makefile/)  --->"

        find $var -name "*.c" -o -name "*.cpp" -o -name "*.cxx" -o -name "*.cc" -o -name "*.h" -o -name "*.hxx" -o -name "*.ini" -o -name "*file" >> cscope.files
    fi
done


echo "......start to cross reference --->"
cscope -Rbkq -i cscope.files

echo "......set ctags according to the cscope.files --->"
ctags -L cscope.files
cscope -ub -i cscope.files

echo "..................All set!"
