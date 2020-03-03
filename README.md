[![Build Status](https://travis-ci.org/haampie/StructuredGrids.jl.svg?branch=master)](https://travis-ci.org/haampie/StructuredGrids.jl)

# StructuredGrids.jl

Tiny package for lazy structured grids:

```julia
julia> using StructuredGrids

julia> g = grid(-2:2, 1:3)
5×3 StructuredGrid.Grid{Tuple{Int64,Int64},2,Tuple{UnitRange{Int64},UnitRange{Int64}}}:
 (-2, 1)  (-2, 2)  (-2, 3)
 (-1, 1)  (-1, 2)  (-1, 3)
 (0, 1)   (0, 2)   (0, 3) 
 (1, 1)   (1, 2)   (1, 3) 
 (2, 1)   (2, 2)   (2, 3)
 
 julia> g[2,2]
 (-1, 2)
```

It's more or less the same as `Iterators.product(-2:2, 1:3)`, but it allows indexing as well and subtypes `AbstractArray`.
