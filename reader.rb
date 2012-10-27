require './cube.rb'
require './encoder.rb'
require './astar.rb'

file_name = ARGV.first #We only care about the first argument
state = ""
File.open(file_name, "r") do |infile|
  while (line = infile.gets)
    state += line.strip
  end
end

if CornerEncoder.encode?(state) and EdgeEncoder.encodeA?(state) and EdgeEncoder.encodeB?(state)
  Astar.search(state)
else
  puts 'invalid cube'
end
