using HorizonSideRobots
function draw!(robot)
    # to_corner!(robot)
    draw_row_or_column!(robot)
end
function to_corner!(robot)
    num_West = 0
    num_Sud = 0
    while !isborder(robot, West) || !isborder(robot, Sud)
        if isborder(robot, Sud)
            move!(robot, West)
            num_West += 1
        else
            move!(robot, Sud)
            num_Sud += 1
        end
    end
    return 11 - num_Sud, 12 - num_West
end
function draw_row_or_column!(robot)
    y_pos, x_pos = to_corner!(robot)
    x_current_pos = 1
    y_current_pos = 1
    for side in (Ost, Nord, West, Sud)
        while !isborder(robot, side)
            if (side == Ost)
                move!(robot, side)
                x_current_pos += 1
                if x_current_pos == 12 - x_pos + 1
                    putmarker!(robot)
                end
            elseif (side == West)
                move!(robot, side)
                x_current_pos += 1
                if x_current_pos == x_pos
                    putmarker!(robot)
                end
            elseif (side == Nord)
                move!(robot, side)
                y_current_pos += 1
                if y_current_pos == 11 - y_pos + 1
                    putmarker!(robot)
                end 
            else 
                move!(robot, side)
                y_current_pos += 1
                if y_current_pos == y_pos
                    putmarker!(robot)
                end
            end
        end
        x_current_pos = 1
        y_current_pos = 1
    end
end
inverse(side::HorizonSide) = HorizonSide((Int(side) +2) % 4)
next(side::HorizonSide) = HorizonSide((Int(side) +1) % 4)
previous(side::HorizonSide) = HorizonSide((Int(side) + 3) % 4)
# include("test5.jl")