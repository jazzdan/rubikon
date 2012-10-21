require './cube.rb'
require './encoder.rb'
require './heuristic.rb'
require './node.rb'
require './pq.rb'
require 'awesome_print'

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

  def self.search2(start)
    cost_limit = Heuristic.fetch(start)
    start = Node.new(start, :goal, 0, :goal)
    path_so_far = [start]
    
    while true
      solution, cost_limit = self.depth_limited_search(0, path_so_far, cost_limit)

      if solution != :none
        puts 'Found a solution: '
        solution.each {|x| print x.direction, ' ' }
        return solution
      elsif cost_limit == Float::INFINITY
        puts 'No solution found'
        return :none
      end
    end
  end

  def self.depth_limited_search(start_cost, path_so_far, cost_limit)
    node = path_so_far.last
    minimum_cost = start_cost + node.h

    if minimum_cost > cost_limit
      return :none, minimum_cost
    elsif node.state == Cube::GOAL
      return path_so_far, cost_limit
    end

    next_cost_limit = Float::INFINITY
    children = node.children.sort{|child| child.h}
    children.each do |child|
      new_start_cost = start_cost + child.h
      puts 'New start cost ' + new_start_cost.to_s + ' at depth ' + child.depth.to_s
      solution, new_cost_limit = depth_limited_search(new_start_cost, path_so_far.push(child), cost_limit)
      if solution != :none
        return solution, new_cost_limit
      end
      path_so_far.pop
      next_cost_limit = [next_cost_limit, new_cost_limit].min
    end

    return :none, next_cost_limit
  end

end
