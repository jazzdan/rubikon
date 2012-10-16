require "../trie.rb"

chars = ['R', 'G', 'B', 'Y', 'O', 'W']

t = {}

for i in 0..10000000
  t[(0...45).map{ chars.to_a[rand(6)] }.join] = 1000
  puts i
end
