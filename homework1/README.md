# Bitonic.jl

A simple sorting algorithim that can be used to sort
vectors across multiple processors using MPI.

## Setup
Bitonic.jl is written in Julia, using the MPI bindings. The MPI 
bindings can be installed as follows:

```sh
julia
julia> Pkg.update()
julia> Pkg.add("MPI")
```


## Running Bitonic.jl

bitonic.jl is a julia script. In theory it can be executed directly by Julia.
However, the script will hang if it is only run with one processor. The correct
way to run the script is: 

```sh
mpirun -np 4 julia bitonic.jl
```

## Running on the corn cluster
This repository also includes bitonic.sh which can be used to
submit bitonic to the corn cluster:

```sh
qsub bitonic.sh

# Unfriendly output
qstat -f -u '*'

# Friendly output
/farmshare/user_data/chekh/qmem/qmem -u 
```

## Limitations
The limitations of this sorting algorithm are:
 1. The number of processors must be 2^n.
 2. The number of values on each processor must be equal.
 
However, the code is written in a way that these limitations could easily
be overcome with some careful consideration