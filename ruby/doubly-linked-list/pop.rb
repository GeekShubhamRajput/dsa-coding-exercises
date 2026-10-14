class Node
  attr_accessor :value, :next, :prev

  def initialize(value)
    @value = value
    @prev = nil
    @next = nil
  end
end

class DoublyLinkedList
  attr_accessor :head, :tail, :length

  def initialize(value)
    new_node = Node.new(value)
    @head = new_node
    @tail = new_node
    @length = 1
  end

  def print_list
    temp = self.head
    while !temp.nil? do
      puts temp.value
      temp = temp.next
    end  
  end

  def empty_list
    self.head = nil
    self.tail = nil
    self.length = 0
  end

  def append(value)
    new_node = Node.new(value)
    if self.length.zero?
      self.head = new_node
      self.tail = new_node
      self.length = 0
    else
      temp = self.head
      while !temp.next.nil? do
        temp = temp.next
      end
      new_node.prev = temp
      temp.next = new_node
      self.tail = new_node 
    end
    self.length += 1
    return true
  end

  def pop
    return if self.length.zero?
    
    temp = self.tail

    if self.length == 1
      self.head = nil
      self.tail = nil
    else
      self.tail = temp.prev
      self.tail.next = nil
    end
    self.length -= 1
    return temp
  end
end

my_doubly_linked_list = DoublyLinkedList.new(1)
my_doubly_linked_list.append(2)

# (2) Items - Returns 2 Node
puts my_doubly_linked_list.pop.value
# (1) Item -  Returns 1 Node
puts my_doubly_linked_list.pop.value
# (0) Items - Returns None
puts my_doubly_linked_list.pop
"""
EXPECTED OUTPUT:
----------------
2
1
None
"""