module CornerEncoder

  CONVERSION = ['GRW', 'BRW', 'GRY', 'BRY', 'GOY', 'BOY', 'GOW', 'BOW']

  def self.encode(corners)
    begin
      Integer(corners.map { |corner| CONVERSION.index(corner).to_s }.join, 8)
    rescue
      puts "ENCODER: Unable to determine validity of corner cubies."
    end
  end

  def self.encode?(corners)
    begin
      Integer(corners.map { |corner| CONVERSION.index(corner).to_s }.join, 8)
      return true
    rescue
      return false
    end
  end


  def self.decode(key)
    s = key.to_s(8)
    while s.size < 8
      s = '0' + s
    end
    s.split('').map { |corner| CONVERSION[Integer(corner)] }
  end

end

module CubeEncoder

  def self.encode?(cube)
    corners = Cube.corners cube
    edges = Cube.edges cube
    
    if CornerEncoder.encode?(corners) and EdgeEncoder.encodeA?(edges) and EdgeEncoder.encodeB?(edges)
      return true
    else
      return false
    end

  end

end

module EdgeEncoder

  CONVERSION_A = ["BO", "BR", "BW", "BY", "GO", "GR"]
  CONVERSION_B = ["GR", "GW", "GY", "OW", "OY", "RW"]

  def self.encode(edges, set)
    begin
      Integer(edges.map { |edge| set.index(edge).to_s }.join, 8)
    rescue
      puts "ENCODER: Invalid edge state" + edges.to_s
    end
  end

  def self.encode?(edges, set)
    begin
      Integer(edges.map { |edge| set.index(edge).to_s }.join, 8)
      return true
    rescue
      return false
    end
  end

  def self.encodeA(edges)
    self.encode(edges.select { |k| CONVERSION_A.include?(k) }, CONVERSION_A)
  end

  def self.encodeA?(edges)
    self.encode?(edges.select { |k| CONVERSION_A.include?(k) }, CONVERSION_A)
  end

  def self.encodeB(edges)
    self.encode(edges.select { |k| CONVERSION_B.include?(k) }, CONVERSION_B)
  end

  def self.encodeB?(edges)
    self.encode?(edges.select { |k| CONVERSION_B.include?(k) }, CONVERSION_B)
  end


  def self.decode(key)
    s = key.to_s(8)
    while s.size < 8
      s = '0' + s
    end
    s.split('').map { |edge| CONVERSION[Integer(corner)] }
  end

end
