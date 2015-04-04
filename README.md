# CME 194
Introduction to parallel computing using MPI
## Installing MPI and Julia on Mac OSX
With homebrew we can run 
```sh
brew install mpich
brew install --HEAD julia
brew install cmake

# Make Julia available in the terminal
sudo ln -s /Applications/Julia.app/Contents/Resources/julia/bin/julia /usr/bin/julia
```
And then install the MPI bindings for Julia. As Julia 0.4 is on the bleeding edge we need to use the github version of Julia-MPI
```sh
julia
julia> Pkg.update()
julia> Pkg.clone("https://github.com/JuliaParallel/MPI.jl.git")
julia> Pkg.build()
```

## Logging into Stanford Corn cluster
```sh
ssh username@corn.stanford.edu
```

## Running Julia scripts with MPI

To run a Julia script with MPI, first make sure that using MPI or import MPI is included at the top of your script. You should then be able to run the MPI job as expected, e.g., with

```sh
mpirun -np 3 julia hello.jl
```

