class Trie
  def initialize
    @root = Hash.new
  end

  def build(str, val)
    node = @root
    str.each_char do |ch|
      node[ch] ||= Hash.new
      node = node[ch]
    end
    node[:val] = val
    node[:end] = true
  end

  def find(str)
    node = @root
    str.each_char do |ch|
      return nil unless node = node[ch]
    end
    return node[:end] && true ? node[:val] : nil
  end
end