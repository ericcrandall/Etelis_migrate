### Bash Script
#!
for r in */
	do
		cd $r
		echo $r
		date
		date > progress.txt
			for m in */
			  do
			  echo starting $m at $(date )>> progress.txt
				cd $m
				  date > date.txt
				  echo $m
				  date
				  mpirun --use-hwthread-cpus -np 120 ~/migrate-5.0.4/src/migrate-n-mpi parmfile
				  sleep 1
				cd ..
			  done
		cd ..
	done
