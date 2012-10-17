require './cube.rb'
require './encoder.rb'
# require './heuristic.rb'
require 'csv'

initial_state = "RRRRRRRRRGGGYYYBBBGGGYYYBBBGGGYYYBBBOOOOOOOOOWWWWWWWWW"

if __FILE__ == $0
  puts "Starting mah script"
  #new_state = Cube.rotateClockwise(initial_state, "Y")

  previous = Array[initial_state]
  depth = 1
  temp = Array[]

  while depth < 4

    previous.each do |current|

      Cube::FACES.keys.each do |face|
        temp.push(Cube.rotate180(current, face))
        temp.push(Cube.rotateClockwise(current, face))
        temp.push(Cube.rotateCounterClockwise(current, face))
        temp[-3, 3].each do |state|
          puts CornerEncoder.encode(Cube.corners(state)) 
        end

      end

    end
    previous = temp
    temp = []
    depth += 1
  end

end
