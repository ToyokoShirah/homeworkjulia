using HorizonSideRobots
include("22.jl")
robot = Robot("test22.sit", animate = true)
side = readline()
side = parse(Int64, side)
move_symmetrical!(robot, HorizonSide(side))