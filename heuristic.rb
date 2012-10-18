require './cube.rb'
require './encoder.rb'
require 'csv'


module Heuristic

  CORNERS = Array[]
  EDGES_A = Array[]
  EDGES_B = Array[]

  def self.calculate(corners, edge_a, edge_b)
    hs = [corners, edge_a, edge_b]
    hs.map {|n| n.nil? ? 0 : n }.max
  end

  def self.fetch(state)
    corner = CORNERS[CornerEncoder.encode(Cube.corners(state))]
    edge_a = EDGES_A[EdgeEncoder.encodeA(Cube.edges(state))]
    edge_b = EDGES_B[EdgeEncoder.encodeB(Cube.edges(state))]

    # if edge_a.nil?
    #  puts 'errr: ' + edge_a.to_s + ' ' + state
    #end
    # self.calculate(corner, edge_a, edge_b)
    corner
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
