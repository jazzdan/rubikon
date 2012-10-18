class Node

  @@uid = 0

  def children
    if @children.nil?
      getChildren()
    end
    @children
  end

  def getChildren
    @children = []
    Cube::FACES.keys.each do |face|
      state = Cube.rotateClockwise(@state, face)
      @children.push Node.new(state, self)

      state = Cube.rotateClockwise(Cube.rotateClockwise(state, face), face)
      @children.push Node.new(state, self)
    end
  end

  def h(g)
    g + Heuristic.fetch(@state)
  end

  def key
    corner = CornerEncoder.encode(Cube.corners(@state)).to_s
    edge_a = EdgeEncoder.encodeA(Cube.edges(@state)).to_s
    edge_b = EdgeEncoder.encodeB(Cube.edges(@state)).to_s
    return (corner + edge_a + edge_b).to_i
  end

  def initialize(state, parent)
    @children = nil
    @parent = parent
    @state = state
    @uid = @@uid
    @@uid += 1
  end

  def parent
    @parent
  end

  def state
    @state
  end

  def uid
    @uid
  end

end
