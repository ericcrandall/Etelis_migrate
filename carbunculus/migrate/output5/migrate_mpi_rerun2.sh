### Bash Script
#!
for r in */
	do
	 echo starting $r at $(date ) >> progress_rerun2.txt
         cd $r
		echo $r
		date
		echo starting $r at $(date ) >> progress_rerun2.txt
			for m in */
			  do
			  echo starting $m at $(date )>> progress_rerun2.txt
				cd $m
				  date > date_rerun2.txt
				  echo $m
				  date
				  # copy the parmfile to parmfile_rerun, and replace the following 3 lines
				  cp parmfile parmfile_rerun
				  rm *.pdf
				  sed -i 's/recover=NO/recover=YES/g' parmfile_rerun
				  sed -i 's/outfile=outfile.txt/outfile=outfile_rerun3.txt/g' parmfile_rerun
				  sed -i 's/pdf-outfile=outfile.pdf/pdf-outfile=NO/g' parmfile_rerun
				  sed -i 's/bayes-posteriorbins= 3000 3000/bayes-posteriorbins= 16384 16384/g' parmfile_rerun
				  sed -i 's/bayes-priors= MIG WEXPPRIOR: 0.0100 10000.000000 100000000 10000/bayes-priors= MIG WEXPPRIOR: 0.0100 10000.000000 100000 10000/g' parmfile_rerun
				  mpirun --use-hwthread-cpus -np 90 ~/migrate-5.0.4/src/migrate-n-mpi parmfile_rerun
				  sleep 1
				cd ..
			  done
		cd ..
	done
