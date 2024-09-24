module Segmentals

export Segmental, start, stop, data, segment_length,
    AbstractSegmentalsIterator

struct Segmental{C,D}
    chrom::C
    start::Int64
    stop::Int64
    data::D
end

Segmental(start::Int64, stop::Int64, data::D) where {D} =
    Segmental{Nothing,D}(nothing, start, stop, data)

    

chrom(s::Segmental) = s.chrom
start(s::Segmental) = s.start
stop(s::Segmental) = s.stop
data(s::Segmental) = s.data
segment_length(s::Segmental) = s.stop - s.start + 1


abstract type AbstractSegmentalsIterator end

end    # module Segmentals
