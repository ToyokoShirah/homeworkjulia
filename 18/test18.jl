using HorizonSideRobots
include("18.jl")
robot = Robot("test18.sit", animate = true)
side = readline()
side = parse(Int64, side)
move_recursive!(robot, HorizonSide(side))