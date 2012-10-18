require './cube.rb'
require './encoder.rb'
require 'csv'


module Heuristic

  CORNERS = Array[]
  EDGES_A = Array[]
  EDGES_B = Array[]

  def self.calculate(corners, edge_a, edge_b)
    [corners, edge_a, edge_b].max
  end

  def self.fetch(state)
    corner = CornerEncoder.encode(Cube.corners(state))
    edge_a = EdgeEncoder.encodeA(Cube.edges(state))
    edge_b = EdgeEncoder.encodeB(Cube.edges(state))
    # puts 'corners: ' + CORNERS[corner].to_s
    # puts 'edge_a: ' + EDGES_A[edge_a].to_s
    # puts 'edge_b: ' + EDGES_B[edge_b].to_s
    self.calculate(CORNERS[corner], EDGES_A[edge_a], EDGES_B[edge_b])
  end

end

CSV.foreach('./heuristics/corners.csv') do |row|
  Heuristic::CORNERS[row[1].to_i] = row[0].to_i
end

CSV.foreach('./heuristics/edges_a.csv') do |row|
  Heuristic::EDGES_A[row[1].to_i] = row[0].to_i
end

CSV.foreach('./heuristics/edges_b.csv') do |row|
  Heuristic::EDGES_B[row[1].to_i] = row[0].to_i
end
