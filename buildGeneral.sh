#!/bin/bash

###created on 12-01-2015
## for general purpose

##### ctags does NOT support symbolic links, so we have to define multiple pathes
#this script is good for large project and you can define 
#different Source code pathes!!!

#######http://cscope.sourceforge.net/large_projects.html

usage()
{
	echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> "
	echo " usage : sudo $0  path_1 ... path_n cscope_db_name"
	echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<\n"
}

# at least, need 3 parameter, script - souce code path - database_name (not absolute path, folder name only)
if [ $# -lt 2 ]
then 
	echo "no path defined, read usage !"
    usage
    exit
fi

DBNAME=${@: -1}  #the last parameter
CSCOPE_DB_PATH=$HOME/cscope/$DBNAME

# main() start

echo "=============================================>"
echo " creating Cscope database - directory: $CSCOPE_DB_PATH"
echo "=============================================>"

mkdir -p $CSCOPE_DB_PATH
cd $CSCOPE_DB_PATH

#loop in valid pathes
for var in $@
do
	if [ $var != $DBNAME ]
	then

		echo "working on Current path $var, ......find assembly files  --->"
		find $var -name "*.s"  -o -name "*.S" -o -name "*.asm" -o -name "*.ASM" >> cscope.files

		echo "......find c/cpp/cc/cxx but no .c++ --->"
		find $var -name "*.c" -o -name "*.C" -o -name "*.cpp" -o -name "*.cxx" -o -name "*.cc" >> cscope.files

		echo "......find header files h/hxx/hpp --->"
		find $var -name "*.h" -o -name "*.hxx" -o -name "*.hpp"  >> cscope.files

		echo "......find makefiles  --->"
		find $var -name "Makefile" -o -name "makefile" -o -name "GNUmakefile" >> cscope.files

		echo "......find all other files (ini)  --->"
		find $var -name "*.ini" -o -name "*.cu" >> cscope.files
    
    echo " ... maybe you need Java files ? NOT TESTED YET !!!---->"
    find $var -name "*.java" >> cscope.files
	fi
done


echo "......start doing cross reference --->"
cscope -Rbkq -i cscope.files

echo "......set ctags --->"
ctags -L cscope.files
cscope -ub -i cscope.files

echo "All set!"
