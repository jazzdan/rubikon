require './astar.rb'
require './cube.rb'
require './heuristic.rb'
require './sharder.rb'

module Solver
  def self.solve
    # state = 'OYBYRGGROBBYRBBYRWYGGOYWBBWYGGOOBYYWWBRWOROOGGWRGWRWOR'
    state = Cube.random_state(Cube::GOAL, 5)

    if !CubeEncoder.encode? state
      puts "INVALID STATE: Unable to process cube file."
      break
    end

    Astar.search(state)
  end
end

Solver.solve
