#!/bin/bash

#/tmp/tmp.Nl0h01gjEa

TMPFILE=$(mktemp /tmp/foo-XXXXX)
echo "Hello world" >> $TMPFILE  # Append some text to the file
cat $TMPFILE                    # Print the contents of the file
rm $TMPFILE                     # Delete the file
