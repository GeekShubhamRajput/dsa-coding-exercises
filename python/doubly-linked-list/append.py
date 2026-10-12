class Node:
  def __init__(self, value):
    self.value = value
    self.prev = None
    self.next = None

class DoublyLinkedList:
  def __init__(self, value):
    new_node = Node(value)
    self.head = new_node
    self.tail = new_node
    self.length = 1

  def print_list(self):
    temp = self.head
    while temp is not None:
      print(temp.value)
      temp = temp.next

  def append(self, value):
    new_node = Node(value)
    temp = self.head
    if self.length == 0:
      self.head = new_node
      self.tail = new_node
    else:
      while temp.next is not None:
        temp = temp.next
      new_node.prev = temp
      temp.next = new_node
      self.tail = new_node
    self.length += 1
    return True

  def empty_list(self):
    self.head = None
    self.tail = None
    self.length = 0

my_doubly_linked_list = DoublyLinkedList(10)
my_doubly_linked_list.print_list()
print("-------Empty List-------")
my_doubly_linked_list.empty_list()
print("-------Append 20, 30, 40 -------")
my_doubly_linked_list.append(20)
my_doubly_linked_list.append(30)
my_doubly_linked_list.append(40)
my_doubly_linked_list.print_list()
