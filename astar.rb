require './cube.rb'
require './encoder.rb'
require './heuristic.rb'
require './node.rb'
require './pq.rb'

module Astar

  def self.search(start)

    moves = 0
    start_node = Node.new(start, :goal, :goal)

    closed = {}
    open = PQ.new
    open.add(start_node.h(moves), start_node)

    while !open.empty?
      current = open.next
      puts 'checking... ' + current.key.to_s
      if current.state == Cube::GOAL
        # TODO: output the path
        puts 'we win'
        puts
        n = current
        while n != :goal
          if n.direction != :goal
            print n.direction
          end
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
