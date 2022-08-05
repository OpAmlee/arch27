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
##    yad --text-info --back=#282c34 --fore=#46d9ff --geometry=1200x800


    sed -n '/START_KEYS/,/END_KEYS/p' ~/.config/ranger/rc.conf | \
	    grep -e '{ ' \
    	-e '\[ (' | \
    	

sed -e 's/^[ \t]*//' \
    -e 's/, (/(/' \
    -e 's/\[ (/(/' \
    -e 's/-- KB_GROUP /\n/' \
    -e 's/", /"\t: /' | \



        yad --text-info --back=#02010F --no-buttons --fore=#B5B3A5 --geometry=1000x760
