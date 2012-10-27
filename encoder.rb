require './cube.rb'

module CornerEncoder

  CONVERSION = ['GRW', 'BRW', 'GRY', 'BRY', 'GOY', 'BOY', 'GOW', 'BOW']

  def self.encode(corners)
    corners.map { |corner| CONVERSION.index(corner).to_s }.join.to_i(8)
  end

  def self.encode?(state)
    begin
      self.encode(Cube.corners(state))
      return true
    rescue
      return false
    end
  end

end

module EdgeEncoder

  CONVERSION_A = ["RW", "GR", "BR", "RY", "GW", "GY", "BY", "BW", "GO"]
  CONVERSION_B = ["RY", "GW", "GY", "BY", "BW", "GO", "OY", "BO", "OW"]

  def self.encode(edges, set)
    edges.map { |edge| set.index(edge).to_s }.join.to_i(9)
  end

  def self.encodeA(edges)
    self.encode(edges.select { |k| CONVERSION_A.include?(k) }, CONVERSION_A)
  end

  def self.encodeA?(state)
    begin
      self.encodeA(Cube.edges(state))
      return true
    rescue
      return false
    end
  end

  def self.encodeB(edges)
    self.encode(edges.select { |k| CONVERSION_B.include?(k) }, CONVERSION_B)
  end

  def self.encodeB?(state)
    begin
      self.encodeB(Cube.edges(state))
      return true
    rescue
      return false
    end
  end

end
