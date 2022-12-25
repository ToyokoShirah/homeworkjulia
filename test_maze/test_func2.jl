using HorizonSideRobots
include("function2.jl")
startingPoint = Coordinates(2, 2)
r = Robot("maze(6).sit", animate = true)
solve!(r, startingPoint)
