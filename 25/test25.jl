using HorizonSideRobots

include("25.jl")
robot = Robot("test25.sit", animate = true)
side = readline()
side = parse(Int64, side)
putmarker_recursive!(robot, HorizonSide(side), 0)