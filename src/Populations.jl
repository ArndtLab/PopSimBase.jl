module Populations

export StationaryPopulation, VaryingPopulation, genome_length, population_size

struct StationaryPopulation
    ploidy::Int
    genome_length::Int
    recombination_rate::Float64
    mutation_rate::Float64
    population_size::Int
end





"""
    StationaryPopulation(; ploidy = 2, population_size = 1_000, genome_length = 1_000_000,
    recombination_rate = 1.0e-8, mutation_rate = 1.0e-8)

Create a stationary population with the given parameters.

# Arguments
- `ploidy::Int`: The ploidy of the population. Default is 2.
- `population_size::Int`: The size of the population. Default is 1_000.
- `genome_length::Int`: The length of the genome. Default is 1_000_000.
- `recombination_rate::Float64`: The recombination rate. Default is 1.0e-8.
- `mutation_rate::Float64`: The mutation rate. Default is 1.0e-8.
"""
function StationaryPopulation(;
        ploidy = 2,
        population_size = 1_000,
        genome_length = 1_000_000,
        recombination_rate = 1.0e-8,
        mutation_rate = 1.0e-8
    )
    StationaryPopulation(ploidy, genome_length, recombination_rate, mutation_rate, population_size)
end

genome_length(pop::StationaryPopulation) = pop.genome_length

population_size(pop::StationaryPopulation, t::T = 0) where {T <: Real} = pop.population_size


struct VaryingPopulation
    ploidy::Int
    genome_length::Int
    recombination_rate::Float64
    mutation_rate::Float64

    population_sizes::Vector{Int}
    times::Vector{Float64}
end


"""
    VaryingPopulation(; ploidy = 2, population_sizes = [1_000], times = [0.0],
    genome_length = 1_000_000, recombination_rate = 1.0e-8, mutation_rate = 1.0e-8)
Create a varying population with the given parameters.
# Arguments
- `ploidy::Int`: The ploidy of the population. Default is 2.
- `genome_length::Int`: The length of the genome. Default is 1_000_000.
- `recombination_rate::Float64`: The recombination rate. Default is 1.0e-8.
- `mutation_rate::Float64`: The mutation rate. Default is 1.0e-8.
- `population_sizes::Vector{Int}`: The sizes of the population at different times. Default is [1_000].
- `times::Vector{Float64}`: The times at which the population sizes are specified. Default is [0.0].

# Notes
- The population sizes and times must have the same length.
- The times must be sorted in ascending order.
- The first time must be 0.0.

# Example
To model a population which starts at N=1000, goes throw a bottleneck (N=200) 
from 150 genertions ago to 120 generations ago and then recovers to N=2000 individuals, 
you can use the following:

```julia
times = [0.0, 120.0, 150.0]
population_sizes = [2000, 200, 1000]
```
"""
function VaryingPopulation(;
        ploidy = 2,
        population_sizes = [1_000],
        times = [0.0],
        genome_length = 1_000_000,
        recombination_rate = 1.0e-8,
        mutation_rate = 1.0e-8
    )
    if length(population_sizes) != length(times)
        throw(ArgumentError("population_sizes and times must have the same length"))
    end
    if !issorted(times)
        throw(ArgumentError("times must be sorted"))
    end
    if times[1] != 0.0
        throw(ArgumentError("times must start at 0.0"))
    end
    VaryingPopulation(ploidy, genome_length, recombination_rate, mutation_rate, population_sizes, times)
end

genome_length(pop::VaryingPopulation) = pop.genome_length

function population_size(pop::VaryingPopulation, t::T = 0) where {T <: Real}
    epoch = findlast(t .>= pop.times)
    if isnothing(epoch)
        throw(ArgumentError("t is before the first time"))
    end
    return pop.population_sizes[epoch]
end

end    # module Populations
