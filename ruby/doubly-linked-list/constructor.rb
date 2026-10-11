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
end

my_doubly_linked_list = DoublyLinkedList.new(7)

puts "Head: #{my_doubly_linked_list.head.value}"
puts "Tail: #{my_doubly_linked_list.tail.value}"
puts "Length: #{my_doubly_linked_list.length}"
