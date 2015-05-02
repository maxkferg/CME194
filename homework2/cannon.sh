# declare a name for this job to be sample_job
#PBS -N cannon.jl; 
# request the queue (enter the possible names, if omitted, serial is the default)
#PBS -q serial     
# request 1 node
#PBS -l nodes=9
# request 4 hours and 30 minutes of cpu time
#PBS -l cput=00:10:00        
# mail is sent to you when the job starts and when it terminates or aborts
#PBS -m bea
# specify your email address
#PBS -M maxferg@stanford.edu
# By default, PBS scripts execute in your home directory, not the 
# directory from which they were submitted. The following line 
# places you in the directory from which the job was submitted.  
cd $PBS_O_WORKDIR

# run the program
mpirun -n 64 julia cannon.jl
exit 0