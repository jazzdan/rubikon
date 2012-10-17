require './cube.rb'
require './encoder.rb'
# require './heuristic.rb'
require 'csv'

initial_state = "RRRRRRRRRGGGYYYBBBGGGYYYBBBGGGYYYBBBOOOOOOOOOWWWWWWWWW"

if __FILE__ == $0
  states = Array[]
  states[CornerEncoder.encode(Cube.corners(initial_state))] = :done
  previous = Array[initial_state]
  depth = 1
  temp = Array[]

  while depth < 4

    previous.each do |current|
      current_key = CornerEncoder.encode(Cube.corners(current))

      Cube::FACES.keys.each do |face|
        temp.push(Cube.rotate180(current, face))
        temp.push(Cube.rotateClockwise(current, face))
        temp.push(Cube.rotateCounterClockwise(current, face))
        temp[-3, 3].each do |state|
          key = CornerEncoder.encode(Cube.corners(state)) 
          if states[key] != :done
            states[key] = :done
            puts key.to_s + ',' + depth.to_s
          end
        end
      end

    end
    previous = temp
    temp = []
    depth += 1
  end

end
