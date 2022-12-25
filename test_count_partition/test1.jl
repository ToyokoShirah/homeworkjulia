using HorizonSideRobots
include("count_ver_and_horz.jl")
r = Robot("test1(2).sit", animate = true)
horizental = count_horizental!(r)
vertical = count_vertical!(r)
println(horizental + vertical)
