require './cube.rb'
require './solver.rb'
require './astar.rb'

10.times do

  puts initial_state = Cube.random_state(Cube::GOAL, 4)

  result = Astar.search2(initial_state)

  directions = Node.get_directions result

  Cube.execute_and_check_directions(initial_state, directions)
end
