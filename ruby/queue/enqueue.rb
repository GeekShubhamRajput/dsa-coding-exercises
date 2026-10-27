## Queue:Enqueue

# Implement the enqueue method for the Queue class that adds a new node with 
# a given value to the end of the queue.

class Node
  attr_accessor :value, :next

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

  def print_queue
    temp = self.first
    while temp do
      puts(temp.value)
      temp = temp.next
    end
  end

  def enqueue(value)
    new_node = Node.new(value)
    if self.length.zero?
      self.first = new_node
      self.last = new_node
    else
      self.last.next = new_node
      self.last = new_node
    end
    self.length += 1
  end
end

my_queue = Queue.new(1)

puts('Queue before enqueue(2):')
my_queue.print_queue

my_queue.enqueue(2)

puts('Queue after enqueue(2):')
my_queue.print_queue
"""
  EXPECTED OUTPUT:
  ----------------
  Queue before enqueue(2):
  1

  Queue after enqueue(2):
  1
  2
"""
