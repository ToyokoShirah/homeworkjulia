using HorizonSideRobots
include("38.jl")
r = Robot("38test.sit", animate = true)
x, y = r.situation.robot_position
mark_perimeter(r, x, y)