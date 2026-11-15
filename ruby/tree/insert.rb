## BST: Insert

# Implement the insert method for the BinarySearchTree class 
# that inserts a new node with a given value into the binary search tree.

class Node
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

class BinarySearchTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(value)
    new_node = Node.new(value)
    if root.nil?
      self.root = new_node
      return true
    end
    temp = root

    while true do
      if value < temp.value
        if temp.left.nil?
          temp.left = new_node
          return true
        end
        temp = temp.left
      elsif value > temp.value
        if temp.right.nil?
          temp.right = new_node
          return true
        end
        temp = temp.right
      else
        return false
      end  
    end
  end
end

def check(expect, actual, message)
  puts(message)
  puts("EXPECTED: #{expect}")
  puts("RETURNED: #{actual}")
  puts(expect == actual ? "PASS" : "FAIL")
end

puts("----- Test: Insert to Empty Tree -----")
bst = BinarySearchTree.new
result = bst.insert(5)
check(true, result, "Insert 5, should succeed:")
check(5, bst.root.value, "Root value after inserting 5:")
check(nil, bst.root.left, "Root's left child after inserting 5:")
check(nil, bst.root.right, "Root's right child after inserting 5:")

puts("----- Test: Insert to Existing Tree -----")
bst1 = BinarySearchTree.new
bst1.insert(10)
bst1.insert(5)
bst1.insert(15)
result = bst1.insert(3)
check(true, result, "Insert 3, should succeed:")
check(3, bst1.root.left.left.value, "Root's left-left value after inserting 3:")
check(nil, bst1.root.left.left.left, "Root's left-left-left child after inserting 3:")
check(nil, bst1.root.left.left.right, "Root's left-left-right child after inserting 3:")

puts("----- Test: Insert Duplicate Value -----")
bst = BinarySearchTree.new
bst.insert(10)
bst.insert(5)
result = bst.insert(5)
check(false, result, "Insert 5 again, should fail:")
check(nil, bst.root.left.left, "Root's left-left child after inserting 5 again:")
check(nil, bst.root.left.right, "Root's left-right child after inserting 5 again:")

puts("----- Test: Insert Greater Than Root -----")
bst = BinarySearchTree.new
bst.insert(10)
result = bst.insert(15)
check(true, result, "Insert 15, should succeed:")
check(15, bst.root.right.value, "Root's right value after inserting 15:")
check(nil, bst.root.right.left, "Root's right-left child after inserting 15:")
check(nil, bst.root.right.right, "Root's right-right child after inserting 15:")

puts("----- Test: Insert Less Than Root -----")
bst = BinarySearchTree.new
bst.insert(10)
result = bst.insert(5)
check(true, result, "Insert 5, should succeed:")
check(5, bst.root.left.value, "Root's left value after inserting 5:")
check(nil, bst.root.left.left, "Root's left-left child after inserting 5:")
check(nil, bst.root.left.right, "Root's left-right child after inserting 5:")
