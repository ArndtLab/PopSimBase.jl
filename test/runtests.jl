using TestItems
using TestItemRunner
@run_package_tests  verbose = true




@testitem "Segemnts" begin
    s = Segments.Segment(1, 10)
    @test Segments.start(s) == 1
    @test Segments.stop(s) == 10
    @test Segments.segment_length(s) == 10
end



@testitem "SegItem" begin
    si = SegItem(Segment(1, 10), 3.14)
    @test start(si) == 1
    @test stop(si) == 10
    @test segment_length(si) == 10
    @test PopSimBase.data(si) == 3.14
end

@testitem "StationaryPopulation" begin
    genome_length = 1_000_000
    N = 1_001

    pop = StationaryPopulation(; genome_length, population_size = N)

    @test pop.genome_length == genome_length
    @test pop.population_size == N
    @test population_size(pop, 0.0) == N
    @test population_size(pop, 1.0) == N    
    @test population_size(pop) == N    
end

@testitem "VaryingPopulation" begin
    genome_length = 1_000_000
    Ts = [0.0, 120.0, 150.0]
    Ns = [2_000, 200, 1_000]
    pop = VaryingPopulation(; genome_length, population_sizes = Ns, times = Ts)

    @test pop.genome_length == genome_length
    @test pop.population_sizes == Ns
    @test pop.times == Ts

    @test population_size(pop, 0.0) == 2_000
    @test population_size(pop, 120.0) == 200
    @test population_size(pop, 150.0) == 1_000
    @test population_size(pop, 1.0) == 2_000
    @test population_size(pop, 100.0) == 2_000
    @test population_size(pop, 130.0) == 200
    @test population_size(pop, 1000.0) == 1_000

end

