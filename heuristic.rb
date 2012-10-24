require 'csv'
require './cube.rb'
require './encoder.rb'
require './sharder.rb'

module Heuristic

  CORNERS = Sharder.new
  EDGES_A = Sharder.new
  EDGES_B = Sharder.new

  def self.calculate(corners, edge_a, edge_b)
    hs = [corners, edge_a, edge_b]
    hs.reject {|n| n.nil? }.max
  end

  def self.fetch(state)
    corner = CORNERS.get(CornerEncoder.encode(Cube.corners(state)))
    edge_a = EDGES_A.get(EdgeEncoder.encodeA(Cube.edges(state)))
    edge_b = EDGES_B.get(EdgeEncoder.encodeB(Cube.edges(state)))

    # if edge_a.nil?
    #  puts 'errr: ' + edge_a.to_s + ' ' + state
    #end
    # self.calculate(corner, edge_a, edge_b)
    calculate(corner, edge_a, edge_b)
  end

end

puts 'loading corner heuristics...'
CSV.foreach('./heuristics/corners.csv') do |row|
  Heuristic::CORNERS.add!(row[1].to_i, row[0].to_i)
end

puts 'loading edge_a heuristics...'
CSV.foreach('./heuristics/edges_a.csv') do |row|
  Heuristic::EDGES_A.add!(row[1].to_i, row[0].to_i)
end

puts 'loading edge_b heuristics...'
CSV.foreach('./heuristics/edges_b.csv') do |row|
  Heuristic::EDGES_B.add!(row[1].to_i, row[0].to_i)
end
