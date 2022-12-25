function fibonacci!(n::Int64) 
    if n == 0 || n == 1
        return 1
    end
    return fibonacci!(n-1) + fibonacci!(n-2)
end

n = readline()
n = parse(Int64, n)
println(fibonacci!(n-1))