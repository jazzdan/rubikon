require './cube.rb'
require './encoder.rb'
require './heuristic.rb'
require './node.rb'
require './pq.rb'
require 'os'

module Astar

  @@nodes_examined = 1
  @@counts = {}

  def self.search2(start_str)
    t1 = Time.now

    solution = nil
    start = Node.new(start_str, :goal, 0, :goal)
    limit = start.h

    puts
    puts 'start: ' + start_str
    puts 'limit: ' + limit.to_s
    puts '====================================================='
    puts

    solution = self.depth_limited_search(start, limit)
    while solution.nil?
      limit += 1
      puts 'nodes: ' + @@nodes_examined.to_s
      puts 'increasing cost limit to ' + limit.to_s
      puts '====================================================='
      puts
      solution = self.depth_limited_search(start, limit)
    end

    puts '==================== COMPLETE ======================='
    puts ' solution: ' + solution.path
    puts '    steps: ' + solution.depth.to_s
    puts '        h: ' + solution.h.to_s
    puts '    nodes: ' + @@nodes_examined.to_s

    t2 = Time.now
    memory_used = OS.rss_bytes
    time_taken = t2 - t1
    self.record_stats(start_str, solution.path, solution.depth, time_taken, memory_used, @@nodes_examined)
    puts '  memory: ' + memory_used.to_s
    puts '    time: ' + time_taken.to_s
    puts
    puts @@counts.to_s
    return solution
  end

  def self.depth_limited_search(node, cost_limit)
    result = nil

    if node.state == Cube::GOAL
      result = node
    elsif node.h <= cost_limit
      if !@@counts[node.depth + 1].nil?
        @@counts[node.depth + 1] += node.children.length
      else
        @@counts[node.depth + 1] = node.children.length
      end

      node.children.sort{|child| child.h}.each do |child|
        @@nodes_examined += 1
        result = self.depth_limited_search(child, cost_limit)
        break if !result.nil?
      end
    end

    return result
  end

  def self.record_stats(start_state, solution, depth, time_taken, memory_used, nodes_examined)
    verified = Cube.execute_and_check_directions(start_state, solution).to_s

    CSV.open("stats.csv", "ab") do |csv|
      csv << [Time.now, start_state, solution, verified, depth, time_taken, memory_used, nodes_examined]
    end
  end

end
