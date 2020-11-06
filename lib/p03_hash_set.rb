class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    hashed_key = key.hash
    unless self[hashed_key].include?(hashed_key)
      resize! if count > num_buckets - 2
      self[hashed_key] = hashed_key
      @count += 1
    end
  end

  def include?(key)
    hashed_key = key.hash
    self[hashed_key].include?(hashed_key)
  end

  def remove(key)
    hashed_key = key.hash
    if self[hashed_key].include?(hashed_key)
      included_in = self[hashed_key]
      ind = included_in.index(hashed_key)
      self[hashed_key].delete_at(ind)
      @count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    ind = num % num_buckets
    @store[ind]
  end

  def []= (num, val)
    ind = num % num_buckets
    @store[ind] << val
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end
