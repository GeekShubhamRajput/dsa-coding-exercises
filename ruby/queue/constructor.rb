## Queue: Constructor

# Create a Queue class that represents a first-in, first-out (FIFO) data structure 
# using a linked list implementation.

class Node
  attr_accessor :next, :value

  def initialize(value)
    @value = value
    @next = nil
  end
end

class Queue
  attr_accessor :first, :last, :length

  def initialize(value)
    new_node = Node.new(value)
    @first = new_node
    @last = new_node
    @length = 1
  end
end

my_queue = Queue.new(4)

puts("First: #{my_queue.first.value}")
puts("Last: #{my_queue.last.value}")
puts ("Length: #{my_queue.length}")
"""
  EXPECTED OUTPUT:
  ----------------
  First: 4
  Last: 4
  Length: 1
"""
