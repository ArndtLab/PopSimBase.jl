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

