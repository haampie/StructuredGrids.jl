module StructuredGrids

import Base: axes, getindex, size

using Base: tail, @propagate_inbounds

export grid

struct Grid{T,N,RT} <: AbstractArray{T,N}
    ranges::RT
end

@inline eltypes(::Tuple{}) = ()
@inline eltypes(ranges) = (eltype(first(ranges)), eltypes(tail(ranges))...)

@inline _axes(::Tuple{}) = ()
@inline _axes(ranges) = (axes(first(ranges), 1), _axes(tail(ranges))...)
@inline axes(g::Grid) = _axes(g.ranges)

@inline _size(::Tuple{}) = ()
@inline _size(ranges) = (size(first(ranges), 1), _size(tail(ranges))...)
@inline size(g::Grid) = _size(g.ranges)


_getindex(::Tuple{}, ::Any) = ()
@propagate_inbounds _getindex(ranges, I) = (first(ranges)[first(I)], _getindex(tail(ranges), tail(I))...)
@propagate_inbounds getindex(g::Grid, I::Vararg{Int,N}) where {N} = _getindex(g.ranges, I)

grid(ranges::Vararg{Any,N}) where {N} = Grid{Tuple{eltypes(ranges)...},N,typeof(ranges)}(ranges)

end # module
