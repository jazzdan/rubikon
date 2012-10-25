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

  GOAL = "RRRRRRRRRGGGYYYBBBGGGYYYBBBGGGYYYBBBOOOOOOOOOWWWWWWWWW"

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
    [23, 24],
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
    'R' => [51, 52, 53, 17, 16, 15, 14, 13, 12, 11, 10, 9],
    'G' => [0, 3, 6, 12, 21, 30, 36, 39, 42, 45, 48, 51],
    'Y' => [6, 7, 8, 15, 24, 33, 38, 37, 36, 29, 20, 11],
    'B' => [8, 5, 2, 53, 50, 47, 44, 41, 38, 32, 23, 14],
    'O' => [30, 31, 32, 33, 34, 35, 47, 46, 45, 27, 28, 29],
    'W' => [42, 43, 44, 35, 26, 17, 2, 1, 0, 9, 18, 27]
  }

  def self.corner(cube, i)
    self.get_a(cube, CORNERS[i]).sort.join
  end

  def self.corners(cube)
    CORNERS.map do |corner|
      self.get_a(cube, corner).sort.join
    end
  end

  def self.edges(cube)
    EDGES.map do |edge|
      self.get_a(cube, edge).sort.join
    end
  end

  def self.face(cube, face)
    self.get(cube, FACES[face])
  end

  def self.get(cube, ids)
    self.get_a(cube, ids).join
  end

  def self.get_a(cube, ids)
    ids.map {|i| cube[i]}
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

  def self.rotate!(str, repeat=2)
    arr = str.split("")
    repeat.times do
      arr.unshift(arr.pop)
    end
    arr.join
  end

  def self.rotate180(cube, face_id)
    cube = '' + cube
    self.rotateClockwise(
      self.rotateClockwise(cube, face_id),
      face_id
    )
  end

  def self.rotateClockwise(cube, face_id)
    cube = '' + cube
    face = self.rotate!(self.face(cube, face_id))
    cube = self.set(cube, FACES[face_id], face)

    # rotate the sides
    sides = self.rotate!(self.sides(cube, face_id), 3)
    cube = self.set(cube, SIDES[face_id], sides)
    cube
  end

  def self.rotateCounterClockwise(cube, face_id)
    cube = '' + cube
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

  def self.sides(cube, face)
    self.get(cube, SIDES[face])
  end

  def self.count_valid(state)
    puts 'Validating counts...'
    puts
    state = '' + state
    4.times {
      FACES.keys.each do |c|
        FACES.keys.each do |char|
          puts char + ': ' + (state.count(char) == 9).to_s
        end
        state = self.rotateClockwise(state, c)
        puts
      end
    }
    puts
    puts 'complete.'
    puts
  end

  def self.rotate180_valid(state)
    puts 'Validating 180 rotations...'
    puts
    FACES.keys.each do |c|
      new_state = '' + state
      2.times {new_state = self.rotate180(new_state, c)}
      puts '     face: ' + c
      puts '    state: ' + state
      puts 'new_state: ' + new_state
      puts '   PASSED: ' + (state == new_state).to_s
      puts
    end
    puts 'complete.'
    puts
  end

  def self.rotateCW_valid(state)
    puts 'Validating CW rotations...'
    puts
    FACES.keys.each do |c|
      new_state = '' + state
      4.times {new_state = self.rotateClockwise(new_state, c)}
      puts '     face: ' + c
      puts '    state: ' + state
      puts 'new_state: ' + new_state
      puts '   PASSED: ' + (state == new_state).to_s
      puts
    end
    puts 'complete.'
    puts
  end

  def self.rotateCCW_valid(state)
    puts 'Validating CCW rotations...'
    puts
    FACES.keys.each do |c|
      new_state = '' + state
      4.times {new_state = self.rotateCounterClockwise(new_state, c)}
      puts '     face: ' + c
      puts '    state: ' + state
      puts 'new_state: ' + new_state
      puts '   PASSED: ' + (state == new_state).to_s
      puts
    end
    puts 'complete.'
    puts
  end

  def self.random_state(state, depth=0)
    puts 'Depth: ' + depth.to_s
    state = '' + state
    if depth == 0
      puts 'derp'
      depth = Random.rand(0..19)
    end

    depth.times do
      action = Random.rand 0..1
      case action
      when 0
        state = Cube.rotateClockwise(state, Cube::FACES.keys.sample)
      when 1
        state = Cube.rotateCounterClockwise(state, Cube::FACES.keys.sample)
      end
    end
    state
  end

  def self.execute_and_check_directions(cube, directions)
    directions = directions.split(' ').reverse

    if directions.first == "goal"
      directions.shift
    end

    cube_to_goal = cube

    directions.map do |dir|
      face = dir[0]
      rotations = dir[1].to_i
      rotations.times do 
        cube_to_goal = Cube.rotateClockwise(cube_to_goal, face)
      end

    end

    if cube_to_goal == Cube::GOAL
      print cube
      puts ' was verified.'
    else
      print 'ERROR: '
      print cube
      puts ' could not be verified.'
    end

  end

end
