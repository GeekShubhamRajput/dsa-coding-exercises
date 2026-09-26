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

  def print_list
    temp = self.head
    
    until temp.nil?
      puts temp.value
      temp = temp.next
    end
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

  def prepend(value)
    new_node = Node.new(value)
    if self.length.zero?
      self.head = new_node
      self.tail = new_node
    else
      temp = self.head
      self.head = new_node
      self.head.next = temp
      self.length += 1 
    end
  end

  def pop_first
    return nil if self.length.zero?

    temp = self.head
    if self.length == 1
      self.head = nil
      self.tail = nil
    else
      self.head = self.head.next
    end
    temp.next = nil
    self.length -= 1
    return temp
  end

  def get(index)
    return nil if index < 0 || index > self.length
      
    temp = self.head
    index.times do
      temp = temp.next
    end
    temp  
  end

  def set_value(index, value)
    temp = self.get(index)
    if temp
      temp.value = value
      return true
    else
      return false
    end
  end

  def insert(index, value)
    return nil if index < 0 || index > self.length
    
    if index == 0
      self.prepend(value)
    elsif index == self.length
      self.append(value)
    else
      new_node = Node.new(value)
      temp = self.get(index - 1)
      new_node.next = temp.next
      temp.next = new_node
      self.length += 1
      return temp
    end
  end
end

my_linked_list = LinkedList.new(1)
my_linked_list.append(3)

puts('LL before insert:')
my_linked_list.print_list

my_linked_list.insert(1,2)

puts('LL after insert(2) in middle:')
my_linked_list.print_list

my_linked_list.insert(0,0)

puts('LL after insert(0) at beginning:')
my_linked_list.print_list

my_linked_list.insert(4,4)

puts('LL after insert(4) at end:')
my_linked_list.print_list
"""
  EXPECTED OUTPUT:
  ----------------
  LL before insert:
  1
  3

  LL after insert(2) in middle:
  1
  2
  3

  LL after insert(0) at beginning:
  0
  1
  2
  3

  LL after insert(4) at end:
  0
  1
  2
  3
  4
"""
