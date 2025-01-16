module CoalescentTrees


export AbstractCoalescentTree, 
    SimpleCoalescentTree, CoalescentTree, 
    first_time, first_id, last_time, iscoalescent, time_span

abstract type AbstractCoalescentTree end


struct SimpleCoalescentTree <: AbstractCoalescentTree
    timespan::Float64
end

time_span(ct::SimpleCoalescentTree) = ct.timespan
iscoalescent(ct::SimpleCoalescentTree) = true


"""
    CoalescentTree{T}

A coalescent tree. Object of this type are returned by the IBDTreeIterator.
"""
struct CoalescentTree{T} <: AbstractCoalescentTree
    ids::Vector{Int64}
    first_id::Int64
    first_time::Float64
    last_time::Float64
    tree::T

    function CoalescentTree{T}(ids::Vector{Int64}, firstid::Int64, firsttime::Float64, lasttime::Float64, tree::T) where T
        new(ids, firstid, firsttime, lasttime, tree)
    end
end

CoalescentTree(ids::Vector{Int64}, first_id::Int64, first_time::Float64, last_time::Float64) = CoalescentTree{Nothing}(ids, first_id, first_time, last_time, nothing)

first_time(ct::CoalescentTree{T}) where {T} = ct.first_time
last_time(ct::CoalescentTree{T}) where {T} = ct.last_time
time_span(ct::CoalescentTree{T}) where {T} = last_time(ct) - first_time(ct)
first_id(ct::CoalescentTree{T}) where {T}   = ct.first_id
iscoalescent(ct::CoalescentTree{T}) where {T} = first_id(ct) > 0

Base.show(io::IO, ct::CoalescentTree{T}) where {T} = print(io, "CoalescentTree starting at $(ct.first_time) in $(ct.first_id) for $(length(ct.ids)) individuals")






struct MutatedSimpleCoalescentTree{M} <: AbstractCoalescentTree
    timespan::Float64
    mutated_length::Int64
    mutations::M
end

time_span(ct::MutatedSimpleCoalescentTree) = ct.timespan
iscoalescent(ct::MutatedSimpleCoalescentTree) = true





struct MutatedCoalescentTree{T,M} <: AbstractCoalescentTree
    ids::Vector{Int64}
    first_id::Int64
    first_time::Float64
    last_time::Float64
    tree::T
    mutated_length::Int64
    mutations::M
end

first_time(ct::MutatedCoalescentTree{T,M}) where {T,M} = ct.first_time
last_time(ct::MutatedCoalescentTree{T,M}) where {T,M} = ct.last_time
time_span(ct::MutatedCoalescentTree{T,M}) where {T,M} = last_time(ct) - first_time(ct)
first_id(ct::MutatedCoalescentTree{T,M}) where {T,M}   = ct.first_id
iscoalescent(ct::MutatedCoalescentTree{T,M}) where {T,M} = first_id(ct) > 0

Base.show(io::IO, ct::MutatedCoalescentTree{T,M}) where {T,M} = print(io, "MutatedCoalescentTree starting at $(ct.first_time) in $(ct.first_id) for $(length(ct.ids)) individuals")



end    # module CoalescentTrees

