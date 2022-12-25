using HorizonSideRobots
include("solve_maze.jl")
startingPoint = Coordinates(2, 2)
r = Robot("maze(6).sit", animate = true)
solve!(r, startingPoint)
