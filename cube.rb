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
    'R' => [0, 1, 2, 5, 8, 7, 6, 3],
    'G' => [9, 10, 11, 20, 29, 28, 27, 18],
    'Y' => [12, 13, 14, 23, 32, 31, 30, 21],
    'B' => [15, 16, 17, 26, 35, 34, 33, 24],
    'O' => [36, 37, 38, 41, 44, 43, 42, 39],
    'W' => [45, 46, 47, 50, 53, 52, 51, 48]
  }

  SIDES = {
    'R' => [51..53, 15..17, 12..14, 9..11],
    'G' => [[0, 3, 6], [12, 21, 30], [36, 39, 42], [45, 48, 51]],
    'Y' => [6..8, [15, 24, 33], 36..38, [11, 20, 29]],
    'B' => [[2, 5, 8], [47, 50, 53], [38, 41, 44], [14, 23, 32]],
    'O' => [30..32, 33..35, 45..47, 27..29],
    'W' => [42..44, [17, 26, 35], 0..2, [9, 10, 11]]
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

  def self.face(cube, face)
    self.get(cube, FACES[face])
  end

  def self.get(cube, ids)
    ids.map {|i| cube[i]}.join
  end

  def self.pp(cube)
    for i in 0..cube.length/3-1
      if [3, 4, 6, 7, 9, 10].include?(i)
        print cube[i*3..(i*3+2)]
      else
        if [5, 8, 11].include?(i)
          puts cube[i*3..(i*3+2)]
        else
          puts '   ' + cube[i*3..(i*3+2)]
        end
      end
    end
  end

  def self.rotate(str, repeat=1)
    arr = str.split("")
    repeat.times { arr.unshift(arr.pop) }
    arr.join
  end

  def self.rotateSide(arr, repeat=1)
    repeat.times { arr.unshift(arr.pop) }
    arr
  end

  def self.rotate180(cube, face_id)
    self.rotateClockwise(
      self.rotateClockwise(cube, face_id),
      face_id
    )
  end

  def self.rotateClockwise(cube, face_id)
    # rotate the face
    face = self.rotate(self.face(cube, face_id), 3)
    cube = self.set(cube, FACES[face_id], face)

    # rotate the sides
    sides = self.rotateSide(self.sides(cube, face_id))
    sides.each_with_index do |side, i|
      cube = self.set(cube, SIDES[face_id][i], side)
    end
    cube
  end

  def self.rotateCounterClockwise(cube, face_id)
    self.rotate180(
      self.rotateClockwise(cube, face_id),
      face_id
    )
  end

  def self.set(cube, ids, to)
    ids.each_with_index do |loc, i|
      cube[loc] = to[i]
    end
    cube
  end

  def self.side(cube, face, side)
    self.get(cube, SIDES[face][side])
  end

  def self.sides(cube, face)
    SIDES[face].map do |side|
      self.get(cube, side)
    end
  end

end