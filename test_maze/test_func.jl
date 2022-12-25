#using (HorizonSideRobots)
include("function.jl")
const razmer_x = 30
const razmer_y = 30



data_array = zeros(Bool,razmer_x,razmer_y)
was_array = zeros(Bool,razmer_x,razmer_y)
r = Robot("untitled.sit",animate = true)
cr = Coord_Robot(r,cord(razmer_x ÷ 2,razmer_y ÷ 2))

recurse_get_data(data_array, was_array,cr)

# for x in 1:razmer_x
#     for y in 1:razmer_y
#         if x == y || y == x - razmer_x ÷ 2 
#             data_array[x,y] = true
#         end
#     end
# end