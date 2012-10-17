module Encoder

  CONVERSION = ['GRW', 'BRW', 'GRY', 'BRY', 'GOY', 'BOY', 'GOW', 'BOW']

  def self.encode(corners)
    Integer(corners.map { |corner| CONVERSION.index(corner).to_s }.join, 8)
  end

  def self.decode(key)
    s = key.to_s(8)
    while s.size < 8
      s = '0' + s
    end
    s.split('').map { |corner| CONVERSION[Integer(corner)] }
  end


end