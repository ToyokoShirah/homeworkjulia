using HorizonSideRobots
include("19.jl")
robot = Robot("test19.sit", animate = true)
side = readline()
side = parse(Int64, side)
move_recursive_putmarker!(robot, HorizonSide(side))