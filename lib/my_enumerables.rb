module Enumerable
  # Your code goes here
  def my_each_with_index
    index = 0
    my_each do |element|
      yield(element, index)
      index += 1
    end
  end

  def my_select
    result = self.class.new
    my_each do |element|
      result << element if yield(element)
    end
    result
  end

  def my_all?
    my_each do |element|
      return false unless yield(element)
    end
    true
  end

  def my_none?
    my_each do |element|
      return false if yield(element)
    end
    true
  end

  def my_count
    res = length
    if block_given?
      my_each do |element|
        res -= 1 unless yield(element)
      end
    end
    res
  end

  def my_map
    res = self.class.new
    my_each do |element|
      res << yield(element)
    end
    res
  end

  def my_inject(acc)
    my_each do |element|
      acc = yield(acc, element)
    end
    acc
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    length.times do |i|
      yield(self[i])
    end
    self
  end
end
