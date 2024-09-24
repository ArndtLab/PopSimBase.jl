module PopSimBase

using Reexport

export Segmentals, Populations, CoalescentTrees, AbstractSegmentalsIterator


include("Segmentals.jl")
include("Populations.jl")
include("CoalescentTrees.jl")


abstract type AbstractSegmentalsIterator end


@reexport using .Populations
@reexport using .Segmentals


end
