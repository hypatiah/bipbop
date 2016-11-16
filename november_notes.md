#Tuesday November 1, 2016
##Linked Lists in Ruby

**Linked list:** a data structure, where in ruby is a class with two attributes: node and next.
Node: a ruby class
Next: a link to the next node
`class node
  attr_accessor :node, :next

  def initialize(node)
    @node = node
  end
end
`

To make basic link list:
`irb(main):001:0> require './linked-list.rb'

irb(main):002:0> node = Node.new("Oh Hai")
=> #<Node:0x007fcfd1314360 @node="Oh Hai">

irb(main):003:0> node.node
=> "Oh Hai"
irb(main):004:0> node.node.class
=> String

irb(main):005:0> node_2 = Node.new("How are you?")
=> #<Node:0x007fcfd13160c0 @node="How are you?">

irb(main):006:0> node.next = node_2
=> #<Node:0x007fcfd13160c0 @node="How are you?">

irb(main):007:0> node.next
=> #<Node:0x007fcfd13160c0 @node="How are you?">

irb(main):008:0> node.next.node
=> "How are you?"
irb(main):009:0> node.next.node.class
=> String

irb(main):010:0> node.next.next
=> nil`

#Thursday November 3rd, 2016
## REACT NATIVE MEETUP NOTES

###Base component


NativeBase
- set of re-usable UI components
- highly customaizable and variable driven
- based on design guidelines of Google & Android
- variable driven like Bootstrap
- 2200+ Github stars

WITH native base:
import {
  Button,
} from 'native-base'

<Button primary>
  Click me!
</Button>
or
<Button success>
  Click me!
</Button>

WITHOUT native base:
var style = StyleSheet.create({
  button: {
    backgorundColor: ''
  }
  })

import MK from 'maya-kai';
MK.start();

##Codepush
has CI to tell if change is codepushable or not
also can rollback changes


##GANT
Chain React: React Native conference summer 2017, portland or.

Ignite: head start for react native

rails composer: used to create apps in 1 hour.

what is mob x?


IGNITE: how would you choose the best set of development tools-setup. xcode version, react-native version and so far
- job as producers
- google play - doesnt work if have maps 9.4 and then something in lower version
- problems with open source code bases that dont interact well with

favorite rn components:
vector icons
animation library: react-native animatable

react-native tab view - mateusz favorite rn components

nucleid - for debugger with atom.

microsoft development - using VScode


#Thursday November 10, 2016
## Sorting and Hashtables

### Merge Sorting
Javascript implementation:
`var a = [34, 203, 3, 746, 200, 984, 198, 764, 9];

function mergeSort(arr)
{
    if (arr.length < 2)
        return arr;

    var middle = parseInt(arr.length / 2);
    var left   = arr.slice(0, middle);
    var right  = arr.slice(middle, arr.length);

    return merge(mergeSort(left), mergeSort(right));
}

function merge(left, right)
{
    var result = [];

    while (left.length && right.length) {
        if (left[0] <= right[0]) {
            result.push(left.shift());
        } else {
            result.push(right.shift());
        }
    }

    while (left.length)
        result.push(left.shift());

    while (right.length)
        result.push(right.shift());

    return result;
}

console.log(mergeSort(a));`

#Friday November 11, 2016
#Trees and Graphs

## Binary Search Tree
every node has 0-2 children
everything to left is less than node, everything greater than is to the right
if the same, make it always go to the left or to the right

having randomized numbers is better, so don't have o(n)

can do binary search tree iteratively and recursively

recursively: since subparts of binary search trees are also binary search trees, how you would use it recursively


`class Tree {
    constructor() {
      this.root = null;
    }

    toObject() {
      return this.root;
    }

    add(value) {

    }
  }

  class Node {
      //assign default left,right=null params
      constructor(value, left=null, right=null) {
          this.value = value;
          this.left = left;
          this.right = right;
      }
  }`

example "add(value) function":
`add(value) {
    // create head if no head
    if (this.root === null) {
      this.root = new Node(value);
      return;
    }

    let current = this.root;

    // want to execute until explicitly break out of it, since if you add a value to a binary search tree, should always find a place to add to it
    while(true) {
      if (current.value > value) {
        // go left

        // if have a left child, move pointer to left and run loop again.
        if (current.left) {
          current = current.left;
        }
        // else, add value to the left child
        else {
          current.left = new Node(value);
          return;
        }
      }
      else {
        // go right

        if (current.right) {
          current = current.right;
        }
        else {
          current.right = new Node(value);
          return;
        }
      }
    }
  }`

  **practical uses:** if you have ordered data and you need to search for nodes very quickly.
  *ex: elastic search or autocomplete*

##AVL
  Stands for
  A specialized binary search tree.
  So has same add(value) algorithm
  Any thing that is an AVL tree is also a Binary Search Tree.

  If tree is not balanced, have to use a rotation.

  If difference in height is 2 or greater, than it is out of balance.


#Monday, November 14th 2016
Ternerary** conditional expression: it contains 3 arguments:
1. a boolean
2. an expression to evaluate if the boolean is true
3. expression to evaluate if the boolean is false

#Wednesday, November 16th 2016
Adding multiple elements to an array in Ruby:
`arr = [1]
arr += [2,3]
arr #=> [1,2,3]`

or
`arr.push(2,3)`
or
`arr.concat([2,3])`
OR at the beginning of the array:
`arr.unshift(2,3)
a #=> [2, 3, 1]`
