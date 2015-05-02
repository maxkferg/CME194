# Cannon.jl

A simple matrix multiplication algorithim that can be used to multiple
a matrix across multiple processors using MPI.

## Setup
Cannon.jl is written in Julia, using the MPI bindings. The MPI 
bindings can be installed as follows:

```sh
julia
julia> Pkg.update()
julia> Pkg.add("MPI")
```


## Running Cannon.jl

cannon.jl is a julia file containing the function cannonMultiply(A,B).
Example usage of cannonMultiply(A,B) is shown in cannon_examples.jl. In theory, the examples can be directly executed directly by Julia. However, the script will hang if it is only run with one processor. The correct
way to run the script is: 

```sh
# The number of processors must be q^2
mpirun -np 4 julia cannonExamples.jl
mpirun -np 9 julia cannonExamples.jl
mpirun -np 16 julia cannonExamples.jl
```

## Running on the corn cluster
This repository also includes bitonic.sh which can be used to
submit bitonic to the corn cluster:

```sh
qsub cannon.sh

# Unfriendly output
qstat -f -u '*'

# Friendly output
/farmshare/user_data/chekh/qmem/qmem -u 
```

## Limitations
The limitations of this sorting algorithm are:
 1. The number of processors must be q^2
 2. The processors will be arranged in a qxq grid
 3. The A matrices on each processor must be the same size
 4. The B matrices on each processor must be the same size
 5. The A and B matrices must have dimensions such that Csub = Asub*Bsub is valid

However, the code is written in a way that these limitations could easily
be overcome with some careful consideration