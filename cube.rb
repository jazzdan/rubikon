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

  FACES = {
    'R' => 0..8,
    'G' => [9, 10, 11, 18, 19, 20, 27, 28, 29],
    'Y' => [12, 13, 14, 21, 22, 23, 30, 31, 32],
    'B' => [15, 16, 17, 24, 25, 26, 33, 34, 35],
    'O' => 36..44,
    'W' => 45..53
  }

  def self.corner(cube, i)
    self.get(cube, CORNERS[i])
  end

  def self.corners(cube)
    CORNERS.map do |corner|
      self.get(cube, corner)
    end
  end

  def self.edge(cube, i)
    self.get(cube, EDGES[i])
  end

  def self.edges(cube)
    EDGES.map do |edge|
      self.get(cube, edge)
    end
  end

  def self.face(cube, side)
    self.get(cube, FACES[side])
  end

  def self.get(cube, ids)
    ids.map {|i| cube[i]}.join
  end

end