using HorizonSideRobots
include("count_rec.jl")
r = Robot("test2(1).sit", animate = true)
count_rec!(r)