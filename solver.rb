require './astar.rb'
require './cube.rb'
require './heuristic.rb'
require './sharder.rb'

module Solver
  def self.solve
    state = Cube.random_state(Cube::GOAL, 3)

    if !CubeEncoder.encode? state
      puts "INVALID STATE: Unable to process cube file."
      break
    end

    puts 'Starting state:'
    puts state
    puts

    #Astar.search(state)
    Astar.search2(state)
  end
end

#Solver.solve
