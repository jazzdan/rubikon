require './cube.rb'
require './encoder.rb'
require './heuristic.rb'
require './node.rb'
require './pq.rb'

module Astar

  def self.search(start)

    start_node = Node.new(start, :goal, 0, :goal)
    limit = start_node.h

    closed = {}
    open = PQ.new
    open.add(start_node.h, start_node)

    while !open.empty?
      current = open.next
      puts 'd   = ' + current.depth.to_s
      if current.state == Cube::GOAL
        puts
        puts 'Solution: '
        puts '========================================================='
        n = current
        while n != :goal
          if n.direction != :goal
            print n.direction
          end
          n = n.parent
        end
        puts
        puts
        return
      end

      children = current.children.sort {|child| child.h}
      closed[current.key] = current
      children.each do |child|
        if child.h <= limit
          open.add(child.h, child)
        end
      end

    end

  end

end
