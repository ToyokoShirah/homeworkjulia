using HorizonSideRobots
n = readline()
n = parse(Int64, n)
include("11.jl")
r = Robot("test11.sit", animate = true)
draw_chess_square!(r, n)