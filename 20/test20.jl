using HorizonSideRobots
include("20.jl")
robot = Robot("test20.sit", animate = true)
side = readline()
side = parse(Int64, side)
result = move_next!(robot, HorizonSide(side))
println(result)