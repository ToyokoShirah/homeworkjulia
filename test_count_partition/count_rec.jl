using HorizonSideRobots
function count_rec!(robot)
    side = Ost
    count_check = 0
    count = 0
    while !isborder(robot, side)
        move!(robot, side)
        x, y = robot.situation.robot_position
        if isborder(robot, Nord)
            count_check += 1
        else
            if (count_check > 0) 
                count += 1;
                count_check = 0;
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
    return count
end

function step!(robot, side)
    if !isborder(robot, side)
        move!(robot, side)
        while isborder(robot, right(side))
            move!(robot, side)
        end
    else
        move!(robot, left(side))
        step!(robot, side)
        move!(robot, right(side))
    end
end

inverse(side::HorizonSide) = HorizonSide((Int(side) +2)% 4)
right(side::HorizonSide) = HorizonSide((Int(side) +1)% 4)
left(side::HorizonSide) = HorizonSide((Int(side) +3)% 4)