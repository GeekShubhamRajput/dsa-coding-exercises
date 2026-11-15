## BST: Constructor

# Create a BinarySearchTree class.

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
end

my_tree = BinarySearchTree.new
puts "Root: #{my_tree.root.inspect}"
"""
  EXPECTED OUTPUT:
  ----------------
  Root: nil
"""
