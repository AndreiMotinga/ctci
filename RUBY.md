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
