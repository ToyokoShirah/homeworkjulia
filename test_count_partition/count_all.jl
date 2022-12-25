using HorizonSideRobots
function count_all1!(robot)
    side = Ost
    count_check = 0
    count = 0
    ins = 1
    while !isborder(robot, side)
        move!(robot, side)
        x, y = robot.situation.robot_position
        if isborder(robot, Nord) && x != 1
            count_check += 1
            if count_check == 1
                move!(robot, inverse(side))
                move!(robot, Nord)
                if isborder(robot, side)
                    ins = 0
                else
                    ins = 1
                end
                move!(robot, Sud)
                move!(robot, side)
            end
        else
            if (count_check > 0) 
                count += ins;
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

function count_all2!(robot)
    side = Sud
    count_check2 = 0
    count2 = 0
    ins = 1
    while !isborder(robot, side)
        move!(robot, side)
        x, y = robot.situation.robot_position
        if isborder(robot, West)
            count_check2 += 1
        else
            if (count_check2 > 0) 
                count2 += ins;
                count_check2 = 0;
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
    return count2
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