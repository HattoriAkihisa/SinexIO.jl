# for block in ["HEADER", "FILE/REFERENCE", "FILE/COMMENT"]
for block0 in vcat("HEADER", split(defined_blocks_str, '\n', keepempty = false))
    blocks = split(block0)
    block = blocks[1]
    block_slash2us = replace(block, "/" => "_")

    @eval begin
        list = $(Symbol("List_" * block_slash2us))
        $(Symbol("indices_" * block_slash2us)) = fmtlist2indices(list)
        @inline function $(Symbol("read_line_" * block_slash2us))(line)
            str = rpad(line, 80)
            return map(i -> strip(str[i]), $(Symbol("indices_" * block_slash2us)))
        end

        function $(Symbol("read_block_" * block_slash2us))(io)
            end_line = "-$($block)"
            comments_lines = []
            data_lines = []
            i = 0
            while !eof(io)
                i += 1
                line = readline(io)
                if occursin(Regex(end_line), line)
                    break
                elseif line[1] in ['*', '#']
                    push!(comments_lines, line)
                else
                    data_line = $(Symbol("read_line_" * block_slash2us))(line)
                    push!(data_lines, data_line)
                end
            end
            return hcat(data_lines...) |> permutedims, comments_lines
        end
        
        read_block(::Val{Symbol($block0)}, io) = $(Symbol("read_block_" * block_slash2us))(io)
    end

    if length(blocks) != 1
        for (p, type) in Iterators.product(p_list, type_list)
            block1 = replace(block0, "{p}" => p, "{type}" => type)
            block2 = replace(block1, "/" => "_", " " => "_")
            if @eval @isdefined $(Symbol("read_block_" * block2))
                continue
            end
            @eval begin
                $(Symbol("read_block_" * block2))(io) = $(Symbol("read_block_" * block_slash2us))(io)
                read_block(::Val{Symbol($block1)}, io) = $(Symbol("read_block_" * block_slash2us))(io)
            end
        end
    end
end

function read_sinex(file)
    ret = Dict()
    open(file, "r") do io
        # Header line
        line = readline(io)
        dat = read_line_HEADER(line)
        ret["HEADER"] = dat

        while !eof(io)
            line = readline(io)
            if line[1] == '*'
                continue
            elseif line[1] == '+'
                block = strip(line[2:end])
                dat = read_block(Val(Symbol(block)), io)
                ret[block] = dat
            elseif occursin("%ENDSNX", line)
                return ret
            end
        end
    end

    return ret
end

function read_sinex_block(file, block)
    ret = Dict()
    open(file, "r") do io
        # Header line
        line = readline(io)
        dat = read_line_HEADER(line)
        ret["HEADER"] = dat

        while !eof(io)
            line = readline(io)
            if line[1] == '*'
                continue
            elseif line[1] == '+'
                b = strip(line[2:end])
                if b == block
                    dat = read_block(Val(Symbol(block)), io)
                    ret[b] = dat
                    return ret
                else
                    while !eof(io)
                        line = readline(io)
                        if occursin(Regex("^-$b"), line)
                            break
                        end
                    end
                end
            elseif occursin("%ENDSNX", line)
                return ret
            end
        end
    end

    return ret
end