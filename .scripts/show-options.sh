#!/usr/bin/bash

#options=$(cd /home/trg/x-rscync-dir2 && /bin/ls -a */ | cut -d " " -f 1 )

options=$(cd /home/trg/x-rscync-dir2 && /bin/exa --icons --all )

echo ${options}