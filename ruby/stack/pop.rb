## Stack:Pop
# Implement the pop method for the Stack class that removes the top 
# node from the stack and returns it.

class Node
  attr_accessor :value, :next

  def initialize(value)
    @value = value
    @next = nil
  end
end

class Stack
  attr_accessor :height, :top

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

  def pop
    return if self.height == 0
    
    temp = self.top
    self.top = self.top.next
    temp.next = nil
    self.height -= 1
    temp 
  end
end

my_stack = Stack.new(4)
my_stack.push(3)
my_stack.push(2)
my_stack.push(1)

puts('Stack before pop():')
my_stack.print_stack

puts('Popped node:')
puts(my_stack.pop.value)

puts('Stack after pop():')
my_stack.print_stack
"""
  EXPECTED OUTPUT:
  ----------------
  Stack before pop():
  1
  2
  3
  4

  Popped node:
  1

  Stack after pop():
  2
  3
  4
"""
