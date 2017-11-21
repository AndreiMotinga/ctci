
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
