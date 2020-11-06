class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    return 0.hash if self.empty?
    cur_hash = self[0].hash
    self.each_with_index do |el, i|
      cur_hash = el.hash ^ self[i-1].hash if i > 0
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
