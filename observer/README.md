#Observer

######behavioral design pattern

##Wiki

The observer pattern is a software design pattern in which an object, called the subject, maintains a list of its dependents, called observers, and notifies them automatically of any state changes, usually by calling one of their methods. It is mainly used to implement distributed event handling systems. The Observer pattern is also a key part in the familiar model–view–controller (MVC) architectural pattern. The observer pattern is implemented in numerous programming libraries and systems, including almost all GUI toolkits.

The observer pattern can cause memory leaks, known as the lapsed listener problem, because in basic implementation it requires both explicit registration and explicit deregistration, as in the dispose pattern, because the subject holds strong references to the observers, keeping them alive. This can be prevented by the subject holding weak references to the observers.

##Class diagram for the Observer pattern
[logo]: https://github.com/DemidenkoAndrey/Design-Pattern-in-Ruby/blob/master/observer/class_diagram_observer.png "Class diagram for the Observer pattern"
![alt text][logo]
