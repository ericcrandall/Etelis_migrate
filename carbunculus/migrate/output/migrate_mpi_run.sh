### Bash Script
#!
for r in */
	do
		cd $r
		echo $r
		date
		date > date.txt
			for m in */
			  do
				cd $m
				  date > date.txt
				  echo $m
				  date
				  mpirun --use-hwthread-cpus -np 80 ~/migrate-5.0.4/src/migrate-n-mpi parmfile
				  sleep 1
				cd ..
			  done
		cd ..
	done
