arr = Array{Int64}(undef, 12)
length1 = length(arr)
println(length1)
for i in 1:length1
    arr[i] = rand(1:5)
end
function recursive_sum!(x::Array{Int64}, len)
    if len == 0
        return 0
    end
    return x[len] + recursive_sum!(x, len - 1)
end
for i in 1:length1
    println(arr[i], " ")
end
println(recursive_sum!(arr, length1))