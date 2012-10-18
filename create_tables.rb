require './cube.rb'
require './encoder.rb'
# require './heuristic.rb'
require 'csv'

initial_state = "RRRRRRRRRGGGYYYBBBGGGYYYBBBGGGYYYBBBOOOOOOOOOWWWWWWWWW"

MAX_DEPTH = 11

class States

  TOTAL = 16_434_824
  SHARDS = 9

  def add!(key)
    if (!lookup?(key))
      @shards[shard(key)][key] = :done
      return true
    else
      return false
    end
  end

  def initialize()
    size = TOTAL / SHARDS
    @shards = Array.new()
    SHARDS.times { @shards.push(Array.new(size)) }
  end

  def lookup?(key)
    @shards[shard(key)][key] == :done
  end

  def shard(index)
    return index % SHARDS
  end

end

def csv(depth, key)
  puts depth.to_s + ',' + key.to_s
end

if __FILE__ == $0
  states = States.new
  states.add!(CornerEncoder.encode(Cube.corners(initial_state)))
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

        state = Cube.rotateClockwise(state, face)
        key = CornerEncoder.encode(Cube.corners(state))
        if states.add!(key)
          temp.push(state)
          csv(depth, key)
        end

        state = Cube.rotateClockwise(state, face)
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
