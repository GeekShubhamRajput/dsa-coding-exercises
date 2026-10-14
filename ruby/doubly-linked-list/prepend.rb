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

  def prepend(value)
    new_node = Node.new(value)
    if self.length.zero?
      self.head = new_node
      self.tail = new_node
    else
      temp = self.head
      temp.prev = new_node
      new_node.next = temp
      self.head = new_node
    end
    self.length += 1
    return true
  end
end

my_doubly_linked_list = DoublyLinkedList.new(2)
my_doubly_linked_list.append(3)

puts '----Before prepend:---'

puts "Head: #{my_doubly_linked_list.head.value}"
puts "Tail: #{my_doubly_linked_list.tail.value}"
puts "Length: #{my_doubly_linked_list.length}"
puts "--------Doubly Linked List:-----"
my_doubly_linked_list.print_list

my_doubly_linked_list.prepend(1)

puts('-------After prepend(1):---')
puts "Head: #{my_doubly_linked_list.head.value}"
puts "Tail: #{my_doubly_linked_list.tail.value}"
puts "Length: #{my_doubly_linked_list.length}"
puts "--------Doubly Linked List:-----"
my_doubly_linked_list.print_list

"""
  EXPECTED OUTPUT:
  
  Before prepend():
  ----------------
  Head: 2
  Tail: 3
  Length: 2 

  Doubly Linked List:
  2
  3

  After prepend():
  ---------------
  Head: 1
  Tail: 3
  Length: 3 

  Doubly Linked List:
  1
  2
  3
"""