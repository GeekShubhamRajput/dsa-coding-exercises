# Stack:Push
# Implement the push method for the Stack class that adds a new node 
# with a given value to the top of the stack.

class Node
  attr_accessor :next, :value 

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

  def print_stack
    temp = self.top
    while temp do
      puts temp.value
      temp = temp.next
    end  
  end

  def push(value)
    new_node = Node.new(value)
    if self.height == 0
      self.top = new_node
    else
      new_node.next = self.top
      self.top = new_node
    end
    self.height += 1
  end
end

my_stack = Stack.new(2)
puts('Stack before push(1):')
my_stack.print_stack
my_stack.push(1)
puts('Stack after push(1):')
my_stack.print_stack
"""
  EXPECTED OUTPUT:
  ----------------
  Stack before push(1):
  2

  Stack after push(1):
  1
  2
"""
