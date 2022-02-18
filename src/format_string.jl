function fmt2regex(fmt::AbstractString)
    ret = mapreduce(*, split(fmt, ',')) do str
        # X
        m = match(r"(?<len>\d+)X", str)
        if !(isnothing(m))
            return repeat(' ', parse(Int, m["len"]))
        end

        # H
        m = match(r"(?<len>\d+)H(?<con>.*)", str)
        if !(isnothing(m))
            return m["con"][1:parse(Int, m["len"])]
        end

        # A,I,F,E
        m = match(r"[AIFE](?<len>\d+)", str)
        if !(isnothing(m))
            return ".{$(parse(Int, m["len"]))}"
        end
    end
end

function expand_fmt(fmt::AbstractString)
    ket = findfirst(')', fmt)

    if isnothing(ket)
        return fmt
    end

    bra = findprev('(', fmt, ket)
    m = match(r"(?<pre>.*)(?<len>\d+)\($", fmt[1:bra])

    if isnothing(m)
        return fmt[bra+1:ket-1]
    end

    fmt = m["pre"] * join(repeat([fmt[bra+1:ket-1]], parse(Int, m["len"])), ',') * fmt[ket+1:end]
    expand_fmt(fmt)
end

function fmtlist2regex(list)
    mapreduce(*, enumerate(eachrow(list))) do (i, row)
        key = "$(i)_" * replace(row[1], ' ' => '_', '-' => '_')
        key = key[1:min(27, length(key))]
        rx = row[2] |> expand_fmt |> fmt2regex
        "(?<P$(i)_$(key)>$rx)"
    end
end

function fmtlist2indices(list)
    lengths = map(eachrow(list)) do row
        fmt = row[2] |> expand_fmt

        ret = mapreduce(+, split(fmt, ',')) do str
            # X
            m = match(r"(?<len>\d+)X", str)
            if !(isnothing(m))
                return parse(Int, m["len"])
            end

            # H
            m = match(r"(?<len>\d+)H(?<con>.*)", str)
            if !(isnothing(m))
                return parse(Int, m["len"])
            end

            # A,I,F,E
            m = match(r"[AIFE](?<len>\d+)", str)
            if !(isnothing(m))
                return parse(Int, m["len"])
            end
        end
    end |> cumsum

    indices = map(1:length(lengths)) do i
        if i == 1
            1:lengths[i]
        else
            lengths[i-1]+1:lengths[i]
        end
    end
    return indices
end