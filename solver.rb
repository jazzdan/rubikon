require './astar.rb'
require './cube.rb'
require './heuristic.rb'
require './sharder.rb'

test = "OROOROOOOGGGWYWBBBBGBWYWGBGGGGWWWBBBRORRORRRRYYYYWYYWY"
state = Cube.random_state(Cube::GOAL)

puts 'Starting state:'
puts state
puts

Astar.search(state)
