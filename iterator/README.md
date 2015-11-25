#Iterator Method

######behavioral design pattern

##Wiki

In object-oriented programming, the iterator pattern is a design pattern in which an iterator is used to traverse a container and access the container's elements. The iterator pattern decouples algorithms from containers; in some cases, algorithms are necessarily container-specific and thus cannot be decoupled.

For example, the hypothetical algorithm SearchForElement can be implemented generally using a specified type of iterator rather than implementing it as a container-specific algorithm. This allows SearchForElement to be used on any container that supports the required type of iterator.

The essence of the Iterator Factory method Pattern is to "Provide a way to access the elements of an aggregate object sequentially without exposing its underlying representation."

##The Iterator Pattern in the Wild

Iterators—mostly internal but occasionally external—are so common in Ruby that it
is hard to know where to start. Ruby arrays actually have two other internal iterators
beside `each`: `reverse_each` cycles through the array elements from the end of the
array to the beginning, while `each_index` calls the block passed in with each index
in the array instead of each element.
The `String` class has an each method that cycles through each line (yes, each
line, not each character) in the string as well as each_byte. Strings also have a wonderful
scan method, which takes a regular expression and iterates over each match
that is found in the string. For example, we might search for all words that begin with
the letter 'p' in a well-known tongue twister:

```ruby

s = 'Peter Piper picked a peck of pickled peppers'
s.scan(/[Pp]\w*/) { |word| puts("The word is #{word}") }

```

External iterators are harder to find in Ruby, but the IO object presents an interesting
example. The IO class is the base class for input and output streams. The neat
thing about the IO object is that it is amphibious—it does both internal and external
iterators. You can open a file and read each line in a very traditional style by using the
open file handle as an external iterator:

```ruby

File.open('names.txt') do |f|
  while !f.eof?
    puts(f.readline)
  end
end

```
