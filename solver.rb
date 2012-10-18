require './astar.rb'
require './cube.rb'
require './heuristic.rb'
require './sharder.rb'

test = "OROOROOOOGGGWYWBBBBGBWYWGBGGGGWWWBBBRORRORRRRYYYYWYYWY"

Astar.search(
  #Cube.rotateClockwise(
    #Cube.rotateCounterClockwise(
      Cube.rotateCounterClockwise(
        Cube.rotateClockwise(
          Cube.rotateClockwise(Cube::GOAL, 'O'), 'B'
        ),
        'W'
      )#,
    #  'Y'
    #),
    #'G'
  #)
)
