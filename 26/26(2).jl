n = readline()
n = parse(Int64, n)
arr = Array{Int64}(undef, n)
arr[1] = arr[2] = 1
for i in 3:n
    arr[i] = arr[i-1] + arr[i-2]
end

println(arr[n])