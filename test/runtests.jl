using TestItems
using TestItemRunner
@run_package_tests  verbose = true



@testitem "StationaryPopulation" begin
    genome_length = 1_000_000

    pop = StationaryPopulation(; genome_length)

    @test pop.genome_length == genome_length
end

@testitem "VaryingPopulation" begin
    genome_length = 1_000_000
    Ts = [0.0, 1.0, 2.0]
    Ns = [1_000, 1_000, 1_000]
    pop = VaryingPopulation(; genome_length, population_sizes = Ns, times = Ts)

    @test pop.genome_length == genome_length
    @test pop.population_sizes == Ns
    @test pop.times == Ts
end

