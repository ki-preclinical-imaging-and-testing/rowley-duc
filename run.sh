#!/bin/bash
home=/usr/local/share/rowley-duc
archive=$home/archive
mountpt=/mnt/rowley
ducdb=$home/.rowley.db
fbkp=$archive/`date +%F_%H-%M-%S`.db
fout=$archive/`date +%F_%H-%M-%S`.out

if grep -qs "${mountpt} " /proc/mounts
then
	echo "Start: `date`" >> $fout 
	time duc index $mountpt -vp -d $ducdb >> $fout
	echo "End: `date`" >> $fout 
	cp --preserve $ducdb $fbkp
else
    echo "ERROR: Rowley not mounted at $mountpt." >> $fout
    echo "       Test connection before rerun." >> $fout
fi
