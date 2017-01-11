class Node
  attr_reader :data, :next, :prev

  def initialize(data)
    @data = data
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

  def remove
    prev.next = self.next if prev
    self.next.prev = prev if self.next
  end

  def self.list(node, msg = "")
    msg += "#{node.data} -> "
    node.next ? list(node.next, msg) : msg[0..-5]
  end

  def self.generate_nodes(current = nil, head = nil, values)
    return head if values.empty?
    next_node = new values.shift
    next_node.prev = current
    head ||= next_node
    generate_nodes(next_node, head, values)
  end

  # EX: remove duplicates from an unsorted linked list.

  # with temporary buffer
  # def remove_dups
  #   values = Set.new [data]
  #   current = self.next
  #   while current
  #     next_node = current.next
  #     value = current.data
  #     values.include?(value) ? current.remove : values << value
  #     current = next_node
  #   end
  # end

  # without temporary buffer
  def remove_dups
    first = self
    while first.next
      second = first.next
      first.next.remove if first.next.data == first.data
      while second.next
        second.next.remove if second.next.data == first.data
        second = second.next
      end
      first = first.next
    end
  end

  # EX: Return Kth to last: Implement an algorithm to find the kth to last
  # element of a singly linked list.
  def self.to_last(node, k, counter = 0, stop = list_size(node) - k)
    return node if counter == stop
    to_last(node.next, k, counter += 1, stop)
  end

  def self.list_size(node, counter = 1)
    return counter unless node.next
    list_size(node.next, counter += 1)
  end
end
