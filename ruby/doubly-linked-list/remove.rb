class Node
  attr_accessor :value, :prev, :next
  def initialize(value)
    @value = value
    @next = nil
    @prev = nil
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

  def pop_first
    return if self.length.zero?

    temp = self.head
    if self.length == 1
      self.head = nil
      self.tail = nil
    else
      self.head = self.head.next
      self.head.prev = nil
      temp.next = nil
    end
    temp.prev = nil
    self.length -= 1
    return temp
  end

  def get(index)
    return nil if index < 0 || index >= length

    if index < length / 2
      temp = head
      i = 0
      while i < index
        temp = temp.next
        i += 1
      end
    else
      temp = tail
      i = length - 1
      while i > index
        temp = temp.prev
        i -= 1
      end
    end
    temp
  end

  def set_value(index, value)
    temp = get(index)
    if temp
      temp.value = value
      return true
    end
    false
  end

  def insert(index, value)
    return if index < 0 || index > length
    
    if index == 0
      return prepend(value)
    elsif index == length
      return append(value)
    else
      new_node = Node.new(value)
      before = get(index - 1)
      after = get(index)
      new_node.next = after
      new_node.prev = before
      after.prev = new_node
      before.next = new_node
      self.length += 1
      true
    end
  end

  def remove(index)
    return if index < 0 || index > self.length

    if index.zero?
      return pop_first
    elsif index == (self.length - 1)
      return pop
    else
      temp = get(index)
      before = temp.prev
      after = temp.next
      before.next = after
      after.prev = before
      temp.next = nil
      temp.prev = nil
      self.length -= 1
      return temp
    end
  end
end

my_doubly_linked_list = DoublyLinkedList.new(1)
my_doubly_linked_list.append(2)
my_doubly_linked_list.append(3)
my_doubly_linked_list.append(4)
my_doubly_linked_list.append(5)

puts('DLL before remove:')
my_doubly_linked_list.print_list

puts('Removed node:')
puts(my_doubly_linked_list.remove(2).value)
puts('DLL after remove in middle:')
my_doubly_linked_list.print_list

puts('Removed node:')
puts(my_doubly_linked_list.remove(0).value)
puts('DLL after remove() of first node:')
my_doubly_linked_list.print_list

puts('Removed node:')
puts(my_doubly_linked_list.remove(2).value)
puts('DLL after remove() of last node:')
my_doubly_linked_list.print_list
"""
EXPECTED OUTPUT:
----------------
DLL before remove():
1
2
3
4
5

Removed node:
3
DLL after remove() in middle:
1
2
4
5

Removed node:
1
DLL after remove() of first node:
2
4
5

Removed node:
5
DLL after remove() of last node:
2
4
"""
