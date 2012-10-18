class PQ

  def add(priority, item)
    @list << [priority, @list.length, item]
    @list.sort!
    self
  end

  def empty?
    @list.empty?
  end

  def initialize
    @list = []
  end

  def next
    @list.shift[2]
  end

end
