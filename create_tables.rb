require './cube.rb'
require './heuristic.rb'

initial_state = "RRRRRRRRRGGGYYYBBBGGGYYYBBBGGGYYYBBBOOOOOOOOOWWWWWWWWW"

if __FILE__ == $0
  puts "Starting mah script"
  
  puts Heuristic.h_corners(initial_state)

end
