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
