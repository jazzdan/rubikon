require './cube.rb'
require './encoder.rb'
require './heuristic.rb'
require './node.rb'
require './pq.rb'
require 'os'

module Astar

  @@nodes_examined = 1

  def self.search2(start_str)
    solution = nil
    start = Node.new(start_str, :goal, 0, :goal)
    cost_limit = start.h

    puts
    puts 'start: ' + start_str
    puts 'initial limit: ' + cost_limit.to_s
    puts '====================================================='
    puts
    t1 = Time.now

    while solution.nil?
      solution = self.depth_limited_search(start, cost_limit)
      puts 'limit depth: ' + cost_limit.to_s

      cost_limit += 1
      puts 'increasing cost limit to ' + cost_limit.to_s
      puts 'nodes examined: ' + @@nodes_examined.to_s
      puts '====================================================='
      puts
    end

    puts 'COMPLETE'
    puts '====================================================='
    puts 'solution: ' + solution.path
    puts 'steps: ' + solution.depth.to_s
    puts 'nodes examined: ' + @@nodes_examined.to_s

    t2 = Time.now
    memory_used = OS.rss_bytes
    time_taken = t2 - t1
    self.record_stats(start_str, solution.path, solution.depth, time_taken, memory_used, @@nodes_examined)
    puts 'memory used: ' + memory_used.to_s
    puts 'time taken: ' + time_taken.to_s
    puts
    return solution
  end

  def self.depth_limited_search(node, cost_limit)
    result = nil

    if node.h <= cost_limit and node.state == Cube::GOAL
      result = node
    elsif node.h <= cost_limit and node.state != Cube::GOAL
      puts 'childs: ' + node.children.length.to_s
      node.children.sort{|child| child.h}.each do |child|
        @@nodes_examined += 1
        result = self.depth_limited_search(child, cost_limit)
        break if !result.nil?
      end
    end

    return result
  end

  def self.record_stats(start_state, solution, depth, time_taken, memory_used, nodes_examined)
    Cube.execute_and_check_directions(start_state, solution) 

    CSV.open("stats.csv", "ab") do |csv|
      csv << [Time.now, start_state, solution, depth, time_taken, memory_used, nodes_examined]
    end
  end

end
