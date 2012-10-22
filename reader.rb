require './cube.rb'
require './encoder.rb'
require './solver.rb'

file_name = ARGV.first #We only care about the first argument
state = ""
File.open(file_name, "r") do |infile|
  while (line = infile.gets)
    state += line.strip
  end
end

Solver.solve state
