module PopSimBase

using Reexport
using Lazy


export Segments, Populations, CoalescentTrees, AbstractSegmentsIterator, SegItem


include("Segments.jl")
include("Populations.jl")
include("CoalescentTrees.jl")


abstract type AbstractSegmentsIterator end

@reexport using .Populations
@reexport using .Segments


end
