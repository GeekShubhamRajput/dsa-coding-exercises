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
end

my_linked_list = LinkedList.new(11)
my_linked_list.append(3)
my_linked_list.append(23)
my_linked_list.append(7)

puts('LL before set_value:')
my_linked_list.print_list()

my_linked_list.set_value(1, 4)

puts('LL after set_value')
my_linked_list.print_list()

"""
  EXPECTED OUTPUT:
  ----------------
  LL before set_value:
  11
  3
  23
  7

  LL after set_value:
  11
  4
  23
  7
"""
