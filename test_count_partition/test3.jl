using HorizonSideRobots
include("count_all.jl")
r = Robot("test3.sit", animate = true)
a = count_all1!(r)
b = count_all2!(r)
println(a + b)