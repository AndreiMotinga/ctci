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

  def self.to_array(node, arr = [])
    arr << node.data
    return arr unless node.next
    to_array(node.next, arr)
  end

  def self.generate_nodes(current = nil, head = nil, values)
    local_values = values.dup
    return head if local_values.empty?
    next_node = new local_values.shift
    next_node.prev = current
    head ||= next_node
    generate_nodes(next_node, head, local_values)
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

  # EX: Write a code to partition a linked list around value X, such that all
  # nodes less than x come before all nodes greater or equal to x. If x is
  # contained within the list, the values of x only need to be after the
  # elements less than x. The partition element x can appear anywhere in the
  # "right partition"; it does not need to appear between the left and right
  # partitions.
  # EXAMPLE:
  # input: 3 -> 5 -> 8 -> 5 -> 10 -> 2 -> 1
  # output: 3 -> 1 -> 2 -> 10 -> 5 -> 5 -> 8
  def self.partition(node, partition)
    head = node
    current = node
    while node
      if node.data < partition
        next_iterator = node.next # save position in list
        node.remove # remove node from the list
        current.insert(node)
        current = node # update latest node that < partition
        node = next_iterator
      else
        node = node.next
      end
    end
    head
  end

  def insert(node)
    temp = self.next
    self.next = node
    node.next = temp
  end
end
