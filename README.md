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

***

###[Composite](https://github.com/DemidenkoAndrey/Design-Pattern-in-Ruby/tree/master/composite)

######structural design pattern

The composite design pattern(*the sum acts like one of the parts*) is a structural pattern used to represent objects that have a **hierarchical tree structure**. It allows for the uniform treatment of both individual leaf nodes and of branches composed of many nodes.

The implementation in the book is inflexible and doesn't allow Tasks to be dynamically created and doesn't allow dynamically splitting tasks into subtasks. To subdivide a task into multiple subtasks, the class of the leaf Task must be changed to a CompositeTask before children can be added. A better solution would be to use a single Node class for both leaves and internal nodes. With this implementation, leaf nodes can have children added without the need to change it's class.

For a specific implementation, you can simply inherit from the Node class and extend it with any additional functions you may need.

***

###[Iterator](https://github.com/DemidenkoAndrey/Design-Pattern-in-Ruby/tree/master/iterator)

######behavioral design pattern

Provide a way to access the elements of an aggregate object sequentially without exposing its underlying representation

In other words, an Iterator provides the outside world with a sort of movable
pointer into the objects stored inside an otherwise opaque aggregate object.

####External iterator

The iteration logic is contained in a separate class. The iteration class can be generalized to handle multiple object types as long as they allow indexing.

External iterator require the additional class to do the actual iterating, but they do allow for greater flexibility because you can control the iteration, which elements are iterated over and in what order.

####Internal iterator

All the iterating logic occurs inside the aggregate object. Use a code block to pass your logic into the aggregate which then calls the block for each of it's elements.

```ruby

array = [10, 20, 30]
array.each {|element| puts("The element is #{element}")}

```

####Enumerable Module

Ruby includes an [Enumerator module](http://ruby-doc.org/core/Enumerable.html)

>The Enumerable mixin provides collection classes with several traversal and searching methods, and with the ability to sort. The class must provide a method each, which yields successive members of the collection. If Enumerable#max, #min, or #sort is used, the objects in the collection must also implement a meaningful <=> operator, as these methods rely on an ordering between members of the collection.

***

###[Command](https://github.com/DemidenkoAndrey/Design-Pattern-in-Ruby/tree/master/command)

######behavioral design pattern

The command pattern is a behavior design pattern used to store the information necessary to call methods at a future time.


###Uses

Command objects are useful for implementing:

**GUI buttons and menu items**

In Swing and Borland Delphi programming, an Action is a command object. In addition to the ability to perform the desired command, an Action may have an associated icon, keyboard shortcut, tooltip text, and so on. A toolbar button or menu item component may be completely initialized using only the Action object.

**Macro recording**

If all user actions are represented by command objects, a program can record a sequence of actions simply by keeping a list of the command objects as they are executed. It can then "play back" the same actions by executing the same command objects again in sequence. If the program embeds a scripting engine, each command object can implement a toScript() method, and user actions can then be easily recorded as scripts.

**Mobile Code**

Using languages such as Java where code can be streamed/slurped from one location to another via URLClassloaders and Codebases the commands can enable new behavior to be delivered to remote locations (EJB Command, Master Worker)

**Multi-level undo**

If all user actions in a program are implemented as command objects, the program can keep a stack of the most recently executed commands. When the user wants to undo a command, the program simply pops the most recent command object and executes its undo() method.

**Networking**

It is possible to send whole command objects across the network to be executed on the other machines, for example player actions in computer games.

**Parallel Processing**

Where the commands are written as tasks to a shared resource and executed by many threads in parallel (possibly on remote machines -this variant is often referred to as the Master/Worker pattern)

**Progress bars**

Suppose a program has a sequence of commands that it executes in order. If each command object has a getEstimatedDuration() method, the program can easily estimate the total duration. It can show a progress bar that meaningfully reflects how close the program is to completing all the tasks.

**Thread pools**

A typical, general-purpose thread pool class might have a public addTask() method that adds a work item to an internal queue of tasks waiting to be done. It maintains a pool of threads that execute commands from the queue. The items in the queue are command objects. Typically these objects implement a common interface such as java.lang.Runnable that allows the thread pool to execute the command even though the thread pool class itself was written without any knowledge of the specific tasks for which it would be used.

**Transactional behavior**

Similar to undo, a database engine or software installer may keep a list of operations that have been or will be performed. Should one of them fail, all others can be reversed or discarded (usually called rollback). For example, if two database tables that refer to each other must be updated, and the second update fails, the transaction can be rolled back, so that the first table does not now contain an invalid reference.

**Wizards**

Often a wizard presents several pages of configuration for a single action that happens only when the user clicks the "Finish" button on the last page. In these cases, a natural way to separate user interface code from application code is to implement the wizard using a command object. The command object is created when the wizard is first displayed. Each wizard page stores its GUI changes in the command object, so the object is populated as the user progresses. "Finish" simply triggers a call to execute(). This way, the command class will work.

***

###[Adapter](https://github.com/DemidenkoAndrey/Design-Pattern-in-Ruby/tree/master/adapter)

######structural design pattern

Convert the interface of a class into another interface clients expect. An adapter lets classes work together that could not otherwise because of incompatible interfaces.

Ruby allows for classes to be modified at runtime. Consequently, rather than create an adapter to modify a classes API, we can simply modify the class at runtime to add or alter methods.

Alternatively, Ruby also allows the runtime modification of individual instances.

Modifying instances or classes at run-time is advisable only when:

- The modifications are simple
- You understand the class you're modifying well and are sure your changes wont break things.

If either of these points aren't true, it's probably better to create a separate adapter.
