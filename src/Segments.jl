module Segments

using Lazy

export Segment, start, stop, segment_length, 
    SegItem, data

struct Segment{T}
    start::T
    stop::T
end

start(s::Segment) = s.start
stop(s::Segment) = s.stop
segment_length(s::Segment) = s.stop - s.start + 1




struct SegItem{T, D}
    seg::Segment{T}
    data::D
end


@forward SegItem.seg   (start, stop, segment_length)
data(si::SegItem) = si.data


end    # module Segments
