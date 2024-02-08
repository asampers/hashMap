# A Class representing a Node in a Linked List
class Node
  attr_accessor :value, :key, :next_node

  def initialize(key, value, next_node = nil)
    @key = key
    @value = value
    @next_node = next_node
  end
end


# A Class representing a Linked List
class LinkedList
  attr_reader :head

  def initialize(key, value)
    @head = Node.new(key, value)
  end

  # Appends a new node at the end of the list
  def append(key, value)
    tail.next_node = Node.new(key, value)
  end

  # Prepends a new node at the start of the list
  def prepend(key, value)
    @head = Node.new(key, value, head)
  end

   # Returns the last node in the list
  def tail(node=@head)
    return node if last_node?(node)

    tail(node.next_node)
  end

  # Returns the size of the linked list
  def size(node=@head,count = 1)
    return count if last_node?(node)

    size(node.next_node, count + 1)
  end

  # Returns the node at a specific index
  def at(index, node = @head)
    return node if index.zero?

    at(index - 1, node.next_node)
  end

  # Pops the last node from this list
  def pop(node=@head)
    return node.next_node = nil if last_node?(node.next_node)

    pop(node.next_node)
  end

  # Returns true if the list contains the given key-value pair else false
  def contains?(key, node=@head)
    return true if node.key == key
    return false if last_node?(node)

    contains?(key, node.next_node) 
  end

  # Traverses the linked list and calls the given block
  def traverse
    current_node = @head

    while current_node
      yield(current_node)
      current_node = current_node.next_node
    end
  end

  # Finds a node in the list and returns it
  def find(key, node=@head)
    return nil if node.nil?

    traverse { |node| return node if yield(node) } if block_given?

    return node if node.key == key
    return nil if last_node?(node)

    find(key, node.next_node)
  end

  def remove(key)
    @head.key == key ? delete_head : delete_node(key)
  end

  # Inserts a node at the given index
  def insert_at(key, value, index)
    prev_node = at(index - 1)
    next_node = prev_node.next_node
    prev_node.next_node = Node.new(key, value, next_node)
  end

  # Removes the node at the given index
  def remove_at(index)
    node = at(index)
    prev_node = at(index - 1)
    prev_node.next_node = node.next_node
  end

  private

  def delete_head
    @head = @head.next_node
    true
  end

  def delete_node(key)
    predecessor = find(key) { |node| node.next_node&.key == key } 

    target = predecessor.next_node
    predecessor.next_node = target.next_node
    target
  end

  # Returns true if the given node is the last one
  def last_node?(node)
    return true if node.next_node.nil?

    false
  end  

end