class ArrayIterator
  def initialize(array)
    @array = array.dup
    @index = 0
  end

  def has_next?
    @index < @array.size
  end

  def item
    @array[@index]
  end

  def next_item
    value = item
    @index += 1
    value
  end
end
