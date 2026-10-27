## Queue: Dequeue

# Implement the dequeue method for the Queue class that removes the 
# first node from the queue and returns it.

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
    true
  end

  def dequeue
    return if self.length.zero?

    temp = self.first
    if self.length == 1
      self.first = nil
      self.last = nil
    else
      self.first = self.first.next
      temp.next = nil
    end
    self.length -= 1
    temp
  end
end

my_queue = Queue.new(1)
my_queue.enqueue(2)

# (2) Items - Returns 2 Node
puts(my_queue.dequeue.value)
# (1) Item -  Returns 1 Node
puts(my_queue.dequeue.value)
# (0) Items - Returns None
p(my_queue.dequeue)
"""
  EXPECTED OUTPUT:
  ----------------
  1
  2
  nil
"""
