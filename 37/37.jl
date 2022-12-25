using HorizonSideRobots



function isborder_in(robot, side)
    x, y = robot.situation.robot_position
    if isborder(robot, side) && (x != 1 && y != 1 && x != 11 && y != 12)
        return true
    else
        return false
    end
    
end

function mark_perimeter(robot, s_x, s_y)
    putmarker!(robot)
    side = Ost
    while true
        println(side)
        if isborder_in(robot, Ost) && !isborder_in(robot, inverse(Ost)) && side == Ost
            side = Sud
        elseif isborder_in(robot, Sud) && !isborder_in(robot, inverse(Sud)) && side == Sud
            side = West
        elseif isborder_in(robot, West) && !isborder_in(robot, inverse(West)) && side == West
            side = Nord
        elseif isborder_in(robot, Nord) && !isborder_in(robot, inverse(Nord)) && side == Nord
            side = Ost
        end

        # if side == Ost && isborder(robot, Sud) && !isborder(robot, Nord)
        #     side = Nord
        # elseif side == Nord && isborder(robot, Ost) && !isborder(robot, West)
        #     side = West
        # elseif side == West && isborder(robot, Nord) && !isborder(robot, Sud)
        #     side = Sud
        # elseif side == Sud && isborder(robot, West) && !isborder(robot, Ost)
        #     side = Ost
        # end

        if isborder_in(robot, Ost) && isborder_in(robot, Sud) 
            side = West
        elseif isborder_in(robot, West) && isborder_in(robot, Nord)
            side = Ost
        elseif isborder_in(robot, Sud) && isborder_in(robot, West)
            side = Nord
        elseif isborder_in(robot, Nord) && isborder_in(robot, Ost)
            side = Sud
        end

        if isborder(robot, Ost) && isborder(robot, Sud) && isborder(robot, Nord)
            side = West
        elseif isborder(robot, West) && isborder(robot, Sud) && isborder(robot, Nord)
            side = Ost
        elseif isborder(robot, Ost) && isborder(robot, Sud) && isborder(robot, West)
            side = Nord
        elseif isborder(robot, Ost) && isborder(robot, West) && isborder(robot, Nord)
            side = Sud
        end

        if !isborder_in(robot, side) && !isborder_in(robot, next(side))
            side = next(side)
        end
        x, y = robot.situation.robot_position
        if isborder(robot, side) && isborder(robot, inverse(side)) && (x == 1 || y == 1 || x == 11 || y == 12)
            side = left(side)
        end

        # if isborder(robot, side) && isborder(robot, next(side)) && isborder(robot, left(side))
        #     side = inverse(side)
        # end
        # if (x != 1 && y != 1 && x != 11 && y != 12)
        #     side = West
        # end
     
        move!(robot, side)
        x, y = robot.situation.robot_position
        if (x == s_x && y == s_y)
            break
        end
        if isborder(robot, side) || isborder(robot, next(side))
            putmarker!(robot)
        end

        
    end
end

next(side::HorizonSide) = HorizonSide((Int(side) +1)% 4)
inverse(side::HorizonSide) = HorizonSide((Int(side) +2)% 4)
left(side::HorizonSide) = HorizonSide((Int(side) +3)% 4)