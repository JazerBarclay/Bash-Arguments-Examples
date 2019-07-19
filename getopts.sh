#!/bin/bash

# A simple function called usage that will be run if
# the user fails to use the script correctly
usage() {
	# $0 gives you the command typed, not the first argument
	echo "Usage: $0 [-h] [-a <var1>] var2"
}

if [ $# -lt 1 ]
then
	usage
	exit 1
fi

# The 'a:' will allow the 'a' option to take a variable
# The 'h' has no colon in front so it is just a flag
# Note that the 'h' and catch-all '*' will default to just print
#   the usage and exit before running any code
# The command 'shift $((OPTIND -1))' will shift the input 
#   arguments 1 over to get to the final argument
while getopts "a:h" o; do case "${o}" in
	a) var1=${OPTARG} && shift $((OPTIND -1)) ;;
	h) usage && exit ;;
	*) usage && exit ;;
esac done

# Second test arguments now shifts are done for if there is a final argument 'var2'
if [ $# -eq 0 ]
then
	usage
	exit 1
fi

# Echo the variables if not 'h' or catch-all
echo "1: $var1"
echo "2: $@"