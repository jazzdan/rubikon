require "../trie.rb"

chars = ['R', 'G', 'B', 'Y', 'O', 'W']

t = Trie.new

for i in 0..1000000
  t.build((0...45).map{ chars.to_a[rand(6)] }.join, "stuff")
  puts i
end
