# Wednesday October 5, 2016

## SQL
* What is the difference between a View and a Table?
  - Table: contains data, collection of related data entries consisting of rows and columns.
  - View: A virtual table, or a SELECT statement that has been saved in the db. You can't change anything in the db, just a set of tables (views don't store actual data)
* What does the HAVING clause do?

*What are the current grades, names, locations, and vote counts for all politicians whose current grades are less than 9.00 ordered by current grade from high to low?*

SELECT congress_members.grade_current, congress_members.name, congress_members.location, COUNT(votes.politician_id) FROM congress_members JOIN votes ON congress_members.id = votes.politician_id GROUP BY congress_members.name HAVING COUNT(congress_members.grade_current) < 9 ORDER BY congress_members.grade_current DESC;
grade_current  name                      location    COUNT(votes.politician_id)
-------------  ------------------------  ----------  --------------------------
12.93132331    Rep. Ileana Ros-Lehtinen  FL          8
11.56066479    Rep. Jim Sensenbrenner    WI          7
10.23278515    Rep. Tim Huelskamp        KS          8
9.285165569    Rep. Bill Cassidy         LA          7

*NOTE: to change format in terminal to prettty itty*
.show
- .header on
- .mode column
- .nullvalue NULL #changes nullvalue to null


# Thursday October 6, 2016

##Binary Search tree
Definition: a binary search tree is a binary tree where:
  - The data value of every node in a left subtree is LESS than data value of that node - aka all left children are of LESS value than the node itself
  - The data value of every node in a node's right subtree is MORE than data value of that node - aka all right children are of MORE value than node itself
  - if need equal node as child for whatever reason, can use count to keep track instead, since binary search tree doesnt allow for equal to
    - Note: A binary tree is NOT a binary search if there are duplicate values

* Immutable objects = unchangeable object, cannot be modified.

# Saturday October 8, 2016

## Graphs and Trees
Trees are graphs that don't contain cycles, and a child can only have one parent.

Graphs can contain cycles.

Tree example in ruby:
`class Tree
  attr_accessor :children, :value

  def initialize(value)
    @value = value
    @children = []
  end
end

tree = Tree.new(7)
tree.children << Tree.new(3)
tree.children << Tree.new(8)

tree.value # => 7
tree.children[0].value # => 3
tree.children[0].value # => 8`

# Monday October 10, 2016

## Deploy to AWS
1. Create an Application Server
2. Create a DB Server
3. Deploy an app to your Application Server
4. Scale and Load-Balance your Web App
5. Give a Domain Name to your Website
6. Cleaning up

# Wednesday October 12, 2016

## Time complexity
Definition of Complexity: max number of dominant operations a program may execute, where *dominant* refers to operations performed the largest number of times.

**example:**
`def dominant(n)
  result = 0
  while i < n
    result += 1
  end
  result
end`

The operation `result += 1` is the dominant operation, and is executed *n* times. Which is O(n) - linear complexity.

*Fun Fact:* An average computer today performs 10^8 operations in under 1 second.

Given a limit of size of data *n*:
  * n <= 500 - expected time complexity: O(n^3)
  * n <= 10,000 - expected time complexity: O(n^2)
  * n <= 1,000,000 -  expected time complexity: O(n) or O(nlogn)


# Friday October 14, 2016

## Merge Sort

`list = []
def merge_sort(list)
  if list.length <= 1
    list
  else
    mid = (list.length / 2).floor
    left = merge_sort(list[0..mid - 1])
    right = merge_sort(list[mid..list.length])
    merge(left,right)
  end
end


# left = [ 1, 4, 1, 3]
# right = [ 100, 101, ]

def merge(left, right)
  if left.empty?
    right
  elsif right.empty?
    left
  elsif left.first < right.first
    [left.first] + merge(left[1..left.length], right)
    # newly_merged = [1] + merge([4, 1, 3], right)
  else
    [right.first] + merge(left, right[1..right.length])
  end
end

#Driver code
arr = [5, 7, 15, 6, 14, 33]
p merge_sort(arr)`

## GIT - Head
**Head:** symbolic name for currently checked out commit - aka what commit you're working on top of.

Note: head points to most recent commit in working tree.
Normally HEAD points to branch name, when you commit the status of the branch name is altered and change is visible through HEAD.

**Detaching HEAD:** means attaching HEAD to a commit instead of branch.
Example:
before detaching head:
HEAD -> master -> C1  *(note C1 is a commit)*
`git checkout C1`
now head is:
HEAD -> C1

## GIT - Relative Refs
Aka shortcuts to refer to places in commit history.

Why use relative refs?
Because referring to a git commit's hash that looks like 203948203948203948kdfj23ou234 isn't super convenient!
*Note* You can however say git checkout 2039 and git will know to go checkout that commit, without fully typing it out

**Relative commit commands:**
 `^` - Move upwards one commit at a time
  ex:
    Given the tree: C0 -> C1 -> C2(master)
    `git checkout master^`     
    HEAD -> C1 = the first parent commit of master
    *OR*
    `git checkout master^^`
    HEAD -> C0 = the second-generation ancestor of master
    *OR*
    `git checkout HEAD^`
    HEAD -> C1


 `~<num>` - Move upwards a number of times
 ex:
   Given the tree: C0 -> C1 -> C2 -> C3 -> C4(master)
   HEAD -> master -> C4
   `git checkout HEAD~4`
   HEAD -> C1

How is `~` useful you ask?
**Branch Forcing:** directly reassign a branch to a specific commit with `-f`
  ex:
  `git branch -f master HEAD~3` = Moves (by force) branch master to three parent commits behind the HEAD

# Saturday October 15, 2016

## JAVA
Datatypes: *int, boolean, and char*
In Java, the **int** data type only allows values between -2,147,483,648 and 2,147,483,647

**Char:** a java datatype used to represent single characters. short for character, and must be enclosed in single quotes as such: 'h'

Note: In Java, variables must have specified data type.
ex:
`int myLuckyNumber = 11;`
myLuckyNumber now stores the value 11 as an int type


###Running Java Programs in Atom (or any text editor)
1. Create your java app `touch HelloWorld.java`

2. Write code:
`public class HelloWorld {
	public static void main(String[] args) {

		System.out.println("Hello World");

	}
}`
*Note: make sure class name is same as file name*

3. Compile java code `javac HelloWorld.java`
This compiles your java app which produces a HelloWorld.class file, which contains instructions for the Java Virtual Machine written in Java byte codes.

4. Run `java HelloWorld`
This command starts a Java Virtual Machine to load the HelloWorld class. Once it loads the class, it will execute the main method and print "Hello World" to the terminal window.

*C'est fini!*

#Tuesday October 18, 2016
config.ru = Rack configuration for Rack based servers used to start the application.

Rails protect_from_forgery - protects from CSRF (Cross-Site Request Forgery)


protect_from_forgery is included by default in the application_controller.rb controller when generating new applications

In Rails, within forms it includes a hidden input field called authenticity_token, which contains a synchronizer token (cryptographically random tokens)
(note only requests sent via POST will be verified)

When the web app processes the POST request, the server compares value submitted for the authenticity_token to the value associated with the user's session. If it doesn't match it indicates request may be malicious.


*******
Action Pack - provides view and controller layers in Rails

- has the modules: Action Dispatch and Action Controller

    * Action Dispatch: parses info about web requests, handles routing and does advanced processing such as decoding params, cookies and sessions related to HTTP

    * Action Controller: provides base controller class. Result of an action is typically content generated from views. Triggers Action View

  Note: users only directly interface with Action Controller, Action Dispatch is activated by default

***
config.ru = Rack configuration for Rack based servers used to start the application.


*** Associations
has_and_belongs_to_many = used to substitute creating a join table manually, but the downside is that it is not good because you can only use for a join table consisting solely of foreign keys. If in the future you need to add attributes to the join table, you would have to remove the has_and_belongs_to_many and create a join table and add has_many :other_model, through => :join_table_name to each model.


***
Top Rails Interview Questions

How does a symbol differ from a string?
A: symbols are immutable and reusable, retaining the same object_id

What is a module? The difference btwn classes and modules?
module: mechanism for namespaces, also used as a mechanism for multiple inheritance via mixins and cannot be instantiated like classes can

Explain A ||= B
equivalent to: a || (a = b)
a = b when a == falsey
otherwise a remains unchanged

Whats the issue with the controller code?

What PATHS will be defined by the following in config/routes.rb?
resources :posts do
  member do
    get 'comments'
  end
  # generates route: /posts/:id/comments

  collection do
    post 'bulk_upload'
  end

  # generates route: /posts/bulk_upload
end

GET /posts
POST /posts
GET /posts/new
GET /posts/:id/edit
GET /posts/:id
PATCH/PUT /posts/:id
DELETE /posts:id
GET /posts/:id/comments
POST /posts/bulk_upload

How would you create getter and setter methods in Ruby?
attr_accessor = setter methods
attr_reader getter methods


Explain a Polymorphic Association
Polymorphic associations allow a model to belong to more than one other model through a single association.
Ex, pictures table can belong to both products and employees tables

class Picture
  belongs_to :imageable, polymorphic: true
end

class Employee
  has_many :pictures, as: :imageable
end

class Product
  has_many :pictures, as: :imageable
end

advantage of polymorphic: allows you to create a single Picture model, rather than separate models for EmployeePicture and ProductPicture example

What is a Filter? When is it called?
Filters: methods called either before/after a controller action is called.

ex:
here UserDashboard/index page only accessible to login users
class UserDashboardController < Application Controller
  before_filter :confirm_logged_in, :except => [:login, :attempt_login, :logout]
  def index
  end

  def login
  end

  def attempt_login
  end

  def logout
  end
end


Define the Rails MVC Implementation using an example:
* Model (ActiveRecord)
  maintains the relationship between Object and DB and handles validation, association, transactions and more. This layer provides an interface and binding between the tables in a relational database and the Ruby program code that manipulates database records.

  Ruby method names are auto generated from field names of the db tables and so on.

* Controller (ActionController)
  The facility within the application that directs traffic, on the one hand querying the models for specific data and on the other hand organizing data (searching, sorting, messaging it) into a form that fits the need of a given view

* View (ActionView)
  presents data in particular format, triggered by a controller's decision to present the data. Every web connection to a Rails app results in the displaying of a view.


*****
Enumerables

/#each = returns original object called on, really used for side effects and not what it returns
/#each_with_index = returns original item and also whatever position in the array it was located in
/#select - returns new object filled with only those original items in block that returned true
/#map - returns new array filled with whatever gets returned by block each time it runs
/#inject (aka #reduce) - passes the element and whatever was returned by the previous iteration into the block, you can specify the initial value or else it will default to the first item of the array

#Monday October 25, 2016

##Hash tables
Send a key through a hashing function (ex: MD5, SHA1, or one of own invention) that converts to an addressable space (some sort of index).

Note: hash tables have O(1) (constant time) lookups, deletes and adds if you're doing a set/map.
