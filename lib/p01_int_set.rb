class MaxIntSet
  attr_reader :store
  def initialize(max)
    @max_len = max
    @store = Array.new(max, false)
  end

  def insert(num)
    @store[num] = true if validate!(num)
  end

  def remove(num)
    @store[num] = false if validate!(num)
  end

  def include?(num)
    @store[num] == true if validate!(num)
  end

  private

  def is_valid?(num)
    num.is_a?(Integer)
  end

  def validate!(num)
    raise "#{num} Is not a valid integer" unless is_valid?(num)
    raise "Out of bounds" unless num.between?(0, @max_len-1)
    true
  end
end


class IntSet
  attr_reader :store, :num_buckets
  def initialize(num_buckets = 20)
    @num_buckets = num_buckets
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] = num unless self[num].include?(num)
  end

  def remove(num)
    included_in = self[num]
    ind = included_in.index(num)
    self[num].delete_at(ind)
  end

  def include?(num)
    self[num].include?(num)
  end

  private
  attr_writer :store
  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    ind = num % num_buckets
    store[ind]
  end

  def []= (num, val)
    ind = num % num_buckets
    store[ind] << val
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    unless self[num].include?(num)
      resize! if count > num_buckets - 2
      self[num] = num
      @count += 1
    end
  end

  def remove(num)
    if self[num].include?(num)
      included_in = self[num]
      ind = included_in.index(num)
      self[num].delete_at(ind)
      @count -= 1
    end
  end

  def include?(num)
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
