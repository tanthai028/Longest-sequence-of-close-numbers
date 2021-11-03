#!/bin/bash

##########################################
#         HOW TO RUN THIS SCRIPT         #
#                                        #
# 1) Give it permission to execute:      #
# $ chmod u+x script.sh                  #
#                                        #
# 2) Run it for your solution:           #
# $ ./script.sh path/to/file.c           #
#                                        #
# 3) Parameter must be a source code     #
#    file, not an executable. Please     #
#    provide the path to the file if it  #
#    is not located in the current       #
#    directory. Example:                 #
# $ ./script.sh ~/cop3514/project4.c     #
#                                        #
##########################################

# check if filename was provided
if [[ $1 == "" ]]; then
	echo "Please specify the source code file as a parameter:"
	echo "./script.sh path/to/file.c"
	exit 0
fi

# try to compile the source code
echo -e "Compilation log:"
gcc -Wall -std=c99 $1

if (($? != 0 )); then
	echo -e "\nCompilation error! Aborting..."
	exit 0
else
	echo -e "\nCompilation successful!"
fi

# run executable for all test cases
echo -e "\nTesting log:"
for i in {1..10}; do
	./a.out < input/$i.txt > tmp
	# check if result matches the expected output exactly
	if [[ $(diff tmp output/$i.txt) == "" ]]; then
		echo -e "\nTEST #$i: Result OK / Formatting OK"
	# check if result matches the expected output after removing whitespaces
	elif [[ $(diff <(tr -d ' \n\t' < tmp) <(tr -d ' \n\t' < output/$i.txt)) == "" ]]; then
		echo -e "\nTEST #$i: Result OK / Formatting FAIL"
		# print differences
		echo "==========================="
		echo "Expected:"
		echo "---------------------------"
		cat output/$i.txt
		echo "==========================="
		echo "Your result:"
		echo "---------------------------"
		cat tmp
		echo "==========================="
	# print differences if result does not match the expected output
	else
		echo -e "\nTEST #$i: Result FAIL"
		echo "==========================="
		echo "Expected:"
		echo "---------------------------"
		cat output/$i.txt
		echo "==========================="
		echo "Your result:"
		echo "---------------------------"
		cat tmp
		echo "==========================="
	fi
done

# clean folder by removing temporary files
rm -f tmp a.out

