module CornerEncoder

  CONVERSION = ['GRW', 'BRW', 'GRY', 'BRY', 'GOY', 'BOY', 'GOW', 'BOW']

  def self.encode(corners)
    begin
      Integer(corners.map { |corner| CONVERSION.index(corner).to_s }.join, 8)
    rescue
      # puts 'CornderEncoder.encode: SHIIITTT - ' + corners.to_s
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

  CONVERSION = []

  def self.encode(cube)
  end

  def self.decode(key)
  end

end

module EdgeEncoder

  CONVERSION = []

  def self.encode(edges)
  end

  def self.decode(key)
  end

end