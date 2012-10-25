require './cube.rb'
require './astar.rb'

for i in 1..10
  
  10.times do
    puts initial_state = Cube.random_state(Cube::GOAL, i)

    result = Astar.search(initial_state)

    #directions = Node.get_directions result

    #Cube.execute_and_check_directions(initial_state, directions)
  end

end
