function convert_txttalbe2list(lines)
    sub_lines = []
    tmp = []
    for i in 1:length(lines)
        if occursin("_____", lines[i])
            push!(sub_lines, copy(tmp))
            tmp = []
        else
            push!(tmp, lines[i])
        end
    end
    
    keyfmt = mapreduce(vcat, sub_lines) do ll
        mat = mapreduce(l -> split(l, '|') |> permutedims, vcat, ll)
        key = replace(strip(join(strip.(mat[:,2]), ' ')), "- "=>"", "["=>"","]"=>"")
        fmt = strip(join(strip.(mat[:,4])))
        return [key fmt]
    end
    
    # println("[")
    foreach(eachrow(keyfmt)) do kf
        @printf "   %-30s %-30s\n" "\""*kf[1]*"\"" "\""*kf[2]*"\""
        #  println("    [\"", kf[1], "\", \"", kf[2], "\"],")
    end
    println("]")

    return keyfmt
end

function print_table(f)
    key = ""
    open(f, "r") do io
        while !eof(io)
            line = readline(io)
            if occursin(r"^\d+.*", line)
                println("# ", line)
                key = line
            elseif occursin("|__Field_________|______Description__________________|___Format_____|", line)
                lines = readuntil(io, "                                                           |              |")
                println("List_" * replace(split(key)[2], "/"=>"_"), " = [")
                convert_txttalbe2list(split(lines, '\n'))
                println()
            end
        end
    end
end