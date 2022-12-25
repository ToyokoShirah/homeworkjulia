# using HorizonSideRobots



# function isborder_in(robot, side)
#     x, y = robot.situation.robot_position
#     if isborder(robot, side)
#         return true
#     else
#         return false
#     end
    
# end

# function mark_perimeter(robot, s_x, s_y)
#     putmarker!(robot)
#     side = Ost
#     diff_x, diff_y = 0, 0
#     result_x, result_y = s_x, s_y   
#     max_diff = 0 
#     while true
        
#         if isborder_in(robot, West) && !isborder_in(robot, inverse(West)) && side == West
#             side = Sud
#         elseif isborder_in(robot, Nord) && !isborder_in(robot, inverse(Nord)) && side == Nord
#             side = West
#         elseif isborder_in(robot, Ost) && !isborder_in(robot, inverse(Ost)) && side == Ost
#             side = Nord
#         elseif isborder_in(robot, Sud) && !isborder_in(robot, inverse(Sud)) && side == Sud
#             side = Ost
#         end

#         if isborder_in(robot, West) && isborder_in(robot, Sud) 
#             side = Ost
#         elseif isborder_in(robot, West) && isborder_in(robot, Nord)
#             side = Sud
#         elseif isborder_in(robot, Sud) && isborder_in(robot, Ost)
#             side = Nord
#         elseif isborder_in(robot, Nord) && isborder_in(robot, Ost)
#             side = West
#         end

#         if isborder(robot, Ost) && isborder(robot, Sud) && isborder(robot, Nord)
#             side = West
#         elseif isborder(robot, West) && isborder(robot, Sud) && isborder(robot, Nord)
#             side = Ost
#         elseif isborder(robot, Ost) && isborder(robot, Sud) && isborder(robot, West)
#             side = Nord
#         elseif isborder(robot, Ost) && isborder(robot, West) && isborder(robot, Nord)
#             side = Sud
#         end

#         if !isborder_in(robot, side) && !isborder_in(robot, left(side))
#             side = left(side)
#         end
#         x, y = robot.situation.robot_position
#         if isborder(robot, left(side)) && isborder(robot, next(side))
#             side = side
#         end

#         # if isborder(robot, side) && isborder(robot, next(side)) && isborder(robot, left(side))
#         #     side = inverse(side)
#         # end
#         # if (x != 1 && y != 1 && x != 11 && y != 12)
#         #     side = West
#         # end
     
#         move!(robot, side)
#         x, y = robot.situation.robot_position
#         max_diff = max(diff_x, diff_y) 
#         if (abs(x - s_x) > diff_x)
#             diff_x = abs(x - s_x)
#         end
#         if (abs(y - s_y) > diff_y)
#             diff_y = abs(y - s_y)
#         end
#         println(diff_x, " ", diff_y)
#         if (max(diff_x, diff_y) > max_diff)
#             result_x = x
#             result_y = y
#         end

#         if (x == s_x && y == s_y)
#             break
#         end
#     end
#     while true
        
#         if isborder_in(robot, West) && !isborder_in(robot, inverse(West)) && side == West
#             side = Sud
#         elseif isborder_in(robot, Nord) && !isborder_in(robot, inverse(Nord)) && side == Nord
#             side = West
#         elseif isborder_in(robot, Ost) && !isborder_in(robot, inverse(Ost)) && side == Ost
#             side = Nord
#         elseif isborder_in(robot, Sud) && !isborder_in(robot, inverse(Sud)) && side == Sud
#             side = Ost
#         end

#         if isborder_in(robot, West) && isborder_in(robot, Sud) 
#             side = Ost
#         elseif isborder_in(robot, West) && isborder_in(robot, Nord)
#             side = Sud
#         elseif isborder_in(robot, Sud) && isborder_in(robot, Ost)
#             side = Nord
#         elseif isborder_in(robot, Nord) && isborder_in(robot, Ost)
#             side = West
#         end

#         if isborder(robot, Ost) && isborder(robot, Sud) && isborder(robot, Nord)
#             side = West
#         elseif isborder(robot, West) && isborder(robot, Sud) && isborder(robot, Nord)
#             side = Ost
#         elseif isborder(robot, Ost) && isborder(robot, Sud) && isborder(robot, West)
#             side = Nord
#         elseif isborder(robot, Ost) && isborder(robot, West) && isborder(robot, Nord)
#             side = Sud
#         end

#         if !isborder_in(robot, side) && !isborder_in(robot, left(side))
#             side = left(side)
#         end
#         x, y = robot.situation.robot_position
#         if isborder(robot, left(side)) && isborder(robot, next(side))
#             side = side
#         end

#         # if isborder(robot, side) && isborder(robot, next(side)) && isborder(robot, left(side))
#         #     side = inverse(side)
#         # end
#         # if (x != 1 && y != 1 && x != 11 && y != 12)
#         #     side = West
#         # end
#         move!(robot, side)
#         x, y = robot.situation.robot_position
#         if (x == result_x && y == result_y)
#             break
#         end
#     end
#     while !isborder(robot, Ost)
#         move!(robot, Ost)
#     end
#     x, y = robot.situation.robot_position
#     if (y == 12)
#         print(true)
#     else
#         print(false)
#     end
# end

# next(side::HorizonSide) = HorizonSide((Int(side) +1)% 4)
# inverse(side::HorizonSide) = HorizonSide((Int(side) +2)% 4)
# left(side::HorizonSide) = HorizonSide((Int(side) +3)% 4)

using HorizonSideRobots
mutable struct Coordinates
    x::Int64
    y::Int64
end

struct CoordRobot
    robot::Robot
    cords::Coordinates
end

global area = 0

function move_cords!(cords::Coordinates, side)
    if side == Ost
        cords.x += 1
    elseif side == West
        cords.x -= 1
    elseif side == Nord
        cords.y += 1
    elseif side == Sud
        cords.y -= 1
    end
    return cords
end

function try_move_putmarker!(robot::CoordRobot, side)
    move!(robot.robot, side)
    if !ismarker(robot.robot)
        global area += 1
        putmarker!(robot.robot)
    end

    move_cords!(robot.cords, side)
end


function get_cords(cords::Coordinates)
    return cords
end

function solve!(previous_arr::Array, current_arr::Array, robot::CoordRobot)
    previous_arr[robot.cords.x, robot.cords.y] = true
    for i in 0:3
        side = HorizonSide(i)
        if isborder(robot.robot, side)
            current_arr[robot.cords.x, robot.cords.y] = true
        elseif !previous_arr[robot.cords.x + move_cords!(Coordinates(0, 0), side).x, robot.cords.y + move_cords!(Coordinates(0, 0), side).y]
            try_move_putmarker!(robot, side)
            solve!(previous_arr, current_arr, robot)
            try_move_putmarker!(robot, inverse(side))
        end
    end
end

inverse(side::HorizonSide) = HorizonSide((Int(side) +2)% 4)

