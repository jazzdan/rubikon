require './cube.rb'
require './encoder.rb'
require './sharder.rb'

initial_state = "RRRRRRRRRGGGYYYBBBGGGYYYBBBGGGYYYBBBOOOOOOOOOWWWWWWWWW"

MAX_DEPTH = 11

def csv(depth, key)
  puts depth.to_s + ',' + key.to_s
end

if __FILE__ == $0
  states = Sharder.new
  base_key = CornerEncoder.encode(Cube.corners(initial_state))
  states.add!(base_key)
  csv(0, base_key)
  previous = Array[initial_state]
  depth = 1
  temp = Array[]

  while depth < MAX_DEPTH
    # puts 'depth ' + depth.to_s
    # puts '================================================================='

    current = previous.pop
    while !current.nil?
      Cube::FACES.keys.each do |face|
        state = Cube.rotateClockwise(current, face)
        key = CornerEncoder.encode(Cube.corners(state))
        if states.add!(key)
          temp.push(state)
          csv(depth, key)
        end

        state = Cube.rotateClockwise(Cube.rotateClockwise(state, face), face)
        key = CornerEncoder.encode(Cube.corners(state))
        if states.add!(key)
          temp.push(state)
          csv(depth, key)
        end
      end
      current = previous.pop
    end

    previous = temp
    temp = []
    depth += 1
  end

end
