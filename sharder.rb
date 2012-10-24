class Sharder

  def add!(key)
    if (!lookup?(key))
      @shards[shard(key)][key] = :done
      return true
    else
      return false
    end
  end

  def initialize(shard_count=10)
    @shard_count = shard_count - 1
    @shards = {}
    (0..@shard_count).each { |i| @shards[i] = {} }
  end

  def lookup?(key)
    @shards[shard(key)][key] == :done
  end

  def shard(index)
    return index % @shard_count
  end

end
