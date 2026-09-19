# class Node
class Node
  attr_accessor :value, :next

  def initialize(value)
    @value = value
    @next = nil
  end
end
        
# class LinkedList
class LinkedList
  attr_accessor :head, :tail, :length  
  
  def initialize(value)
    new_node = Node.new(value)
    @head = new_node
    @tail = new_node
    @length = 1
  end 

  def make_empty
    self.head = nil
    self.tail = nil
    self.length = 0
  end

  def append(value)
    new_node = Node.new(value)
    if self.length.zero?
      self.head = new_node
      self.tail = new_node
    else
      self.tail.next = new_node
      self.tail = new_node
    end
    self.length += 1
  end

  def print_list
    temp = self.head
    
    until temp.nil?
      puts temp.value
      temp = temp.next
    end
  end
end

my_linked_list = LinkedList.new(0)
my_linked_list.make_empty

my_linked_list.append(1)
my_linked_list.append(2)

puts("Head: #{my_linked_list.head.value}")
puts("Tail: #{my_linked_list.tail.value}")
puts("Length: #{my_linked_list.length}")

puts('Linked List:')
my_linked_list.print_list
"""
  EXPECTED OUTPUT:
  ----------------
  Head: 1
  Tail: 2
  Length: 2 

  Linked List:
  1
  2 
"""
