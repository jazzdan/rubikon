class Sharder

  TOTAL = 16_434_824
  SHARDS = 9

  def add!(key, val=:done)
    if (!lookup?(key))
      @shards[shard(key)][key] = val
      return true
    else
      return false
    end
  end

  def get(key)
    @shards[shard(key)][key]
  end

  def initialize()
    @shards = {}
    (0..SHARDS).each { |i| @shards[i] = {} }
  end

  def lookup?(key)
    !@shards[shard(key)][key].nil?
  end

  def shard(index)
    return index % SHARDS
  end

end
