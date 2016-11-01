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
