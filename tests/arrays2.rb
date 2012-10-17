
arr = []

for i in 0..90000000
  index = Integer((0..54).map { (Random.rand(11) * 6).round.to_s }.join)
  puts i.to_s + ', ' + index.to_s
  arr[index] = 11
end