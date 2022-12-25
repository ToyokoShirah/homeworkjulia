using HorizonSideRobots
global path_robot =  Array{String}(undef, 13, 13)

list_column = 1:13
list_row = 1:13
for i in list_column
    for j in list_row
        path_robot[i, j] = "free"
    end
end
mutable struct Coordinates
    x::Int64
    y::Int64
end

startingPoint = Coordinates(2, 2)
previousPoint = Coordinates(2, 1)
endingPoint = Coordinates(13, 12)

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
end


# function HorizonSideRobots.move!(robot::CoordRobot, side)
#     move!(robot.robot, side)
#     move!(robot.cords, side)
# end

function get_robot(robot::Robot, side)
    move!(robot, side)
    return robot
end

function get_cords(cords::Coordinates, side)
    move_cords!(cords, side)
    return cords
end

function set_path(cords::Coordinates, situation::String)
    global path_robot[cords.x, cords.y] = situation
    return path_robot[cords.x, cords.y-1]
end


function solve!(robot::Robot, cords::Coordinates)
    # robot_Nord, cord_Nord = get_robot(robot, cords, Nord)
    # robot_Sud, cord_Sud = get_robot(robot, cords, Sud)
    # robot_West, cord_West = get_robot(robot, cords, West)
    # robot_Ost, cord_Ost = get_robot(robot, cords, Ost) 
    a = set_path(cords, "occupied")
    x_diff = cords.x - previousPoint.x
    y_diff = cords.y - previousPoint.y
    println(cords.x,  " " , cords.y, " ", previousPoint.x, " ", previousPoint.y, " ", x_diff, " ", y_diff, " ", a)
    previousPoint.x = cords.x
    previousPoint.y = cords.y
    
    if cords.x == endingPoint.x && cords.y == endingPoint.y 
        return true
    end
    for side in (Nord, Sud, Ost, West) 
        if !isborder(robot, side)
            if path_robot[cords.x + move_cords!(Coordinates(0, 0), side), cords.y + move_cords!(Coordinates(0, 0), side)] == "free"
                if solve!(get_robot(robot, side), get_cords(cords, side))
                    return true
                end
            end
        end
        if (y_diff == 1) 
            # set_path(cords, "free")
            move!(robot, Sud)
            get_cords(cords, Sud)
             
        elseif (y_diff == -1)
            # set_path(cords, "free")
            move!(robot, Nord)
            get_cords(cords, Nord)
            
         elseif (x_diff == 1) 
            # set_path(cords, "free")
            move!(robot, West)
            get_cords(cords, West)
            
        elseif (x_diff == -1)
            # set_path(cords, "free")
            move!(robot, Ost)
            get_cords(cords, Ost)
            
        end
        x_diff = cords.x - previousPoint.x
        y_diff = cords.y - previousPoint.y
        println(cords.x,  " " , cords.y, " ", previousPoint.x, " ", previousPoint.y, " ", x_diff, " ", y_diff, " ", a)
        previousPoint.x = cords.x
        previousPoint.y = cords.y
        return false
    end
    # if !isborder(robot, Nord) 
    #     if path_robot[cords.x, cords.y + 1] == "free" 
    #         if solve!(get_robot(robot, Nord), get_cords(cords, Nord)) 
    #             return true
    #         end
    #     end
    # end

    # if !isborder(robot, Sud) 
    #     if path_robot[cords.x, cords.y - 1] == "free" 
    #         if solve!(get_robot(robot, Sud), get_cords(cords, Sud))
    #             return true
    #         end
    #     end
    # end

    # if !isborder(robot, Ost) 
    #     if path_robot[cords.x + 1 , cords.y] == "free" 
    #         if solve!(get_robot(robot,Ost), get_cords(cords, Ost))
    #             return true
    #         end
    #     end
    # end

    # if !isborder(robot, West) 
    #     if path_robot[cords.x - 1, cords.y] == "free" 
    #         if solve!(get_robot(robot, West), get_cords(cords, West))
    #             return true
    #         end
    #     end
    # end
end




