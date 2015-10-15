#Template Method

######behavioral design pattern

##Wiki

In computer programming, the strategy pattern (also known as the policy pattern) is a software design pattern that enables an algorithm's behavior to be selected at runtime. The strategy pattern

  - defines a family of algorithms,
  - encapsulates each algorithm
  - makes the algorithms interchangeable within that family.

Strategy lets the algorithm vary independently from clients that use it. Strategy is one of the patterns included in the influential book Design Patterns by Gamma et al. that popularized the concept of using patterns to describe software design.

For instance, a class that performs validation on incoming data may use a strategy pattern to select a validation algorithm based on the type of data, the source of the data, user choice, or other discriminating factors. These factors are not known for each case until run-time, and may require radically different validation to be performed. The validation strategies, encapsulated separately from the validating object, may be used by other validating objects in different areas of the system (or even different systems) without code duplication.

The essential requirement in the programming language is the ability to store a reference to some code in a data structure and retrieve it. This can be achieved by mechanisms such as the native function pointer, the first-class function, classes or class instances in object-oriented programming languages, or accessing the language implementation's internal storage of code via reflection.

##Class diagram for the Strategy pattern
[logo]: https://github.com/DemidenkoAndrey/Design-Pattern-in-Ruby/blob/master/strategy/class_diagram_strategy.png "Class diagram for the Strategy pattern"
![alt text][logo]

##The Strategy Pattern in the Wild

The rdoc utility, which came packaged with your Ruby distribution, contains a couple
of instances of the classic GoF class-based Strategy pattern. The purpose of rdoc
is to extract documentation from programs. Besides Ruby, rdoc can distill documentation
from C and (goodness help us!) FORTRAN programs. The rdoc utility uses the Strategy pattern to handle each of the different programming languages—there is a C parser, a Ruby parser, and a FORTRAN parser, each of which is a strategy for handling its respective input.

The rdoc utility also gives you a choice of output formats—you can choose to
output your documentation in several flavors of HTML, or in XML, or in the format
used by the Ruby-supplied ri command. As you have probably guessed, each of
these output formats is also handled by its own strategy. The relationship between
the various rdoc strategy classes is a good illustration of the typical Ruby attitude
toward inheritance.

The final strategy generates output for the Ruby ri command, which
does not resemble either XML or HTML. The classes that generate HTML, CHM, and XML will naturally share a lot of common code and, therefore, have an inheritance relationship. The RIGenerator produces
very different output and is completely unrelated to the XML/HTML family. The
rdoc code gives no thought to making all of the generators share a common superclass
simply because they need to implement the same interface. Each generator implements
the right methods, and that is the end of it.

A good example of the Proc object as a lightweight strategy object is as close at
hand as the familiar array. If you want to sort the contents of a Ruby array, you can
simply call the sort method:

```ruby
a = ['russell', 'mike', 'john', 'dan', 'rob']
a.sort
end
```

By default, sort will sort by the “natural” ordering of the objects in the array. But
what if we want to use some other ordering? For example, what if we want to sort by
the length of the strings? We simply pass in a comparison strategy—as a code block:

```ruby
a.sort { |a,b| a.length <=> b.length }
```

The sort method will call your code block each time it needs to compare two
elements in the array. Your block should return 1 if the first element is larger, 0 if they
are equal, and -1 if the second element is larger. Not so coincidentally, this is exactly
what the <=> operator does.
