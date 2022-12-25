using HorizonSideRobots
include("37.jl")
r = Robot("37test.sit", animate = true)
x, y = r.situation.robot_position
println(x, y)
mark_perimeter(r, x, y)