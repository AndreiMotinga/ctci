class Node
  attr_accessor :value # todo rename to data
  attr_reader :next, :prev

  def initialize(value)
    @value = value
  end

  def next=(node)
    @next = node
    return unless node
    node.prev = self unless node.prev == self
  end

  def prev=(node)
    @prev = node
    return unless node
    node.next = self unless node.next == self
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
    prev.next = self.next if prev
    self.next.prev = prev if self.next
  end

  def formatted_list
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
