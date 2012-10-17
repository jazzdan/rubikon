class Node

  def initialize(parent)
    @parent = parent
  end

  def parent
    @parent
  end

end

puts 'HEURISTIC THE SHIT OUT OF IT'
node = states.last
heuristic = 0
while node.parent != :goal
  puts 'to: ' + node.parent.to_s
  node = states[node.parent]
  heuristic += 1
end

puts 'DONE: h() = ' + heuristic.to_s
