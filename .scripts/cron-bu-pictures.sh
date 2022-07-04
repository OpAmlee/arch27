#!/bin/bash
	
	#rsync -azz/home/trg/Pictures/ /mnt/abu/Pictures
	#this / makes sure the source is inside the folder not backing up the folder itself	
	
	# Backup description	
	#30 17 1 * * rsync -avzz (source)(destination)

rsync -azz /home/trg/Pictures/ /bu/Pictures
