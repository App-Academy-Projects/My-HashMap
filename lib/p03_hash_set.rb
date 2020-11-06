class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
  end

  def include?(key)
  end

  def remove(key)
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
