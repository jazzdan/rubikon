=begin
Goal State

RRRRRRRRRGGGYYYBBBGGGYYYBBBGGGYYYBBBOOOOOOOOOWWWWWWWWW

or

RRR
RRR
RRR
GGGYYYBBB
GGGYYYBBB
GGGYYYBBB
OOO
OOO
OOO
WWW
WWW
WWW
=end

module Cube

  CORNERS = [
    [0, 9, 51],
    [2, 17, 53],
    [6, 11, 12],
    [8, 14, 15],
    [29, 30, 36],
    [32, 33, 38],
    [27, 42, 45],
    [35, 44, 47]
  ]

  EDGES = [
    [1, 52],
    [3, 10],
    [5, 16],
    [7, 13],
    [18, 48],
    [20, 21],
    [23, 24], #
    [26, 50],
    [28, 39],
    [31, 37],
    [34, 41],
    [43, 46]
  ]

  def self.corner(cube, i) {
    CORNERS[i].map {|i| cube[i]}.join
  end

  def self.corners(cube)
    CORNERS.map do |corner|
      corner.map {|i| cube[i]}.join
    end
  end

  def self.edge(cube, i) {
    EDGES[i].map {|i| cube[i]}.join
  end

  def self.edges(cube)
    EDGES.map do |corner|
      corner.map {|i| cube[i]}.join
    end
  end

end