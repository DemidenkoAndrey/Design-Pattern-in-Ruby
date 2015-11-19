#Disign Patterns in Ruby
##Five Main Points

1. Separate out the things that change from thouse that stay the same.

    - promotes DRY code
    - improves maintainability

2. Program to an interface, not an implementation.

   Code should belong to the most general object possible, and specific classes should inherit from the general class.
    - increases modularity

3. Prefer composition over inheritance

  Avoid saying that an object is a kind of something and instead say that it has something. In other words, it's often better to reference other classes or modules than to put functionality in superclasses.

    - increases encapsulation
    - increases modularity, implementations can be easily swapped

4. Delegate, delegate, delegate Let other classes handle functionality within their domain

5. You ain't gonna need it (Russ Olsen's addition)
   Don't implement features or design in flexibility that you don't immediately need because you will probably never need it.

***

##Design Patterns

###[Template Method](https://github.com/DemidenkoAndrey/Design-Pattern-in-Ruby/tree/master/template_method)

######behavioral design pattern

1. Create a **skeletal class** with methods that are common between algorithms.

2. Create a **subclass** for each algorithm and override the common methods from the skeletal class.

Disadvantages:

  - no runtime flexibility

***

###[Strategy](https://github.com/DemidenkoAndrey/Design-Pattern-in-Ruby/tree/master/strategy)

######behavioral design pattern

The basic idea is to **delegate tasks to encapsulated algorithms which are interchangable at runtime**.

In the Strategy pattern we have an object (the context) that is trying to get something done. But to get that thing done, we need to supply the context with a second object, called the strategy, that helps get the thing done.

1. Define a family of objects which all do the same thing (ex: format output, generate graphics etc.).
2. Ensure the family of objects share the same interface so that they are interchangable.
There are two strategies to passing data from the context object to the strategy object. We can pass the data as paramaters when the strategy is called, or we can pass the context object as the single parameter.

If the strategies are very simple and have only one method, we can even use code blocks for our algorithms and simply use *block.call*. However, if multiple methods are needed, the strategies must be structured as separate classes.

Advantages:

- algorithms are interchangable at runtime
- promotes modularity

***

###[Observer](https://github.com/DemidenkoAndrey/Design-Pattern-in-Ruby/tree/master/observer)

######behavioral design pattern

The Observer pattern (also known as publish/subscribe) provides a simple mechanism for one object to inform a set of interested third-party objects when its state changes.

An object, called the **subject**, maintains a list of its dependents, called **observers**, and notifies them automatically of any state changes, usually by calling one of their methods.

The Ruby Standard Library includes an [Observable](http://ruby-doc.org/stdlib-2.2.3/libdoc/observer/rdoc/Observable.html) module that implements this pattern.

####Push and Pull

In the default implementation, the notification sent to the observer doesn't specify which of the Subjects attributes has changed. To find out which attribute has changed, the Observer has to check the Subjects attributes, this is the *pull* method.

Another approach would be the *push* method where the notification includes other attributes which provide the Observer with additional information like the examples below.

```ruby

observer.update(self, :salary_changed)
observer.update(self, :salary_changed, old_salary, new_salary)

```

An observer may only need to know when a specific attribute of the subject changes. The simple implementation would notify the observer when any attribute changes.
