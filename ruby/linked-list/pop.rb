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

  def pop
    if self.length.zero?
      return nil
    else
      temp = self.head
      pre = self.head
      while(temp.next) do
        pre = temp
        temp = temp.next
      end
      self.tail = pre
      self.tail.next = nil
      self.length -= 1
      if self.length.zero?
        self.head = nil
        self.tail = nil
      end
      return temp
    end
  end
end

def check(expect, actual, message)
  puts(message)
  puts("EXPECTED: #{expect}")
  puts("RETURNED: #{actual}")
  puts(expect == actual ? "PASS" : "FAIL")
end

print("\n----- Test: Pop on linked list with one node -----\n")
linked_list = LinkedList.new(1)
linked_list.print_list
popped_node = linked_list.pop
check(1, popped_node.value, "Value of popped node:")
check(nil, linked_list.head, "Head of linked list:")
check(nil, linked_list.tail, "Tail of linked list:")
check(0, linked_list.length, "Length of linked list:")

print("\n----- Test: Pop on linked list with multiple nodes -----\n")
linked_list = LinkedList.new(1)
linked_list.append(2)
linked_list.append(3)
linked_list.print_list
popped_node = linked_list.pop()
check(3, popped_node.value, "Value of popped node:")
check(1, linked_list.head.value, "Head of linked list:")
check(2, linked_list.tail.value, "Tail of linked list:")
check(2, linked_list.length, "Length of linked list:")

print("\n----- Test: Pop on empty linked list -----\n")
linked_list = LinkedList.new(1)
linked_list.head = nil
linked_list.tail = nil
linked_list.length = 0
popped_node = linked_list.pop
check(nil, popped_node, "Popped node from empty linked list:")
check(nil, linked_list.head, "Head of linked list:")
check(nil, linked_list.tail, "Tail of linked list:")
check(0, linked_list.length, "Length of linked list:")

print("\n----- Test: Pop all -----\n")
linked_list = LinkedList.new(1)
linked_list.append(2)
linked_list.print_list
popped_node = linked_list.pop
check(2, popped_node.value, "Value of popped node (first pop):")
check(1, linked_list.head.value, "Head of linked list (after first pop):")
check(1, linked_list.tail.value, "Tail of linked list (after first pop):")
check(1, linked_list.length, "Length of linked list (after first pop):")
popped_node = linked_list.pop
check(1, popped_node.value, "Value of popped node (second pop):")
check(nil, linked_list.head, "Head of linked list (after second pop):")
check(nil, linked_list.tail, "Tail of linked list (after second pop):")
check(0, linked_list.length, "Length of linked list (after second pop):")
popped_node = linked_list.pop
check(nil, popped_node, "Popped node from empty linked list (third pop):")
check(nil, linked_list.head, "Head of linked list (after third pop):")
check(nil, linked_list.tail, "Tail of linked list (after third pop):")
check(0, linked_list.length, "Length of linked list (after third pop):")
