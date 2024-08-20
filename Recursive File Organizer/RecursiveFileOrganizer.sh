#! /bin/bash

# Get the current username.
username=$(whoami)

# Change directory to the user's home directory.
cd /home

# Prompt the user to decide whether to use default folder names or customize them.
echo "Do you want the chosen folders(bin, lib, src, inc)? (Y/N): "; read answer
answer1="Y"
answer2="N"

# Check user's response.
if [ "$answer" == "$answer1" ];
then
	
	# If the user chose "Y" meaning "Yes", create default directories.
	mkdir ~/bin
	mkdir ~/lib
	mkdir ~/src
	mkdir ~/inc

	# Set the paths to the newly created directories.
	Pathtobin=/home/$username/bin
	Pathtolib=/home/$username/lib
	Pathtosrc=/home/$username/src
	Pathtoinc=/home/$username/inc

elif [ "$answer" == "$answer2" ];
then

	# If the user chose "N" meaning "No", prompt for custom directory names.
	echo "Give name for executable's folder: "; read exename
	mkdir /home/$username/$exename
	Pathtobin=/home/$username/$exename
	echo "Give name for lib folder: "; read libname
	mkdir /home/$username/$libname
	Pathtolib=/home/$username/$libname
	echo "Give name for src folder: "; read srcname
	mkdir /home/$username/$srcname
	Pathtosrc=/home/$username/$srcname
	echo "Give name for inc folder: "; read incname
	mkdir /home/$username/$incname
	Pathtoinc=/home/$username/$incname
fi



# Method to check if the files being moved already exist in the destination directories (This function is not used).
checkEquality()
{

# Check for existing executable files in the 'bin' directory.
cd $Pathtobin
	for j in *; do
		if [ "$j" == "arg1" ]; then
			echo "Executable exists!"
		fi
	done

# Check for existing library files in the 'lib' directory.
cd $Pathtolib
	for j in *; do
		if [ "$j" == "arg1" ]; then
			echo "Lib file exists!"
		fi
	done

# Check for existing source files in the 'src' directory.
cd $Pathtosrc
	for j in *; do
		if [ "$j" == "arg1" ]; then
			echo "C or Cpp file exists!"
		fi
	done

# Check for existing header files in the 'inc' directory.
cd $Pathtoinc
	for j in *; do
		if [ "$j" == "arg1" ]; then
			echo "Header file exists!"
		fi
	done

}

# Change directory to the user's desktop.
cd /home/$username/Desktop

# Initialize counters for each file type to track the number of moved files.
exemv=0
libmv=0
srcmv=0
incmv=0

# Method to move the files to the appropriate directories based on their type.
Collect()
{
cd $p                                   			# $p = argument directory
local arg1=$PWD										# Store the current directory path.
echo $arg1				  							# /home/$username/Desktop/argumentdir --> First path before recursion (This path will always change recursively).

	# Loop through each item in the directory.
	for arg1 in *; do

		# Check if the item is an executable (contains "exe" in the name).
		if [[ "$arg1" == *"exe"* ]]; then
			#checkEquality $arg1
			mv "$arg1" "$Pathtobin"					# Move the executable to the bin directory.
			((exemv++))								# Increment the executable move counter.
		fi

		# Check if the item is a library file (contains "lib" in the name).
		if [[ "$arg1" == *"lib"* ]]; then
			mv "$arg1" "$Pathtolib"					# Move the library file to the lib directory.
			#checkEquality $arg1
			((libmv++))								# Increment the library move counter.
		fi

		# Check if the item is a C source file (.c extension).
		if [[ "$arg1" == *".c"* ]]; then
			mv "$arg1" "$Pathtosrc"					# Move the source file to the src directory.
			#checkEquality $arg1
			((srcmv++))								# Increment the source file move counter.
		fi

		# Check if the item is a header file (.h extension).
		if [[ "$arg1" == *".h"* ]]; then
			mv "$arg1" "$Pathtoinc"					# Move the header file to the inc directory.
			#checkEquality $arg1
			((incmv++))								# Increment the header file move counter.
		fi

		# Check if the item is a directory (to handle nested directories).
		if [ -d "$arg1" ]; then
			#echo $arg1     						# First argument directory subdirectory.

			# If it's a directory, set '$p' to the new directory and recursively call 'Collect()'.
			p=$arg1
			Collect $arg1
			#/home/$username/Desktop/argumentdir/argumentdir2

		fi
	done
}

# Loop through all the arguments passed to the script and call 'Collect()' on each.
for i in $@; do										# '$@' For all arguments given when running the program
	p=$i
	Collect $p
done

# If no arguments are provided, as a default use the 'testfiles' directory on the desktop and call 'Collect()' on that.
if [ $# -eq 0 ]; then								# If zero arguments are given then take "testfiles" directory
	p=/home/$username/Desktop/testfiles
	Collect $p
fi

# For every type of file, print the number of files moved to each directory.
echo "Executable files moved: " $exemv
echo "Lib files moved: " $libmv
echo "Source files moved: " $srcmv
echo "Header files moved: " $incmv
