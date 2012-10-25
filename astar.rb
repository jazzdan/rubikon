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

    puts
    puts 'start: ' + start_str
    puts 'initial limit: ' + cost_limit.to_s
    puts '====================================================='
    puts
    t1 = Time.now

    while true
      solution = self.depth_limited_search(start, cost_limit)
      puts 'limit depth: ' + cost_limit.to_s

      if !solution.nil?
        t2 = Time.now
        memory_used = OS.rss_bytes
        time_taken = t2 - t1
        puts 'COMPLETE'
        puts '====================================================='
        print 'solution: '
        print solution.path
        puts
        puts 'steps: ' + solution.depth.to_s
        puts 'nodes examined: ' + @@nodes_examined.to_s
        puts 'memory used: ' + memory_used.to_s
        puts 'time taken: ' + time_taken.to_s
        self.record_stats(start_str, solution.path, solution.depth, time_taken, memory_used, @@nodes_examined)
        return solution
      else
        cost_limit += 1
        puts 'increasing cost limit to ' + cost_limit.to_s
      end
      puts 'nodes examined: ' + @@nodes_examined.to_s
      puts '====================================================='
      puts
    end
  end

  def self.depth_limited_search(node, cost_limit)
    result = nil

    if node.h <= cost_limit and node.state == Cube::GOAL
      result = node
    elsif node.h <= cost_limit and node.state != Cube::GOAL
      node.children.sort{|child| child.h}.each do |child|
        @@nodes_examined += 1
        result = depth_limited_search(child, cost_limit)
        break if !result.nil?
      end
    end

    return result
  end

  def self.record_stats(start_state, solution, depth, time_taken, memory_used, nodes_examined)
   CSV.open("stats.csv", "ab") do |csv|
      csv << [Time.now, start_state, solution, depth, time_taken, memory_used, nodes_examined]
   end  
  end

end
