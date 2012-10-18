class Sharder

  TOTAL = 16_434_824
  SHARDS = 9

  def add!(key)
    if (!lookup?(key))
      @shards[shard(key)][key] = :done
      return true
    else
      return false
    end
  end

  def initialize()
    size = TOTAL / SHARDS
    @shards = Array.new()
    SHARDS.times { @shards.push(Array.new()) }
  end

  def lookup?(key)
    @shards[shard(key)][key] == :done
  end

  def shard(index)
    return index % SHARDS
  end

end
