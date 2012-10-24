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

  CONVERSION = ["RW", "GR", "BR", "RY", "GW", "GY", "BY", "BW", "GO", "OY", "BO", "OW"]

  def self.encode(edges)
    begin
      Integer(edges.map { |edge| CONVERSION.index(edge).to_s(12) }.join, 12)
    rescue
      puts "ENCODER: Invalid edge state" + edges.to_s
    end
  end

  def self.encode?(edges)
    begin
      Integer(edges.map { |edge| CONVERSION.index(edge).to_s }.join, 8)
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
    s.split('').map { |edge| CONVERSION[Integer(corner)] }
  end

end
