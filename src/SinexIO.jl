module SinexIO

export read_sinex, read_sinex_block

using Dates
include("sinex_contents.jl")
include("format_string.jl")
include("read_sinex.jl")

export time2datetime, sinexmat2mat
include("sinex_params.jl")

end # module
