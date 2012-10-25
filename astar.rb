require './cube.rb'
require './encoder.rb'
require './heuristic.rb'
require './node.rb'
require './pq.rb'
require 'os'

module Astar

  @@nodes_examined = 1

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

  def self.search2(start_str)
    start = Node.new(start_str, :goal, 0, :goal)
    cost_limit = start.h
    path_so_far = [start]
    puts
    puts 'start: ' + start_str
    puts
    t1 = Time.now

    while true
      solution, cost_limit = self.depth_limited_search(path_so_far, cost_limit)

      if solution != :none
        t2 = Time.now
        memory_used = OS.rss_bytes
        time_taken = t2 - t1
        puts 'COMPLETE'
        puts '====================================================='
        print 'solution: '
        solution.reverse.each {|x| print x.direction, ' ' }
        puts
        puts 'steps: ' + (solution.length - 1).to_s
        puts 'nodes examined: ' + @@nodes_examined.to_s
        puts 'memory used: ' + memory_used.to_s
        puts 'time taken: ' + time_taken.to_s
        self.record_stats(start_str, Node.get_human_directions(solution), solution.length-1, time_taken, memory_used, @@nodes_examined)
        return solution
      elsif cost_limit == Float::INFINITY
        puts 'No solution found'
        return :none
      else
        cost_limit += 1
        puts 'increasing cost limit to ' + cost_limit.to_s
      end
      puts 'nodes examined: ' + @@nodes_examined.to_s
      puts '====================================================='
      puts
    end
  end

  def self.depth_limited_search(path_so_far, cost_limit)
    node = path_so_far.last
    minimum_cost = node.h

    if minimum_cost > cost_limit
      return :none, minimum_cost
    elsif node.state == Cube::GOAL
      return path_so_far, cost_limit
    end

    next_cost_limit = Float::INFINITY
    children = node.children.sort{|child| child.h}
    children.each do |child|
      @@nodes_examined += 1
      solution, new_cost_limit = depth_limited_search(path_so_far.push(child), cost_limit)
      if solution != :none
        return solution, new_cost_limit
      end
      path_so_far.pop
      next_cost_limit = [next_cost_limit, new_cost_limit].min
    end

    return :none, next_cost_limit
  end

  def self.record_stats(start_state, solution, depth, time_taken, memory_used, nodes_examined)
   CSV.open("stats.csv", "ab") do |csv|
      csv << [Time.now, start_state, solution, depth, time_taken, memory_used, nodes_examined]
   end  
  end

end
