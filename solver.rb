require './astar.rb'
require './cube.rb'
require './heuristic.rb'
require './sharder.rb'

module Solver
  def self.solve state = Cube.random_state(Cube::GOAL)
    test = "OROOROOOOGGGWYWBBBBGBWYWGBGGGGWWWBBBRORRORRRRYYYYWYYWY"

    test2 = "BBYRRYGRGOBRWYOYBBGGGRYWRBOWGGROGOOOYBWYOWBGWRWBOWYYWR"

    puts 'Starting state:'
    puts state
    puts

    #Astar.search(state)
    Astar.search2(state)
  end
end
