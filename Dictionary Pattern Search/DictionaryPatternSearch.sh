#! /bin/bash

# Check if the number of arguments provided is exactly one.
# The script expects only one argument, which is the path to the dictionary file.
if [ $# -ne 1 ]; then
	echo "You must use only one argument, try again"
	exit 1
fi

# Makes sure the 'results' directory will be created in 'Desktop' for every user.
name=$(whoami)
cd /home/$name/Desktop

mkdir results

# Verify if the 'results' directory was successfully created and if not we create it.
file=/home/$name/Desktop/results
if [ -d "$file" ]; then
	echo ""									# Directory exists, no action needed.
else
	mkdir results							# Create the directory if it doesn't exist.
fi

# Define three arrays with different sets of words.
set1=( he she it they )
set2=( is was were )
set3=( a to the there )

# Compile the C program (word_search.c) to create the executable 'a.out'.
gcc word_search.c
cd results

# Set the path to the dictionary file provided as an argument.
dictionaryPath=/home/$name/Desktop/$1

# Initialize counters for the total number of generated files,
# the number of non-empty files, and the number of empty files.
generfiles=0
notempty=0
empty=0

# Generate all possible combinations of words from the three arrays and creating txt files inside 'results' 
# directory to hold the outcomes.
# Each text file contains the output of running the C program with the word combination.
for (( i=0; i<4; i=i+1 )); do
	word1=${set1[$i]}						# First word from set1.
	for (( j=0; j<3; j=j+1 )); do
		word2=${set2[$j]}					# Second word from set2.
		for (( w=0; w<4; w=w+1 )); do
			word3=${set3[$w]}				# Third word from set3.

			# We run the compiled C program with the dictionary path and the three words as arguments and we
            # store the output in a text file named 'out_word1_word2_word3.txt'.
			echo $(.././a.out $dictionaryPath $word1 $word2 $word3) > out_"$word1"_"$word2"_"$word3".txt
			
			# This code below checks the exit status of the C program.
			#if [ $? -gt 0 ]; then
			#	exit $?
			#fi

			# Increment the total number of generated files.
			((generfiles++))

			# Check if the generated text file is empty or not.
			string=$( cat out_"$word1"_"$word2"_"$word3".txt)
			if [ -n "$string" ]; then
				((notempty++))				# Increment the counter for non-empty files.
			else
				((empty++))					# Increment the counter for empty files.
			fi
		done
	done
done

# Print the summary of the number of generated, non-empty, and empty files.
echo "Total number of generated files: " $generfiles
echo "Total number of not empty files: " $notempty
echo "Total number of empty files: " $empty
