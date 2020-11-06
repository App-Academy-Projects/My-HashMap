class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    return 0.hash if self.empty?
    cur_hash = self[0].hash
    if self.length > 1
      self.each do |el|
        cur_hash ^= el.hash
      end
    end
    cur_hash
  end
end

class String
  def hash
    int_arr = self.to_int_arr
    int_arr.hash
  end
  
  def to_int_arr
    arr = self.chars
    int_arr = []
    arr.each do |ch|
      ascci = ch.ord
      int_arr << ascci
    end
    int_arr
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.to_a.sort.hash
  end
end
