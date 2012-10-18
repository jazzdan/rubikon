require './cube.rb'
require './encoder.rb'
require './heuristic.rb'
require './node.rb'
require './pq.rb'

module Astar

  def self.search(start)

    moves = 0
    start_node = Node.new(start, :goal)

    closed = {}
    open = PQ.new
    open.add(start_node.h(moves), start_node)

    while !open.empty?
      current = open.next
      if current.state == Cube::GOAL
        # TODO: output the path
        puts 'we win'
        n = current
        while n != :goal
          puts n.state
          n = n.parent
        end
        return
      end

      closed[current.key] = current
      moves += 1

      current.children.each do |child|
        if !closed.has_key?(child.key)
            open.add(child.h(moves), child)
        end
      end

    end

  end

end
