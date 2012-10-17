require './cube.rb'


module Heuristic

  def self.calculate(corners, edge_1, edge_2)
    values = Array[corners, edge_1, edge_2]
    values.max
  end

end
