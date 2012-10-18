require './cube.rb'
require './encoder.rb'
# require './heuristic.rb'
require 'csv'

initial_state = "RRRRRRRRRGGGYYYBBBGGGYYYBBBGGGYYYBBBOOOOOOOOOWWWWWWWWW"

errors = 0

if __FILE__ == $0
  states = Array.new(16_434_824)
  states[CornerEncoder.encode(Cube.corners(initial_state))] = :done
  previous = Array[initial_state]
  depth = 1
  temp = Array[]

  while depth < 4

    previous.each do |current|
      current_key = CornerEncoder.encode(Cube.corners(current))

      Cube::FACES.keys.each do |face|
        actions = []
        actions.push(Cube.rotate180(current, face))
        actions.push(Cube.rotateClockwise(current, face))
        actions.push(Cube.rotateCounterClockwise(current, face))
        actions.each_with_index do |state, i|
          begin
            key = CornerEncoder.encode(Cube.corners(state)) 
            if states[key] != :done
              states[key] = :done
              puts key.to_s + ',' + depth.to_s
            end
            temp.push(state)
          rescue
            #puts
            puts
            puts 'action: ' + ['180', 'CW', 'CCW'][i]
            puts ' depth: ' + depth.to_s
            puts '  face: ' + face
            puts 'origin: ' + current
            puts ' state: ' + state
            puts
            #Cube.pp(state)
            #puts
            errors += 1
          end
        end
      end

    end
    previous = temp
    temp = []
    depth += 1
  end

  puts
  puts errors.to_s + ' ERRORS'

end
