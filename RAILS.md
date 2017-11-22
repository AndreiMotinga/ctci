
## Rails
### What is the general history of Rails?
### What is new in Rails 4, 5?
### Explain the different pieces of Rails.
### Walk through the flow of a request through Rails.
### What are the different server options for running a Rails/Rack app?
### Explain CSRF and how Rails combats it.
### Explain mass-assignment vulnerability.
### Why do some people say "Rails can't scale"?
### What is Rack?
### What is middleware? How does it compare to controller filters/actions?
### Explain various forms of caching available in Rails.
### What are some Ruby web server options?
### How is something like 30.seconds.ago implemented?
### Explain a polymorphic association:
Polymorphic associations allow a model to belong to more than one other model through a single association.

![image](http://cdn.skilledup.com/wp-content/uploads/2014/10/RoR_QA_polymorphic1-screenshot.jpg)

![image](http://cdn.skilledup.com/wp-content/uploads/2014/10/RoR_QQ_polymorphic2-screenshot.jpg)


### HOW Web Works
![image](http://www.pearltrees.com/s/pic/or/how-web-works-portrait-93700198)

### Why Ruby on Rails

There are lot of advantages of using Ruby on Rails(ROR)

1. DRY Principal
2. Convention over Configuration
3. Gems and Plugins
4. Scaffolding
5. Pure OOP Concept

### Define MVC

![image](https://srikantmahapatra.files.wordpress.com/2013/11/mvc1.png)

for Example your url is something like this:

http://localhost:3000/users/new

here users is your controller and new is your method, there must be a file in your views/users folder named new.html.erb, so once the submit button is pressed, User model or whatever defined in the rhtml form_for syntax, will be called and values will be stored into the database.

### What is ORM in Rails?

ORM tends for Object-Relationship-Model, it means that your Classes are mapped to table in the database, and Objects are directly mapped to the rows in the table.

### What is the difference between a plugin and a gem?

A gem is just ruby code. It is installed on a machine and it’s available for all ruby applications running on that machine. Rails, rake, json, rspec — are all examples of gems.
Plugin is also ruby code but it is installed in the application folder and only available for that specific application.

Sitemap-generator, etc.

In general, since Rails works well with gems you will find that you would be mostly integrating with gem files and not plugins in general. Most developers release their libraries as gems.

### What is restful in rails

**Stands for REpresentational State Transfer**

**operation		SQL				REST**

create 		insert 		POST

read 			select			GET

update			update 		PUT

delete 		delete			DELETE

### What is request.xhr?

A request.xhr tells the controller that the new **Ajax request** has come, It always return TRUE or FALSE

### How many Types of Relationships does a Model has?

* (1) has_one
* (2) belongs_to
* (3) has_many
* (4) has_many :through

### What is asset pipeline

Asset pipeline which enables proper organization of CSS and JavaScript

### **What is the difference between include and extend**

Include makes the module’s methods available to the instance of a class, while
extend makes these methods available to the class itself.

#### Explain the different pieces of Rails
#### Explain the processing flow of a Rails request
#### Explain MVC in terms of Rails
#### What is REST?
#### Describe the Rails Asset Pipeline and how it handles assets (such as JavaScript and CSS files); bonus points for explaining what was the big change in Rails 5.1
#### What is an ORM?
#### What is ActiveRecord and what is Arel? Describe the capabilities of each
#### What is the Convention over Configuration pattern? Provide examples of how it is applied in Rails
#### What is the fat model, skinny controller approach? Discuss some of its advantages and pitfalls, as well as some alternatives
#### Describe the Rails testing philosophy
#### What is the purpose of layouts?
#### Explain the use of yield and content_for in layouts and provide examples
#### What are N+1 queries and how can you avoid them? How would you find/debug N+1 queries?
#### What are filters/actions in Rails? Describe the three types of filters, including how and why each might be used, and the order in which they are executed
#### What is Rack middleware? How does it compare to controller filters/actions?
#### Explain what Rails' mass-assignment vulnerability is and Rails' method to control field access
#### How do you sort an Array of objects by a particular attribute? What is a better way to do sorting with ActiveRecord?
#### What are the different server options for running a Rails/Rack app?
#### Explain CSRF and how Rails combats it
#### Explain various forms of caching available in Rails
#### How is something like 30.seconds.ago implemented?
#### What is Rails concern?
#### What is functionality of helpers?
#### Which Rails server are you using?
#### Which HTML template engine does Rails support by default?
#### What are some ActiveRecords callbacks which you are familiar with?
#### Does ActiveRecord have after_delete callback?
#### What are the benefits of using active records as opposed to native SQL queries. On which occasion should you be choosing one over the other?
#### Explain rails db:migrate and the benefits that comes along with that?
#### Explain how Rails' scaffolding works and why you would want to use them
#### What is database transactions and how it is represented in Rails?
#### Explain ActiveRecord's associations (all of them)
#### What are scopes in ActiveRecord? How should you use them?
#### Where would you use #pluck and why exactly is it useful?
#### Explain eager loading
#### How can you eager load associated objects?
#### What is the difference between render and redirect?
#### What is the difference between #save! and #save? (Elaborate on general difference between AR methods with and without a bang !)
#### What is the difference between form_for and form_tag?
#### What is the purpose of environment.rb and application.rb files?
#### What is request.xhr?
#### How can you list all routes for a Rails application?
#### Give an example of nested routes usage
#### What is observer in Rails?
#### What is duck typing?
#### Explain what Rails engines are? Provide examples of commonly used engines
#### What deployment tools do you use?
#### What does your development setup look like?
#### Why do some people say "Rails can't scale"?
#### When is Rails a good choice for a project?
#### What are some of the drawbacks of Rails?
#### What are Form Objects? Why are they useful? Where would you use them?
#### What are Query Objects? Why are they useful? Where would you use them?
#### What are View Objects? Why are they useful? Where would you use them?

#### What Is Rails?

Rails is a extremely productive web-application framework written in Ruby language by David Hansson.
Rails are an open source Ruby framework for developing database-backend web applications.
Rails include everything needed to create a database-driven web application using the Model-View-Controller (MVC) pattern.
#### What Are The Various Components Of Rail?

Action Pack: Action Pack is a single gem that contains Action Controller, Action View and Action Dispatch. The “VC” part of “MVC”.
Action Controller: Action Controller is the component that manages the controllers in a Rails application. The Action Controller framework processes incoming requests to a Rails application, extracts parameters, and dispatches them to the intended action.

Services provided by Action Controller include session management, template rendering, and redirect management.

Action View: Action View manages the views of your Rails application. It can create both HTML and XML output by default.

Action View manages rendering templates, including nested and partial templates, and includes built-in AJAX support.

Action Dispatch: Action Dispatch handles routing of web requests and dispatches them as you want, either to your application or any other Rack application. Rack applications are a more advanced topic and are covered in a separate guide called Rails on Rack.

Action Mailer: Action Mailer is a framework for building e-mail services. You can use Action Mailer to receive and process incoming email and send simple plain text or complex multipart emails based on flexible templates.
Active Model: Active Model provides a defined interface between the Action Pack gem services and Object Relationship Mapping gems such as Active Record. Active Model allows Rails to utilize other ORM frameworks in place of Active Record if your application needs this.
Active Record: Active Record are like Object Relational Mapping (ORM), where classes are mapped to table, objects are mapped to columns and object attributes are mapped to data in the table.
Active Resource: Active Resource provides a framework for managing the connection between business objects and RESTful web services. It implements a way to map web-based resources to local objects with CRUD semantics.
Active Support: Active Support is an extensive collection of utility classes and standard Ruby library extensions that are used in Rails, both by the core code and by your applications.

#### Explain About Restful Architecture?

RESTful: REST stands for Representational State Transfer. REST is an architecture for designing both web applications and application programming interfaces (API’s), that’s uses HTTP.

RESTful interface means clean URLs, less code, CRUD interface. CRUD means Create-READ-UPDATE-DESTROY. In REST, they add 2 new verbs, i.e, PUT, DELETE.

#### Why Ruby On Rails?

There are lot of advantages of using ruby on rails.

DRY Principal( Don’t Repeat Yourself): It is a principle of software development aimed at reducing repetition of code. “Every piece of code must have a single, unambiguous representation within a system”
Convention over Configuration: Most web development framework for .NET or Java force you to write pages of configuration code. If you follow suggested naming conventions, Rails doesn’t need much configuration.
Gems and Plugins: RubyGems is a package manager for the Ruby programming language that provides a standard format for distributing ruby programs and library.
Plugins: A Rails plugin is either an extension or a modification of the core framework. It provides a way for developers to share bleeding-edge ideas without hurting the stable code base. We need to decide if our plugin will be potentially shared across different Rails applications.

Scaffolding: Scaffolding is a meta-programming method of building database-backend software application. It is a technique supported by MVC frameworks, in which programmer may write a specification, that describes how the application database may be used. There are two type of scaffolding:
-static: Static scaffolding takes 2 parameter i.e your controller name and model name.

-dynamic: In dynamic scaffolding you have to define controller and model one by one.

Rack Support: Rake is a software task management tool. It allows you to specify tasks and describe dependencies as well as to group tasks in a namespace.
Metaprogramming: Metaprogramming techniques use programs to write programs.
Bundler: Bundler is a new concept introduced in Rails 3, which helps you to manage your gems for application. After specifying gem file, you need to do a bundle install.
Rest Support.
Action Mailer

#### What Do You Mean By Render And Redirect_to?

render causes rails to generate a response whose content is provided by rendering one of your templates. Means, it will direct goes to view page.

redirect_to generates a response that, instead of delivering content to the browser, just tells it to request another url. Means it first checks actions in controller and then goes to view page.

#### What Is Orm In Rails?

ORM tends for Object-Relationship-Model, where Classes are mapped to table in the database, and Objects are directly mapped to the rows in the table.

#### How Many Types Of Associations Relationships Does A Model Have?

When you have more than one model in your rails application, you would need to create connection between those models. You can do this via associations. Active Record supports three types of associations:

one-to-one: A one-to-one relationship exists when one item has exactly one of another item. For example, a person has exactly one birthday or a dog has exactly one owner.

one-to-many: A one-to-many relationship exists when a single object can be a member of many other objects. For instance, one subject can have many books.

many-to-many: A many-to-many relationship exists when the first object is related to one or more of a second object, and the second object is related to one or many of the first object.

You indicate these associations by adding declarations to your models: has_one, has_many, belongs_to, and has_and_belongs_to_many.

#### What Are Helpers And How To Use Helpers In Ror?

Helpers are modules that provide methods which are automatically usable in your view. They provide shortcuts to commonly used display code and a way for you to keep the programming out of your views. The purpose of a helper is to simplify the view.

#### What Are Filters?

Filters are methods that run “before”, “after” or “around” a controller action. Filters are inherited, so if you set a filter on ApplicationController, it will be run on every controller in your application.

#### What Is Mvc? And How It Works?

MVC tends for Model-View-Controller, used by many languages like PHP, Perl, Python etc. The flow goes like this:

Request first comes to the controller, controller finds and appropriate view and interacts with model, model interacts with your database and send the response to controller then controller based on the response give the output parameter to view.

#### What Is Session And Cookies?

Session is used to store user information on the server side. Maximum size is 4 kb. Cookies are used to store information on the browser side or we can say client side.

#### What Is Request.xhr?
A request.xhr tells the controller that the new Ajax request has come, It always return Boolean values (TRUE or FALSE)

#### What Things We Can Define In The Model?

There are lot of things you can define in models few are:

Validations (like validates_presence_of, numeracility_of, format_of etc.)
Relationships (like has_one, has_many, HABTM etc.)
Callbacks (like before_save, after_save, before_create etc.)
Suppose you installed a plugin say validation_group, So you can also define validation_group settings in your model
ROR Queries in Sql
Active record Associations Relationship

#### How Many Types Of Callbacks Available In Ror?

before_validation
before_validation_on_create
validate_on_create
after_validation
after_validation_on_create
before_save
before_create
after_create
after_save

#### How To Serialize Data With Yaml?

YAML is a straight forward machine parsable data serialization format, designed for human readability and interaction with scripting language such as Perl and Python.

YAML is optimized for data serialization, formatted dumping, configuration files, log files, internet messaging and filtering.

#### What Are The Various Changes Between The Rails Version 2 And 3?

Introduction of bundler (new way to manage your gem dependencies)
Gemfile and Gemfile.lock (where all your gem dependencies lies, instead of environment.rb)
HTML5 support

#### What Is Tdd And Bdd?

TDD stands for Test-Driven-Development and BDD stands for Behavior-Driven-Development.

#### What Do You Mean By Naming Convention In Rails.

- **Variables**: Variables are named where all letters are lowercase and words are separated by underscores. E.g: total, order_amount.
- **Class and Module**: Classes and modules uses MixedCase and have no underscores, each word starts with a uppercase letter. Eg: InvoiceItem
- **Database Table**: Table name have all lowercase letters and underscores between words, also all table names to be plural. Eg: invoice_items, orders etc
- **Model**: The model is named using the class naming convention of unbroken MixedCase and always the singular of the table name. For eg: table name is might be orders, the model name would be Order. Rails will then look for the class definition in a file called order.rb in /app/model directory. If the model class name has multiple capitalized words, the table name is assumed to have underscores between these words.
- **Controller**: controller class names are pluralized, such that Orders Controller would be the controller class for the orders table. Rails will then look for the class definition in a file called orders_controlles.rb in the /app/controller directory.

####  What Is Active Record?

Active Record are like Object Relational Mapping(ORM), where classes are mapped to table and objects are mapped to columns in the table.

#### What Is Bundler?

Bundler is a new concept introduced in Rails3, which helps to you manage your gems for the application. After specifying gems in your Gemfile, you need to do a bundle install. If the gem is available in the system, bundle will use that else it will pick up.

#### Explain how Rails implements Ajax?

Ajax powered web page retrieves the web page from the server which is new or changed unlike other web-page where you have to refresh the page to get the latest information.

Rails triggers an Ajax Operation in following ways

Some trigger fires: The trigger could be a user clicking on a link or button, the users inducing changes to the data in the field or on a form
Web client calls the server: A Java-script method, XMLHttpRequest, sends data linked with the trigger to an action handler on the server. The data might be the ID of a checkbox, the whole form or the text in the entry field
Server does process: The server side action handler does something with the data and retrieves an HTML fragment to the web client
Client receives the response: The client side JavaScript, which Rails generates automatically, receives the HTML fragment and uses it to update a particular part of the current

#### Explain what is Cross-Site Request Forgery (CSRF) and how Rails is protected against it?

CSRF is a form of attack where hacker submits a page request on your behalf to a different website, causing damage or revealing your sensitive data. To protect from CSRF attacks, you have to add “protect_from_forgery” to your ApplicationController. This will cause Rails to require a CSRF token to process the request. CSRF token is given as a hidden field in every form created using Rails form builders.

#### Explain what is rake in Rails?

Rake is a Ruby Make; it is a Ruby utility that substitutes the Unix utility ‘make’, and uses a ‘Rakefile’ and ‘.rake files’ to build up a list of tasks. In Rails, Rake is used for normal administration tasks like migrating the database through scripts, loading a schema into the database, etc.

#### Mention what is the difference between Procs and Blocks?

The difference between Procs and Blocks,

Block is just the part of the syntax of a method while proc has the characteristics of a block
Procs are objects, blocks are not
At most one block can appear in an argument list
Only block is not able to be stored into a variable while Proc can


#### Mention what is the difference extend and include?
The “include” makes the module’s methods available to the instance of a class, while “extend” makes these methods available to the class itself.

#### What are some strategies you can employ for reducing duplication and bloated Active Record models? What are the pros/cons of each strategy?

Because Ruby on Rails is an MVC framework, it can become tempting to try and fit everything into the Model or the Controller. Ruby on Rails is a powerful framework that provides many different mechanisms for describing our application and keeping our models and controllers nice and tidy.

Below are two ways of reducing fat models. They illustrate different levels of shared understanding between the extracted functionality and the model in question.

##### 1. Use ActiveSupport::Concern

If the code really belongs in the model (because it relies on ActiveRecord helpers), but there is a coherent grouping of methods, a concern might be worth implementing. For example, many models in a system could enable a user to create a note on a number of models:

```
require 'active_support/concern'

module Concerns::Noteable
  extend ActiveSupport::Concern

  included do
    has_many :notes, as: :noteable, dependent: :destroy
  end

  def has_simple_notes?
    notes.not_reminders_or_todos.any?
  end

  def has_to_do_notes?
    notes.to_dos.any?
  end

  def has_reminder_notes?
    notes.reminders.any?
  end
  ...
end
```
The Concern can then be applied like so:

```
class Language < ActiveRecord::Base
  include TryFind
  include Concerns::Noteable
end
```

##### Pros:
This is a great way of testing a cohesive piece of functionality and making it clear to other developers that these methods belong together. Unit tests can also operate on a test double or a stub, which will keep functionality as decoupled from the remaining model implementation as possible.

##### Cons:
ActiveSupport::Concerns can be a bit controversial. When they are over-used, the model becomes peppered in multiple files and it’s possible for multiple concerns to have clashing implementations. A concern is still fundamentally coupled to Rails.


##### 2. User Service Class

Depending on the source of the bloat, sometimes it makes better sense to delegate to a service class. 10 lines of validation code can be wrapped up in a custom validator and tucked away in app/validators. Transformation of form parameters can be placed in a custom form under app/forms. If you have custom business logic, it may be prudent to keep it in a lib/ folder until it’s well defined.

The beauty of delegation is that the service classes will have no knowledge of the business domain and can be safely refactored and tested without any knowledge of the models.

##### Pros:
This approach is elegant and builds a custom library on top of what Ruby on Rails provides out of the box.

##### Cons:
If the underlying APIs change, your code will likely need to be updated to match. Instead of coupling to your model layer, you’ve now coupled yourself to either Ruby on Rails or a third-party library.



#### What is metaprogramming?
Ruby developers should know what’s metaprogramming, because it is widely used, especially in popular frameworks such as Rails, Sinatra, and Padrino. By using metaprogramming, we can reduce duplicate code, but there is a downside where it will increase the complexity of the code in the long run.

Here’s an example of metaprogramming in Ruby:

A user can have a lot of roles, and you want to check the authorization.

Normal scenario:

```
def admin?
     role ==  'admin'
end

def marketer?
    role == 'marketer'
end

def sales?
   role == 'sales'
end
```
Metaprogramming:

```
['admin', 'marketer', 'sales'].each do |user_role|
    define_method "#{user_role}?" do
        role == user_role
    end
end
```

#### Given this Human class implementation
```
class Human

    def talk
        puts "I’m talking"
    end

     private

     def whisper
          puts "I’m whispering"
     end
end
```
What’s the output of :

```
Human.new.talk
Human.new.whisper
Human.new.send(:talk)
Human.new.send(:whisper)

...
...

I’m talking
NoMethodError: private method ‘whisper’ called for #<Human:0x007fd97b292d48>
I’m talking
I’m whispering
```
To explain, the class object Human.new.talk is calling an instance method, so it works perfectly. The talk method is a public method and can be called by everyone.

The class object Human.new.whisper is trying to access a private method, which it is not allowed to. Private and Protected methods are not accessible from outside. They are only used internally. This is an object-oriented design and can be used to structure the code, which the implementation is not supposed to expose to consumer object.

Finally, Human.new.send(:talk) sends a bypass control check to the method so it can be called without raising an error. Same goes to Human.new.send(:whisper).
