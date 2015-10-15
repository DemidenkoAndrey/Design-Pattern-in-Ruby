#Template Method

######behavioral design pattern

##Wiki

>In the template method of this design pattern, one or more algorithm steps can be overridden by subclasses to allow differing behaviors while ensuring that the overarching algorithm is still followed.

>In object-oriented programming, first a class is created that provides the basic steps of an algorithm design. These steps are implemented using abstract methods. Later on, subclasses change the abstract methods to implement real actions. Thus the general algorithm is saved in one place but the concrete steps may be changed by the subclasses.

>The Template Method pattern thus manages the larger picture of task semantics, and more refined implementation details of selection and sequence of methods. This larger picture calls abstract and non-abstract methods for the task at hand. The non-abstract methods are completely controlled by the template method, but the abstract methods, implemented in subclasses, provide the pattern's expressive power and degree of freedom. Template Method's abstract class may also define hook methods that may be overridden by subclasses. Some or all of the abstract methods can be specialized in a subclass, allowing the writer of the subclass to provide particular behavior with minimal modifications to the larger semantics. The template method (that is non-abstract) remains unchanged in this pattern, ensuring that the subordinate non-abstract methods and abstract methods are called in the originally intended sequence.

>The Template Method pattern occurs frequently, at least in its simplest case, where a method calls only one abstract method, with object oriented languages. If a software writer uses a polymorphic method at all, this design pattern may be a rather natural consequence. This is because a method calling an abstract or polymorphic function is simply the reason for being of the abstract or polymorphic method. The Template Method pattern may be used to add immediate present value to the software or with a vision to enhancements in the future. It is strongly related to the Non-Virtual Interface (NVI) pattern.

>The Template Method pattern implements the Protected Variations GRASP principle, like the Adapter pattern does. The difference is that Adapter gives the same interface for several operations, while Template Method does so only for one.

##Class diagram for the Template Method pattern
[logo]: https://github.com/DemidenkoAndrey/Design-Pattern-in-Ruby/blob/master/template_method/class_diagram_template_method.png "Class diagram for the Template Method pattern"
![alt text][logo]

##Templates in the Wild

You can find a classic example of the Template Method pattern in WEBrick, the lightweight,
all-Ruby library for building TCP/IP servers. A key part of WEBrick is the
GenericServer class, which implements all of the details of being a network server. Of
course, GenericServer has no idea what you want to actually accomplish in your server.
Thus, to use GenericServer, you simply extend it and override the run method:

```ruby
require 'webrick'
class HelloServer < WEBrick::GenericServer
def run(socket)
socket.print('Hello TCP/IP world')
end
end
```

The template method buried inside GenericServer contains all the code for listening
on a TCP/IP port, accepting new connections, and cleaning up when a connection is
broken. And right in the middle of all that code, right when it has its hands on a new
connection, it calls your run method.

There is another very common example of the Template Method pattern that is
perhaps so pervasive that it is hard to see. Think about the initialize method that
we use to set up our objects. All we know about initialize is that it is called sometime
toward the end of the process of creating a new object instance and that it is a
method that we can override in our class to do any specific initialization. Sounds like
a hook method to me.
