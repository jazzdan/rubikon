require './astar.rb'
require './cube.rb'
require './heuristic.rb'
require './sharder.rb'

test = "OROOROOOOGGGWYWBBBBGBWYWGBGGGGWWWBBBRORRORRRRYYYYWYYWY"
test2 = "BBYRRYGRGOBRWYOYBBGGGRYWRBOWGGROGOOOYBWYOWBGWRWBOWYYWR"
state = Cube.random_state(Cube::GOAL)

puts 'Starting state:'
puts state
puts

#Astar.search(state)
Astar.search2(state)
