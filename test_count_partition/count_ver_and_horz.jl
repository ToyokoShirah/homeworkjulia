using HorizonSideRobots
function count_horizental!(robot)
    count_horz = 0
    count_check_horz = 0
    side = Ost
    while !isborder(robot, side)
        move!(robot, side)
        x, y = robot.situation.robot_position
        println(x, " ", y)
        if isborder(robot, Nord)
            count_check_horz += 1
        else
            if (count_check_horz > 0) 
                count_horz += 1;
                count_check_horz = 0;
            end
        end
        while isborder(robot, side)
            if !isborder(robot, Nord)
                if (y == 1 || y == 12) 
                    move!(robot, Nord)
                    x, y = robot.situation.robot_position
                    side = inverse(side)
                    if isborder(robot, side)
                        step!(robot, side)
                        x, y = robot.situation.robot_position
                    end
                else
                    step!(robot, side)
                    x, y = robot.situation.robot_position
                end
            end
            if isborder(robot, side)
                if isborder(robot, Nord)
                    break
                end
            end
        end
    end
    return count_horz
end

function count_vertical!(robot)
    count_vert = 0
    count_check_vert = 0
    side = Sud
    while !isborder(robot, side)
        move!(robot, side)
        x, y = robot.situation.robot_position
        println(x, " ", y)
        if isborder(robot, West)
            count_check_vert += 1
        else
            if (count_check_vert > 0) 
                count_vert += 1;
                count_check_vert = 0;
            end
        end
        while isborder(robot, side)
            if !isborder(robot, West)
                if (x == 1 || x == 11) 
                    move!(robot, West)
                    x, y = robot.situation.robot_position
                    side = inverse(side)
                    if isborder(robot, side)
                        step!(robot, side)
                        x, y = robot.situation.robot_position
                    end
                else
                    step!(robot, side)
                    x, y = robot.situation.robot_position
                end
            end
            if isborder(robot, side)
                if isborder(robot, West)
                    break
                end
            end
        end
    end
    return count_vert
end

inverse(side::HorizonSide) = HorizonSide((Int(side) +2)% 4)
right(side::HorizonSide) = HorizonSide((Int(side) +1)% 4)
left(side::HorizonSide) = HorizonSide((Int(side) +3)% 4)

function step!(robot, side)
    if !isborder(robot, side)
        move!(robot, side)
    elseif !isborder(robot, right(side))
        move!(robot, right(side))
        step!(robot, side)
        move!(robot, left(side))
    end
end


