function time2datetime(str)
    yy, ddd, sssss = parse.(Int, split(str, ':'))
    return DateTime(yy <= 50 ? 2000 + yy : 1900 + yy) + Day(ddd - 1) + Second(sssss)
end

function sinexmat2mat(mat)
    imax = parse(Int, mat[end, 1])
    ret = zeros(imax, imax)

    for row in eachrow(mat)
        i = parse(Int, row[1])
        j = parse(Int, row[2])

        for k in 1:3
            isempty(row[k+2]) && continue
            ret[i, j+k-1] = parse(Float64, row[k+2])
        end
    end
    return ret
end