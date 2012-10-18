require './cube.rb'
require './heuristic.rb'

base = "RRRRRRRRRGGGYYYBBBGGGYYYBBBGGGYYYBBBOOOOOOOOOWWWWWWWWW"
test = "OROOROOOOGGGWYWBBBBGBWYWGBGGGGWWWBBBRORRORRRRYYYYWYYWY"

puts 'h() = ' + Heuristic.fetch(Cube.rotateClockwise(base, 'R')).to_s
