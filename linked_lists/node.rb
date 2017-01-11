class Node
  # todo rename next to avoid keyword clashing
  attr_accessor :value, :next, :prev

  def initialize(value)
    @value = value
  end

  # ex: remove duplicates from an unsorted linked list.
  # with temporary buffer
  def remove_dups
    values = Set.new [value]
    current = self.next
    while current
      next_node = current.next
      value = current.value
      values.include?(value) ? current.remove : values << value
      current = next_node
    end
  end

  def remove
    next_node = self.next
    prev.next = next_node if prev
    next_node.prev = prev if next_node
  end

  def print_nodes
    string = value.to_s
    current = self.next
    while current
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
