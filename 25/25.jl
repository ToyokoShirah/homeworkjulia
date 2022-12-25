using HorizonSideRobots

function putmarker_recursive!(robot::Robot, side::HorizonSide, check::Int64)
    if !isborder(robot, side)
        if check % 2 == 0
            putmarker!(robot)
        end
        move!(robot, side)
        putmarker_recursive!(robot, side, check + 1)
    end
end

