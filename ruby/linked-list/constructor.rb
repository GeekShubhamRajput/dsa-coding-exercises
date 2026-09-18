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
end

my_linked_list = LinkedList.new(4)

puts("Head: #{my_linked_list.head.value}")
puts("Tail: #{my_linked_list.tail.value}")
puts("Length: #{my_linked_list.length}")
# Head: 4
# Tail: 4
# Length: 1
