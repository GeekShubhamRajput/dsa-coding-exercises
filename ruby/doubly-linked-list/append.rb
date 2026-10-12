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
end

my_doubly_linked_list = DoublyLinkedList.new(10)
my_doubly_linked_list.print_list
puts "Empty the List"
my_doubly_linked_list.empty_list
puts "Length : #{my_doubly_linked_list.length}"
my_doubly_linked_list.print_list

puts("-------Append 20, 30, 40 -------")
my_doubly_linked_list.append(20)
my_doubly_linked_list.append(30)
my_doubly_linked_list.append(40)
my_doubly_linked_list.print_list
puts "Head : #{my_doubly_linked_list.head.value}"
puts "Tail : #{my_doubly_linked_list.tail.value}"
