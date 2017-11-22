#### What is the difference between a lambda, a block and a proc?
#### How do you sort an Array of objects by a particular attribute?
##### What is a better way to do sorting with ActiveRecord?
#### What are some of your favorite gems? What are their alternatives?
#### In Ruby, which is generally the better option: a recursive function or an iterative one?
#### What are #method_missing and #send? Why are they useful?
#### What are the various Ruby runtimes, and how are they different?
#### What is a class?
Classes are a blue-print for constructing computer models for real or virtual objects.
Classes hold **data**, have **methods** that interact with that data, and are used to **instantiate objects**.

#### What is the difference between class and superclass?

#### What is an object?
An instance of a class.
To some, it's also the root class in ruby (Object).
Classes themselves descend from the Object root class. (Kudos to Ezra)
```
irb(main):003:0> Array
Array < Object
irb(main):004:0> Array.superclass
Object < BasicObject
irb(main):005:0> Array.superclass.superclass
BasicObject
irb(main):006:0> Array.superclass.superclass.superclass
nil
irb(main):007:0>
```

##### What is a module?
##### Can you tell me the difference between classes and modules?
##### Reasons to use modules ?

serve as namespaces
```ruby
module ANamespace
  class AClass
    def initialize
      puts "Another object, coming right up!"
    end
  end
end

ANamespace::AClass.new
 #=> Another object, coming right up!
```

Also, modules provide as a mechanism for multiple inheritance via **mix-ins** and **cannot be instantiated** like classes can.

```ruby
module AMixIn
  def who_am_i?
    puts "An existentialist, that's who."
  end
end

# String is already the parent class
class DeepString < String
  # extend adds instance methods from AMixIn as class methods
  extend AMixIn
end

DeepString.who_am_i?
 #=> An existentialist, that's who.

AMixIn.new
 #=> NoMethodError: undefined method ‘new’ for AMixIn:Module
```
What are the different uses of Ruby modules? Could you provide an example of each and explain why it is valuable?
(Question provided by anonymous Codementor)

Traits/Mixins:
Examples: Mappable, Renderable, Movable
Traits/Mixins is a useful alternative to class inheritance when there is a need to acquire behavior that describes a trait (e.g. Renderable) instead of an is-a relationship (e.g. Vehicle), especially when there is a need for multiple traits since a class can only inherit once.
Namespace:
Examples: Graphics, Devise, Finance
Namespace Ruby classes and modules to avoid naming clashes with similarly-named classes/modules from libraries
Singleton class alternative:
Examples: Application, Universe, Game
Modules cannot be instantiated, therefore they can be used as an easy alternative to singleton classes to represent only one instance of a domain model via module methods (equivalent of class methods)
Bag of stateless helper methods:
Examples: Helpers, Math, Physics
Stateless helper methods receive their data via arguments without needing a class to be instantiated nor keep any state (e.g. calculate_interest(amount, rate_per_year, period)), so a module is used instead for holding a bag of stateless helper methods.

#### Can you tell me the three levels of method access control for classes and modules?  What do they imply about the method?

**All methods**, no matter the access control, can be **accessed within the class**.  But what about outside callers?

_Public_ methods enforce **no access control** -- they can be called in any scope.

_Protected_ methods are only accessible to **other objects of the same class**.

_Private_ methods are only accessible within the **context of the current object**.

```ruby
class AccessLevel
  def something_interesting
    another = AccessLevel.new
    another.public_method
    another.protected_method
    another.private_method
  end

  def public_method
    puts "Public method. Nice to meet you."
  end

  protected

  def protected_method
    puts "Protected method. Sweet!"
  end

  private

  def private_method
    puts "Incoming exception!"
  end
end

AccessLevel.new.something_interesting
 #=> Public method.  Nice to meet you.
 #=> Protected method.  Sweet!
 #=> NoMethodError: private method ‘private_method’ called for
 #=>  #<AccessLevel:0x898c8>
```

#### There are three ways to invoke a method in ruby.  Can you give me at least two?

- **dot operator** (or period operator)
- the **Object#send** method
- **method(:foo).call**

```ruby
object = Object.new
puts object.object_id
 #=> 282660

puts object.send(:object_id)
 #=> 282660

puts object.method(:object_id).call
 #=> 282660
```

#### Explain this ruby idiom: a ||= b
A common idiom that strong ruby developers use all the time.

```ruby
# a = b when a == false
# otherwise a remains unchanged
a || a = b # (Kudos to Markus Prinz)
```

```ruby
a = 1
b = 2
a ||= b #=> a = 1
```

```ruby
a = nil
b = 2
a ||= b #=> a = 2
```

```ruby
a = false
b = 2
a ||= b #=> a = 2
```

#### What does self mean?
`self` _always_ refers to the current object.  But this question is more difficult than it seems because **Classes are also objects** in ruby.

```ruby
class WhatIsSelf
  def test
    puts "At the instance level, self is #{self}"
  end

  def self.test
    puts "At the class level, self is #{self}"
  end
end

WhatIsSelf.test
 #=> At the class level, self is WhatIsSelf

WhatIsSelf.new.test
 #=> At the instance level, self is #<WhatIsSelf:0x28190>
```

This short snippet indicates two things:

- at the _class level_, self is the **class**, in this case WhatIsSelf.
- at the _instance level_, self is the **instance in context**, in this case the instance of WhatIsSelf at memory location 0x28190.

#### What is a Proc?
Everyone usually confuses procs with blocks, but the strongest rubyist can grok the true meaning of the question.

Essentially, Procs are **anonymous methods** (or nameless functions) containing code. They can be placed inside a variable and **passed around** like any other object or scalar value. They are created by **Proc.new**, **lambda**, and **blocks** (invoked by the yield keyword).

**Note:** Procs and lambdas do have subtle, but important, [differences](http://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Method_Calls#Understanding_blocks.2C_Procs_and_methods) in ruby v1.8.6.  However, I wouldn't expect a candidate talk about these nitty-gritty details during an interview. (Kudos to Noah Thorp)

```ruby
# wants a proc, a lambda, AND a block
def three_ways(proc, lambda, &block)
  proc.call
  lambda.call
  yield # like block.call
  puts "#{proc.inspect} #{lambda.inspect} #{block.inspect}"
end

anonymous = Proc.new { puts "I'm a Proc for sure." }
nameless  = lambda { puts "But what about me?" }

three_ways(anonymous, nameless) do
  puts "I'm a block, but could it be???"
end
 #=> I'm a Proc for sure.
 #=> But what about me?
 #=> I'm a block, but could it be???
 #=> #<Proc:0x00089d64> #<Proc:0x00089c74> #<Proc:0x00089b34>
```

#### What is unit testing (in classical terms)?  What is the primary technique when writing a test?
Unit testing, simply put, is testing methods -- the smallest unit in object-oriented programming. It allows a developer to flesh out API before it's consumed by other systems in the application.
The primary way to achieve this is to **assert** that the **actual** result of the method matches an **expected** result.

```ruby
require "test/unit"

class Brokened
  def uh_oh
    "I needs fixing"
  end
end

class BrokenedTest < Test::Unit::TestCase
  def test_uh_oh
    actual = Brokened.new
    assert_equal("I'm all better!", actual.uh_oh)
  end
end
 #=> Started
 #=> F
 #=> Finished in 0.663831 seconds.
 #=>
 #=>   1) Failure:
 #=> test_uh_oh:11
 #=> <"I'm all better!"> expected but was
 #=> <"I needs fixing">.
 #=>
 #=> 1 tests, 1 assertions, 1 failures, 0 errors
```

#### What are rubygems?  Any favorites not including rails?  Any that you've worked on personally?
[rubygems](http://www.rubygems.org/) is package manager software for ruby libraries (i.e. gems).  The package manager has basic [CRUD](http://en.wikipedia.org/wiki/Create,_read,_update_and_delete) operations, dependency trees, and supports asynchronous communication between multiple gem servers.



### Lambda
Despite the fancy name, a lambda is just a **function**... peculiarly... without a name. They're **anonymous**, little functional spies sneaking into the rest of your code.

Lambdas in Ruby are also objects, just like everything else! The last expression of a lambda is its return value, just like regular functions. As boring and familiar as that all sounds, it gives us a lot of power.

As objects, lambdas have methods and can be assigned to variables. Let's try it!

```
l = lambda { "Do or do not" }
puts l.call
```

```
l = lambda do |string|
  if string == "try"
    return "There's no such thing"
  else
    return "Do or do not."
  end
end
puts l.call("try") # Feel free to experiment with this
```

### Blocks

A simpler way to describe blocks is “A block is code that you can store in a variable like any other object and run on demand.”

```
addition = lambda {|a, b| return a + b }
puts addition.call(5, 6)
```

The `lambda` keyword is what is most commonly used to create a block in Ruby. There are other ways to do it, but lets keep things simple for now.

```
empty_block = lambda { }
puts empty_block.object_id
puts empty_block.class
puts empty_block.class.superclass
```
gives us

```
23659940
Proc
Object
```

Another example

```
class Calculator
  def add(a, b)
    return a + b
  end
end

addition_method = Calculator.new.method("add")
addition =  addition_method.to_proc

puts addition.call(5, 6)
```
And there you have it - a regular, old fashioned method converted to a fancy-pants block!

### Lambda vs Blocks

```
puts lambda {}
puts Proc.new {}
```

As you can see, both approaches produce an instance of a Proc, though the one created using lambda is clearly distinguished with the word `lambda` in parentheses - an unusual deviation from the norm.

**Here’s an example that uses lambdas - the return within the block hands control back to the method.**


```
def a_method
 lambda { return "we just returned from the block" }.call
 return "we just returned from the calling method"
end
```

```
we just returned from the calling method
```

**Here’s one that uses Proc.new - the return within the block exits not just the block itself, but also the surrounding method.**

```
def a_method
 Proc.new { return "we just returned from the block" }.call
 return "we just returned from the calling method"
end
```

```
we just returned from the block
```

As a consequence, `Proc.new` is something that’s hardly ever used to explicitly create blocks because of these surprising return semantics. It is recommended that you avoid using this form unless absolutely necessary

### Literal way of writing Lambda & Proc

```
short = ->(a, b) { a + b }
puts short.call(2, 3)

long = lambda { |a, b| a + b }
puts long.call(2, 3)
```

```
short = proc { |a, b| a + b }
puts short.call(2, 3)

long = Proc.new { |a, b| a + b }
puts long.call(2, 3)
```

### How would you declare and use a constructor in Ruby?
Constructors are declared via the initialize method and get called when you call on a new object to be created.

Using the code snippet below, calling Order.new acts as a constructor for an object of the class Order.

```
class Human
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end
```
### How does a symbol differ from a string?
Short answer: symbols are immutable and reusable, retaining the same object_id.

### How and when would you declare a Global Variable?
Global variables are declared with the ‘$’ symbol and can be declared and used anywhere within your program. You should use them sparingly to never.

### How would you create getter and setter methods in Ruby?
- attr_accessor creates getter and setter
- attr_reader creates getter
- attr_writer creates setter
- or you can use usual methods to set and get instance variables

### Describe the difference between class and instance variables?
- Class variables are created with the prefix ‘@@’ and are shared by all objects in a class.
  Considered a 'big no no'.
- Instance variables are created with the prefix ‘@’ and belong to a single object within a class.

### Explain some of the looping structures available in Ruby?
For loop, While loop, Until Loop, do.

###Explain what functional testing is:

Functional testing in Rails allows you to test the response of  various actions contained in a controller. Using the Rails default test library, mini test, functional tests use a collection of assert statements that will tell your testing library to expect a certain response based on a control request passed in (either a get, post, patch, put, head, delete request).

The two example tests below show functional tests for making sure the post and delete requests in our UsersController properly create and destroy users. The functional tests do this by making sure the requests result in a change in the User.count and that they then redirect to the desired pages.

![image](http://cdn.skilledup.com/wp-content/uploads/2014/10/RoR_QA_funtional_tests-screenshot.jpg)

### Inject
Combines all elements of enum by applying a binary operation, specified by a block or a symbol that names a method or operator.

```
>> (1..3).inject { |sum,  memo| sum + memo }
6
>> (1..3).inject { |sum,  memo| sum * memo }
6
```

### Map
```
(1..4).map { |i| i*i }      #=> [1, 4, 9, 16]
(1..4).collect { "cat"  }   #=> ["cat", "cat", "cat", "cat"]
```

### What types of variabls are there in in ruby
1. `foobar` local variables
2. `@foobar` instance variables
3. `@@foobar` class variables
4. `$foobar` global variables



#### Compare Symbol and String, why use one vs the other?
#### Describe multiple ways to define an instance method in Ruby; now do the similar for class methods
#### Which is generally the better option (not only for Ruby): a recursive function or an iterative one?
#### What are the various Ruby runtimes, and how are they different?
#### What does self mean when used in a class?
#### What does it mean that "everything in Ruby is an object"?
#### What is a Hash? How efficient is reading/writing/iterating over one?
#### What is a block? Write a method that takes a block as an argument
#### What about closures in Ruby? What are they?
#### What is the difference between a lambda, a block and a proc?
#### Explain what a ||= b means
#### What is memoization? Why and when would you use it?
#### Have you heard the term PORO? Do you know what it is?
#### Is it bad to rescue Exception? Why?
#### What's the difference between the & and && operators?
#### What's the difference between the and and && operators? Why use one over the other?
#### What are #method_missing and #send? Why are they useful?
#### What is meta-programming, what methods of meta-programming does Ruby support, and when/why would you use it in a project?
#### What does the #lazy method do to enumerators and why is that useful?
#### Why do some methods end with a bang ! and others with question marks ?, what are they called and what do they do?
#### Go through Basic OOP primitives like encapsulation, abstraction, polymorphism and inheritance
#### Talk about SOLID principle
#### What are mixins, how do they work, and how would you use them? What are some advantages of using them and what are some potential problems? Give examples to support your answers
#### What's the difference between extend, prepend, and include?
#### Describe access modifiers and how they are used within the ruby language (private, public, protected)
#### How would you declare and use a constructor in Ruby?
#### How would you create getter and setter methods in Ruby?
#### What is a Class, what is an Object and why we need Module?
#### Does Ruby support multiple inheritance?
#### Explain what singleton methods are, what is Eigenclass in Ruby?
#### Describe Ruby method lookup path
#### Describe available Ruby callbacks and how can we use them in practice?
#### Why Enumerable is so useful? Elaborate on methods like #each, #map, #inject, #reject, et cetera (also shortcut notation e.g. #reduce(:+))
#### Why would you use BigDecimal over float?
#### When do you prefer to use fetch over [] on Hash (and other way around) and why?
#### What's the difference between local, @instance, @@class, and $global variables? Why and where would you use specific type?
#### How can you implement method overloading?
#### How can you call the base class method from inside of its overriden method?
#### What is Global Interpreter Lock (GIL)?

#### Ruby Supports Single Inheritance/multiple Inheritance Or Both?
Ruby Supports only Single Inheritance

#### Explain what is “Yield” in Ruby on Rails?

A Ruby method that receives a code block invokes it by calling it with the “Yield”.





Language Characteristics and Core Objects
-------------------------------------------------------------------------------

Q: What is the highest level in the object model?
A: `BasicObject`

Q: Is everything in Ruby an object?
A: Methods are not objects. Blocks are not objects. Keywords are not objects. However, there exist Method objects and Proc objects, and some keywords refer to objects.

Q: Which core object includes the `Kernel` module?
A: `Object`

Q: What can you say about an identifier that begins with a capital letter?
A: It is a constant.

Q: What is a DSL and how does it pertain to Ruby?
A: A Domain Specific Language is an API that allows a developer to solve a problem or represent data more naturally than they might otherwise. The flexible nature of Ruby's syntax and the ability to alias and alter existing methods and classes makes it conducive to creating rich DSL's.

Q: What is duck typing and how does it pertain to Ruby?
A: That an object may be acted upon even if it isn't the expected type as long as it looks and behaves like the expected object. This is a characteristic of Ruby because the lack of type checking of parameters makes this an effective programming technique.

Q: Is Ruby a statically typed or a dynamically typed language?
A: Dynamically typed since type checking is done at runtime.

Q: Is Ruby a strongly typed or a weakly typed language?
A: Strongly typed since an object's type is checked before an operation is performed on it.

Q: What does it mean to coerce an object? Why would you do it?
A: To coerce an object means to force it into an expected type. One might do this in order to try and force an unknown object type into the expected type or format required by the operation. This is a common practice involved in duck typing.

Q: What is the difference between a statement and an expression in Ruby?
A: All statements are expressions in Ruby since all statements return a value.

Data Types
-------------------------------------------------------------------------------

### String

Q: Why might you want to avoid using string literals within loops?
A: A new object is created for every string literal even when the values are identical. Consider using variables or symbols instead.

Q: Does `String` include the `Enumerable` module?
A: No.

Q: What method might you use to enumerate over a string?
A: `String#each_char`

Q: What is the difference between a character literal such as `?A` and a string literal such as `"A"`?
A: There is no difference.

### Symbol

Q: Describe a symbol.
A: Symbols are scalar value objects used as identifiers, mapping immutable strings to fixed internal values.

Q: Why are symbols typically used as hash keys instead of strings?
A: Strings are mutable while symbols are immutable. Though Ruby internally makes an immutable copy of a string when used as a hash key, comparing two symbols is faster than comparing two `String` objects. This is also a convention.

### Numeric

Q: Symbols are immutable objects. Name another immutable core Ruby object.
A: `Fixnum`

Q: What happens when a value becomes too big for `Fixnum`?
A: It is automatically converted to a `Bignum`.

Q: What is the superclass of `Fixnum`?
A: `Integer`

Q: What is the superclass of `Integer`?
A: `Numeric`

Q: What numeric class might you use to avoid the rounding error arising in the use of binary floating-point arithmetic?
A: `BigDecimal`

### Array

Q: How does the `%W` syntax differ from the `%w` syntax?
A: With `%W` it is possible to define an array containing string interpolation.

### Hash

Q: Name at least one synonym for `Hash#key?`?
A: `Hash#has_key?`, `Hash#include?`, `Hash#member?`

Q: How might you specify a default value for a hash?
A: Pass the default values as arguments to `::new` on initialization or change the default directly with the method `Hash#default`. You may also provide a default at the time of query with `Hash#fetch`.

Q: Does `Hash` use `#==` or `#eql?` to compare hash keys?
A: `#eql?`

Q: In what order are the values of a hash iterated?
A: The order in which they were inserted.

Q: What is the synonym of `Hash#[]=`?
A: `Hash#store`

Q: Why can you safely use a string as a hash key, even though a string is mutable?
A: Because the interpreter makes a private copy of a string used as a hash key.

Q: Why might you use `Hash#fetch` over `Hash#[]` when querying values in a hash?
A: `Hash#fetch` provides options for handling the case where a key does not exist in the hash.

Q: When would you need to use `Hash#rehash`?
A: After you mutate a mutable hash key.

### Range

Q: What are two uses of ranges?
A: comparison, iteration

### Regexp

Q: How might you include an expression within a `Regexp` literal?
A: Using `#{}` just like as in a double-quoted string literal.

Q: What is the global variable for the last `Regexp` match?
A: `$LAST_MATCH_INFO` equivalent to `$~`

Operators
-------------------------------------------------------------------------------

Q: What are two uses of the splat operator?
A: Explode or expand the elements of an array. Collect arguments of a parameter list into an array.

Q: What is the only operator which accepts three operands?
A: The conditional operator `?:` (sometimes referred to as the ternary if operator).

Q: Which operator must be defined in order to implement the `Comparable` module?
A: `<=>`

Q: What is the difference between `#==` and `#equal?`?
A: `#==` performs the generic comparison and is implemented differently across classes while `#equal?` is defined on `BasicObject` and compares object identity. Therefore, `#equal?` should not be overridden in subclasses.

Q: What is the difference between `#==` and `#===`?
A: `#==` performs the generic comparison while `#===` performs case equality comparison and is useful for providing meaningful semantics in case statements.

Q: What is the difference between `#==` and `#eql?`?
A: `#eql?` is sometimes an alternate equality. `Hash` uses `#eql?` to test for hash key equality. `Numeric` types perform type conversion across `#==` but not across `#eql?`, thus `#eql?` performs a stricter comparison than `#==` in that case.

Q: Which binds more tightly? `&&` or `and`
A: `&&`

Q: Which binds more tightly? `&&` or `=`
A: `&&`

Q: Which binds more tightly? `and` or `=`
A: `=`

Q: Which binds more tightly? `&&` or `||`
A: `&&`

Control Structures
-------------------------------------------------------------------------------

Q: What is a statement modifier?
A: A condition which follows a statement such as with `x = 1 if a == true`

Q: Does a while block define a new scope?
A: No.

Q: Does the case statement in Ruby have fall-through behavior?
A: No.

Q: What is the difference between `throw/catch` and `raise/rescue`?
A: `throw` and `catch` accept matching symbols as arguments and should be considered a control-flow structure where `raise` and `rescue` is used to raise and handle exceptions. `throw` and `catch` are not commonly used while exception handling with `raise` and `rescue` is used often.

Q: Does a `rescue` block define a new scope?
A: No.

Q: What are some advantages of a case statement versus repeated `elsif` statements?
A: It shows intent. It DRY's out the condition.

Q: What are some disadvantages of a case statement versus repeated `elsif` statements?
A: The statement is typically resistant to modification without a complete refactoring of the entire control structure. The case statement can be confusing if multiple comma-separated expressions are associated with a single when clause.

Blocks and Iterators
-------------------------------------------------------------------------------

Q: Name at least two classes which include the `Enumerable` module.
A: `Array`, `Hash`, `Range`, `IO`...

Q: When might you use the `do`/`end` syntax versus using the curly bracket syntax for a block?
A: The `do`/`end` syntax for a block is commonly used for multi-line statements. An alternate convention is to use curly bracket syntax for blocks that return a value while using `do`/`end` syntax for blocks that change the state of the system somehow and do not return a value.

Q: What is an iterator?
A: An object that allows traversal of the elements of the container. In Ruby, an iterator is typically considered any method that uses the yield statement.

Q: How do you define block-local variables within a block's parameter list?
A: Variables that appear after a semicolon in a block's parameter list are guaranteed to be local to the block.

Q: What is the synonym of `Enumerable#include?`?
A: `Enumerable#member?`

Q: Can a collection be modified while it is being iterated upon?
A: Yes.

Q: Is a block an object?
A: No. A block is a syntactic structure of the interpreter. A block can be converted to a Proc object.

Q: What is the synonym of `Enumberable#collect`?
A: `Enumberable#map`

Q: What is the synonym of `Enumberable#find`?
A: `Enumberable#detect`

Q: What is the synonym of `Enumberable#select`?
A: `Enumberable#find_all`

Q: What is the opposite of `Enumberable#select`?
A: `Enumberable#reject`

Q: What is the synonym of `Enumberable#inject`?
A: `Enumberable#reduce`

Q: Why might you use `#each` instead of `for/in`?
A: It's the "Ruby way" - an example of how Ruby defines methods that mimic natural language concepts. Iterator methods such as `#each` read more naturally. `#each` is a block so it defines a new variable scope. `for/in` depends on the existence of `#each` which implies that `#each` is a more fundamental aspect of the language.

Q: What happens if a block is passed two arguments but only accepts one argument?
A: Nothing. Only the first argument will be passed to the block.

Q: How is a block anonymous?
A: It doesn't have a name. It doesn't exist beyond it's execution unless converted to a Proc object.

Q: How does block invocation differ from method invocation?
A: Ruby will throw an exception if more than the expected number of arguments are passed to a method. A block will simply ignore the extra values.

Methods
-------------------------------------------------------------------------------

Q: Does Ruby support method overloading?
A: No.

Q: How might you test the presence of a method?
A: `Object#respond_to?` or `Module#method_defined?`

Q: What is the meaning of `self`?
A: The current object.

Q: What does a bang `!` at the end of a method signify?
A: That it should be with caution. Methods with this naming convention typically perform a mutation on the receiver object.

Q: What is a mutator method?
A: A method which alters the internal state of the object receiver.

Q: Is a method an object?
A: No, however, a `Method` object is of course, an object.

Q: What is a predicate in the context of Ruby method naming conventions?
A: A method that answers a question posed by the method invocation or method name. Predicates typically return a boolean.

Q: Are instance methods public or private?
A: They are public by default. You can change their visibility using `Module#private`, `Module#protected`, or back again using `Module#public`.

Q: When might you explicitly use the `return` statement.
A: To return from a method prematurely.

Q: Why might you want to alias a method?
A: To create a synonym for an existing method that is more readable or appropriate in the context of some problems or to add functionality to an existing method.

Q: How might you send a message to a private method of a receiver object from outside the scope of the receiver object?
A: `Object#send`

Q: How would you typically prevent future modifications to an object?
A: `#freeze`

Q: How is the invocation of a private method different than the invocation of a public method from within its defining class?
A: It must be referenced in a functional manner without an explicit receiver object and not on the class object itself or on the current object `self`.

Q: Can method names be capitalized?
A: Yes, but the convention is that they are not.

Q: What is the difference between private and protected methods?
A: A private method can only be called by any instance methods of the defining class or any subclasses and must be invoked in a functional style and not explicitly on `self` such as with `self.my_method`. A protected method may be explicitly invoked by any instance of the defining class, and is not restricted to implicit invocation on `self`.

Q: What is a singleton method?
A: A method that is available only on a single object.

Q: How does `return` differ from within a method than from within a block?
A: `return` within a method returns from the method. `return` within a block returns from its lexically enclosing method.

Q: Are class methods public or private?
A: They are public by default. You can change their visibility using `Module#private_class_method` and back again using `Module#public_class_method`.

Q: Does a method return a value if it does not contain an expression?
A: Yes, it returns `nil`.

Q: If a method is declared outside a class or module definition at the top level, where does it live?
A: As a private instance method of `Object`, whose value of `self` resolves to the special "main" object.

Q: What is the origin of the "keywords" `public`, `private`, and `protected`?
A: They are instance methods of the `Module` class. Since `Class` subclasses `Module`, these methods can be invoked without an explicit reference to `self` such as with `self.private`.

Q: How do you define a private class method?
A: Define the class method and call `Module#private_class_method` with an argument as a symbol of the class method name.

Q: Name at least two ways to disable methods.
A: `undef method_name`, `Module#remove_method`, `Module#undef_method`

Q: What is the difference between `Module#remove_method` and `Module#undef_method`?
A: `Module#undef_method` prevents any invocation of the method through an instance of the class, while `Module#remove_method` will remove the method definition from the class, but not prevent inherited methods of the same name from being invoked.

Q: Explain how Ruby syntax supports keyword arguments in parameters lists?
A: You can leave off the curly brackets from a hash in a parameter list, assuming it is the last argument in the list.

Procs and Lambdas
-------------------------------------------------------------------------------

Q: What are the two varieties of Proc objects?
A: Procs and lambdas.

Q: What can be said about a method argument that is prefixed with `&`?
A: It will refer to the calling block as a named Proc object. It must be the last argument in the parameter list.

Q: What is the main difference between procs and lambdas?
A: Calling a lambda is more akin to invoking a method where a return statement in a lambda will return from the lambda itself, instead of returning from the lexically enclosing method, as procs do. Adding to this notion, lambdas must be invoked with the exact number of arguments such as is required by method invocation, whereas procs are more flexible in receiving arguments.

Q: Does an object have to be a Proc object for a `&` to be prefixed to it in a parameter list?
A: No, `&` can appear before any object having a `#to_proc` method.

Q: What is the difference between Proc invocation and lambda invocation?
A: A block must be associated with lambda invocation. Lambdas must be invoked with the exact number of arguments such as is required by method invocation, whereas procs are more flexible in receiving arguments.

Q: When might you encounter a `LocalJumpError`?
A: You might typically encounter this exception when attempting to yield when no block is given. You might also encounter this exception when attempting to return from a method that has already returned such as if you attempt to return from a Proc object whose lexically enclosing method has already returned.

Closures
-------------------------------------------------------------------------------

Q: Describe a closure in Ruby.
A: A closure is an object that is both an invocable function together with a variable binding. The object retains access to the local variables that were in scope at the time of the object definition.

Q: Does a closure in Ruby retain variables by value or by reference?
A: By reference; the closure also extends the lifetimes of its variables.

Q: A closure's reference to its variables is said to be dynamically bound. What does this mean?
A: The values of the variables are resolved when the Proc object is executed.

Q: Is it possible to alter a closure?
A: Yes, the binding of a closure can be altered using `#binding`.

Method Objects
-------------------------------------------------------------------------------

Q: What must you first do before you can invoke an `UnboundMethod` object?
A: Bind it to a receiver object using `UnboundMethod#bind`.

Q: Are method objects closures?
A: No.

Q: How do you obtain a `Method` object from an existing module/class?
A: Using `Object#method`

Q: How do you obtain an `UnboundMethod` object from an existing module/class?
A: Using `Module#instance_method`

Constants
-------------------------------------------------------------------------------

Q: Are constants public or private?
A: Public.

Q: What happens if you attempt to define a constant on a class from outside the class?
A: It defines successfully since constants are publicly accessible and assignable.

Q: What happens to a constant which is not assigned?
A: It does not exist.

Classes
-------------------------------------------------------------------------------

Q: What is the difference between an instance variable and a class variable?
A: A class variable is evaluated in reference to the class object created by the enclosing class definition while an instance variable is evaluated in reference to `self`. Instance variables cannot be referenced outside of instance methods.

Q: Why must a class name begin with a capital letter?
A: Because the `class` keyword creates a new constant that refers to the class and constants begin with a capital letter.

Q: Is `#initialize` an instance method or a class method?
A: An instance method.

Q: What is the difference between a class variable and a class instance variable?
A: Class instance variables are instance variables of a class. Class instance variables cannot be used within instance methods.

Q: What is a singleton?
A: A class having only a single instance.

Q: How might you create a singleton?
A: By including the `Singleton` module.

Q: Can you define accessor methods for class instance variables?
A: Yes, if they are defined as singleton methods of the class.

Q: Can classes be nested?
A: Yes.

Q: Is `#initialize` public or private?
A: Private by default.

Q: What does `Class#allocate` do?
A: It creates an uninitialized instance of a class.

Q: What is an eigenclass?
A: An anonymous class associated with an object. An object's singleton methods are instance methods of its associated eigenclass.

Q: What is the relationship between singleton methods and class methods?
A: Class methods are singleton methods of the eigenclass associated with the class object.

Q: What is `Class::new`?
A: A class method of the `Class` object which creates new classes.

Q: If `Class` `B` is nested within `Class` `A`, and there exists a class method on `A`, does `Class` `B` then have access to this instance method on `Class` `A`?
A: No. Nesting one class within another does not give the inner class any special access to the methods or variables of the outer class.

Q: Are eigenclasses inherited?
A: The eigenclasses of an object are inherited from the eigenclasses of the superclass of the class object. An eigenclass of an object instance stands alone and does not inherit from any other classes.

Q: What happens to any return value of `#initialize`?
A: It is ignored.

Q: What is a factory method?
A: An initialization method that creates specialized instances of a class.

Q: What is the method to run initialization code on copied instances of an object?
A: `#initialize_copy`

Q: Does `#initialize_copy` override `#initialize`?
A: No.

Q: What does it mean that `Object#dup` and `#clone` perform shallow copies?
A: The instance variables of the copy are copied by reference rather than by value.

Q: What is the difference between `Object#dup` and `#clone`?
A: `#clone` copies the frozen state of an object and any singleton methods of an object while `Object#dup` does neither.

Modules
-------------------------------------------------------------------------------

Q: What are two main functions of modules?
A: As mixins, as namespaces...

Q: Can a module be subclassed?
A: No.

Q: What happens when a class includes a module?
A: The instance methods of the module become instance methods of the class.

Q: What happens when an object extends a module?
A: The instance methods of the module become singleton methods on the object.

Q: What is the superclass of `Class`?
A: `Module`

Q: Why must module names begin with a capital letter?
A: Because the `module` keyword creates a new constant that refers to the module and constants begin with a capital letter.

Q: How would you check if a module has been included by an object?
A: Using `#is_a?` such as with `my_obj.is_a? MyModule`.

Q: What does `Module#module_function` do?
A: Makes class copies of the specified methods and makes instance methods private.

Structs
-------------------------------------------------------------------------------

Q: What is a `Struct` in Ruby?
A: A core Ruby class that generates other classes containing accessor methods for the specified fields.

Q: Can methods be added to a `Struct`?
A: Yes.

Inheritance
-------------------------------------------------------------------------------

Q: What's the difference between `Object#is_a?` and `Object#instance_of?`?
A: `Object#instance_of?` ignores inheritance and any mixed-in modules.

Q: If the `super` keyword is used in a method without any arguments, which if any arguments get passed to the superclass method?
A: All arguments that were passed to the current subclass method will be passed to the superclass method.

Q: Are singleton methods inherited?
A: No, since they are not defined by a class and thus are unrelated to the inheritance mechanism.

Q: Are class methods inherited?
A: Yes.

Q: Are constants inherited?
A: Yes.

Q: Are class variables inherited?
A: No. The behavior is different than inheritance. Any alteration of a class variable by a subclass affects that class variable in the superclass and all other subclasses of the superclass.

Q: Why might you want to avoid the use of class variables?
A: Their values can be changed at any point in the inheritance chain which can cause unexpected behavior in parent classes or subclasses which use those class variables.

Q: What should you watch out for when subclassing a class that is unknown to you?
A: Overriding private methods or overwriting class variables.

Q: How might you prevent a method on a superclass from being inherited by a subclass?
A: Override the method in the subclass or `undef` the method in the subclass.

Metaprogramming
-------------------------------------------------------------------------------

Q: Can `Module#attr_reader` be considered an example of metaprogramming?
A: Yes, since it creates getter methods at the time of the enclosing class definition.

Q: How might you access an instance variable of a receiver object from outside the scope of the receiver object?
A: With an accessor method or using `Object#instance_variable_get`, `BasicObject#instance_eval`, or `Binding#eval`.

Q: Which method is invoked when a method is not found?
A: The nearest `#method_missing`

Q: How can you open an eigenclass from within its associated class?
A: `class << self`

Q: What is a binding?
A: A representation of an object's variable bindings at some moment.

Q: What is Ruby's reflection API?
A: A collection of methods mostly defined by `Kernel`, `Object`, and `Module` that allow a program to examine its own state and structure.

Q: Which method is invoked when a constant is not found?
A: The nearest `#const_missing`

Q: `Module#define_method` accepts how many and of what types of arguments?
A: A symbol as the method name and either a block or a `Method` object as the method body.

Q: Can `#eval` accept a block?
A: No, `#eval` accepts a string. However, `Module#class_eval` and `BasicObject#instance_eval` can accept blocks.

Q: How might you obtain a reference to an eigenclass from within its associated class?
A: `Object#singleton_class`, `eigenclass = class << self; self; end`

Q: How might you alter method visibility from outside a class definition?
A: Using `Module#class_eval`

Q: What is the difference between `BasicObject#instance_eval` and `BasicObject#instance_exec`?
A: `BasicObject#instance_exec` can only accept a block, not a string, and it can accept arguments and pass them to the block, allowing the block to be evaluated in the context of the receiver object with parameters whose values come from the block.

Q: Where do `#class_variable_get` and `#class_variable_set` live in the object model?
A: `Module`

Q: Where do `#instance_variable_get` and `#instance_variable_set` live in the object model?
A: `Object`

Q: Where do `#local_variables` and `#global_variables` live in the object model?
A: `Kernel`

Loading Modules, Files, and Gems
-------------------------------------------------------------------------------

### Loading

Q: What is `$LOAD_PATH`?
A: A global array of strings of the directories to be searched when loading files with the load and require methods. `$LOAD_PATH` is equivalent to `$:`.

Q: What is the difference between `Kernel#require` and `Kernel#load`?
A: `Kernel#require` can load binary extensions. `Kernel#require` does not require a filename extension. `Kernel#require` prevents multiple loads of the same file path. `Kernel#load` loads the specified file at the current `$SAFE` level while `Kernel#require` loads the specified file with a `$SAFE` level of 0.

Q: Does a file loaded with `Kernel#require` or `Kernel#load` have access to the local variables of the referencing file?
A: No.

Q: What is the difference between `Kernel#require` and `Kernel#require_relative`?
A: `Kernel#require_relative` ignores the load path.

Q: What does `Kernel#autoload` do?
A: Allows lazy-loading of files when a constant assigned to a file is first referenced.

### Files

Q: What does `File::expand_path` do?
A: Converts a relative path to a fully qualified path.

Q: What method(s) in class `Dir` can be used to list the contents of a directory?
A: `Dir::entries`, `Dir::foreach`, `Dir#each`...

Q: What is an `IO` object?
A: An IO object is an instance of class `IO` that can be used for reading or writing binary data to and from a file.

### Gems

Q: Are RubyGems installation directories included in `$LOAD_PATH`?
A: Yes.

Q: If more than one version of a Gem is installed, which version will be used?
A: The Gem with the highest version number.

Security
-------------------------------------------------------------------------------

Q: What can you say about objects derived from tainted objects?
A: They will also be tainted.

Q: What is the default `$SAFE` level?
A: 0

Q: What happens when you attempt to lower the `$SAFE` level?
A: The `$SAFE` level cannot be lowered; it can only be raised.

Q: What is the difference between taint and trust?
A: Taint is derived from the environment such as the command line, environment variables, files, sockets, etc..., while trust is derived from the `$SAFE` level of the originating code. Untrusted objects are both untrusted and tainted.

Exceptions
-------------------------------------------------------------------------------

Q: What error is raised if a method is passed the wrong number of arguments?
A: `ArgumentError`

Q: What error is raised if method name resolution fails?
A: `NoMethodError`

Q: The superclass of `StandardError` is __.
A: `Exception`

Q: What does the default implementation of `BasicObject#method_missing` do?
A: Raises a `NoMethodError`.

Q: What happens if you attempt to redefine `BasicObject#__send__`?
A: Ruby issues a warning.

Debugging
-------------------------------------------------------------------------------

Q: What is the difference between `#to_s` and `#inspect`?
A: `#inspect` is the same as `#to_s`, except some classes redefine `#inspect` to provide output that is more helpful for debugging.

Q: What is the difference between `#puts` and `#p`?
A: `#p` converts objects to strings with an `#inspect` method and returns argument(s) as a result (useful to inject directly into the method argument list). `#puts` uses `#to_s` and returns `nil`.

Q: Which Ruby interpreter option enables debugging?
A: `-d` / `--debug`

Q: What is the global variable for the last exception raised?
A: `$ERROR_INFO` equivalent to `$!`

Q: How can you obtain the current state of the call stack?
A: Using `Exception#backtrace` (state at exception raise), `Thread.current.backtrace` (current state) or `Kernel#caller` (does not include current line)

Q: What does `Kernel#__method__` return?
A: The name of the currently executing method as a symbol.

Q: What is the synonym of `Kernel#__method__`?
A: `Kernel#__callee__` (the difference since Ruby 2.0 is that `__callee__` returns the name of an aliased method, if any).

The Ruby Environment and the Interpreter
-------------------------------------------------------------------------------

Q: What is the difference between `#puts` and `#print`?
A: `#puts` appends a newline character to the output. `#print` prints a value of special variable `$_` when called without arguments.

Q: Which Ruby interpreter option allows running of one-line scripts?
A: `-e`

Q: Where do the curly brackets to define a hash literal `{}` exist in the object model?
A: It does not exist within the object model - it is a function of the interpreter.

Q: What is the default encoding in MRI?
A: UTF-8

Q: How does Ruby know that a setter method such as `X#[]=` should be called in the expression `x.field = []`?
A: It is a syntactical conversion in the interpreter.

Q: What is the global constant to access arguments specified on the command line?
A: `ARGV`

Q: Which Ruby interpreter option enables warnings about deprecated or problematic code?
A: `-w`

Q: In MRI, which objects are not subject to garbage collection?
A: Symbols, but in version 2.2 [was implemented symbol GC](http://www.sitepoint.com/symbol-gc-ruby-2-2/).

Q: What module in the standard library enables English language alternatives to terse global variables?
A: `English`
