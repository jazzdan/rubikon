require './cube.rb'
require './heuristic.rb'

base = "RRRRRRRRRGGGYYYBBBGGGYYYBBBGGGYYYBBBOOOOOOOOOWWWWWWWWW"
test = "OROOROOOOGGGWYWBBBBGBWYWGBGGGGWWWBBBRORRORRRRYYYYWYYWY"

puts 'h() = ' + Heuristic.fetch(Cube.rotate180(base, 'R')).to_s
