#!/bin/bash

# A simple function called usage that will be run if
# the user fails to use the script correctly
usage() {
	# $0 gives you the command typed, not the first argument
	echo "Usage: $0 [var1]"
}

# If the total inputs does not equal 1 then show usage and close
if [ $# -ne 1 ]
then
	usage
	exit 1
fi

# This secion will only run where the if function didnt exit
# Lets echo the input to the console with $1 for the first argument

echo $1
