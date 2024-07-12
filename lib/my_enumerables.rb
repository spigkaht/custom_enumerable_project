module Enumerable
  # Your code goes here
  def my_all?
    if block_given?
      for elem in self do
        return false if !yield(elem)
      end
      return true
    else
      for elem in self do
        return false if !elem
      end
      return true
    end
  end

  def my_any?
    if block_given?
      for elem in self do
        return true if yield(elem)
      end
      return false
    else
      for elem in self do
        return true if elem
      end
    end
  end

  def my_count
    counter = 0
    if block_given?
      for elem in self do
        counter += 1 if yield(elem)
      end
      return counter
    else
      return self.length
    end
  end

  def my_each_with_index
    if block_given?
      counter = 0
      for elem in self do
        yield(elem, counter)
        counter += 1
      end
    else
      return self
    end
  end

  def my_inject(accumulator = 0)
    self.my_each do |elem|
      accumulator = yield(accumulator, elem)
    end
    accumulator
  end

  def my_map
    array = []
    for elem in self do
      array << yield(elem)
    end
    array
  end

  def my_none?
    if block_given?
      for elem in self do
        return false if yield(elem)
      end
      return true
    else
      for elem in self do
        return false if elem
      end
    end
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for elem in self do
      yield(elem)
    end
  end
end

# p [1, 2, 3, 4].my_inject(:+)
