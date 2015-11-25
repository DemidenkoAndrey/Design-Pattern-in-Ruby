# It turns out that we don’t really need for_each_element—the Array class
# sports a fine iterator method call called each. Just like our for_each_element method,
# each takes a one-parameter code block and calls that code block for each element in
# the array:
# a.each {|element| puts("The element is #{element}")}

def for_each_element(array)
  array = array.dup
  i = 0
  while i < array.length
    yield(array[i])
    i += 1
  end
end
