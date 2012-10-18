require 'awesome_print'

class PQ

  def add(priority, item)
    if @items[item.uid].nil?
      @items[item.uid] = item
      @list << [priority, @list.length, item.uid]
      @list.sort!
    end
    self
  end

  def empty?
    @list.empty?
  end

  def initialize
    @items = {}
    @list = []
  end

  def next
    @items.delete(@list.shift[2])
  end

end
