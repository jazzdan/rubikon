require './cube.rb'


module Heuristic

  @@goal_state = "RRRRRRRRRGGGYYYBBBGGGYYYBBBGGGYYYBBBOOOOOOOOOWWWWWWWWW"
  @@goal_corners = Cube.corners(@@goal_state)

  def self.calculate(corners, edge_1, edge_2)
    values = Array[corners, edge_1, edge_2]
    values.max
  end

  def self.corners_in_place(state)
    current_corners = Cube.corners(state)
    if current_corners == @@goal_corners
      return 0
    else
      diff = current_corners - @@goal_corners
      return diff.length
    end
  end

  def self.edges_in_place_1(state)
    Cube.edges(state)
  end

end
