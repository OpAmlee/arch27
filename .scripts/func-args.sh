#!/bin/bash
die(){
	local m="$1"  # the first arg 
	local e=$2    # the second arg
	echo "$m" 
	exit $e
}

# if not enough args displayed, display an error and die
[ $# -eq 0 ] && die "Usage: $0 filename" 1

# Rest of script goes here
echo "We can start working the script..."
