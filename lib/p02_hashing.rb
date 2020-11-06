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
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
