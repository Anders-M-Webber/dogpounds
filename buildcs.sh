#!/bin/bash

####  @copyLeft  No Guaratee!!!

###created on 12-01-2015
## for general purpose

##### ctags does NOT support symbolic links, so we have to define multiple pathes
#this script is good for large project and you can define 
#different Source code pathes!!!

#######http://cscope.sourceforge.net/large_projects.html

# at least, need at least 3 parameters, "this_script" "code repositary pathes", the last is "database_name"
usage()
{
        echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> "
        echo " usage : $0  code_path_1 ... code_path_n cscope_db_name"
        echo " usage : MUST open file from cscope_db_name directory!!!"
        echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<\n"
}

# at least, need 3 parameter, "this_script" "path" "database_name"

if [ $# -lt 2 ]
then 
    echo "no correct code pathes defined, read usage !"
    usage
    exit
fi

DBNAME=${@: -1}  #the last parameter, at here it means the directory/path of the database will be created soon
CSCOPE_DB_PATH="$HOME/cscope/$DBNAME"


# main() start

echo "=============================================>"
echo " creating Cscope database - directory: $CSCOPE_DB_PATH"
echo "=============================================>"

if [! -d "$CSCOPE_DB_PATH" ];then
    #here force to create the directory if it is not exist
    echo "Creating $CSCOPE_DB_PATH ..."
    mkdir -p $CSCOPE_DB_PATH
fi

cd $CSCOPE_DB_PATH

#loop in valid pathes, $@ is all positional parameters, i.e., {$1,$2...}
for var in $@
do
    #do not search in the database directory
    if [ $var != $DBNAME ]
    then

        echo "working on Current path $var, ......find all files (c/cpp/cc/cxx/h/hxx/makefile/)  --->"
# -o means or
        find $var -name "*.c" -o -name "*.cpp" -o -name "*.cxx" -o -name "*.cc" -o -name "*.h" -o -name "*.hxx" -o -name "*.S" -o -name "*.s" -o -name "*.ini" -o -name "*file" >> cscope.files
    fi
done


echo "......start to cross reference --->"
cscope -Rbkq -i cscope.files

echo "......set ctags according to the cscope.files --->"
ctags -L cscope.files
cscope -ub -i cscope.files

echo "..................All set!"
