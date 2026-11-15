## BST: Contains

# Implement the contains method for the BinarySearchTree class that checks
# if a node with a given value exists in the binary search tree.

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
      return
    end
    temp = root

    while true do
      if new_node.value == temp.value
        return false
      elsif new_node.value < temp.value
        if temp.left.nil?
          temp.left = new_node
          return true
        end
        temp = temp.left
      else
        if temp.right.nil?
          temp.right = new_node
          return true
        end
        temp = temp.right
      end
    end
  end

  def contains(value)
    temp = root
    while !temp.nil?
      if value < temp.value
        temp = temp.left
      elsif value > temp.value
        temp = temp.right
      else
        return true
      end
    end
    false
  end
end

def check(expect, actual, message)
  puts(message)
  puts("EXPECTED: #{expect}")
  puts("RETURNED: #{actual}")
  puts(expect == actual ? "PASS" : "FAIL")
end

puts("----- Test: Contains on Empty Tree -----")
bst = BinarySearchTree.new
result = bst.contains(5)
check(false, result, "Check if 5 exists in an empty tree:")

puts("----- Test: Contains Existing Value -----\n")
bst = BinarySearchTree.new
bst.insert(10)
bst.insert(5)
bst.insert(15)
result = bst.contains(10)
check(true, result, "Check if 10 exists:")
result = bst.contains(5)
check(true, result, "Check if 5 exists:")
result = bst.contains(15)
check(true, result, "Check if 15 exists:")

puts("------ Test: Contains Not Existing Value -----\n")
bst = BinarySearchTree.new
bst.insert(10)
bst.insert(5)
result = bst.contains(15)
check(false, result, "Check if 15 exists:")

puts("----- Test: Contains with Duplicate Inserts -----\n")
bst = BinarySearchTree.new
bst.insert(10)
bst.insert(10)
result = bst.contains(10)
check(true, result, "Check if 10 exists with duplicate inserts:")

puts("----- Test: Contains with Left and Right -----\n")
bst = BinarySearchTree.new
bst.insert(10)
bst.insert(5)
bst.insert(15)
bst.insert(1)
bst.insert(8)
bst.insert(12)
bst.insert(20)
result = bst.contains(1)
check(true, result, "Check if 1 exists:")
result = bst.contains(8)
check(true, result, "Check if 8 exists:")
result = bst.contains(12)
check(true, result, "Check if 12 exists:")
result = bst.contains(20)
check(true, result, "Check if 20 exists:")
