#!/usr/bin/env bash
#set -euo pipefail


#sed -n '/START_KEYS/,/END_KEYS/p' ~/.config/dusk/config.def.h | \
#    grep -e '{ KeyPress,' \
#    -e '\[ (' \
#    -e 'KB_GROUP' | \
#    grep -v '\-\- , ("' | \
#    sed -e 's/^[ \t]*//' \
#    -e 's/, (/(/' \
#    -e 's/\[ (/(/' \
#    -e 's/-- KB_GROUP /\n/' \
#    -e 's/", /"\t: /' | \
##    yad --text-info --back=#02010F --fore=#DDDDDD --geometry=800x600


    sed -n '/START_KEYS/,/END_KEYS/p' ~/.config/dusk/config.def.h | \
	    grep -e '{ ' \
    	-e '\[ (' | \
    	

sed -e 's/^[ \t]*//' \
    -e 's/, (/(/' \
    -e 's/\[ (/(/' \
    -e 's/-- KB_GROUP /\n/' \
    -e 's/", /"\t: /' | \



        yad --text-info --back=#02010F --fore=#DDDDDD --geometry=800x600 --no-buttons
