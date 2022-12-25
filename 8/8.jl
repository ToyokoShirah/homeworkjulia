using HorizonSideRobots
function under_entry!(robot)
    imax, jmax = r.situation.frame_size
    while !isborder(robot, Nord)
        move!(robot, Nord)
    end
    number_i = 1
    side = Ost
    while isborder(robot, Nord)
        move!(robot, side)
        number_i += 1
        if (number_i >= imax)
            side = inverse(side)
            number_i = 0
        end
    end
end
inverse(side::HorizonSide) = HorizonSide((Int(side) +2)% 4)
    


        

