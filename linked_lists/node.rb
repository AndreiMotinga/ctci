class Node
  attr_accessor :value, :next, :prev

  def initialize(value)
    @value = value
  end

  # ex: remove duplicates from an unsorted linked list.
  # def remove_dups
  #   duplicates = []
  #
  # end

  def remove
    next_node = self.next
    prev.next = next_node if prev
    next_node.prev = prev if next_node
  end

  def print_nodes
    string = "#{self.value}"
    current = self.next
    while current do
      string += " -> #{current.value}"
      current = current.next
    end
    string
  end

  def self.generate_nodes(values)
    current = head = new values.first
    values.each_with_index do |v, i|
      next if i == 0
      next_node = new v
      next_node.prev = current
      current.next = next_node
      current = next_node
    end
    head
  end
end
