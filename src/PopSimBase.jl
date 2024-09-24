module PopSimBase

using Reexport

export Segmentals, Populations, CoalescentTrees


include("Segmentals.jl")
include("Populations.jl")
include("CoalescentTrees.jl")

@reexport using .Populations
# @reexport using .Segmentals


end
