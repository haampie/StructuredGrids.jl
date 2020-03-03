using Test

using StructuredGrids

@test eltype(grid(1:10)) == Tuple{Int}
@test eltype(grid(1:10, 1.0:10.0)) == Tuple{Int, Float64}
@test size(grid(1:10, 1:10)) == (10, 10)
@test axes(grid(1:10, 1:10)) == (Base.OneTo(10), Base.OneTo(10))
@test all(grid(1:10, 2:5) .== Iterators.product(1:10, 2:5))
@test grid(1:10, 3:5)[1, 1] == (1, 3)
@test grid(1:10, 3:5)[10, 3] == (10, 5)
