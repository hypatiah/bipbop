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
