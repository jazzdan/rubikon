require './cube.rb'
require './heuristic.rb'
require 'csv'

initial_state = "RRRRRRRRRGGGYYYBBBGGGYYYBBBGGGYYYBBBOOOOOOOOOWWWWWWWWW"

if __FILE__ == $0
  puts "Starting mah script"
  #new_state = Cube.rotateClockwise(initial_state, "Y")
  
  depth = 0

  CSV.open("corners.csv", "wb") do |csv|
    csv << Cube.corners(initial_state).unshift(depth)
    stack = Array.new
    stack.push(initial_state)
    depth = depth + 1
    temp_stack = Array.new

    while depth < 2
      Cube::FACES.keys.each_with_index {|face, index|
        #puts depth.to_s + ' ' + face.to_s
        #csv << Cube.corners(Cube.rotateClockwise(initial_state, face)).unshift(depth)
        #csv << Cube.corners(Cube.rotateCounterClockwise(initial_state, face)).unshift(depth)
        #csv << Cube.corners(Cube.rotate180(initial_state, face)).unshift(depth)

        while !stack.empty?
          puts stack.empty?
          puts depth
          puts face
          state = stack.pop

          clockwised_state = Cube.rotateClockwise(state, face)
          temp_stack.push(clockwised_state)
          counterclockwised_state = Cube.rotateCounterClockwise(state, face)
          temp_stack.push(counterclockwised_state)
          flipped_state = Cube.rotate180(state, face)
          temp_stack.push(flipped_state)

          csv << Cube.corners(clockwised_state).unshift(depth)
          csv << Cube.corners(counterclockwised_state).unshift(depth)
          csv << Cube.corners(flipped_state).unshift(depth)

        end

        stack = temp_stack

      }
      
      depth = depth + 1

    end
  end

end
