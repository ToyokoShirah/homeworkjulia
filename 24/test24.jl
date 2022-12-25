using HorizonSideRobots

include("24.jl")
robot = Robot("test24.sit", animate = true)
side = readline()
side = parse(Int64, side)
half_dist!(robot, HorizonSide(side))