# Stack : Constructor

class Node
  attr_accessor :value, :next
  def initialize(value)
    @value = value
    @next = nil
  end
end

class Stack
  attr_accessor :top, :height
  def initialize(value)
    new_node = Node.new(value)
    @top = new_node
    @height = 1
  end
end

my_stack = Stack.new(4)
puts("Top: #{my_stack.top.value}")
puts("Height: #{my_stack.height}")
"""
  EXPECTED OUTPUT:
  ----------------
  Top: 4
  Height: 1
"""
