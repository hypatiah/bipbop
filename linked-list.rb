class Node
  attr_accessor :node, :next

  def initialize(node)
    @node = node
  end

  #visual representation of linked-list
  def self.node_list(node, msg = nil)
    msg ||= ""
    return msg[0..-4] if node.nil?
    node_list(node.next, msg << "#{node.node} -> ")
  end
end

# ## To make basic link list
# irb(main):001:0> require './linked-list.rb'
#
# irb(main):002:0> node = Node.new("Oh Hai")
# => #<Node:0x007fcfd1314360 @node="Oh Hai">
#
# irb(main):003:0> node.node
# => "Oh Hai"
# irb(main):004:0> node.node.class
# => String
#
# irb(main):005:0> node_2 = Node.new("How are you?")
# => #<Node:0x007fcfd13160c0 @node="How are you?">
#
# irb(main):006:0> node.next = node_2
# => #<Node:0x007fcfd13160c0 @node="How are you?">
#
# irb(main):007:0> node.next
# => #<Node:0x007fcfd13160c0 @node="How are you?">
#
# irb(main):008:0> node.next.node
# => "How are you?"
# irb(main):009:0> node.next.node.class
# => String
#
# irb(main):010:0> node.next.next
# => nil
